# Create an EC2 instance
resource "aws_instance" "ubuntu" {
  instance_type          = var.instance_type  # Instance type defined in variables
  ami                    = var.instance_ami   # AMI ID defined in variables
  vpc_security_group_ids = [aws_security_group.Jenkins_SG.id]  # Attach the Jenkins_SG security group
  tags = {
    Name = var.instance_name  # Set instance name based on variables
  }

  user_data = file("script.sh")  # Use the contents of "script.sh" as user data
}

# Create a security group for Jenkins
resource "aws_security_group" "Jenkins_SG" {
  name        = var.security_group_name  # Security group name defined in variables
  description = "Inbound rules for security group"
  vpc_id      = var.vpc_id  # VPC ID defined in variables

  # Ingress rules
  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "incoming 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "incoming 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule to allow all outbound traffic
  egress {
    description = "outbound rules"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an S3 bucket for Jenkins
resource "aws_s3_bucket" "jenkins_bucket_20" {
  bucket = "jenkins_bucket_20-${random_id.randomness.hex}"  # Generate a unique bucket name

  tags = {
    Name = "jenkins_bucket_20"  # Set bucket name tag
  }
}

# Generate a random ID
resource "random_id" "randomness" {
  byte_length = 10  # Set the length of the random ID
}
