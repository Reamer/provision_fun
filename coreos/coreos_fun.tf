variable "slave-amount" {
  type = "string"
}

// blank 10GB image for net install.
resource "libvirt_volume" "coreos-qcow2" {
  name = "coreos-qcow2-${count.index}"
  pool = "default"
  format = "qcow2"
  size = 10000000000
  count = "${var.slave-amount}"
}

resource "libvirt_domain" "terraform_test" {
  name = "terraform_test-${count.index}"
  vcpu = 2
  memory = 1024

  network_interface {
       bridge = "virbr1"
  }
  graphics {
    type = "vnc"
    listen_type = "address"
  }
  disk {
    volume_id = "${element(libvirt_volume.coreos-qcow2.*.id, count.index)}"
  }
  count = "${var.slave-amount}"
}
