variable "environment" {
  type    = string
  default = "dev"
}

variable "tags" {
   type = map(string)
   default = {
   "environment" = "Dev"
   "Owner" = "Shankar"
   "Business Unit" = "IT"
}
}

variable "windows_vm_size" {
  type    = string
  default = "Standard_B2ms"
}

variable "linux_vm_size" {
  type    = string
  default = "Standard_B1ms"
}

variable "webvm_name" {
  type = string
  default = "web-vm"
}

variable "bastion_vm" {
  type = string
  default = "bstn-vm"
  
}

variable "virtual_network" {
  type = string
  default = "vnet"
  
}

variable "bastion_subnet" {
  type = string
  default = "bastion"
 
}

variable "web_subnet" {
  type = string
  default = "web"
  
}

variable "app_subnet" {
  type = string
  default = "app"
  
}

variable "db_subnet" {
  type = string
  default = "db"
  
}

variable "vnet_prefix" {
  type = list(string)
  default = [ "10.20.0.0/16"
  , "10.30.0.0/16"]
}

variable "bastion_prefix" {
  type = list(string)
  default = [ "10.20.1.0/24"]
}

variable "web_prefix" {
  type = list(string)
  default = [ "10.20.2.0/24"]
}

variable "app_prefix" {
  type = list(string)
  default = [ "10.30.1.0/24"]
}

variable "db_prefix" {
  type = list(string)
  default = [ "10.30.3.0/24"]
}

variable "bastion_nsg" {
  type = string
  default = "bastion-nsg"
  
}

variable "web_nsg" {
  type = string
  default = "web-nsg"
  
}

variable "app_nsg" {
  type = string
  default = "app-nsg"
  
}

variable "db_nsg" {
  type = string
  default = "db-nsg"
  
}

variable "my_local_pip" {
type = string
default = "13.71.66.0/24"
description = "Please provide your IP local machine public IP address to open port connectivity"
}