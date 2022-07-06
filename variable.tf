variable "region" {
  description = "The AWS region to create resources in."
  default = "us-west-2"
}
variable "use_remote_state" {
  type    = bool
  default = true
}
variable "key_name" {
  description = "Name of key pair. Must exist in chosen region."
  default = "devopspk"
}

variable "instance_type" {
  default = "t2.small"
}

variable "amis" {
  description = "Which AMI to spawn. Defaults to the Ubuntu 14.04 LTS."
  default = {
    us-east-1 = "ami-fce3c696"
    us-west-1 = "ami-06116566"
    us-west-2 = "ami-9abea4fb"
    eu-west-1 = "ami-f95ef58a"
  }
}