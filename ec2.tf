resource "aws_instance" "ec2-web" {
  ami           = "ami-0557a15b87f6559cf" 
  instance_type = "t2.micro"
  tags = {
    Name = "first-ec2-server"
  }
}
