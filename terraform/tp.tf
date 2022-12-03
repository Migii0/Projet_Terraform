resource "openstack_compute_keypair_v2" "test_keypair" {
  count      = 1
  provider   = openstack.ovh
  name       = "sshkey_eductive21"  # Attention au XX ;)
  public_key = file("~/.ssh/id_rsa.pub")
  region     = "GRA11"
}
# Création d'une instance
resource "openstack_compute_instance_v2" "tp_terraform" {
  count       = 1
  name        = "${var.instance_name}_${count.index+1}"    # Nom de l'instance
  provider    = openstack.ovh        # Nom du fournisseur
  image_name  = var.image_name       # Nom de l'image
  flavor_name = var.flavor_name      # Nom du type d'instance
  region      = "GRA11"           # Nom de la régions


  # Nom de la ressource openstack_compute_keypair_v2 nommée test_keypair
  key_pair    = openstack_compute_keypair_v2.test_keypair[count.index].name

  # Composant réseau par défaut
  network {
    name      = "Ext-Net"
  }

 }
