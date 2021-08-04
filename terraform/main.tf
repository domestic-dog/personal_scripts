provider "google" {
zone = "${var.zone}"
project = "${var.project}"
}

module "serv_entity" {
source = "./modules/serv_entity"
public_key_path = "${var.public_key_path}"
zone = "${var.zone}"
#app_disk_img = "${var.app_disk_img}"
}


module "slaves" {
source = "./modules/slaves"
public_key_path = "${var.public_key_path}"
zone = "${var.zone}"
#app_disk_img = "${var.app_disk_img}"
}


#module "web-ui" {
#source = "./modules/web-ui"
#public_key_path = "${var.public_key_path}"
#zone = "${var.zone}"
##db_disk_image = "${var.db_disk_image}"
#}

