terraform {
  backend "s3" {
    bucket = "my-ff-testiing-bucketbatch30"
    region = "ap-south-1"
    key = "eks/terraform.tfstate"
    
  }
}