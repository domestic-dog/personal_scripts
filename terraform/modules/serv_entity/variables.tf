variable app_disk_img {
description = "Jenkins instance"
default = "jenkins-instance-1623761690"
}
variable "app_disk_default" {
description = "docker instance"
default = "docker-default-1628098422"
}

variable public_key_path {
default = "/home/no/Desktop/infra-repo/secrets/id_rsa.pub"
description = "Path to the public key used for ssh access"
}

variable zone {
description = "zone"
# Значение по умолчанию
default = "europe-west1-b"
}

