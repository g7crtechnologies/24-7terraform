create_resource_group        = true
existing_resource_group_name = "value"
location                     = "eastus"
region                       = "eu"
component = {
  prod = "prod"
  psr  = "psr"
  dev  = "dev"
  qa   = "qa"
  stg  = "stg"
  stb  = "stb"
  hub  = "hub"
}

subscription_id = {
  "prod" = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
  "psr"  = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
  "dev"  = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
  "qa"  = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
  "stb"  = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
  "stg"  = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
  "hub"  = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
}

tags = {
  "owner"       = "g7"
  "environment" = "tfs"
}

address_space = {
  prod = {
    prod-c2c = {
      name          = "prod-c2c"
      address_space = ["10.89.16.0/20"]
      product       = "aiva"
    }
    prod-cde = {
      name          = "prod-prod-cde"
      address_space = ["10.88.16.0/20"]
      product       = "aiva"
    }
    prod-oos = {
      name          = "prod-oos"
      address_space = ["10.88.16.0/20"]
      product       = "aiva"
    }
  }
  hub = {
    hub = {
      name          = "hub"
      address_space = ["10.89.40.0/21"]
      product       = "aiva"
    }
  }
  psr = {
    psr-c2c = {
      name          = "psr-c2c"
      address_space = ["10.89.80.0/21"]
      product       = "aiva"
    }
    psr-cde = {
      name          = "psr-psr-cde"
      address_space = ["10.89.72.0/21"]
      product       = "aiva"
    }
    psr-oos = {
      name          = "psr-oos"
      address_space = ["10.89.88.0/21"]
      product       = "aiva"
    }
  }

  dev = {
    dev-c2c = {
      name          = "dev-c2c"
      address_space = ["10.89.32.0/21"]
      product       = "aiva"
    }
    dev-cde = {
      name          = "dev-cde"
      address_space = ["10.89.24.0/21"]
      product       = "aiva"
    }
    dev-oos = {
      name          = "dev-oos"
      address_space = ["10.89.40.0/21"]
      product       = "aiva"
    }
  }

  qa = {
    qa-c2c = {
      name          = "qa-c2c"
      address_space = ["10.89.56.0/21"]
      product       = "aiva"
    }
    qa-cde = {
      name          = "qa-cde"
      address_space = ["10.89.48.0/21"]
      product       = "aiva"
    }
    qa-oos = {
      name          = "qa-oos"
      address_space = ["10.89.64.0/21"]
      product       = "aiva"
    }
  }

  stb = {
    stb-c2c = {
      name          = "stb-c2c"
      address_space = ["10.89.104.0/21"]
      product       = "aiva"
    }
    stb-cde = {
      name          = "stb-cde"
      address_space = ["10.89.96.0/21"]
      product       = "aiva"
    }
    stb-oos = {
      name          = "stb-oos"
      address_space = ["10.89.112.0/21"]
      product       = "aiva"
    }
  }

  stg = {
    stg-c2c = {
      name          = "stg-c2c"
      address_space = ["10.89.8.0/21"]
      product       = "aiva"
    }
    stg-cde = {
      name          = "stg-cde"
      address_space = ["10.89.0.0/21"]
      product       = "aiva"
    }
    stg-oos = {
      name          = "stg-stg-oos"
      address_space = ["10.89.16.0/21"]
      product       = "aiva"
    }
  }
}
#================================================================================#

subnet_prefixes = {
  hub = {

    hub1 = {
      name             = "azurefirewall"
      address_prefixes = ["10.88.48.0/26"]
      skey             = "hub"
      product          = "aiva"
    }
    hub2 = {
      name             = "mgmt"
      address_prefixes = ["10.88.52.0/22"]
      skey             = "hub"
      product          = "aiva"
    }
    hub3 = {
      name             = "app-gw"
      address_prefixes = ["10.88.56.0/22"]
      skey             = "hub"
      product          = "aiva"
    }

    hub4 = {
      name             = "lb"
      address_prefixes = ["10.88.57.0/24"]
      skey             = "hub"
      product          = "aiva"
    }
    hub5 = {
      name             = "gateway"
      address_prefixes = ["10.88.48.64/26"]
      skey             = "hub"
      product          = "aiva"
    }
  }
  prod = {

    c2c1 = {
      name             = "app"
      address_prefixes = ["10.88.16.0/23"]
      skey             = "prod-c2c"
      product          = "aiva"
    }
    c2c2 = {
      name             = "app-db"
      address_prefixes = ["10.88.18.0/23"]
      skey             = "prod-c2c"
      product          = "aiva"
    }
    c2c3 = {
      name             = "lb"
      address_prefixes = ["10.88.22.0/24"]
      skey             = "prod-c2c"
      product          = "aiva"
    }

    cde1 = {
      name             = "app"
      address_prefixes = ["10.88.0.0/23"]
      skey             = "prod-cde"
      product          = "aiva"
    }
    cde2 = {
      name             = "app-db"
      address_prefixes = ["10.88.2.0/23"]
      skey             = "prod-cde"
      product          = "aiva"
    }
    cde3 = {
      name             = "lb"
      address_prefixes = ["10.88.6.0/24"]
      skey             = "prod-cde"
      product          = "aiva"
    }

    oos1 = {
      name             = "app"
      address_prefixes = ["10.88.32.0/23"]
      skey             = "prod-oos"
      product          = "aiva"
    }
    oos2 = {
      name             = "app-db"
      address_prefixes = ["10.88.34.0/23"]
      skey             = "prod-oos"
      product          = "aiva"
    }
    oos3 = {
      name             = "lb"
      address_prefixes = ["10.88.38.0/24"]
      skey             = "prod-oos"
      product          = "aiva"
    }

  }

  psr = {

    c2c1 = {
      name             = "app"
      address_prefixes = ["10.89.82.0/23"]
      skey             = "psr-c2c"
      product          = "aiva"
    }
    c2c2 = {
      name             = "app-db"
      address_prefixes = ["10.89.84.0/23"]
      skey             = "psr-c2c"
      product          = "aiva"
    }
    c2c3 = {
      name             = "lb"
      address_prefixes = ["10.89.87.0/24"]
      skey             = "psr-c2c"
      product          = "aiva"
    }

    cde1 = {
      name             = "app"
      address_prefixes = ["10.89.74.0/23"]
      skey             = "psr-cde"
      product          = "aiva"
    }
    cde2 = {
      name             = "app-db"
      address_prefixes = ["10.89.76.0/23"]
      skey             = "psr-cde"
      product          = "aiva"
    }
    cde3 = {
      name             = "lb"
      address_prefixes = ["10.89.79.0/24"]
      skey             = "psr-cde"
      product          = "aiva"
    }

    oos1 = {
      name             = "app"
      address_prefixes = ["10.89.90.0/23"]
      skey             = "psr-oos"
      product          = "aiva"
    }
    oos2 = {
      name             = "app-db"
      address_prefixes = ["10.89.92.0/23"]
      skey             = "psr-oos"
      product          = "aiva"
    }
    oos3 = {
      name             = "lb"
      address_prefixes = ["10.89.95.0/24"]
      skey             = "psr-oos"
      product          = "aiva"
    }

  }

  dev = {

    c2c1 = {
      name             = "app"
      address_prefixes = ["10.89.34.0/23"]
      skey             = "dev-c2c"
      product          = "aiva"
    }
    c2c2 = {
      name             = "app-db"
      address_prefixes = ["10.89.36.0/23"]
      skey             = "dev-c2c"
      product          = "aiva"
    }
    c2c3 = {
      name             = "lb"
      address_prefixes = ["10.89.39.0/24"]
      skey             = "dev-c2c"
      product          = "aiva"
    }

    cde1 = {
      name             = "app"
      address_prefixes = ["10.89.26.0/23"]
      skey             = "dev-cde"
      product          = "aiva"
    }
    cde2 = {
      name             = "app-db"
      address_prefixes = ["10.89.28.0/23"]
      skey             = "dev-cde"
      product          = "aiva"
    }
    cde3 = {
      name             = "lb"
      address_prefixes = ["10.89.31.0/24"]
      skey             = "dev-cde"
      product          = "aiva"
    }

    oos1 = {
      name             = "app"
      address_prefixes = ["10.89.42.0/23"]
      skey             = "dev-oos"
      product          = "aiva"
    }
    oos2 = {
      name             = "app-db"
      address_prefixes = ["10.89.44.0/23"]
      skey             = "dev-oos"
      product          = "aiva"
    }
    oos3 = {
      name             = "lb"
      address_prefixes = ["10.89.47.0/24"]
      skey             = "dev-oos"
      product          = "aiva"
    }

  }

  qa = {

    c2c1 = {
      name             = "app"
      address_prefixes = ["10.89.58.0/23"]
      skey             = "qa-c2c"
      product          = "aiva"
    }
    c2c2 = {
      name             = "app-db"
      address_prefixes = ["10.89.60.0/23"]
      skey             = "qa-c2c"
      product          = "aiva"
    }
    c2c3 = {
      name             = "lb"
      address_prefixes = ["10.89.63.0/24"]
      skey             = "qa-c2c"
      product          = "aiva"
    }

    cde1 = {
      name             = "app"
      address_prefixes = ["10.89.50.0/23"]
      skey             = "qa-cde"
      product          = "aiva"
    }
    cde2 = {
      name             = "app-db"
      address_prefixes = ["10.89.52.0/23"]
      skey             = "qa-cde"
      product          = "aiva"
    }
    cde3 = {
      name             = "lb"
      address_prefixes = ["10.89.55.0/24"]
      skey             = "qa-cde"
      product          = "aiva"
    }

    oos1 = {
      name             = "app"
      address_prefixes = ["10.89.66.0/23"]
      skey             = "qa-oos"
      product          = "aiva"
    }
    oos2 = {
      name             = "app-db"
      address_prefixes = ["10.89.68.0/23"]
      skey             = "qa-oos"
      product          = "aiva"
    }
    oos3 = {
      name             = "lb"
      address_prefixes = ["10.89.71.0/24"]
      skey             = "qa-oos"
      product          = "aiva"
    }

  }

  stb = {

    c2c1 = {
      name             = "app"
      address_prefixes = ["10.89.106.0/23"]
      skey             = "stb-c2c"
      product          = "aiva"
    }
    c2c2 = {
      name             = "app-db"
      address_prefixes = ["10.89.108.0/23"]
      skey             = "stb-c2c"
      product          = "aiva"
    }
    c2c3 = {
      name             = "lb"
      address_prefixes = ["10.89.111.0/24"]
      skey             = "stb-c2c"
      product          = "aiva"
    }

    cde1 = {
      name             = "app"
      address_prefixes = ["10.89.98.0/23"]
      skey             = "stb-cde"
      product          = "aiva"
    }
    cde2 = {
      name             = "app-db"
      address_prefixes = ["10.89.100.0/23"]
      skey             = "stb-cde"
      product          = "aiva"
    }
    cde3 = {
      name             = "lb"
      address_prefixes = ["10.89.103.0/24"]
      skey             = "stb-cde"
      product          = "aiva"
    }

    oos1 = {
      name             = "app"
      address_prefixes = ["10.89.114.0/23"]
      skey             = "stb-oos"
      product          = "aiva"
    }
    oos2 = {
      name             = "app-db"
      address_prefixes = ["10.89.116.0/23"]
      skey             = "stb-oos"
      product          = "aiva"
    }
    oos3 = {
      name             = "lb"
      address_prefixes = ["10.89.119.0/24"]
      skey             = "stb-oos"
      product          = "aiva"
    }

  }

  stg = {

    c2c1 = {
      name             = "app"
      address_prefixes = ["10.89.8.0/23"]
      skey             = "stg-c2c"
      product          = "aiva"
    }
    c2c2 = {
      name             = "app-db"
      address_prefixes = ["10.89.10.0/23"]
      skey             = "stg-c2c"
      product          = "aiva"
    }
    c2c3 = {
      name             = "lb"
      address_prefixes = ["10.89.14.0/24"]
      skey             = "stg-c2c"
      product          = "aiva"
    }

    cde1 = {
      name             = "app"
      address_prefixes = ["10.89.0.0/23"]
      skey             = "stg-cde"
      product          = "aiva"
    }
    cde2 = {
      name             = "app-db"
      address_prefixes = ["10.89.2.0/23"]
      skey             = "stg-cde"
      product          = "aiva"
    }
    cde3 = {
      name             = "lb"
      address_prefixes = ["10.89.6.0/24"]
      skey             = "stg-cde"
      product          = "aiva"
    }

    oos1 = {
      name             = "app"
      address_prefixes = ["10.89.16.0/23"]
      skey             = "stg-oos"
      product          = "aiva"
    }
    oos2 = {
      name             = "app-db"
      address_prefixes = ["10.89.18.0/23"]
      skey             = "stg-oos"
      product          = "aiva"
    }
    oos3 = {
      name             = "lb"
      address_prefixes = ["10.89.22.0/24"]
      skey             = "stg-oos"
      product          = "aiva"
    }

  }
}

