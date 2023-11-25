module "s3_bucket" {
  source = "./modules/s3"
}

module "ec2_instance" {
  depends_on = [ module.security_group ]
  source = "./modules/ec2"
  counter = var.counter
  create_ec2 = var.create
  sg = module.security_group.security_group_id
}

module "security_group" {
  source     = "./modules/security"
}

module "iam" {
  depends_on = [module.s3_bucket]
  source     = "./modules/iam"
  resource   = module.s3_bucket.s3_arn
}
