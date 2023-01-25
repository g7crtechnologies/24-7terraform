#cloud-config
device_aliases: {'ephemeral0': '/dev/sdb','datadisk': '/dev/sdc1'}

disk_setup:
    /dev/disk/azure/scsi1/lun0:
        table_type: gpt
        layout: True
        overwrite: True

fs_setup:
    - device: /dev/disk/azure/scsi1/lun0
      partition: 1
      filesystem: ext4

mounts:
    - ["/dev/disk/azure/scsi1/lun0-part1", "/datadisk", auto, "defaults,noexec,nofail"]