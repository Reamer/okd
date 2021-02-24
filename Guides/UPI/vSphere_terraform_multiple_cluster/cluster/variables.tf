//////
// vSphere variables
//////

variable "vsphere_cluster" {
  type        = string
  description = "This is the name of the vSphere cluster."
}

variable "vsphere_datacenter" {
  description = "Name of the datacenter."
  type        = string
}

variable "vsphere_datastore"{
  description = "Name of the datastore"
  type = string
}

variable "vm_network"{
  description = "Name of the nework"
  type = string
}

variable "vm_template"{
  description = "Name of the template"
  type = string
}

variable "vm_folder"{
  description = "Name of the folder"
  type = string
}

variable "region" {
  description = "Name of the region tag category"
  type = string
}

variable "zone" {
  description = "Name of the zone tag category"
  type = string
}

/////////
// OpenShift cluster variables
/////////

variable "cluster_id" {
  type        = string
  description = "This cluster id must be of max length 27 and must have only alphanumeric or hyphen characters."
}

/////////
// Bootstrap machine variables
/////////

variable "bootstrap_complete" {
  type    = bool
  default = false
}

variable "bootstrap_ignition" {
  type = string
}

variable "bootstrap_mac" {
  type    = string
  default = ""
}

///////////
// Control Plane machine variables
///////////

variable "control_plane_ignition" {
  type = string
}
variable "control_plane_macs" {
  type    = list(string)
  default = []
}

//////////
// Compute machine variables
//////////

variable "compute_ignition" {
  type = string
}

variable "compute_macs" {
  type    = list(string)
  default = []
}
