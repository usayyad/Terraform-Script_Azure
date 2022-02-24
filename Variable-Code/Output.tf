output "PublicIP" {
    value = azurerm_public_ip.example.ip_address
}
output "subnet_id" {
    value = azurerm_subnet.example.id
}
output "address_prefixes" {
    value = azurerm_subnet.example.address_prefixes
}