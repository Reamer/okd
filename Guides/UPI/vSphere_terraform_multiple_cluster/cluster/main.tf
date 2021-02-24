data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

module "resource_pool" {
  source = "./resource_pool"

  name            = var.cluster_id
  datacenter_id   = data.vsphere_datacenter.dc.id
  vsphere_cluster = var.vsphere_cluster
}

data "vsphere_tag_category" "region" {
  name = var.region
}

data "vsphere_tag" "region" {
  name        = var.vsphere_datacenter
  category_id = data.vsphere_tag_category.region.id
}

data "vsphere_tag_category" "zone" {
  name = var.zone
}

data "vsphere_tag" "zone" {
  name        = var.vsphere_cluster
  category_id = data.vsphere_tag_category.zone.id
}

module "bootstrap" {
  source = "./machine"

  name                 = "bootstrap"
  ignition             = var.bootstrap_ignition
  resource_pool_id     = module.resource_pool.pool_id
  datastore            = var.vsphere_datastore
  folder               = var.vm_folder
  network              = var.vm_network
  datacenter_id        = data.vsphere_datacenter.dc.id
  template             = var.vm_template
  mac_addresses        = var.bootstrap_complete ? [] : compact(list(var.bootstrap_mac))
  memory               = 8192
  num_cpu              = 4
  num_cores_per_socket = 4
  disk_size            = 60
  tags                 = [data.vsphere_tag.zone.id, data.vsphere_tag.region.id]
}

module "master" {
  source = "./machine"

  name                 = "master"
  ignition             = var.control_plane_ignition
  resource_pool_id     = module.resource_pool.pool_id
  folder               = var.vm_folder
  datastore            = var.vsphere_datastore
  network              = var.vm_network
  datacenter_id        = data.vsphere_datacenter.dc.id
  template             = var.vm_template
  mac_addresses        = var.control_plane_macs
  memory               = 16384
  num_cpu              = 4
  num_cores_per_socket = 4
  disk_size            = 60
  tags                 = [data.vsphere_tag.zone.id, data.vsphere_tag.region.id]
}

module "compute" {
  source = "./machine"

  name                 = "worker"
  name_suffix          = format("-%s", var.vsphere_cluster)
  ignition             = var.compute_ignition
  resource_pool_id     = module.resource_pool.pool_id
  folder               = var.vm_folder
  datastore            = var.vsphere_datastore
  network              = var.vm_network
  datacenter_id        = data.vsphere_datacenter.dc.id
  template             = var.vm_template
  mac_addresses        = var.compute_macs
  memory               = 8192
  num_cpu              = 4
  num_cores_per_socket = 4
  disk_size            = 60
  tags                 = [data.vsphere_tag.zone.id, data.vsphere_tag.region.id]
}
