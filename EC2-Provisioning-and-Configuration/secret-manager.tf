resource "aws_secretsmanager_secret" "public-key" {
  name                = "jenkins-public-key"

}

resource "aws_secretsmanager_secret" "private-key" {
  name                = "jenkins-private-key"

}

resource "aws_secretsmanager_secret_version" "public" {
  secret_id     = "${aws_secretsmanager_secret.public-key.id}"
  secret_string = "${tls_private_key.iti-key.public_key_openssh}"
} 

resource "aws_secretsmanager_secret_version" "private" {
  secret_id     = "${aws_secretsmanager_secret.private-key.id}"
  secret_string = "${tls_private_key.iti-key.private_key_pem}"
}