resource "azurerm_resource_group" "rg" {
  name     = "${var.name}-rg"
  location = var.location

  tags = {
    Project     = "Project2"
    Environment = "production"
    StudentName = var.name
  }
}

resource "azurerm_container_group" "aci" {
  name                = "${var.name}-aci"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = "${var.name}-aci-demo"

  container {
    name   = "web"
    image  = var.image
    cpu    = 0.5
    memory = 1

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
