module "iti" {
    source = "./network"
    public1-subnet-cidr = var.public1-subnet-cidr
    public2-subnet-cidr = var.public2-subnet-cidr
    az1 = var.az1
    az2 =  var.az2
    vpc-cidr = var.vpc-cidr
    vpc-name = var.vpc-name
}