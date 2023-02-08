#cloud-config

# Partition and format data disks
disk_setup:
{% for i in range(var.disk_count) %}
/dev/{{ var.disk_letters[i] }}:
table_type: gpt 
layout: true
overwrite: true
{% endfor %}

# Mount data disks
mounts:
{% for i in range(var.disk_count) %}
    - [ /dev/{{ var.disk_letters[i] }}1, var.mount_path{{ i + 1 }}, ext4, "defaults,noatime,nofail" ]
{% endfor %}

# Write fstab
fstab:
{% for i in range(var.disk_count) %}
- [ /dev/{{ local.disk_letters[i] }}1, var.mount_path{{ i + 1 }}, ext4, "defaults,noatime,nofail", 0, 0 ]
{% endfor %}
