# tf-az-module-linux-virtual-machine-scale-set
Terraform module to build an Azure Linux virtual machine scale set

Manages a Linux Virtual Machine Scale Set.

## [Disclaimers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#disclaimers)

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#example-usage)

This example provisions a basic Linux Virtual Machine Scale Set on an internal network. Additional examples of how to use the `azurerm_linux_virtual_machine_scale_set` resource can be found [in the ./examples/vm-scale-set/linux\` directory within the GitHub Repository](https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples/vm-scale-set/linux).

```hcl
locals { first_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+wWK73dCr+jgQOAxNsHAnNNNMEMWOHYEccp6wJm2gotpr9katuF/ZAdou5AaW1C61slRkHRkpRRX9FA9CYBiitZgvCCz+3nWNN7l/Up54Zps/pHWGZLHNJZRYyAB6j5yVLMVHIHriY49d/GZTZVNB8GoJv9Gakwc/fuEZYYl4YDFiGMBP///TzlI4jhiJzjKnEvqPFki5p2ZRJqcbCiF4pJrxUQR/RXqVFQdbRLZgYfJ8xGB878RENq3yQ39d8dVOkq4edbkzwcUmwwwkYVPIoDGsYLaRHnG+To7FvMeyO7xDVQkMKzopTQV8AuKpyvpqu0a9pWOMaiCyDytO7GGN you@me.com" } provider "azurerm" { features {} } resource "azurerm_resource_group" "example" { name = "example-resources" location = "West Europe" } resource "azurerm_virtual_network" "example" { name = "example-network" resource_group_name = azurerm_resource_group.example.name location = azurerm_resource_group.example.location address_space = ["10.0.0.0/16"] } resource "azurerm_subnet" "internal" { name = "internal" resource_group_name = azurerm_resource_group.example.name virtual_network_name = azurerm_virtual_network.example.name address_prefixes = ["10.0.2.0/24"] } resource "azurerm_linux_virtual_machine_scale_set" "example" { name = "example-vmss" resource_group_name = azurerm_resource_group.example.name location = azurerm_resource_group.example.location sku = "Standard_F2" instances = 1 admin_username = "adminuser" admin_ssh_key { username = "adminuser" public_key = local.first_public_key } source_image_reference { publisher = "Canonical" offer = "0001-com-ubuntu-server-jammy" sku = "22_04-lts" version = "latest" } os_disk { storage_account_type = "Standard_LRS" caching = "ReadWrite" } network_interface { name = "example" primary = true ip_configuration { name = "internal" primary = true subnet_id = azurerm_subnet.internal.id } } }
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#argument-reference)

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#name-1) - (Required) The name of the Linux Virtual Machine Scale Set. Changing this forces a new resource to be created.
    
-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#location-1) - (Required) The Azure location where the Linux Virtual Machine Scale Set should exist. Changing this forces a new resource to be created.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#resource_group_name-1) - (Required) The name of the Resource Group in which the Linux Virtual Machine Scale Set should be exist. Changing this forces a new resource to be created.
    
-   [`admin_username`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#admin_username-1) - (Required) The username of the local administrator on each Virtual Machine Scale Set instance. Changing this forces a new resource to be created.
    
-   [`instances`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#instances-1) - (Optional) The number of Virtual Machines in the Scale Set. Defaults to `0`.
    

-   [`sku`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#sku-1) - (Required) The Virtual Machine SKU for the Scale Set, such as `Standard_F2`.
    
-   [`network_interface`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#network_interface-1) - (Required) One or more `network_interface` blocks as defined below.
    
-   [`os_disk`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#os_disk-1) - (Required) An `os_disk` block as defined below.
    

___

-   [`additional_capabilities`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#additional_capabilities-1) - (Optional) An `additional_capabilities` block as defined below.
    
-   [`admin_password`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#admin_password-1) - (Optional) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created.
    

-   [`admin_ssh_key`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#admin_ssh_key-1) - (Optional) One or more `admin_ssh_key` blocks as defined below.

-   [`automatic_os_upgrade_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#automatic_os_upgrade_policy-1) - (Optional) An `automatic_os_upgrade_policy` block as defined below. This can only be specified when `upgrade_mode` is set to either `Automatic` or `Rolling`.
    
-   [`automatic_instance_repair`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#automatic_instance_repair-1) - (Optional) An `automatic_instance_repair` block as defined below. To enable the automatic instance repair, this Virtual Machine Scale Set must have a valid `health_probe_id` or an [Application Health Extension](https://docs.microsoft.com/azure/virtual-machine-scale-sets/virtual-machine-scale-sets-health-extension).
    

-   [`boot_diagnostics`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#boot_diagnostics-1) - (Optional) A `boot_diagnostics` block as defined below.
    
-   [`capacity_reservation_group_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#capacity_reservation_group_id-1) - (Optional) Specifies the ID of the Capacity Reservation Group which the Virtual Machine Scale Set should be allocated to. Changing this forces a new resource to be created.
    

-   [`computer_name_prefix`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#computer_name_prefix-1) - (Optional) The prefix which should be used for the name of the Virtual Machines in this Scale Set. If unspecified this defaults to the value for the `name` field. If the value of the `name` field is not a valid `computer_name_prefix`, then you must specify `computer_name_prefix`. Changing this forces a new resource to be created.
    
-   [`custom_data`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#custom_data-1) - (Optional) The Base64-Encoded Custom Data which should be used for this Virtual Machine Scale Set.
    

-   [`data_disk`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#data_disk-1) - (Optional) One or more `data_disk` blocks as defined below.
    
-   [`disable_password_authentication`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#disable_password_authentication-1) - (Optional) Should Password Authentication be disabled on this Virtual Machine Scale Set? Defaults to `true`.
    

-   [`do_not_run_extensions_on_overprovisioned_machines`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#do_not_run_extensions_on_overprovisioned_machines-1) - (Optional) Should Virtual Machine Extensions be run on Overprovisioned Virtual Machines in the Scale Set? Defaults to `false`.
    
-   [`edge_zone`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#edge_zone-1) - (Optional) Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine Scale Set should exist. Changing this forces a new Linux Virtual Machine Scale Set to be created.
    
-   [`encryption_at_host_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#encryption_at_host_enabled-1) - (Optional) Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?
    
-   [`extension`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#extension-1) - (Optional) One or more `extension` blocks as defined below
    
-   [`extension_operations_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#extension_operations_enabled-1) - (Optional) Should extension operations be allowed on the Virtual Machine Scale Set? Possible values are `true` or `false`. Defaults to `true`. Changing this forces a new Linux Virtual Machine Scale Set to be created.
    

-   [`extensions_time_budget`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#extensions_time_budget-1) - (Optional) Specifies the duration allocated for all extensions to start. The time duration should be between `15` minutes and `120` minutes (inclusive) and should be specified in ISO 8601 format. Defaults to `PT1H30M`.
    
-   [`eviction_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#eviction_policy-1) - (Optional) Specifies the eviction policy for Virtual Machines in this Scale Set. Possible values are `Deallocate` and `Delete`. Changing this forces a new resource to be created.
    

-   [`gallery_application`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#gallery_application-1) - (Optional) One or more `gallery_application` blocks as defined below.
    
-   [`health_probe_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#health_probe_id-1) - (Optional) The ID of a Load Balancer Probe which should be used to determine the health of an instance. This is Required and can only be specified when `upgrade_mode` is set to `Automatic` or `Rolling`.
    
-   [`host_group_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#host_group_id-1) - (Optional) Specifies the ID of the dedicated host group that the virtual machine scale set resides in. Changing this forces a new resource to be created.
    
-   [`identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#identity-1) - (Optional) An `identity` block as defined below.
    
-   [`max_bid_price`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#max_bid_price-1) - (Optional) The maximum price you're willing to pay for each Virtual Machine in this Scale Set, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machines in the Scale Set will be evicted using the `eviction_policy`. Defaults to `-1`, which means that each Virtual Machine in this Scale Set should not be evicted for price reasons.
    

-   [`overprovision`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#overprovision-1) - (Optional) Should Azure over-provision Virtual Machines in this Scale Set? This means that multiple Virtual Machines will be provisioned and Azure will keep the instances which become available first - which improves provisioning success rates and improves deployment time. You're not billed for these over-provisioned VM's and they don't count towards the Subscription Quota. Defaults to `true`.
    
-   [`plan`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#plan-1) - (Optional) A `plan` block as defined below. Changing this forces a new resource to be created.
    

-   [`platform_fault_domain_count`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#platform_fault_domain_count-1) - (Optional) Specifies the number of fault domains that are used by this Linux Virtual Machine Scale Set. Changing this forces a new resource to be created.
    
-   [`priority`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#priority-1) - (Optional) The Priority of this Virtual Machine Scale Set. Possible values are `Regular` and `Spot`. Defaults to `Regular`. Changing this value forces a new resource.
    

-   [`provision_vm_agent`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#provision_vm_agent-1) - (Optional) Should the Azure VM Agent be provisioned on each Virtual Machine in the Scale Set? Defaults to `true`. Changing this value forces a new resource to be created.
    
-   [`proximity_placement_group_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#proximity_placement_group_id-1) - (Optional) The ID of the Proximity Placement Group in which the Virtual Machine Scale Set should be assigned to. Changing this forces a new resource to be created.
    
-   [`rolling_upgrade_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#rolling_upgrade_policy-1) - (Optional) A `rolling_upgrade_policy` block as defined below. This is Required and can only be specified when `upgrade_mode` is set to `Automatic` or `Rolling`. Changing this forces a new resource to be created.
    
-   [`scale_in`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#scale_in-1) - (Optional) A `scale_in` block as defined below.
    
-   [`secret`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#secret-1) - (Optional) One or more `secret` blocks as defined below.
    
-   [`secure_boot_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#secure_boot_enabled-1) - (Optional) Specifies whether secure boot should be enabled on the virtual machine. Changing this forces a new resource to be created.
    
-   [`single_placement_group`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#single_placement_group-1) - (Optional) Should this Virtual Machine Scale Set be limited to a Single Placement Group, which means the number of instances will be capped at 100 Virtual Machines. Defaults to `true`.
    
-   [`source_image_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#source_image_id-1) - (Optional) The ID of an Image which each Virtual Machine in this Scale Set should be based on. Possible Image ID types include `Image ID`, `Shared Image ID`, `Shared Image Version ID`, `Community Gallery Image ID`, `Community Gallery Image Version ID`, `Shared Gallery Image ID` and `Shared Gallery Image Version ID`.
    

-   [`source_image_reference`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#source_image_reference-1) - (Optional) A `source_image_reference` block as defined below.

-   [`spot_restore`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#spot_restore-1) - (Optional) A `spot_restore` block as defined below.
    
-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#tags-1) - (Optional) A mapping of tags which should be assigned to this Virtual Machine Scale Set.
    
-   [`termination_notification`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#termination_notification-1) - (Optional) A `termination_notification` block as defined below.
    
-   [`upgrade_mode`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#upgrade_mode-1) - (Optional) Specifies how Upgrades (e.g. changing the Image/SKU) should be performed to Virtual Machine Instances. Possible values are `Automatic`, `Manual` and `Rolling`. Defaults to `Manual`. Changing this forces a new resource to be created.
    

-   [`user_data`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#user_data-1) - (Optional) The Base64-Encoded User Data which should be used for this Virtual Machine Scale Set.
    
-   [`vtpm_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#vtpm_enabled-1) - (Optional) Specifies whether vTPM should be enabled on the virtual machine. Changing this forces a new resource to be created.
    
-   [`zone_balance`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#zone_balance-1) - (Optional) Should the Virtual Machines in this Scale Set be strictly evenly distributed across Availability Zones? Defaults to `false`. Changing this forces a new resource to be created.
    

-   [`zones`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#zones-1) - (Optional) Specifies a list of Availability Zones in which this Linux Virtual Machine Scale Set should be located.

___

An `additional_capabilities` block supports the following:

-   [`ultra_ssd_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#ultra_ssd_enabled-1) - (Optional) Should the capacity to enable Data Disks of the `UltraSSD_LRS` storage account type be supported on this Virtual Machine Scale Set? Possible values are `true` or `false`. Defaults to `false`. Changing this forces a new resource to be created.

___

An `admin_ssh_key` block supports the following:

-   [`public_key`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#public_key-1) - (Required) The Public Key which should be used for authentication, which needs to be in `ssh-rsa` format with at least 2048-bit or in `ssh-ed25519` format.
    
-   [`username`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#username-1) - (Required) The Username for which this Public SSH Key should be configured.
    

___

An `automatic_os_upgrade_policy` block supports the following:

-   [`disable_automatic_rollback`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#disable_automatic_rollback-1) - (Required) Should automatic rollbacks be disabled?
    
-   [`enable_automatic_os_upgrade`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#enable_automatic_os_upgrade-1) - (Required) Should OS Upgrades automatically be applied to Scale Set instances in a rolling fashion when a newer version of the OS Image becomes available?
    

___

An `automatic_instance_repair` block supports the following:

-   [`enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#enabled-1) - (Required) Should the automatic instance repair be enabled on this Virtual Machine Scale Set?
    
-   [`grace_period`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#grace_period-1) - (Optional) Amount of time for which automatic repairs will be delayed. The grace period starts right after the VM is found unhealthy. Possible values are between `10` and `90` minutes. The time duration should be specified in `ISO 8601` format (e.g. `PT10M` to `PT90M`).
    

-   [`action`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#action-1) - (Optional) The repair action that will be used for repairing unhealthy virtual machines in the scale set. Possible values include `Replace`, `Restart`, `Reimage`.

___

A `boot_diagnostics` block supports the following:

-   [`storage_account_uri`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#storage_account_uri-1) - (Optional) The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor.

___

A `certificate` block supports the following:

-   [`url`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#url-1) - (Required) The Secret URL of a Key Vault Certificate.

___

A `data_disk` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#name-2) - (Optional) The name of the Data Disk.
    
-   [`caching`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#caching-1) - (Required) The type of Caching which should be used for this Data Disk. Possible values are `None`, `ReadOnly` and `ReadWrite`.
    
-   [`create_option`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#create_option-1) - (Optional) The create option which should be used for this Data Disk. Possible values are `Empty` and `FromImage`. Defaults to `Empty`. (`FromImage` should only be used if the source image includes data disks).
    
-   [`disk_size_gb`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#disk_size_gb-1) - (Required) The size of the Data Disk which should be created.
    
-   [`lun`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#lun-1) - (Required) The Logical Unit Number of the Data Disk, which must be unique within the Virtual Machine.
    
-   [`storage_account_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#storage_account_type-1) - (Required) The Type of Storage Account which should back this Data Disk. Possible values include `Standard_LRS`, `StandardSSD_LRS`, `StandardSSD_ZRS`, `Premium_LRS`, `PremiumV2_LRS`, `Premium_ZRS` and `UltraSSD_LRS`.
    

-   [`disk_encryption_set_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#disk_encryption_set_id-1) - (Optional) The ID of the Disk Encryption Set which should be used to encrypt this Data Disk. Changing this forces a new resource to be created.

-   [`ultra_ssd_disk_iops_read_write`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#ultra_ssd_disk_iops_read_write-1) - (Optional) Specifies the Read-Write IOPS for this Data Disk. Only settable when `storage_account_type` is `PremiumV2_LRS` or `UltraSSD_LRS`.
    
-   [`ultra_ssd_disk_mbps_read_write`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#ultra_ssd_disk_mbps_read_write-1) - (Optional) Specifies the bandwidth in MB per second for this Data Disk. Only settable when `storage_account_type` is `PremiumV2_LRS` or `UltraSSD_LRS`.
    
-   [`write_accelerator_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#write_accelerator_enabled-1) - (Optional) Should Write Accelerator be enabled for this Data Disk? Defaults to `false`.
    

___

A `diff_disk_settings` block supports the following:

-   [`option`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#option-1) - (Required) Specifies the Ephemeral Disk Settings for the OS Disk. At this time the only possible value is `Local`. Changing this forces a new resource to be created.
    
-   [`placement`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#placement-1) - (Optional) Specifies where to store the Ephemeral Disk. Possible values are `CacheDisk` and `ResourceDisk`. Defaults to `CacheDisk`. Changing this forces a new resource to be created.
    

___

An `extension` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#name-3) - (Required) The name for the Virtual Machine Scale Set Extension.
    
-   [`publisher`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#publisher-1) - (Required) Specifies the Publisher of the Extension.
    
-   [`type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#type-1) - (Required) Specifies the Type of the Extension.
    
-   [`type_handler_version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#type_handler_version-1) - (Required) Specifies the version of the extension to use, available versions can be found using the Azure CLI.
    
-   [`auto_upgrade_minor_version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#auto_upgrade_minor_version-1) - (Optional) Should the latest version of the Extension be used at Deployment Time, if one is available? This won't auto-update the extension on existing installation. Defaults to `true`.
    
-   [`automatic_upgrade_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#automatic_upgrade_enabled-1) - (Optional) Should the Extension be automatically updated whenever the Publisher releases a new version of this VM Extension?
    
-   [`force_update_tag`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#force_update_tag-1) - (Optional) A value which, when different to the previous value can be used to force-run the Extension even if the Extension Configuration hasn't changed.
    
-   [`protected_settings`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#protected_settings-1) - (Optional) A JSON String which specifies Sensitive Settings (such as Passwords) for the Extension.
    

-   [`protected_settings_from_key_vault`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#protected_settings_from_key_vault-1) - (Optional) A `protected_settings_from_key_vault` block as defined below.

-   [`provision_after_extensions`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#provision_after_extensions-1) - (Optional) An ordered list of Extension names which this should be provisioned after.
    
-   [`settings`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#settings-1) - (Optional) A JSON String which specifies Settings for the Extension.
    

___

A `gallery_application` block supports the following:

-   [`version_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#version_id-1) - (Required) Specifies the Gallery Application Version resource ID. Changing this forces a new resource to be created.
    
-   [`configuration_blob_uri`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#configuration_blob_uri-1) - (Optional) Specifies the URI to an Azure Blob that will replace the default configuration for the package if provided. Changing this forces a new resource to be created.
    
-   [`order`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#order-1) - (Optional) Specifies the order in which the packages have to be installed. Possible values are between `0` and `2147483647`. Defaults to `0`. Changing this forces a new resource to be created.
    
-   [`tag`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#tag-1) - (Optional) Specifies a passthrough value for more generic context. This field can be any valid `string` value. Changing this forces a new resource to be created.
    

___

An `identity` block supports the following:

-   [`type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#type-2) - (Required) Specifies the type of Managed Service Identity that should be configured on this Linux Virtual Machine Scale Set. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both).
    
-   [`identity_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#identity_ids-1) - (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Linux Virtual Machine Scale Set.
    

___

An `ip_configuration` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#name-4) - (Required) The Name which should be used for this IP Configuration.
    
-   [`application_gateway_backend_address_pool_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#application_gateway_backend_address_pool_ids-1) - (Optional) A list of Backend Address Pools ID's from a Application Gateway which this Virtual Machine Scale Set should be connected to.
    
-   [`application_security_group_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#application_security_group_ids-1) - (Optional) A list of Application Security Group ID's which this Virtual Machine Scale Set should be connected to.
    
-   [`load_balancer_backend_address_pool_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#load_balancer_backend_address_pool_ids-1) - (Optional) A list of Backend Address Pools ID's from a Load Balancer which this Virtual Machine Scale Set should be connected to.
    

-   [`load_balancer_inbound_nat_rules_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#load_balancer_inbound_nat_rules_ids-1) - (Optional) A list of NAT Rule ID's from a Load Balancer which this Virtual Machine Scale Set should be connected to.

-   [`primary`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#primary-1) - (Optional) Is this the Primary IP Configuration for this Network Interface? Defaults to `false`.

-   [`public_ip_address`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#public_ip_address-1) - (Optional) A `public_ip_address` block as defined below.
    
-   [`subnet_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#subnet_id-1) - (Optional) The ID of the Subnet which this IP Configuration should be connected to.
    

-   [`version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#version-1) - (Optional) The Internet Protocol Version which should be used for this IP Configuration. Possible values are `IPv4` and `IPv6`. Defaults to `IPv4`.

___

An `ip_tag` block supports the following:

-   [`tag`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#tag-2) - (Required) The IP Tag associated with the Public IP, such as `SQL` or `Storage`. Changing this forces a new resource to be created.
    
-   [`type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#type-3) - (Required) The Type of IP Tag, such as `FirstPartyUsage`. Changing this forces a new resource to be created.
    

___

A `network_interface` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#name-5) - (Required) The Name which should be used for this Network Interface. Changing this forces a new resource to be created.
    
-   [`ip_configuration`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#ip_configuration-1) - (Required) One or more `ip_configuration` blocks as defined above.
    
-   [`dns_servers`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#dns_servers-1) - (Optional) A list of IP Addresses of DNS Servers which should be assigned to the Network Interface.
    
-   [`enable_accelerated_networking`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#enable_accelerated_networking-1) - (Optional) Does this Network Interface support Accelerated Networking? Defaults to `false`.
    
-   [`enable_ip_forwarding`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#enable_ip_forwarding-1) - (Optional) Does this Network Interface support IP Forwarding? Defaults to `false`.
    
-   [`network_security_group_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#network_security_group_id-1) - (Optional) The ID of a Network Security Group which should be assigned to this Network Interface.
    
-   [`primary`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#primary-2) - (Optional) Is this the Primary IP Configuration?
    

___

An `os_disk` block supports the following:

-   [`caching`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#caching-2) - (Required) The Type of Caching which should be used for the Internal OS Disk. Possible values are `None`, `ReadOnly` and `ReadWrite`.
    
-   [`storage_account_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#storage_account_type-2) - (Required) The Type of Storage Account which should back this the Internal OS Disk. Possible values include `Standard_LRS`, `StandardSSD_LRS`, `StandardSSD_ZRS`, `Premium_LRS` and `Premium_ZRS`. Changing this forces a new resource to be created.
    
-   [`diff_disk_settings`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#diff_disk_settings-1) - (Optional) A `diff_disk_settings` block as defined above. Changing this forces a new resource to be created.
    
-   [`disk_encryption_set_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#disk_encryption_set_id-2) - (Optional) The ID of the Disk Encryption Set which should be used to encrypt this OS Disk. Conflicts with `secure_vm_disk_encryption_set_id`. Changing this forces a new resource to be created.
    

-   [`disk_size_gb`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#disk_size_gb-2) - (Optional) The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine Scale Set is sourced from.

-   [`secure_vm_disk_encryption_set_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#secure_vm_disk_encryption_set_id-1) - (Optional) The ID of the Disk Encryption Set which should be used to Encrypt the OS Disk when the Virtual Machine Scale Set is Confidential VMSS. Conflicts with `disk_encryption_set_id`. Changing this forces a new resource to be created.

-   [`security_encryption_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#security_encryption_type-1) - (Optional) Encryption Type when the Virtual Machine Scale Set is Confidential VMSS. Possible values are `VMGuestStateOnly` and `DiskWithVMGuestState`. Changing this forces a new resource to be created.

-   [`write_accelerator_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#write_accelerator_enabled-2) - (Optional) Should Write Accelerator be Enabled for this OS Disk? Defaults to `false`.

___

A `plan` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#name-6) - (Required) Specifies the name of the image from the marketplace. Changing this forces a new resource to be created.
    
-   [`publisher`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#publisher-2) - (Required) Specifies the publisher of the image. Changing this forces a new resource to be created.
    
-   [`product`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#product-1) - (Required) Specifies the product of the image from the marketplace. Changing this forces a new resource to be created.
    

___

A `protected_settings_from_key_vault` block supports the following:

-   [`secret_url`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#secret_url-1) - (Required) The URL to the Key Vault Secret which stores the protected settings.
    
-   [`source_vault_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#source_vault_id-1) - (Required) The ID of the source Key Vault.
    

___

A `scale_in` block supports the following:

-   [`rule`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#rule-1) - (Optional) The scale-in policy rule that decides which virtual machines are chosen for removal when a Virtual Machine Scale Set is scaled in. Possible values for the scale-in policy rules are `Default`, `NewestVM` and `OldestVM`, defaults to `Default`. For more information about scale in policy, please [refer to this doc](https://docs.microsoft.com/azure/virtual-machine-scale-sets/virtual-machine-scale-sets-scale-in-policy).
    
-   [`force_deletion_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#force_deletion_enabled-1) - (Optional) Should the virtual machines chosen for removal be force deleted when the virtual machine scale set is being scaled-in? Possible values are `true` or `false`. Defaults to `false`.
    

___

A `public_ip_address` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#name-7) - (Required) The Name of the Public IP Address Configuration.
    
-   [`domain_name_label`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#domain_name_label-1) - (Optional) The Prefix which should be used for the Domain Name Label for each Virtual Machine Instance. Azure concatenates the Domain Name Label and Virtual Machine Index to create a unique Domain Name Label for each Virtual Machine.
    
-   [`idle_timeout_in_minutes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#idle_timeout_in_minutes-1) - (Optional) The Idle Timeout in Minutes for the Public IP Address. Possible values are in the range `4` to `32`.
    
-   [`ip_tag`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#ip_tag-1) - (Optional) One or more `ip_tag` blocks as defined above. Changing this forces a new resource to be created.
    
-   [`public_ip_prefix_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#public_ip_prefix_id-1) - (Optional) The ID of the Public IP Address Prefix from where Public IP Addresses should be allocated. Changing this forces a new resource to be created.
    

-   [`version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#version-2) - (Optional) The Internet Protocol Version which should be used for this public IP address. Possible values are `IPv4` and `IPv6`. Defaults to `IPv4`. Changing this forces a new resource to be created.

___

A `rolling_upgrade_policy` block supports the following:

-   [`cross_zone_upgrades_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#cross_zone_upgrades_enabled-1) - (Optional) Should the Virtual Machine Scale Set ignore the Azure Zone boundaries when constructing upgrade batches? Possible values are `true` or `false`.
    
-   [`max_batch_instance_percent`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#max_batch_instance_percent-1) - (Required) The maximum percent of total virtual machine instances that will be upgraded simultaneously by the rolling upgrade in one batch. As this is a maximum, unhealthy instances in previous or future batches can cause the percentage of instances in a batch to decrease to ensure higher reliability.
    
-   [`max_unhealthy_instance_percent`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#max_unhealthy_instance_percent-1) - (Required) The maximum percentage of the total virtual machine instances in the scale set that can be simultaneously unhealthy, either as a result of being upgraded, or by being found in an unhealthy state by the virtual machine health checks before the rolling upgrade aborts. This constraint will be checked prior to starting any batch.
    
-   [`max_unhealthy_upgraded_instance_percent`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#max_unhealthy_upgraded_instance_percent-1) - (Required) The maximum percentage of upgraded virtual machine instances that can be found to be in an unhealthy state. This check will happen after each batch is upgraded. If this percentage is ever exceeded, the rolling update aborts.
    
-   [`pause_time_between_batches`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#pause_time_between_batches-1) - (Required) The wait time between completing the update for all virtual machines in one batch and starting the next batch. The time duration should be specified in ISO 8601 format.
    
-   [`prioritize_unhealthy_instances_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#prioritize_unhealthy_instances_enabled-1) - (Optional) Upgrade all unhealthy instances in a scale set before any healthy instances. Possible values are `true` or `false`.
    
-   [`maximum_surge_instances_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#maximum_surge_instances_enabled-1) - (Optional) Create new virtual machines to upgrade the scale set, rather than updating the existing virtual machines. Existing virtual machines will be deleted once the new virtual machines are created for each batch. Possible values are `true` or `false`.
    

___

A `secret` block supports the following:

-   [`certificate`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#certificate-1) - (Required) One or more `certificate` blocks as defined above.
    
-   [`key_vault_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#key_vault_id-1) - (Required) The ID of the Key Vault from which all Secrets should be sourced.
    

___

A `termination_notification` block supports the following:

-   [`enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#enabled-2) - (Required) Should the termination notification be enabled on this Virtual Machine Scale Set?
    
-   [`timeout`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#timeout-1) - (Optional) Length of time (in minutes, between 5 and 15) a notification to be sent to the VM on the instance metadata server till the VM gets deleted. The time duration should be specified in ISO 8601 format. Defaults to `PT5M`.
    

___

A `source_image_reference` block supports the following:

-   [`publisher`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#publisher-3) - (Required) Specifies the publisher of the image used to create the virtual machines. Changing this forces a new resource to be created.
    
-   [`offer`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#offer-1) - (Required) Specifies the offer of the image used to create the virtual machines. Changing this forces a new resource to be created.
    
-   [`sku`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#sku-2) - (Required) Specifies the SKU of the image used to create the virtual machines.
    
-   [`version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#version-3) - (Required) Specifies the version of the image used to create the virtual machines.
    

___

A `spot_restore` block supports the following:

-   [`enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#enabled-3) - (Optional) Should the Spot-Try-Restore feature be enabled? The Spot-Try-Restore feature will attempt to automatically restore the evicted Spot Virtual Machine Scale Set VM instances opportunistically based on capacity availability and pricing constraints. Possible values are `true` or `false`. Defaults to `false`. Changing this forces a new resource to be created.
    
-   [`timeout`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#timeout-2) - (Optional) The length of time that the Virtual Machine Scale Set should attempt to restore the Spot VM instances which have been evicted. The time duration should be between `15` minutes and `120` minutes (inclusive). The time duration should be specified in the ISO 8601 format. Defaults to `PT1H`. Changing this forces a new resource to be created.
    

___

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#id-1) - The ID of the Linux Virtual Machine Scale Set.
    
-   [`identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#identity-2) - A `identity` block as defined below.
    
-   [`unique_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#unique_id-1) - The Unique ID for this Linux Virtual Machine Scale Set.
    

___

A `identity` block exports the following:

-   [`principal_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#principal_id-1) - The Principal ID associated with this Managed Service Identity.
    
-   [`tenant_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#tenant_id-2) - The Tenant ID associated with this Managed Service Identity.
    

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#create-1) - (Defaults to 60 minutes) Used when creating the Linux Virtual Machine Scale Set.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#read-1) - (Defaults to 5 minutes) Used when reading the Linux Virtual Machine Scale Set.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#update-1) - (Defaults to 60 minutes) Used when updating (and rolling the instances of) the Linux Virtual Machine Scale Set (e.g. when changing SKU).
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#delete-1) - (Defaults to 60 minutes) Used when deleting the Linux Virtual Machine Scale Set.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set#import)

Linux Virtual Machine Scale Sets can be imported using the `resource id`, e.g.

```shell
terraform import azurerm_linux_virtual_machine_scale_set.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Compute/virtualMachineScaleSets/scaleset1
```