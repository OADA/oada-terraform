provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  //token = "${var.token}" // Require for an AWS Go account and not require for a normal AWS account
  region     = "${var.region}"
}

resource "aws_instance" "oada_server" {
  ami           = "ami-0de53d8956e8dcf80"
  instance_type = "" // relevant instance type atlest m5.large
  key_name      = ""// PEM file name 
  user_data = "${file("installation.sh")}"
  security_groups = ["${aws_security_group.ingress-all.id}"]


  
  
	 tags{
	 Name="OADA Server"
         }

  subnet_id = "${aws_subnet.OADA_Subnet.id}"

}