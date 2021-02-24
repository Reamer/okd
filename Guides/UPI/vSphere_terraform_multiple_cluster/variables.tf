//////
// vSphere variables
//////

variable "vsphere_server" {
  type        = string
  description = "This is the vSphere server for the environment."
}

variable "vsphere_user" {
  type        = string
  description = "vSphere server user for the environment."
}

variable "vsphere_password" {
  type        = string
  description = "vSphere server password"
  sensitive   = true
}

variable "vsphere_datacenter" {
  type        = string
  description = "This is the name of the vSphere datacenter."
}

variable "vsphere_clusters" {
  description = "Map of clusters."
  type        = map
}

variable "region" {
  description = "Name of the region tag category"
  default = "k8s-region"
  type = string
}

variable "zone" {
  description = "Name of the zone tag category"
  default = "k8s-zone"
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

///////////
// Control Plane machine variables
///////////

variable "control_plane_ignition" {
  type = string
}


//////////
// Compute machine variables
//////////

variable "compute_ignition" {
  type = string
}
