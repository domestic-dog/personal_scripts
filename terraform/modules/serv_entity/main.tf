resource "google_compute_instance" "service-entity" {
name = "service-entity"
machine_type = "g1-small"
#zone = "${var.zone}"
tags = ["service-entity"]
boot_disk {
initialize_params {
image = "${var.app_disk_img}"
}
}

network_interface {
network = "default"
access_config {
nat_ip = ""
}
}
#metadata  = {
#ssh-keys = "appuser:${file(var.public_key_path)}"
#}
}

resource "google_compute_instance" "rabbitmq" {
name = "rabbit-mq"
machine_type = "g1-small"
#zone = "${var.zone}"
tags = ["service-entity"]
boot_disk {
initialize_params {
image = "${var.app_disk_default}"
}
}

network_interface {
network = "default"
access_config {
nat_ip = "35.205.225.217"
}
}
#metadata  = {
#ssh-keys = "appuser:${file(var.public_key_path)}"
#}
}

resource "google_compute_address" "app_ip" { name = "serv-entity-ip" }
resource "google_compute_address" "mq_ip" { name = "mq-ip" }
resource "google_compute_firewall" "firewall_jenkins" {
name = "serv-entity-default"
network = "default"
allow {
protocol = "tcp"
ports = ["8080"]
}
source_ranges = ["0.0.0.0/0"]
target_tags = ["service-entity"]
}
