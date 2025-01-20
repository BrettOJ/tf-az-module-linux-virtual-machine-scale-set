
variable "address_space" {
  type = list(string)
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "bgp_community" {
  type    = string
  default = null
}

variable "ddos_protection_plan" {
  type = map(any)
  default = {
    id     = ""
    enable = false
  }
}

variable "encryption" {
  type = map(any)
  default = {
    enforcement = ""
  }
}

variable "dns_servers" {
  type    = list(string)
  default = [""]
}

variable "edge_zone" {
  type    = string
  default = ""
}

variable "flow_timeout_in_minutes" {
  type    = number
  default = 4
}


variable "create_nsg" {
  type    = bool
  default = false
}

variable "admin_username" {
  description = "The username of the local administrator on each Virtual Machine Scale Set instance."
  type        = string
}

variable "instances" {
  description = "The number of Virtual Machines in the Scale Set."
  type        = number
  default     = 0
}

variable "sku" {
  description = "The Virtual Machine SKU for the Scale Set, such as Standard_F2."
  type        = string
}

variable "capacity_reservation_group_id" {
  description = "Specifies the ID of the Capacity Reservation Group which the Virtual Machine Scale Set should be allocated to."
  type        = string
}

variable "computer_name_prefix" {
  description = "The prefix which should be used for the name of the Virtual Machines in this Scale Set."
  type        = string
}

variable "custom_data" {
  description = "The Base64-Encoded Custom Data which should be used for this Virtual Machine Scale Set."
  type        = string
}

variable "disable_password_authentication" {
  description = "Should Password Authentication be disabled on this Virtual Machine Scale Set?"
  type        = bool
  default     = true
}

variable "do_not_run_extensions_on_overprovisioned_machines" {
  description = "Should Virtual Machine Extensions be run on Overprovisioned Virtual Machines in the Scale Set?"
  type        = bool
  default     = false
}

variable "encryption_at_host_enabled" {
  description = "Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
  type        = bool
}

variable "extension_operations_enabled" {
  description = "Should extension operations be allowed on the Virtual Machine Scale Set?"
  type        = bool
  default     = true
}

variable "extensions_time_budget" {
  description = "Specifies the duration allocated for all extensions to start."
  type        = string
  default     = "PT1H30M"
}

variable "eviction_policy" {
  description = "Specifies the eviction policy for Virtual Machines in this Scale Set."
  type        = string
}

variable "health_probe_id" {
  description = "The ID of a Load Balancer Probe which should be used to determine the health of an instance."
  type        = string
}

variable "host_group_id" {
  description = "Specifies the ID of the dedicated host group that the virtual machine scale set resides in."
  type        = string
}

variable "max_bid_price" {
  description = "The maximum price you're willing to pay for each Virtual Machine in this Scale Set, in US Dollars."
  type        = number
  default     = -1
}

variable "overprovision" {
  description = "Should Azure over-provision Virtual Machines in this Scale Set?"
  type        = bool
  default     = true
}

variable "platform_fault_domain_count" {
  description = "Specifies the number of fault domains that are used by this Linux Virtual Machine Scale Set."
  type        = number
}

variable "priority" {
  description = "The Priority of this Virtual Machine Scale Set."
  type        = string
  default     = "Regular"
}

variable "provision_vm_agent" {
  description = "Should the Azure VM Agent be provisioned on each Virtual Machine in the Scale Set?"
  type        = bool
  default     = true
}

variable "proximity_placement_group_id" {
  description = "The ID of the Proximity Placement Group in which the Virtual Machine Scale Set should be assigned to."
  type        = string
}

variable "secure_boot_enabled" {
  description = "Specifies whether secure boot should be enabled on the virtual machine."
  type        = bool
}

variable "single_placement_group" {
  description = "Should this Virtual Machine Scale Set be limited to a Single Placement Group, which means the number of instances will be capped at 100 Virtual Machines."
  type        = bool
  default     = true
}

variable "source_image_id" {
  description = "The ID of an Image which each Virtual Machine in this Scale Set should be based on."
  type        = string
}


variable "upgrade_mode" {
  description = "Specifies how Upgrades (e.g. changing the Image/SKU) should be performed to Virtual Machine Instances."
  type        = string
  default     = "Manual"
}

variable "user_data" {
  description = "The Base64-Encoded User Data which should be used for this Virtual Machine Scale Set."
  type        = string
}

variable "vtpm_enabled" {
  description = "Specifies whether vTPM should be enabled on the virtual machine."
  type        = bool
}

variable "zone_balance" {
  description = "Should the Virtual Machines in this Scale Set be strictly evenly distributed across Availability Zones?"
  type        = bool
  default     = false
}

variable "zones" {
  description = "Specifies a list of Availability Zones in which this Linux Virtual Machine Scale Set should be located."
  type        = list(string)
}

variable "ultra_ssd_enabled" {
  description = "Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine Scale Set?"
  type        = bool
  default     = false
}

variable "automatic_instance_repair_enabled" {
  description = "Should Automatic Instance Repair be enabled for this Virtual Machine Scale Set?"
  type        = bool
  default     = false
}

variable "automatic_instance_repair_grace_period" {
  description = "The grace period for Automatic Instance Repair."
  type        = string
  default     = "PT30M"
}

variable "automatic_instance_repair_action" {
  description = "The action to take when Automatic Instance Repair is triggered."
  type        = string
  default     = "Reimage"
}

variable "boot_diagnostics_storage_account_uri" {
  description = "The URI of the Storage Account where Boot Diagnostics should be stored."
  type        = string
}

variable "data_disk_name" {
  description = "The name of the Data Disk."
  type        = string
}

variable "data_disk_caching" {
  description = "The caching type of the Data Disk."
  type        = string

}

variable "data_disk_create_option" {
  description = "The create option of the Data Disk."
  type        = string
}

variable "data_disk_disk_size_gb" {
  description = "The size of the Data Disk in GB."
  type        = number
}

variable "data_disk_lun" {
  description = "The Logical Unit Number of the Data Disk."
  type        = number
}

variable "data_disk_storage_account_type" {
  description = "The Storage Account Type of the Data Disk."
  type        = string
}

variable "data_disk_disk_encryption_set_id" {
  description = "The ID of the Disk Encryption Set which should be used to encrypt the Data Disk."
  type        = string
}

variable "data_disk_ultra_ssd_disk_iops_read_write" {
  description = "The number of IOPS allowed for the UltraSSD Disk."
  type        = number
}

variable "data_disk_ultra_ssd_disk_mbps_read_write" {
  description = "The number of MBps allowed for the UltraSSD Disk."
  type        = number
}

variable "data_disk_write_accelerator_enabled" {
  description = "Should Write Accelerator be enabled on the Data Disk?"
  type        = bool
}

variable "extension_name" {
  description = "The name of the Extension."
  type        = string
}

variable "extension_publisher" {
  description = "The Publisher of the Extension."
  type        = string
}

variable "extension_type" {
  description = "The Type of the Extension."
  type        = string
}

variable "extension_type_handler_version" {
  description = "The Type Handler Version of the Extension."
  type        = string
}

variable "extension_auto_upgrade_minor_version" {
  description = "Should the Extension automatically upgrade to the latest minor version?"
  type        = bool
}

variable "extension_automatic_upgrade_enabled" {
  description = "Should the Extension automatically upgrade to the latest version?"
  type        = bool
}

variable "extension_force_update_tag" {
  description = "The Force Update Tag of the Extension."
  type        = string
}

variable "extension_protected_settings" {
  description = "The Protected Settings of the Extension."
  type        = string
}

variable "extension_protected_settings_from_key_vault_secret_url" {
  description = "The Secret URL of the Key Vault from which the Protected Settings should be retrieved."
  type        = string
}

variable "extension_protected_settings_from_key_vault_source_vault_id" {
  description = "The ID of the Key Vault from which the Protected Settings should be retrieved."
  type        = string
}

variable "extension_provision_after_extensions" {
  description = "A list of Extension names which should be provisioned before this Extension."
  type        = list(string)
}

variable "extension_settings" {
  description = "The Settings of the Extension."
  type        = string
}

variable "gallery_application_version_id" {
  description = "The Version ID of the Gallery Application."
  type        = string
}

variable "gallery_application_configuration_blob_uri" {
  description = "The Blob URI of the Gallery Application Configuration."
  type        = string
}

variable "gallery_application_order" {
  description = "The Order of the Gallery Application."
  type        = number
}

variable "gallery_application_tag" {
  description = "The Tag of the Gallery Application."
  type        = string
}

variable "identity_type" {
  description = "The Type of the Managed Identity."
  type        = string
}

variable "identity_identity_ids" {
  description = "A list of Managed Identity IDs."
  type        = list(string)
}

variable "network_interface_name" {
  description = "The name of the Network Interface."
  type        = string
}

variable "network_interface_dns_servers" {
  description = "A list of DNS Servers for the Network Interface."
  type        = list(string)
}

variable "network_interface_enable_accelerated_networking" {
  description = "Should Accelerated Networking be enabled on the Network Interface?"
  type        = bool
}

variable "network_interface_enable_ip_forwarding" {
  description = "Should IP Forwarding be enabled on the Network Interface?"
  type        = bool
}

variable "network_interface_network_security_group_id" {
  description = "The ID of the Network Security Group which should be associated with the Network Interface."
  type        = string
}

variable "network_interface_primary" {
  description = "Should this Network Interface be the Primary Interface on the Virtual Machine?"
  type        = bool
}

variable "network_interface_ip_configuration_name" {
  description = "The name of the IP Configuration."
  type        = string
}

variable "network_interface_ip_configuration_application_gateway_backend_address_pool_ids" {
  description = "A list of Application Gateway Backend Address Pool IDs."
  type        = list(string)
}

variable "network_interface_ip_configuration_application_security_group_ids" {
  description = "A list of Application Security Group IDs."
  type        = list(string)
}

variable "network_interface_ip_configuration_load_balancer_backend_address_pool_ids" {
  description = "A list of Load Balancer Backend Address Pool IDs."
  type        = list(string)
}

variable "network_interface_ip_configuration_load_balancer_inbound_nat_rules_ids" {
  description = "A list of Load Balancer Inbound NAT Rule IDs."
  type        = list(string)
}

variable "network_interface_ip_configuration_primary" {
  description = "Should this IP Configuration be the Primary Configuration on the Network Interface?"
  type        = bool
}

variable "network_interface_ip_configuration_public_ip_address_name" {
  description = "The name of the Public IP Address."
  type        = string
}

variable "network_interface_ip_configuration_public_ip_address_domain_name_label" {
  description = "The Domain Name Label of the Public IP Address."
  type        = string
}

variable "network_interface_ip_configuration_public_ip_address_idle_timeout_in_minutes" {
  description = "The Idle Timeout in Minutes of the Public IP Address."
  type        = number
}

variable "network_interface_ip_configuration_public_ip_address_ip_tag_tag" {
  description = "The Tag of the Public IP Address."
  type        = string
}

variable "network_interface_ip_configuration_public_ip_address_ip_tag_type" {
  description = "The Type of the Public IP Address."
  type        = string
}

variable "network_interface_ip_configuration_public_ip_address_public_ip_prefix_id" {
  description = "The ID of the Public IP Prefix which should be associated with the Public IP Address."
  type        = string
}

variable "network_interface_ip_configuration_public_ip_address_version" {
  description = "The Version of the Public IP Address."
  type        = string
}

variable "network_interface_ip_configuration_subnet_id" {
  description = "The ID of the Subnet which should be associated with the IP Configuration."
  type        = string
}

variable "network_interface_ip_configuration_version" {
  description = "The Version of the IP Configuration."
  type        = string
}


variable "os_disk_caching" {
  description = "The caching type of the OS Disk."
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "The Storage Account Type of the OS Disk."
  type        = string
}

variable "os_disk_disk_encryption_set_id" {
  description = "The ID of the Disk Encryption Set which should be used to encrypt the OS Disk."
  type        = string
}

variable "os_disk_disk_size_gb" {
  description = "The size of the OS Disk in GB."
  type        = number
}

variable "os_disk_secure_vm_disk_encryption_set_id" {
  description = "The ID of the Disk Encryption Set which should be used to encrypt the OS Disk."
  type        = string
}

variable "os_disk_security_encryption_type" {
  description = "The Encryption Type of the OS Disk."
  type        = string
}

variable "os_disk_write_accelerator_enabled" {
  description = "Should Write Accelerator be enabled on the OS Disk?"
  type        = bool
}

variable "diff_disk_settings_option" {
  description = "The Option of the Diff Disk Settings."
  type        = string
}

variable "diff_disk_settings_placement" {
  description = "The Placement of the Diff Disk Settings."
  type        = string
}

variable "plan_name" {
  description = "The Name of the Plan."
  type        = string
}

variable "plan_publisher" {
  description = "The Publisher of the Plan."
  type        = string
}

variable "plan_product" {
  description = "The Product of the Plan."
  type        = string
}

variable "additional_capabilities_ultra_ssd_enabled" {
  description = "Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine Scale Set?"
  type        = bool
}

variable "scale_in_rule" {
  description = "The Rule for Scale In."
  type        = string
}

variable "scale_in_force_deletion_enabled" {
  description = "Should Force Deletion be enabled for Scale In?"
  type        = bool
}

variable "rolling_upgrade_policy_cross_zone_upgrades_enabled" {
  description = "Should Cross Zone Upgrades be enabled for Rolling Upgrades?"
  type        = bool
}

variable "rolling_upgrade_policy_max_batch_instance_percent" {
  description = "The Maximum Batch Instance Percent for Rolling Upgrades."
  type        = number
}

variable "rolling_upgrade_policy_max_unhealthy_instance_percent" {
  description = "The Maximum Unhealthy Instance Percent for Rolling Upgrades."
  type        = number
}

variable "rolling_upgrade_policy_max_unhealthy_upgraded_instance_percent" {
  description = "The Maximum Unhealthy Upgraded Instance Percent for Rolling Upgrades."
  type        = number
}

variable "rolling_upgrade_policy_pause_time_between_batches" {
  description = "The Pause Time Between Batches for Rolling Upgrades."
  type        = string
}

variable "rolling_upgrade_policy_prioritize_unhealthy_instances_enabled" {
  description = "Should Unhealthy Instances be prioritized for Rolling Upgrades?"
  type        = bool
}

variable "rolling_upgrade_policy_maximum_surge_instances_enabled" {
  description = "Should Maximum Surge Instances be enabled for Rolling Upgrades?"
  type        = bool
}

variable "secret_certificate_url" {
  description = "The URL of the Certificate Secret."
  type        = string
}

variable "secret_key_vault_id" {
  description = "The ID of the Key Vault."
  type        = string
}

variable "termination_notification_enabled" {
  description = "Should Termination Notification be enabled?"
  type        = bool
}

variable "termination_notification_timeout" {
  description = "The Timeout for Termination Notification."
  type        = string
}

variable "source_image_reference_publisher" {
  description = "The Publisher of the Source Image Reference."
  type        = string
}

variable "source_image_reference_offer" {
  description = "The Offer of the Source Image Reference."
  type        = string
}

variable "source_image_reference_sku" {
  description = "The SKU of the Source Image Reference."
  type        = string
}

variable "source_image_reference_version" {
  description = "The Version of the Source Image Reference."
  type        = string
}

variable "automatic_os_upgrade_policy_disable_automatic_rollback" {
  description = "Should Automatic Rollback be disabled for Automatic OS Upgrades?"
  type        = bool
}

variable "automatic_os_upgrade_policy_enable_automatic_os_upgrade" {
  description = "Should Automatic OS Upgrades be enabled?"
  type        = bool
}

variable "spot_restore_enabled" {
  description = "Should Spot Restore be enabled?"
  type        = bool
}

variable "spot_restore_timeout" {
  description = "The Timeout for Spot Restore."
  type        = string
}

variable "admin_ssh_key_username" {
  description = "The username of the local administrator on each Virtual Machine Scale Set instance."
  type        = string
}

variable "admin_ssh_key_public_key" {
  description = "The Public Key of the local administrator on each Virtual Machine Scale Set instance."
  type        = string
}

# SSH Variables

variable "algorithm" {
  description = "The algorithm to use for the key. RSA or ECDSA."
  type        = string
  default     = "RSA"
}

variable "rsa_bits" {
  description = "The number of bits to use for the RSA key."
  type        = number
  default     = 2048
}

variable "ecdsa_curve" {
  description = "The name of the elliptic curve to use for the ECDSA key."
  type        = string
  default     = "P384"
}

variable "create_ssh_public_key" {
  description = "Create SSH Public Key."
  type        = bool
  default     = true
}









