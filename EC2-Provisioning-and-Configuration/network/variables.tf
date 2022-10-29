variable "public1-subnet-cidr" {
  type = string
}

variable "public2-subnet-cidr" {
  type = string
}

variable "az1" {
  type = string
  default = "us-east-1a"
}

variable "az2" {
  type = string
  default = "us-east-1b"
}

variable "vpc-cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc-name" {
  type = string
}
