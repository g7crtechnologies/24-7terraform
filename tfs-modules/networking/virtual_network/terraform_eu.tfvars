#------------------------------------------
# Variables for East US Region
#------------------------------------------
location = "eastus"
region   = "eu"
tags = {
  "environment" = "tfs"
}
address_space = {
  prod = {
    prod-c2c = {
      name          = "prod-c2c"
      address_space = ["10.88.16.0/20"]
      product       = "speech"
    }
    prod-cde = {
      name          = "prod-cde"
      address_space = ["10.88.0.0/20"]
      product       = "speech"
    }
    prod-oos = {
      name          = "prod-oos"
      address_space = ["10.88.32.0/20"]
      product       = "speech"
    }
  }
  hub = {
    hub = {
      name          = "hub"
      address_space = ["10.88.48.0/20"]
      product       = "speech"
    }
  }
  psr = {
    psr-c2c = {
      name          = "psr-c2c"
      address_space = ["10.89.80.0/21"]
      product       = "speech"
    }
    psr-cde = {
      name          = "psr-cde"
      address_space = ["10.89.72.0/21"]
      product       = "speech"
    }
    psr-oos = {
      name          = "psr-oos"
      address_space = ["10.89.88.0/21"]
      product       = "speech"
    }
  }

  dev = {
    dev-c2c = {
      name          = "dev-c2c"
      address_space = ["10.89.32.0/21"]
      product       = "speech"
    }
    dev-cde = {
      name          = "dev-cde"
      address_space = ["10.89.24.0/21"]
      product       = "speech"
    }
    dev-oos = {
      name          = "dev-oos"
      address_space = ["10.89.40.0/21"]
      product       = "speech"
    }
  }

  qa = {
    qa-c2c = {
      name          = "qa-c2c"
      address_space = ["10.89.56.0/21"]
      product       = "speech"
    }
    qa-cde = {
      name          = "qa-cde"
      address_space = ["10.89.48.0/21"]
      product       = "speech"
    }
    qa-oos = {
      name          = "qa-oos"
      address_space = ["10.89.64.0/21"]
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
      address_space = ["10.89.96.0/21"]
      product       = "speech"
    }
    stb-oos = {
      name          = "stb-oos"
      address_space = ["10.89.112.0/21"]
      product       = "speech"
    }
  }

  stg = {
    stg-c2c = {
      name          = "stg-c2c"
      address_space = ["10.89.8.0/21"]
      product       = "speech"
    }
    stg-cde = {
      name          = "stg-cde"
      address_space = ["10.89.0.0/21"]
      product       = "speech"
    }
    stg-oos = {
      name          = "stg-oos"
      address_space = ["10.89.16.0/21"]
      product       = "speech"
    }
  }
}
#================================================================================#

subnet_prefixes = {
  hub = {

    hub-mgmt = {
      name             = "mgmt"
      address_prefixes = ["10.88.52.0/22"]
      skey             = "hub"
      product          = "speech"
    }

    hub-lb = {
      name             = "lb"
      address_prefixes = ["10.88.57.0/24"]
      skey             = "hub"
      product          = "speech"
    }
  }
  prod = {

    c2c-app = {
      name             = "app"
      address_prefixes = ["10.88.16.0/23"]
      skey             = "prod-c2c"
      product          = "speech"
    }
    c2c-app-db = {
      name             = "app-db"
      address_prefixes = ["10.88.18.0/23"]
      skey             = "prod-c2c"
      product          = "speech"
    }
    c2c-lb = {
      name             = "lb"
      address_prefixes = ["10.88.22.0/24"]
      skey             = "prod-c2c"
      product          = "speech"
    }

    cde-app = {
      name             = "app"
      address_prefixes = ["10.88.0.0/23"]
      skey             = "prod-cde"
      product          = "speech"
    }
    cde-app-db = {
      name             = "app-db"
      address_prefixes = ["10.88.2.0/23"]
      skey             = "prod-cde"
      product          = "speech"
    }
    cde-lb = {
      name             = "lb"
      address_prefixes = ["10.88.6.0/24"]
      skey             = "prod-cde"
      product          = "speech"
    }

    oos-app = {
      name             = "app"
      address_prefixes = ["10.88.32.0/23"]
      skey             = "prod-oos"
      product          = "speech"
    }
    oos-app-db = {
      name             = "app-db"
      address_prefixes = ["10.88.34.0/23"]
      skey             = "prod-oos"
      product          = "speech"
    }
    oos-lb = {
      name             = "lb"
      address_prefixes = ["10.88.38.0/24"]
      skey             = "prod-oos"
      product          = "speech"
    }

  }

  psr = {

    c2c-app = {
      name             = "app"
      address_prefixes = ["10.89.82.0/23"]
      skey             = "psr-c2c"
      product          = "speech"
    }
    c2c-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.84.0/23"]
      skey             = "psr-c2c"
      product          = "speech"
    }
    c2c-lb = {
      name             = "lb"
      address_prefixes = ["10.89.87.0/24"]
      skey             = "psr-c2c"
      product          = "speech"
    }

    cde-app = {
      name             = "app"
      address_prefixes = ["10.89.74.0/23"]
      skey             = "psr-cde"
      product          = "speech"
    }
    cde-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.76.0/23"]
      skey             = "psr-cde"
      product          = "speech"
    }
    cde-lb = {
      name             = "lb"
      address_prefixes = ["10.89.79.0/24"]
      skey             = "psr-cde"
      product          = "speech"
    }

    oos-app = {
      name             = "app"
      address_prefixes = ["10.89.90.0/23"]
      skey             = "psr-oos"
      product          = "speech"
    }
    oos-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.92.0/23"]
      skey             = "psr-oos"
      product          = "speech"
    }
    oos-lb = {
      name             = "lb"
      address_prefixes = ["10.89.95.0/24"]
      skey             = "psr-oos"
      product          = "speech"
    }

  }

  dev = {

    c2c-app = {
      name             = "app"
      address_prefixes = ["10.89.34.0/23"]
      skey             = "dev-c2c"
      product          = "speech"
    }
    c2c-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.36.0/23"]
      skey             = "dev-c2c"
      product          = "speech"
    }
    c2c-lb = {
      name             = "lb"
      address_prefixes = ["10.89.39.0/24"]
      skey             = "dev-c2c"
      product          = "speech"
    }

    cde-app = {
      name             = "app"
      address_prefixes = ["10.89.26.0/23"]
      skey             = "dev-cde"
      product          = "speech"
    }
    cde-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.28.0/23"]
      skey             = "dev-cde"
      product          = "speech"
    }
    cde-lb = {
      name             = "lb"
      address_prefixes = ["10.89.31.0/24"]
      skey             = "dev-cde"
      product          = "speech"
    }

    oos-app = {
      name             = "app"
      address_prefixes = ["10.89.42.0/23"]
      skey             = "dev-oos"
      product          = "speech"
    }
    oos-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.44.0/23"]
      skey             = "dev-oos"
      product          = "speech"
    }
    oos-lb = {
      name             = "lb"
      address_prefixes = ["10.89.47.0/24"]
      skey             = "dev-oos"
      product          = "speech"
    }

  }

  qa = {

    c2c-app = {
      name             = "app"
      address_prefixes = ["10.89.58.0/23"]
      skey             = "qa-c2c"
      product          = "speech"
    }
    c2c-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.60.0/23"]
      skey             = "qa-c2c"
      product          = "speech"
    }
    c2c-lb = {
      name             = "lb"
      address_prefixes = ["10.89.63.0/24"]
      skey             = "qa-c2c"
      product          = "speech"
    }

    cde-app = {
      name             = "app"
      address_prefixes = ["10.89.50.0/23"]
      skey             = "qa-cde"
      product          = "speech"
    }
    cde-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.52.0/23"]
      skey             = "qa-cde"
      product          = "speech"
    }
    cde-lb = {
      name             = "lb"
      address_prefixes = ["10.89.55.0/24"]
      skey             = "qa-cde"
      product          = "speech"
    }

    oos-app = {
      name             = "app"
      address_prefixes = ["10.89.66.0/23"]
      skey             = "qa-oos"
      product          = "speech"
    }
    oos-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.68.0/23"]
      skey             = "qa-oos"
      product          = "speech"
    }
    oos-lb = {
      name             = "lb"
      address_prefixes = ["10.89.71.0/24"]
      skey             = "qa-oos"
      product          = "speech"
    }

  }

  stb = {

    c2c-app = {
      name             = "app"
      address_prefixes = ["10.89.106.0/23"]
      skey             = "stb-c2c"
      product          = "speech"
    }
    c2c-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.108.0/23"]
      skey             = "stb-c2c"
      product          = "speech"
    }
    c2c-lb = {
      name             = "lb"
      address_prefixes = ["10.89.111.0/24"]
      skey             = "stb-c2c"
      product          = "speech"
    }

    cde-app = {
      name             = "app"
      address_prefixes = ["10.89.98.0/23"]
      skey             = "stb-cde"
      product          = "speech"
    }
    cde-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.100.0/23"]
      skey             = "stb-cde"
      product          = "speech"
    }
    cde-lb = {
      name             = "lb"
      address_prefixes = ["10.89.103.0/24"]
      skey             = "stb-cde"
      product          = "speech"
    }

    oos-app = {
      name             = "app"
      address_prefixes = ["10.89.114.0/23"]
      skey             = "stb-oos"
      product          = "speech"
    }
    oos-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.116.0/23"]
      skey             = "stb-oos"
      product          = "speech"
    }
    oos-lb = {
      name             = "lb"
      address_prefixes = ["10.89.119.0/24"]
      skey             = "stb-oos"
      product          = "speech"
    }

  }

  stg = {

    c2c-app = {
      name             = "app"
      address_prefixes = ["10.89.8.0/23"]
      skey             = "stg-c2c"
      product          = "speech"
    }
    c2c-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.10.0/23"]
      skey             = "stg-c2c"
      product          = "speech"
    }
    c2c-lb = {
      name             = "lb"
      address_prefixes = ["10.89.14.0/24"]
      skey             = "stg-c2c"
      product          = "speech"
    }

    cde-app = {
      name             = "app"
      address_prefixes = ["10.89.0.0/23"]
      skey             = "stg-cde"
      product          = "speech"
    }
    cde-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.2.0/23"]
      skey             = "stg-cde"
      product          = "speech"
    }
    cde-lb = {
      name             = "lb"
      address_prefixes = ["10.89.6.0/24"]
      skey             = "stg-cde"
      product          = "speech"
    }

    oos-app = {
      name             = "app"
      address_prefixes = ["10.89.16.0/23"]
      skey             = "stg-oos"
      product          = "speech"
    }
    oos-app-db = {
      name             = "app-db"
      address_prefixes = ["10.89.18.0/23"]
      skey             = "stg-oos"
      product          = "speech"
    }
    oos-lb = {
      name             = "lb"
      address_prefixes = ["10.89.22.0/24"]
      skey             = "stg-oos"
      product          = "speech"
    }

  }
}

