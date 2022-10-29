resource "aws_instance" "jenkins_agent" {
    ami           = "ami-017fecd1353bcc96e" #different from region to another
    instance_type = "t2.micro"
    subnet_id = module.iti.public1-id
    key_name = "deployer-key"

    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
      Name = "agent_2"
    }

    provisioner "local-exec" {
      command = <<EOF
        echo '${tls_private_key.iti-key.private_key_pem}' > /home/abeer/.ssh/key.pem && chmod 600 /home/abeer/.ssh/key.pem
      EOF
    }

    provisioner "remote-exec" {
      inline = ["echo 'Wait until SSH is ready'"]

      connection {
        type     = "ssh"
        user     = var.ssh_user
        private_key = "${tls_private_key.iti-key.private_key_pem}"
        host     = aws_instance.jenkins_agent.public_ip
    }
  }

    provisioner "local-exec" {
      command = "sudo ansible-playbook -i ${aws_instance.jenkins_agent.public_ip}, -u root site.yml --private-key '/home/abeer/.ssh/key.pem'"
    }

    provisioner "file" {
       source      = "/home/abeer/id_rsa.pub"
       destination = "/$HOME/.ssh/"
    }
}
