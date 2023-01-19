variable "instance_config" {
  description = <<-EOF
Parameters for configuring compute instances.
release_type = Set in metadata as 'release_type', determines salt highstate on VM.
network_type = The {pci_type}-{service_tier}, e.g.: cde-app, c2c-web, oos-db, etc.
service_account = Service account to assign to instance. If null, a service account will be generated.
service_account_scopes = Service account scopes. list of strings. if empty, no service account will be assigned. defaults to [ "cloud-platform" ]
instance_name = Sets the base name of the created instances. The created compute_instance resource will be named {prefix}-{instance_name}{number}-{zone}"
instance_count = How many instances of resource PER region.
can_ip_forward = Passed directly to google_compute_instance. Enables IP forwarding
regions = Which region(s) to put hosts into. This is a 'symbolic' region name like 'east' or 'west', not a specific GCP region name. If empty, will create hosts in all regions."
create_instance_groups = If true, instance groups are created with the created compute_instances
instance_group_named_ports = If create_instance_groups is true, this is a map of portnames -> port values for the instance group
zones = Which zone(s) to put the hosts into. This is a dictionary keyed by region.
Value is a map with a primary key of region name ('east'/'west'). Value is a list of zones in which to create compute_instances. Currently, only the first entry in the list will be used (due to a bug in Terraform) unless you also
set enable_multi_zone = true. See the CAVEAT for enable_multi_zone!
To create hosts in a single zone, specify only one zone.
For example:
```
instance_count = 4
regions = [ "east" ]
zones = { "east" = [ "us-east-4" ] }
```
enable_multi_zone = (bool) if true, spreads compute instances across
multiple zones in a region. If you enable multi zone, you should disable
the ILB, because of a graph cycle issue with terraform when reducing
instance_count.
metadata = Map of extra metadata to pass to all instances. This is merged with and overridden by instance_metadata. The metadata values have a limited macro substitution capability:
{{DC}} - datacenter/region name ("west", "east")
{{ENVIRONMENT}} - environment ("dev", "qa", "stg", etc.)
{{HOST}} - dns name or item name (if no DNS)
{{INSTANCE_NAME}} - instance name
{{NUMBER}} - host number, prefixed with leading zeroes
{{PROJECT}} - project name
{{PROJECT_ID}} - project ID (projectname-XXXX)
{{REGION}} - name of compute region (us-west2)
{{ZONE}} - name of compute zone (us-west2-a)
instance_metadata = Map of compute_resource name to metadata for that specific instance. Keys looked up are compute_resource.name and compute_resource.dnsname. Higher priority than metadata.
machine_type = Machine type for created instances.
deletion_protection = If true, prevents deletion (via terraform destroy) of this resource. defaults to False
enable_display = If true, enables Virtual Displays on the instance.
description = Short descriptive string for each of the instances
disk_auto_delete = Whether or not the disk should be auto-deleted.
disk_type = The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard.
disk_size_gb = The size of the boot image in gigabytes.
tags = Tags to apply to all compute_instance resources
instance_tags = Map of tags to apply to specific instances of compute resource. Keys are compute resource item name or dnsname, values are list of tags. Merged on top of variable 'tags'.
labels = A map of the labels to apply to the instances
instance_labels = A map of per-instance labels to apply to the each created compute resource. Keys are compute_instance resource item name or dns name. values are map(string). Merged on top of variable 'labels'
image_project = Which image project to pull images from. Default is 'centos-cloud', could use 'gce-uefi-images' to get Shielded VM support
image_family = Operating system and image version to deploy to compute_instances. If no version is specified, the latest version of the image in the image_project will be deployed.
use_preferred_image = If true, use the globally preferred image from the 'truth' module.
static_ips = Static IPs to assign to the instances. output of the tfs_static_ip module
attached_disks = A list of objects describing the size and type of additional disks to attach to each instance
list (object ({
disk_size_gb = number
disk_type = string
ephemeral = boolean (optional, default = true)
perpetual_disk_self_link = string (optional, ignored if ephemeral != true)
perpetual_disk_name = string (optional, ignored if ephemeral != true)
layout = list(object ({
label = string
filesystem = string
# number or "auto", "any" (cloud-init "none" not supported)
partition = any
mount_point = string
mount_options = string
fsck_freq = number
fsck_pass = number
overwrite = bool
# string "free" or number representing gb.
size = any
}) )
}))
dns_region_is_subdomain = If true, generated dns records will separate DNS instance name and region with a '.', otherwise, region in hostname will have '-'
name_include_region = If false, don't include region in dns name OR the compute instance name. This causes hosts to be numbered sequentially across regions. i.e.: instead of host01-east, host01-west, you will get host01, host02.
cloud_init = A dictionary of extra cloud-init data. The data will be serialized directly as a cloud init configuration file"
extra_cloud_init = A dictionary of extra cloud-init templates to process. The key should be the target host filename, and the value is an object (dictionary) with two keys: content_type (defaults to 'text/cloud-config'), and 'content' (file content). This should be rarely used!
write_files = A list of files to write to the target, using the write_files cloud-init module. Should be a list of file information blocks. Content blocks contain the following fields: 'content', 'source_file', or 'source_template' (precedence in that order), and 'path' (destination path on target). Optional fields are: 'owner' (defaults to 'root:root'), permissions (defaults to '0644').
disable_salt = If true, don't install salt client. This should be rarely used!
salt_master_overrides = Leave this blank, unless you know what you're doing. (list of strings to override default salt masters)
dns_ttl = Set the default TTL for DNS A records of created compute_instance
salt_config = Extra configuration to pass to salt minion configuration. Each key/value pair in map will be serialized as YAML and added to the minion configuration. One example usage is overriding saltenv, i.e.: {saltenv = 'my_branch'}
use_legacy_naming_convention = if null, use value from project.use_legacy_naming_convention. if true/false controls generation of old/new hostnames
disable_alt_cnames = if null, use value from project.disable_alt_cnames. if use_legacy_naming_convention == true, value is forced to false.
power_down = Setting this to True will power down the compute instances. The default is False (so that the systems are running).
guest_accelerator = A map of GPU parameters: "type" - the accellerator type resource to use, "count" - number of GPUs to allocate.
EOF
default = {
    name = "vm"
}
}

variable "host_info" {
  type = any
}