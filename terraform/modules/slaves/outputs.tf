output "instance_ips" {
  value = google_compute_address.slave_ip.address
}