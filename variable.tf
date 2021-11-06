variable "prefix" {
  type    = string
  default = "shankar"
}

variable "tags" {
   type = map(string)
   default = {
   "environment" = "Dev"
   "Owner" = "Shankar"
   "Business Unit" = "IT"
}
}

variable "vm_size" {
  type    = string
  default = "Standard_B2ms"
}
