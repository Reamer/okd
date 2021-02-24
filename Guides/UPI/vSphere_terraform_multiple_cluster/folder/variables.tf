variable "path" {
  description = "The path of the folder to be created. This is relative to the root of the type of folder you are creating, and the supplied datacenter"
  type = string
}

variable "datacenter_id" {
  description = "The ID of the datacenter the folder will be created in"
  type = string
}
