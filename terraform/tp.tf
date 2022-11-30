# Création d'une ressource de paire de clés SSH
resource "openstack_compute_keypair_v2" "test_keypair" {
  provider   = openstack.ovh
  name       = "sshkey_${var.instance_name}"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Création d'une instance
resource "openstack_compute_instance_v2" "tp_terraform" {
  name        = var.instance_name    # Nom de l'instance
  provider    = openstack.ovh        # Nom du fournisseur
  image_name  = var.image_name       # Nom de l'image
  flavor_name = var.flavor_name      # Nom du type d'instance
  region      = var.region           # Nom de la régions

  # Nom de la ressource openstack_compute_keypair_v2 nommée test_keypair
  key_pair    = openstack_compute_keypair_v2.test_keypair.name

  # Composant réseau par défaut
  network {
    name      = "Ext-Net"
  }
 }
