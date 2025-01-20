locals {
  naming_convention_info = {
    site = "site"
    env  = "env"
    app  = "app"
    name = "name"
  }
  tags = {
    environment = "Production"
    created_by  = "Terraform"
  }
}
module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags = local.tags
    }
  }
}

module "azure_virtual_network" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-virtual-network?ref=main"
  location               = var.location
  resource_group_name    = module.resource_groups.rg_output[1].name
  address_space          = var.address_space
  dns_servers            = var.dns_servers
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags

}

module "azure_subnet" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-network-subnet?ref=main"
  resource_group_name    = module.resource_groups.rg_output[1].name
  virtual_network_name   = module.azure_virtual_network.vnets_output.name
  location               = var.location
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags
  create_nsg             = var.create_nsg
  subnets = {
    001 = {
      address_prefixes                          = ["10.0.1.0/24"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = null
      route_table_id                            = null
      delegation                                = null
      nsg_inbound                               = []
      nsg_outbound                              = []
    }
  }
}

module "tls_private_key" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-tls-private-key?ref=main"
  algorithm              = var.algorithm
  rsa_bits               = var.rsa_bits
  ecdsa_curve            = var.ecdsa_curve
  resource_group_name    = var.resource_group_name
  create_ssh_public_key  = var.create_ssh_public_key
  location               = var.location
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags
}

module "azurerm_linux_virtual_machine_scale_set" {
  source                                            = "git::https://git::https://github.com/BrettOJ/tf-az-module-linux-virtual-machine-scale-set"
  resource_group_name                               = var.resource_group_name
  location                                          = var.location
  sku                                               = var.sku
  instances                                         = var.instances
  admin_username                                    = var.admin_username
  capacity_reservation_group_id                     = var.capacity_reservation_group_id
  computer_name_prefix                              = var.computer_name_prefix
  custom_data                                       = var.custom_data
  disable_password_authentication                   = var.disable_password_authentication
  do_not_run_extensions_on_overprovisioned_machines = var.do_not_run_extensions_on_overprovisioned_machines
  edge_zone                                         = var.edge_zone
  encryption_at_host_enabled                        = var.encryption_at_host_enabled
  extension_operations_enabled                      = var.extension_operations_enabled
  extensions_time_budget                            = var.extensions_time_budget
  eviction_policy                                   = var.eviction_policy
  health_probe_id                                   = var.health_probe_id
  host_group_id                                     = var.host_group_id
  max_bid_price                                     = var.max_bid_price
  overprovision                                     = var.overprovision
  platform_fault_domain_count                       = var.platform_fault_domain_count
  priority                                          = var.priority
  provision_vm_agent                                = var.provision_vm_agent
  proximity_placement_group_id                      = var.proximity_placement_group_id
  secure_boot_enabled                               = var.secure_boot_enabled
  single_placement_group                            = var.single_placement_group
  source_image_id                                   = var.source_image_id
  tags                                              = local.tags
  upgrade_mode                                      = var.upgrade_mode
  user_data                                         = var.user_data
  vtpm_enabled                                      = var.vtpm_enabled
  zone_balance                                      = var.zone_balance
  zones                                             = var.zones

  automatic_instance_repair = {
    enabled      = var.automatic_instance_repair_enabled
    grace_period = var.automatic_instance_repair_grace_period
    action       = var.automatic_instance_repair_action
  }

  boot_diagnostics = {
    storage_account_uri = var.boot_diagnostics_storage_account_uri
  }

/*
  data_disk = {
    name                           = var.data_disk_name
    caching                        = var.data_disk_caching
    create_option                  = var.data_disk_create_option
    disk_size_gb                   = var.data_disk_disk_size_gb
    lun                            = var.data_disk_lun
    storage_account_type           = var.data_disk_storage_account_type
    disk_encryption_set_id         = var.data_disk_disk_encryption_set_id
    ultra_ssd_disk_iops_read_write = var.data_disk_ultra_ssd_disk_iops_read_write
    ultra_ssd_disk_mbps_read_write = var.data_disk_ultra_ssd_disk_mbps_read_write
    write_accelerator_enabled      = var.data_disk_write_accelerator_enabled
  }

  extension = {
    name                       = var.extension_name
    publisher                  = var.extension_publisher
    type                       = var.extension_type
    type_handler_version       = var.extension_type_handler_version
    auto_upgrade_minor_version = var.extension_auto_upgrade_minor_version
    automatic_upgrade_enabled  = var.extension_automatic_upgrade_enabled
    force_update_tag           = var.extension_force_update_tag
    protected_settings         = var.extension_protected_settings
    protected_settings_from_key_vault = {
      secret_url      = var.extension_protected_settings_from_key_vault_secret_url
      source_vault_id = var.extension_protected_settings_from_key_vault_source_vault_id
    }
    provision_after_extensions = var.extension_provision_after_extensions
    settings                   = var.extension_settings
  }

  gallery_application = {
    version_id             = var.gallery_application_version_id
    configuration_blob_uri = var.gallery_application_configuration_blob_uri
    order                  = var.gallery_application_order
    tag                    = var.gallery_application_tag
  }
*/
  identity = {
    type         = var.identity_type
    identity_ids = var.identity_identity_ids
  }

  network_interface = {
    name                          = var.network_interface_name
    dns_servers                   = var.network_interface_dns_servers
    enable_accelerated_networking = var.network_interface_enable_accelerated_networking
    enable_ip_forwarding          = var.network_interface_enable_ip_forwarding
    network_security_group_id     = var.network_interface_network_security_group_id
    primary                       = var.network_interface_primary
    ip_configuration = {
      name                                         = var.network_interface_ip_configuration_name
      application_gateway_backend_address_pool_ids = var.network_interface_ip_configuration_application_gateway_backend_address_pool_ids
      application_security_group_ids               = var.network_interface_ip_configuration_application_security_group_ids
      load_balancer_backend_address_pool_ids       = var.network_interface_ip_configuration_load_balancer_backend_address_pool_ids
      load_balancer_inbound_nat_rules_ids          = var.network_interface_ip_configuration_load_balancer_inbound_nat_rules_ids
      primary                                      = var.network_interface_ip_configuration_primary
      public_ip_address = {
        name                    = var.network_interface_ip_configuration_public_ip_address_name
        domain_name_label       = var.network_interface_ip_configuration_public_ip_address_domain_name_label
        idle_timeout_in_minutes = var.network_interface_ip_configuration_public_ip_address_idle_timeout_in_minutes
        ip_tag = {
          tag  = var.network_interface_ip_configuration_public_ip_address_ip_tag_tag
          type = var.network_interface_ip_configuration_public_ip_address_ip_tag_type
        }
        public_ip_prefix_id = var.network_interface_ip_configuration_public_ip_address_public_ip_prefix_id
        version             = var.network_interface_ip_configuration_public_ip_address_version
      }
      subnet_id = var.network_interface_ip_configuration_subnet_id
      version   = var.network_interface_ip_configuration_version
    }
  }

  os_disk = {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    diff_disk_settings = {
      option    = var.diff_disk_settings_option
      placement = var.diff_disk_settings_placement
    }
    disk_encryption_set_id           = var.os_disk_disk_encryption_set_id
    disk_size_gb                     = var.os_disk_disk_size_gb
    secure_vm_disk_encryption_set_id = var.os_disk_secure_vm_disk_encryption_set_id
    security_encryption_type         = var.os_disk_security_encryption_type
    write_accelerator_enabled        = var.os_disk_write_accelerator_enabled
  }

  plan = {
    name      = var.plan_name
    publisher = var.plan_publisher
    product   = var.plan_product
  }

  additional_capabilities = {
    ultra_ssd_enabled = var.additional_capabilities_ultra_ssd_enabled
  }

  scale_in = {
    rule                   = var.scale_in_rule
    force_deletion_enabled = var.scale_in_force_deletion_enabled
  }

  rolling_upgrade_policy = {
    cross_zone_upgrades_enabled             = var.rolling_upgrade_policy_cross_zone_upgrades_enabled
    max_batch_instance_percent              = var.rolling_upgrade_policy_max_batch_instance_percent
    max_unhealthy_instance_percent          = var.rolling_upgrade_policy_max_unhealthy_instance_percent
    max_unhealthy_upgraded_instance_percent = var.rolling_upgrade_policy_max_unhealthy_upgraded_instance_percent
    pause_time_between_batches              = var.rolling_upgrade_policy_pause_time_between_batches
    prioritize_unhealthy_instances_enabled  = var.rolling_upgrade_policy_prioritize_unhealthy_instances_enabled
    maximum_surge_instances_enabled         = var.rolling_upgrade_policy_maximum_surge_instances_enabled
  }

  secret = {
    certificate = {
      url = var.secret_certificate_url
    }
    key_vault_id = var.secret_key_vault_id
  }


  termination_notification = {
    enabled = var.termination_notification_enabled
    timeout = var.termination_notification_timeout
  }

  source_image_reference = {
    publisher = var.source_image_reference_publisher
    offer     = var.source_image_reference_offer
    sku       = var.source_image_reference_sku
    version   = var.source_image_reference_version
  }

  automatic_os_upgrade_policy = {
    disable_automatic_rollback  = var.automatic_os_upgrade_policy_disable_automatic_rollback
    enable_automatic_os_upgrade = var.automatic_os_upgrade_policy_enable_automatic_os_upgrade
  }

  spot_restore = {
    enabled = var.spot_restore_enabled
    timeout = var.spot_restore_timeout
  }

  admin_ssh_key = null
}







