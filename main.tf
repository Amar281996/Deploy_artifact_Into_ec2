resource "aws_security_group" "artifactory_sg" {
  name = "artifactory_sg"
  description = "Allows HTTP traffic"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

data "template_file" "user_data" {
  template = "${file("templates/user_data.tpl")}"

}

resource "aws_instance" "artifactory" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  user_data = "${data.template_file.user_data.rendered}"
  security_groups = ["${aws_security_group.artifactory_sg.name}"]

  tags = {
    Name = "artifactory"
  }
}
