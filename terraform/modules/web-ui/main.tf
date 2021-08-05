resource "google_compute_instance" "web-ui" {
name = "web-ui"
machine_type = "g1-small"
#zone = "${var.zone}"
tags = ["web-ui"]
boot_disk {
initialize_params {
image = "${var.app_disk_default}"
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