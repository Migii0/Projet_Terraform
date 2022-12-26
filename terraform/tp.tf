resource "openstack_compute_keypair_v2" "gra11_keypair" {
  count      = 3
  provider   = openstack.ovh
  name       = "sshkey_eductive21_gra_${count.index+1}"  # Attention au XX ;)
  public_key = file("~/.ssh/id_rsa.pub")
  region     = "GRA11"
}


# Create two instances in the GRA11 region
resource "openstack_compute_instance_v2" "gra11_instances" {
  count = 3
  name  = "backend_eductive21_gra_${count.index+1}"
  provider    = openstack.ovh        # Nom du fournisseur
  image_name  = var.image_name       # Nom de l'image
  flavor_name = var.flavor_name      # Nom du type d'instance
  region = "GRA11"
  key_pair    = openstack_compute_keypair_v2.gra11_keypair[count.index].name

  network {
    name      = "Ext-Net"
  }
}

resource "openstack_compute_keypair_v2" "sbg5_keypair" {
  count      = 3
  provider   = openstack.ovh
  name       = "sshkey_eductive21_sbg_${count.index+1}"  # Attention au XX ;)
  public_key = file("~/.ssh/id_rsa.pub")
  region     = "SBG5"
}


# Create two instances in the SBG5 region
resource "openstack_compute_instance_v2" "sbg5_instances" {
  count = 3
  name  = "backend_eductive21_sbg_${count.index+1}"
  provider    = openstack.ovh        # Nom du fournisseur
  image_name  = var.image_name       # Nom de l'image
  flavor_name = var.flavor_name      # Nom du type d'instance
  region = "SBG5"
  key_pair    = openstack_compute_keypair_v2.sbg5_keypair[count.index].name

  network {
    name      = "Ext-Net"
  }


}
