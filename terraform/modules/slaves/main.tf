resource "google_compute_instance" "app" {
name = "slave"
machine_type = "g1-small"
#zone = "${var.zone}"
tags = ["slaves"]
boot_disk {
initialize_params {
image = "${var.app_disk_img}"
}
}

network_interface {
network = "default"
access_config {
nat_ip = "${google_compute_address.app_ip.address}"
}
}
#metadata  = {
#ssh-keys = "appuser:${file(var.public_key_path)}"
#}
}

resource "google_compute_address" "app_ip" { name = "slave-party-ip" }
resource "google_compute_firewall" "slave-party" {
name = "slave-party-default"
network = "default"
allow {
protocol = "tcp"
ports = ["8080"]
}
source_ranges = ["0.0.0.0/0"]
target_tags = ["slaves"]
}
