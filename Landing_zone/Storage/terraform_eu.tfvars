#------------------------------------------
# Variable file for East US Region
#------------------------------------------
location                 = "eastus"
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
  dev = {
    dev = {
      name = "dev"
    }
  }
  qa = {
    qa = {
      name = "qa"
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
