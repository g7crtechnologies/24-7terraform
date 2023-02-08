data "template_file" "disk" {
  template = var.template_file_disk

  vars = {
    disk_count   = var.disk_count
    disk_letters = var.disk_letters
    mount_path   = var.mount_path
  }
}

data "template_file" "write_files" {
  template = var.template_file_writefiles
}

# Render a multi-part cloud-init config making use of the part
# above, and other source files
data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.disk.rendered
  }

  part {
    filename     = "writefiles.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.write_files.rendered
  }
}
