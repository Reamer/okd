provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

module "folder" {
  source = "./folder"

  path          = var.cluster_id
  datacenter_id = data.vsphere_datacenter.dc.id
}

module "cluster" {
  for_each = var.vsphere_clusters
  source = "./cluster"

  vsphere_cluster      = each.key
  vsphere_datacenter   = var.vsphere_datacenter
  vsphere_datastore    = each.value.vsphere_datastore
  cluster_id           = var.cluster_id
  vm_template          = each.value.vm_template
  vm_network           = each.value.vm_network
  vm_folder            = module.folder.path
  bootstrap_complete   = var.bootstrap_complete
  bootstrap_ignition   = var.bootstrap_ignition
  bootstrap_mac        = each.value.bootstrap_mac
  control_plane_ignition = var.control_plane_ignition
  control_plane_macs   = each.value.control_plane_macs

  compute_ignition     = var.compute_ignition
  compute_macs         = each.value.compute_macs

  region               = var.region
  zone                 = var.zone
}
