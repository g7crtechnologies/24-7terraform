#------------------------------------------
# Variable file for West US Region
#------------------------------------------
location                 = "westus"
account_tier             = "Standard"
account_replication_type = "LRS"
tags = {
  "terraform" = 1
}
container_access_type = "blob"
env = {
  stb = {
    stb = {
      name = "stb"
    }
  }
  stg = {
    stg = {
      name = "stg"
    }
  }
  prod = {
    prod = {
      name = "prod"
    }
  }
  psr = {
    psr = {
      name = "psr"
    }
  }
  hub = {
    hub = {
      name = "hub"
    }
  }
}
