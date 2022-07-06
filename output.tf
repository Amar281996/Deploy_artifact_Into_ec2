output "artifactory_instance" {
  value = "[ ${aws_instance.artifactory.public_dns} ]"
}