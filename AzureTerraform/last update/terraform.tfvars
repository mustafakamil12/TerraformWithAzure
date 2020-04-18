web_server_location         = "westus2"     #location
web_server_rg		        = "web-rg"      #name
resource_prefix             = "web-server"  #it will be used for labling the resources that we create
web_server_address_space 	= "1.0.0.0/22"  # the ip range that will be used
#web_server_address_prefix   = "1.0.1.0/24" # after adding subnets list we will not need this line
web_server_name             = "web-01"
environment                 = "production"
web_server_count            = 2
web_server_subnets          = ["1.0.1.0/24","1.0.2.0/24"]
terraform_script_version    = "1.00"
domain_name_label           = "learning-mustafa-web"