variable project {
description = "Project ID"
}
variable zone {
description = "zone"
# Значение по умолчанию
default = "europe-west1-b"
}
variable public_key_path {
# Описание переменной
description = "Path to the public key used for ssh access"
}
variable disk_image {
description = "Disk image"
}

variable db_disk_image {
description = "Disk image for reddit db"
default = "reddit-db"
}

variable app_disk_img {
description = "Disk image for reddit db"
default = "app-base-1621678709"
}

