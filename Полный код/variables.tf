variable "token" {
  description = "Yandex Cloud IAM token"
  type        = string
}

variable "cloud_id" {
  description = "Yandex Cloud cloud id"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud folder id"
  type        = string
}

variable "default_zone" {
  description = "Default availability zone"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "develop"
}

variable "default_cidr" {
  description = "CIDR for default subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "each_vm" {
  description = "DB VMs definitions"
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
}
