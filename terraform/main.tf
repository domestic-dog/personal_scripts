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
#module "web-ui" {
#source = "./modules/web-ui"
#public_key_path = "${var.public_key_path}"
#zone = "${var.zone}"
##db_disk_image = "${var.db_disk_image}"
#}

resource "google_compute_instance" "app" {
name = "learn-jenkins"
machine_type = "g1-small"
zone = "${var.zone}"
tags = ["jenkins"]
boot_disk {
initialize_params {
image = "ubuntu-1604-xenial-v20210429"
}
}


network_interface {
network = "default"
access_config {
nat_ip = "${google_compute_address.app_ip.address}"
}

}
}
resource "google_compute_address" "app_ip" { name = "ip-test" }
