# Projet 


## Terraform

J'ai créé 3 ressources terraform, une backend_gra, une back_sbg et une frontend.
Dans mes 2 instances backend j'ai fait un count pour avoir 3 instances par régions.
Cela me donne 3 instances backend de la région GRA11, 3 instances bakcend de la région SBG5 et 1 instance frontend.
J'y ai ajouté à la fin mon réseau privé en fonction de mon numéro (21) et les nodes pour l'inventory ansible

## Haproxy

A l'intérieur de mon instance frontend j'y ai installé les paquets Haproxy.
La configuration de mon fichier Haproxy.cfg est la suivante : 
3 lignes frontend sur les ports 80,81 et 82 avec à la liaison entre les 3 serveurs backend de chaque région.

## Ansible 

Dans mon fichier de configuration Ansible j'ai  procéder à l'installation du serveur Nginx sur mes backends en deux fois car mes instances sont dans deux ressources différentes.
Pour le frontend il n'y en a qu'un.

