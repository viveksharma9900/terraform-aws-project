variable "ami_id" {
  type    = string
  default = "ami-0f58b397bc5c1f2e8"
}
variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "subnet_id" {
  type = string
}
variable "sg_id" {
  type = string
}
variable "project_name" {
  type = string
}
variable "environment" {
  type = string
}
