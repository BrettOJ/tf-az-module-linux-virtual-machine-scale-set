address_space                                                                   = ["10.0.0.0/16"]
dns_servers                                                                     = ["168.63.129.16"]
location                                                                        = "southeastasia"
resource_group_name                                                             = "example-resources"
admin_username                                                                  = "adminuser"
instances                                                                       = 1
sku                                                                             = "Standard_F2"
capacity_reservation_group_id                                                   = null
computer_name_prefix                                                            = "vmss"
custom_data                                                                     = null
disable_password_authentication                                                 = true
do_not_run_extensions_on_overprovisioned_machines                               = false
edge_zone                                                                       = null
encryption_at_host_enabled                                                      = false
extension_operations_enabled                                                    = true
extensions_time_budget                                                          = "PT1H30M"
eviction_policy                                                                 = null # Possible values include: Deallocate, Delete
health_probe_id                                                                 = null # can only be specified when upgrade_mode is set to Automatic or Rolling.
host_group_id                                                                   = null 
max_bid_price                                                                   = null # This can only be configured when priority is set to Spot.
overprovision                                                                   = true
platform_fault_domain_count                                                     = 1
priority                                                                        = "Regular" # Possible values are Regular and Spot
provision_vm_agent                                                              = true
proximity_placement_group_id                                                    = null
secure_boot_enabled                                                             = false
single_placement_group                                                          = true
source_image_id                                                                 = null
upgrade_mode                                                                    = "Manual"
user_data                                                                       = null
vtpm_enabled                                                                    = false
zone_balance                                                                    = false
zones                                                                           = []
ultra_ssd_enabled                                                               = false

automatic_instance_repair_enabled                                               = false
automatic_instance_repair_grace_period                                          = "PT30M"
automatic_instance_repair_action                                                = "Reimage"

boot_diagnostics_storage_account_uri                                            = null

data_disk_name                                                                  = null
data_disk_caching                                                               = null
data_disk_create_option                                                         = null
data_disk_disk_size_gb                                                          = 0
data_disk_lun                                                                   = 0
data_disk_storage_account_type                                                  = null
data_disk_disk_encryption_set_id                                                = null
data_disk_ultra_ssd_disk_iops_read_write                                        = 0
data_disk_ultra_ssd_disk_mbps_read_write                                        = 0
data_disk_write_accelerator_enabled                                             = false

extension_name                                                                  = null
extension_publisher                                                             = null
extension_type                                                                  = null
extension_type_handler_version                                                  = null
extension_auto_upgrade_minor_version                                            = false
extension_automatic_upgrade_enabled                                             = false
extension_force_update_tag                                                      = null
extension_protected_settings                                                    = {}
extension_protected_settings_from_key_vault_secret_url                          = null
extension_protected_settings_from_key_vault_source_vault_id                     = null
extension_provision_after_extensions                                            = []
extension_settings                                                              = {}

gallery_application_version_id                                                  = null
gallery_application_configuration_blob_uri                                      = null
gallery_application_order                                                       = 0
gallery_application_tag                                                         = null

identity_type                                                                   = "SystemAssigned" # Possible values are SystemAssigned, UserAssigned
identity_identity_ids                                                           = []

network_interface_name                                                          = null
network_interface_dns_servers                                                   = []
network_interface_enable_accelerated_networking                                 = false
network_interface_enable_ip_forwarding                                          = false
network_interface_network_security_group_id                                     = null
network_interface_primary                                                       = false
network_interface_ip_configuration_name                                         = null
network_interface_ip_configuration_application_gateway_backend_address_pool_ids = []
network_interface_ip_configuration_application_security_group_ids               = []
network_interface_ip_configuration_load_balancer_backend_address_pool_ids       = []
network_interface_ip_configuration_load_balancer_inbound_nat_rules_ids          = []
network_interface_ip_configuration_primary                                      = false
network_interface_ip_configuration_public_ip_address_name                       = null
network_interface_ip_configuration_public_ip_address_domain_name_label          = null
network_interface_ip_configuration_public_ip_address_idle_timeout_in_minutes    = 0
network_interface_ip_configuration_public_ip_address_ip_tag_tag                 = null
network_interface_ip_configuration_public_ip_address_ip_tag_type                = null
network_interface_ip_configuration_public_ip_address_public_ip_prefix_id        = null
network_interface_ip_configuration_public_ip_address_version                    = null
network_interface_ip_configuration_subnet_id                                    = null
network_interface_ip_configuration_version                                      = null

os_disk_caching                                                                 = null
os_disk_storage_account_type                                                    = null
os_disk_disk_encryption_set_id                                                  = null
os_disk_disk_size_gb                                                            = 0
os_disk_secure_vm_disk_encryption_set_id                                        = null
os_disk_security_encryption_type                                                = null
os_disk_write_accelerator_enabled                                               = false

diff_disk_settings_option                                                       = null
diff_disk_settings_placement                                                    = null

plan_name                                                                       = null
plan_publisher                                                                  = null
plan_product                                                                    = null

additional_capabilities_ultra_ssd_enabled                                       = false

scale_in_rule                                                                   = null
scale_in_force_deletion_enabled                                                 = false

rolling_upgrade_policy_cross_zone_upgrades_enabled                              = false
rolling_upgrade_policy_max_batch_instance_percent                               = 0
rolling_upgrade_policy_max_unhealthy_instance_percent                           = 0
rolling_upgrade_policy_max_unhealthy_upgraded_instance_percent                  = 0
rolling_upgrade_policy_pause_time_between_batches                               = null
rolling_upgrade_policy_prioritize_unhealthy_instances_enabled                   = false
rolling_upgrade_policy_maximum_surge_instances_enabled                          = false

secret_certificate_url                                                          = null
secret_key_vault_id                                                             = null

termination_notification_enabled                                                = false
termination_notification_timeout                                                = null

source_image_reference_publisher                                                = "Canonical"
source_image_reference_offer                                                    = "0001-com-ubuntu-server-jammy"
source_image_reference_sku                                                      = "22_04-lts"
source_image_reference_version                                                  = "latest"

automatic_os_upgrade_policy_disable_automatic_rollback                          = false
automatic_os_upgrade_policy_enable_automatic_os_upgrade                         = false

spot_restore_enabled                                                            = false
spot_restore_timeout                                                            = null

admin_ssh_key_username                                                          = "adminuser"
admin_ssh_key_public_key                                                        = null

#SSH Key values

algorithm             = "RSA"
rsa_bits              = 2048
ecdsa_curve           = null
create_ssh_public_key = true