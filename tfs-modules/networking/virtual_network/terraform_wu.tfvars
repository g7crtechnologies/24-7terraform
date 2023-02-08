#------------------------------------------
# Variables for West US Region
#------------------------------------------
location = "westus"
region   = "wu"
tags = {
  "environment" = "tfs"
}

address_space = {
  hub = {
    hub = {
      name          = "hub"
      address_space = ["10.86.48.0/20"]
      product       = "speech"
    }
  }
  prod = {
    prod-c2c = {
      name          = "prod-c2c"
      address_space = ["10.86.16.0/20"]
      product       = "speech"
    }
    prod-cde = {
      name          = "prod-cde"
      address_space = ["10.86.0.0/20"]
      product       = "speech"
    }
    prod-oos = {
      name          = "prod-oos"
      address_space = ["10.86.32.0/21"]
      product       = "speech"
    }
  }

  psr = {
    psr-c2c = {
      name          = "psr-c2c"
      address_space = ["10.87.80.0/21"]
      product       = "speech"
    }
    psr-cde = {
      name          = "psr-cde"
      address_space = ["10.87.72.0/21"]
      product       = "speech"
    }
    psr-oos = {
      name          = "psr-oos"
      address_space = ["10.87.88.0/21"]
      product       = "speech"
    }
  }

  stb = {
    stb-c2c = {
      name          = "stb-c2c"
      address_space = ["10.89.104.0/21"]
      product       = "speech"
    }
    stb-cde = {
      name          = "stb-cde"
      address_space = ["10.87.96.0/21"]
      product       = "speech"
    }
    stb-oos = {
      name          = "stb-oos"
      address_space = ["10.87.112.0/21"]
      product       = "speech"
    }
  }

  stg = {
    stg-c2c = {
      name          = "stg-c2c"
      address_space = ["10.87.8.0/21"]
      product       = "speech"
    }
    stg-cde = {
      name          = "stg-cde"
      address_space = ["10.87.0.0/21"]
      product       = "speech"
    }
    stg-oos = {
      name          = "stg-oos"
      address_space = ["10.87.16.0/21"]
      product       = "speech"
    }
  }
}
#================================================================================#

subnet_prefixes = {
  hub = {

    hub-mgmt = {
      name             = "mgmt"
      address_prefixes = ["10.86.52.0/22"]
      skey             = "hub"
      product          = "speech"
    }
    hub-lb = {
      name             = "lb"
      address_prefixes = ["10.86.57.0/24"]
      skey             = "hub"
      product          = "speech"
    }
  }
  prod = {

    c2c-app = {
      name             = "app"
      address_prefixes = ["10.86.16.0/23"]
      skey             = "prod-c2c"
      product          = "speech"
    }
    c2c-app-db = {
      name             = "app-db"
      address_prefixes = ["10.86.18.0/23"]
      skey             = "prod-c2c"
      product          = "speech"
    }
    c2c-lb = {
      name             = "lb"
      address_prefixes = ["10.86.22.0/24"]
      skey             = "prod-c2c"
      product          = "speech"
    }

    cde-app = {
      name             = "app"
      address_prefixes = ["10.86.0.0/23"]
      skey             = "prod-cde"
      product          = "speech"
    }
    cde-app-db = {
      name             = "app-db"
      address_prefixes = ["10.86.2.0/23"]
      skey             = "prod-cde"
      product          = "speech"
    }
    cde-lb = {
      name             = "lb"
      address_prefixes = ["10.86.6.0/24"]
      skey             = "prod-cde"
      product          = "speech"
    }

    oos-app = {
      name             = "app"
      address_prefixes = ["10.86.32.0/23"]
      skey             = "prod-oos"
      product          = "speech"
    }
    oos-app-db = {
      name             = "app-db"
      address_prefixes = ["10.86.34.0/23"]
      skey             = "prod-oos"
      product          = "speech"
    }
    oos-lb = {
      name             = "lb"
      address_prefixes = ["10.86.38.0/24"]
      skey             = "prod-oos"
      product          = "speech"
    }

  }

  psr = {

    c2c-app = {
      name             = "app"
      address_prefixes = ["10.87.82.0/23"]
      skey             = "psr-c2c"
      product          = "speech"
    }
    c2c-app-db = {
      name             = "app-db"
      address_prefixes = ["10.87.84.0/23"]
      skey             = "psr-c2c"
      product          = "speech"
    }
    c2c-lb = {
      name             = "lb"
      address_prefixes = ["10.87.87.0/24"]
      skey             = "psr-c2c"
      product          = "speech"
    }

    cde-app = {
      name             = "app"
      address_prefixes = ["10.87.74.0/23"]
      skey             = "psr-cde"
      product          = "speech"
    }
    cde-app-db = {
      name             = "app-db"
      address_prefixes = ["10.87.76.0/23"]
      skey             = "psr-cde"
      product          = "speech"
    }
    cde-lb = {
      name             = "lb"
      address_prefixes = ["10.87.79.0/24"]
      skey             = "psr-cde"
      product          = "speech"
    }

    oos-app = {
      name             = "app"
      address_prefixes = ["10.87.90.0/23"]
      skey             = "psr-oos"
      product          = "speech"
    }
    oos-app-db = {
      name             = "app-db"
      address_prefixes = ["10.87.92.0/23"]
      skey             = "psr-oos"
      product          = "speech"
    }
    oos-lb = {
      name             = "lb"
      address_prefixes = ["10.87.95.0/24"]
      skey             = "psr-oos"
      product          = "speech"
    }

  }

  stb = {

    c2c-app = {
      name             = "app"
      address_prefixes = ["10.87.106.0/23"]
      skey             = "stb-c2c"
      product          = "speech"
    }
    c2c-app-db = {
      name             = "app-db"
      address_prefixes = ["10.87.108.0/23"]
      skey             = "stb-c2c"
      product          = "speech"
    }
    c2c-lb = {
      name             = "lb"
      address_prefixes = ["10.87.111.0/24"]
      skey             = "stb-c2c"
      product          = "speech"
    }

    cde-app = {
      name             = "app"
      address_prefixes = ["10.87.98.0/23"]
      skey             = "stb-cde"
      product          = "speech"
    }
    cde-app-db = {
      name             = "app-db"
      address_prefixes = ["10.87.100.0/23"]
      skey             = "stb-cde"
      product          = "speech"
    }
    cde-lb = {
      name             = "lb"
      address_prefixes = ["10.87.103.0/24"]
      skey             = "stb-cde"
      product          = "speech"
    }

    oos-app = {
      name             = "app"
      address_prefixes = ["10.87.114.0/24"]
      skey             = "stb-oos"
      product          = "speech"
    }
    oos-app-db = {
      name             = "app-db"
      address_prefixes = ["10.87.116.0/24"]
      skey             = "stb-oos"
      product          = "speech"
    }
    oos-lb = {
      name             = "lb"
      address_prefixes = ["10.87.119.0/24"]
      skey             = "stb-oos"
      product          = "speech"
    }

  }

  stg = {

    c2c-app = {
      name             = "app"
      address_prefixes = ["10.87.8.0/23"]
      skey             = "stg-c2c"
      product          = "speech"
    }
    c2c-app-db = {
      name             = "app-db"
      address_prefixes = ["10.87.10.0/23"]
      skey             = "stg-c2c"
      product          = "speech"
    }
    c2c-lb = {
      name             = "lb"
      address_prefixes = ["10.87.14.0/24"]
      skey             = "stg-c2c"
      product          = "speech"
    }

    cde-app = {
      name             = "app"
      address_prefixes = ["10.87.0.0/23"]
      skey             = "stg-cde"
      product          = "speech"
    }
    cde-app-db = {
      name             = "app-db"
      address_prefixes = ["10.87.2.0/23"]
      skey             = "stg-cde"
      product          = "speech"
    }
    cde-lb = {
      name             = "lb"
      address_prefixes = ["10.87.6.0/24"]
      skey             = "stg-cde"
      product          = "speech"
    }

    oos-app = {
      name             = "app"
      address_prefixes = ["10.87.16.0/23"]
      skey             = "stg-oos"
      product          = "speech"
    }
    oos-app-db = {
      name             = "app-db"
      address_prefixes = ["10.87.18.0/23"]
      skey             = "stg-oos"
      product          = "speech"
    }
    oos-lb = {
      name             = "lb"
      address_prefixes = ["10.87.22.0/24"]
      skey             = "stg-oos"
      product          = "speech"
    }

  }
}


