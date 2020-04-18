variable	"subscription_id" {}
variable	"client_id" {}
variable	"client_secret" {} 
variable	"tenant_id" {}

variable "web_server_location" {}
variable "web_server_rg" {}
variable "resource_prefix" {}
variable "web_server_address_space" {}
#variable "web_server_address_prefix" {} we don't need this variable after adding subnets
variable "web_server_name" {}
variable "environment" {}
variable "web_server_count" {}
variable "web_server_subnets" {
  type = "list"
}
variable "terraform_script_version" {}
variable "domain_name_label"{}


provider "azurerm" {
    version         = "1.27"
    #version         = "2.0.0"
    subscription_id = "${var.subscription_id}"
    client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
    tenant_id       = "${var.tenant_id}"
}




data "azurerm_resource_group" "web_server_rg" {
  name      = "${var.web_server_rg}"
}

resource "azurerm_virtual_network" "web_server_vnet" {
	name                = "${var.resource_prefix}-vnet"
	location            = "${var.web_server_location}"
	resource_group_name = "${data.azurerm_resource_group.web_server_rg.name}"
	address_space       = ["${var.web_server_address_space}"]
}

resource "azurerm_subnet" "web_server_subnet" {
  name                      = "testsubnet"
  resource_group_name       = "${data.azurerm_resource_group.web_server_rg.name}"
  virtual_network_name      = "${azurerm_virtual_network.web_server_vnet.name}"
  address_prefix            = "1.0.3.0/24"
 }

