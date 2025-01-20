resource "azurerm_linux_virtual_machine_scale_set" "linux_vmss" {
  name                                              = module.lvmss_name.naming_convention_output[var.naming_convention_info.name].names.0
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
  tags                                              = var.tags
  upgrade_mode                                      = var.upgrade_mode
  user_data                                         = var.user_data
  vtpm_enabled                                      = var.vtpm_enabled
  zone_balance                                      = var.zone_balance
  zones                                             = var.zones

  dynamic "automatic_instance_repair" {
    for_each = var.automatic_instance_repair != null ? [var.automatic_instance_repair] : []
    content {
      enabled      = var.automatic_instance_repair.enabled
      grace_period = var.automatic_instance_repair.grace_period
      action       = var.automatic_instance_repair.action
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.boot_diagnostics != null ? [var.boot_diagnostics] : []
    content {
      storage_account_uri = var.boot_diagnostics.storage_account_uri
    }
  }

  dynamic "data_disk" {
    for_each = var.data_disk != null ? [var.data_disk] : []
    content {
      name                           = var.data_disk.name
      caching                        = var.data_disk.caching
      create_option                  = var.data_disk.create_option
      disk_size_gb                   = var.data_disk.disk_size_gb
      lun                            = var.data_disk.lun
      storage_account_type           = var.data_disk.storage_account_type
      disk_encryption_set_id         = var.data_disk.disk_encryption_set_id
      ultra_ssd_disk_iops_read_write = var.data_disk.ultra_ssd_disk_iops_read_write
      ultra_ssd_disk_mbps_read_write = var.data_disk.ultra_ssd_disk_mbps_read_write
      write_accelerator_enabled      = var.data_disk.write_accelerator_enabled
    }
  }

  dynamic "extension" {
    for_each = var.extension != null ? [var.extension] : []
    content {
      name                       = var.extension.name
      publisher                  = var.extension.publisher
      type                       = var.extension.type
      type_handler_version       = var.extension.type_handler_version
      auto_upgrade_minor_version = var.extension.auto_upgrade_minor_version
      automatic_upgrade_enabled  = var.extension.automatic_upgrade_enabled
      force_update_tag           = var.extension.force_update_tag
      protected_settings         = var.extension.protected_settings
      protected_settings_from_key_vault {
        secret_url      = var.protected_settings_from_key_vault.secret_url
        source_vault_id = var.protected_settings_from_key_vault.source_vault_id
      }
      provision_after_extensions = var.extension.provision_after_extensions
      settings                   = var.extension.settings
    }
  }

  dynamic "gallery_application" {
    for_each = var.gallery_application != null ? [var.gallery_application] : []
    content {
      version_id             = var.gallery_application.version_id
      configuration_blob_uri = var.gallery_application.configuration_blob_uri
      order                  = var.gallery_application.order
      tag                    = var.gallery_application.tag
    }
  }

  identity {
    type         = var.identity.type
    identity_ids = var.identity.identity_ids
  }

  network_interface {
    name                          = var.network_interface.name
    dns_servers                   = var.network_interface.dns_servers
    enable_accelerated_networking = var.network_interface.enable_accelerated_networking
    enable_ip_forwarding          = var.network_interface.enable_ip_forwarding
    network_security_group_id     = var.network_interface.network_security_group_id
    primary                       = var.network_interface.primary
    ip_configuration {
      name                                         = var.network_interface.ip_configuration.name
      application_gateway_backend_address_pool_ids = var.network_interface.ip_configuration.application_gateway_backend_address_pool_ids
      application_security_group_ids               = var.network_interface.ip_configuration.application_security_group_ids
      load_balancer_backend_address_pool_ids       = var.network_interface.ip_configuration.load_balancer_backend_address_pool_ids
      load_balancer_inbound_nat_rules_ids          = var.network_interface.ip_configuration.load_balancer_inbound_nat_rules_ids
      primary                                      = var.network_interface.ip_configuration.primary
      public_ip_address {
        name                    = var.network_interface.ip_configuration.public_ip_address.name
        domain_name_label       = var.network_interface.ip_configuration.public_ip_address.domain_name_label
        idle_timeout_in_minutes = var.network_interface.ip_configuration.public_ip_address.idle_timeout_in_minutes
        dynamic "ip_tag" {
          for_each = var.network_interface.ip_configuration.public_ip_address.ip_tag != null ? [var.network_interface.ip_configuration.public_ip_address.ip_tag] : []
          content {
          tag  = var.network_interface.ip_configuration.public_ip_address.ip_tag.tag
          type = var.network_interface.ip_configuration.public_ip_address.ip_tag.type
        }
      }         
        public_ip_prefix_id = var.network_interface.ip_configuration.public_ip_address.public_ip_prefix_id
        version             = var.network_interface.ip_configuration.public_ip_address.version
      }
      subnet_id = var.network_interface.ip_configuration.subnet_id
      version   = var.network_interface.ip_configuration.version
    }
  }

  os_disk {
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
    diff_disk_settings {
      option    = var.os_disk.diff_disk_settings.option
      placement = var.os_disk.diff_disk_settings.placement
    }
    disk_encryption_set_id           = var.os_disk.disk_encryption_set_id
    disk_size_gb                     = var.os_disk.disk_size_gb
    secure_vm_disk_encryption_set_id = var.os_disk.secure_vm_disk_encryption_set_id
    security_encryption_type         = var.os_disk.security_encryption_type
    write_accelerator_enabled        = var.os_disk.write_accelerator_enabled
  }

  dynamic "plan" {
    for_each = var.plan != null ? [var.plan] : []
    content {
      name      = var.plan.name
      publisher = var.plan.publisher
      product   = var.plan.product
    }
  }

  additional_capabilities {
    ultra_ssd_enabled = var.additional_capabilities.ultra_ssd_enabled
  }

  scale_in {
    rule                   = var.scale_in.rule
    force_deletion_enabled = var.scale_in.force_deletion_enabled
  }

  dynamic "rolling_upgrade_policy" {
    for_each = var.rolling_upgrade_policy != null ? [var.rolling_upgrade_policy] : []
    content {
      cross_zone_upgrades_enabled             = var.rolling_upgrade_policy.cross_zone_upgrades_enabled
      max_batch_instance_percent              = var.rolling_upgrade_policy.max_batch_instance_percent
      max_unhealthy_instance_percent          = var.rolling_upgrade_policy.max_unhealthy_instance_percent
      max_unhealthy_upgraded_instance_percent = var.rolling_upgrade_policy.max_unhealthy_upgraded_instance_percent
      pause_time_between_batches              = var.rolling_upgrade_policy.pause_time_between_batches
      prioritize_unhealthy_instances_enabled  = var.rolling_upgrade_policy.prioritize_unhealthy_instances_enabled
      maximum_surge_instances_enabled         = var.rolling_upgrade_policy.maximum_surge_instances_enabled
    }
  }

  dynamic secret {
    for_each = var.secret != null ? [var.secret] : []
    content {
      certificate {
          url = var.certificate.url
        }
        key_vault_id = var.secret.key_vault_id
  }
  }

  termination_notification {
    enabled = var.termination_notification.enabled
    timeout = var.termination_notification.timeout
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  automatic_os_upgrade_policy {
    disable_automatic_rollback  = var.automatic_os_upgrade_policy.disable_automatic_rollback
    enable_automatic_os_upgrade = var.automatic_os_upgrade_policy.enable_automatic_os_upgrade
  }

  dynamic spot_restore {
    for_each = var.spot_restore != null ? [var.spot_restore] : []
    content {
      enabled = var.spot_restore.enabled
      timeout = var.spot_restore.timeout
    }
  }

  dynamic admin_ssh_key {
    for_each = var.admin_ssh_key != null ? [var.admin_ssh_key] : []
    content {
    username   = var.admin_ssh_key.username
    public_key = var.admin_ssh_key.public_key
  }
}
}


