variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "Jenkins_EC2 "
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
variable "instance_ami" {
  description = "AMI of Ubuntu EC2 instance"
  type        = string
  default     = "ami-053b0d53c279acc90"
}
variable "vpc_id" {
  description = "Id of your VPC"
  type        = string
  default     = "vpc-02650c20873519e46"
}
variable "security_group_name" {
  description = "Security group name"
  type        = string
  default     = "Jenkins_SG"
}
