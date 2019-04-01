variable "access_key" {
  description = "Access key"
  default = "" // your access key
}

variable "secret_key" {
  description = "Secret key"
  default = "" // your secret key
}

variable "token" {
  description = "Token"
  default = "" // your token. This is only applicable for AWS Go accounts
}

variable "region" {
  description = "Region"
  default = "" // relevant region
}

variable "availability_zone" {
  description = "Availability zone of the subnet."
  default = "" // relevant security region
}