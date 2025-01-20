variable "location" {
  description = "The Azure location where the Linux Virtual Machine Scale Set should exist."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Linux Virtual Machine Scale Set should be exist."
  type        = string
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

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine Scale Set should exist."
  type        = string
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

variable "tags" {
  description = "A mapping of tags which should be assigned to this Virtual Machine Scale Set."
  type        = map(string)
  default     = {}
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

variable "admin_ssh_key" {
  description = "An admin_ssh_key block as defined below."
  type = object({
    username   = string
    public_key = string
  })
}

variable "automatic_os_upgrade_policy" {
  description = "Should OS Upgrades automatically be applied to Scale Set instances in a rolling fashion when a newer version of the OS Image becomes available?"
  type = object({
    disable_automatic_rollback  = bool
    enable_automatic_os_upgrade = bool
  })
  default = null
}

variable "automatic_instance_repair" {
  description = "Should the automatic instance repair be enabled on this Virtual Machine Scale Set?"
  type = object({
    enabled      = bool
    grace_period = string
    action       = string
  })
  default = null
}

variable "boot_diagnostics" {
  description = "A boot_diagnostics block as defined below. - Passing a null value will utilize a Managed Storage Account to store Boot Diagnostics."
  type = object({
    storage_account_uri = string
  })
  default = null
}

variable "additional_capabilities" {
  description = "An additional_capabilities block as defined below."
  type = object({
    ultra_ssd_enabled = bool
  })
}

variable "data_disk" {
  description = "A data_disk block as defined below."
  type = object({
    name                           = string
    caching                        = string
    create_option                  = string
    disk_size_gb                   = number
    lun                            = number
    storage_account_type           = string
    disk_encryption_set_id         = string
    ultra_ssd_disk_iops_read_write = number
    ultra_ssd_disk_mbps_read_write = number
    write_accelerator_enabled      = bool
  })
  default = null
}

variable "extension" {
  description = "An extension block as defined below."
  type = object({
    name                       = string
    publisher                  = string
    type                       = string
    type_handler_version       = string
    auto_upgrade_minor_version = bool
    automatic_upgrade_enabled  = bool
    force_update_tag           = string
    protected_settings         = string
    protected_settings_from_key_vault = object({
      secret_url      = string
      source_vault_id = string
    })
    provision_after_extensions = list(string)
    settings                   = string
  })
}

variable "gallery_application" {
  description = "A gallery_application block as defined below."
  type = object({
    version_id             = string
    configuration_blob_uri = string
    order                  = number
    tag                    = string
  })
  default = null
}

variable "identity" {
  description = "An identity block as defined below."
  type = object({
    type         = string
    identity_ids = list(string)
  })
}


variable "network_interface" {
  description = "A network_interface block as defined below."
  type = object({
    name = string
    ip_configuration = object({
      name                                         = string
      application_gateway_backend_address_pool_ids = list(string)
      application_security_group_ids               = list(string)
      load_balancer_backend_address_pool_ids       = list(string)
      load_balancer_inbound_nat_rules_ids          = list(string)
      primary                                      = bool
      public_ip_address = object({
        name                    = string
        domain_name_label       = string
        idle_timeout_in_minutes = number
        ip_tag = object({
          tag  = string
          type = string
        })
        public_ip_prefix_id = string
        version             = string
      })
      subnet_id = string
      version   = string
    })
    dns_servers                   = list(string)
    enable_accelerated_networking = bool
    enable_ip_forwarding          = bool
    network_security_group_id     = string
    primary                       = bool
  })
}

variable "os_disk" {
  description = "An os_disk block as defined below."
  type = object({
    caching              = string
    storage_account_type = string
    diff_disk_settings = object({
      option    = string
      placement = string
    })
    disk_encryption_set_id           = string
    disk_size_gb                     = number
    secure_vm_disk_encryption_set_id = string
    security_encryption_type         = string
    write_accelerator_enabled        = bool
  })
}

variable "plan" {
  description = "A plan block as defined below."
  type = object({
    name      = string
    publisher = string
    product   = string
  })
  default = null
}

variable "scale_in" {
  description = "A scale_in block as defined below."
  type = object({
    rule                   = string
    force_deletion_enabled = bool
  })
  default = {
    rule                   = "Default"
    force_deletion_enabled = false
  }
}

variable "rolling_upgrade_policy" {
  description = "A rolling_upgrade_policy block as defined below."
  type = object({
    cross_zone_upgrades_enabled             = bool
    max_batch_instance_percent              = number
    max_unhealthy_instance_percent          = number
    max_unhealthy_upgraded_instance_percent = number
    pause_time_between_batches              = string
    prioritize_unhealthy_instances_enabled  = bool
    maximum_surge_instances_enabled         = bool
  })
  default = null
}

variable "secret" {
  description = "A secret block as defined below."
  type = object({
    certificate = list(object({
      url = string
    }))
    key_vault_id = string
  })
}

variable "termination_notification" {
  description = "A termination_notification block as defined below."
  type = object({
    enabled = bool
    timeout = string
  })
}

variable "source_image_reference" {
  description = "A source_image_reference block as defined below."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "spot_restore" {
  description = "A spot_restore block as defined below."
  type = object({
    enabled = bool
    timeout = string
  })

}
  

variable "naming_convention_info" {
  description = "A naming_convention_info block as defined below."
  type = object({
    name = string
    app = string
    site     = string
    env   = string
  })
}