provider "google" {
zone = "${var.zone}"
project = "${var.project}"
}

module "serv_entity" {
source = "./modules/serv_entity"
public_key_path = "${var.public_key_path}"
zone = "${var.zone}"
}


module "slaves" {
source = "./modules/slaves"
public_key_path = "${var.public_key_path}"
zone = "${var.zone}"
}


module "web-ui" {
source = "./modules/web-ui"
public_key_path = "${var.public_key_path}"
zone = "${var.zone}"
# db_disk_image = "${var.db_disk_image}"
}

output "slave-1" {
    value = module.slaves.instance_ips
}
