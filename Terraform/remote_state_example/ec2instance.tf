# ------------------------------------------------------------------------------
# CREATE THE EC2 instance
# ------------------------------------------------------------------------------

resource "aws_instance" "app_server" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo"
  }
}
