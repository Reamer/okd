variable "name" {
  description = "The name of the resource pool"
  type = string
}

variable "datacenter_id" {
  description = "The datacenter id"
  type = string
}

variable "vsphere_cluster" {
  description = "This is the name of the vSphere cluster."
  type = string
}
