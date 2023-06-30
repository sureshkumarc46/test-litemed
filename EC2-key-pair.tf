resource "aws_key_pair" "NDS_key" {
  key_name   = "litemed_staging_key1"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "NDS-key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "litemed_staging_key1.pem"
}