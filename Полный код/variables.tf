variable "token" {
  type = string
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "default_zone" {
  type = string
}

variable "image_id" {
  type = string
}

variable "platform_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "ssh_user" {
  type = string
}

variable "web_count" {
  type = number
}

variable "web_cpu" {
  type = number
}

variable "web_ram" {
  type = number
}

variable "web_disk" {
  type = number
}

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
}
