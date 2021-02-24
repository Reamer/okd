variable "name" {
  description = "Name of the VM"
  type = string
}

variable "name_suffix" {
  description = "Name suffix of the VM"
  type = string
  default = ""
}

variable "ignition" {
  type    = string
  default = ""
}

variable "resource_pool_id" {
  description = "The managed object reference ID of the resource pool to put this virtual machine in"
  type = string
}

variable "folder" {
  description = "The path to the folder to put this virtual machine in, relative to the datacenter that the resource pool is in."
  type = string
}

variable "datastore" {
  description = "Name of the Datastore"
  type = string
}

variable "network" {
  description = "Name of the Network"
  type = string
}

variable "datacenter_id" {
  description = "The datacenter id"
  type = string
}

variable "template" {
  description = "Name of the template"
  type = string
}

variable "mac_addresses" {
  description = "Each MAC address in the list creates a VM"
  type = list(string)
}
variable "memory" {
  description = "The size of the virtual machine's memory, in MB"
  type = number
}

variable "num_cpu" {
  description = "The total number of virtual processor cores to assign to this virtual machine"
  type = number
}

variable "num_cores_per_socket" {
  description = "The number of cores per socket in this virtual machine"
  type = number
}

variable "disk_size" {
  description = "The size of the disk, in GB"
  type = number
}

variable "tags" {
  description = "The IDs of any tags to attach to this virtual machine "
  type = list(string)
}

variable "hardware_version" {
  description = "The hardware version number. Valid range is from 4 to 15. The hardware version cannot be downgraded."
  default = 15
  type = number
}
