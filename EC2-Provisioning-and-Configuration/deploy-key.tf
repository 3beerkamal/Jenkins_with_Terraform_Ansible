# RSA key of size 4096 bits
resource "tls_private_key" "iti-key" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${tls_private_key.iti-key.public_key_openssh}"

}