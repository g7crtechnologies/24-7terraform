create_resource_group        = true
existing_resource_group_name = "value"
location                     = "westus"
region                       = "wu"
component = {
  prod = "prod"
  psr  = "psr"
  stg  = "stg"
  stb  = "stb"
  hub  = "hub"
}

tags = {
  "owner"       = "g7"
  "environment" = "tfs"
}

subscription_id = {
  "prod" = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
  "psr"  = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
  "stg"  = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
  "stb"  = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
  "hub"  = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
}

address_space = {
  hub = {
    hub = {
      name          = "hub"
      address_space = ["10.86.48.0/20"]
      product       = "aiva"
    }
  }
  prod = {
    prod-c2c = {
      name          = "prod-c2c"
      address_space = ["10.86.16.0/20"]
      product       = "aiva"
    }
    prod-cde = {
      name          = "prod-cde"
      address_space = ["10.86.0.0/20"]
      product       = "aiva"
    }
    prod-oos = {
      name          = "prod-oos"
      address_space = ["10.86.32.0/21"]
      product       = "aiva"
    }
  }

  psr = {
    psr-c2c = {
      name          = "psr-c2c"
      address_space = ["10.87.80.0/21"]
      product       = "aiva"
    }
    psr-cde = {
      name          = "psr-cde"
      address_space = ["10.87.72.0/21"]
      product       = "aiva"
    }
    psr-oos = {
      name          = "psr-oos"
      address_space = ["10.87.88.0/21"]
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
      address_space = ["10.87.96.0/21"]
      product       = "aiva"
    }
    stb-oos = {
      name          = "stb-oos"
      address_space = ["10.87.112.0/21"]
      product       = "aiva"
    }
  }

  stg = {
    stg-c2c = {
      name          = "stg-c2c"
      address_space = ["10.87.8.0/21"]
      product       = "aiva"
    }
    stg-cde = {
      name          = "stg-cde"
      address_space = ["10.87.0.0/21"]
      product       = "aiva"
    }
    stg-oos = {
      name          = "stg-oos"
      address_space = ["10.87.16.0/21"]
      product       = "aiva"
    }
  }
}
#================================================================================#

subnet_prefixes = {
  hub = {

    hub1 = {
      name             = "azurefirewall"
      address_prefixes = ["10.86.48.0/26"]
      skey             = "hub"
      product          = "aiva"
    }
    hub2 = {
      name             = "mgmt"
      address_prefixes = ["10.86.52.0/22"]
      skey             = "hub"
      product          = "aiva"
    }
    hub3 = {
      name             = "app-gw"
      address_prefixes = ["10.86.56.0/24"]
      skey             = "hub"
      product          = "aiva"
    }
    hub4 = {
      name             = "lb"
      address_prefixes = ["10.86.57.0/24"]
      skey             = "hub"
      product          = "aiva"
    }
    hub5 = {
      name             = "gateway"
      address_prefixes = ["10.86.48.64/26"]
      skey             = "hub"
      product          = "aiva"
    }
  }
  prod = {

    c2c1 = {
      name             = "app"
      address_prefixes = ["10.86.16.0/23"]
      skey             = "prod-c2c"
      product          = "aiva"
    }
    c2c2 = {
      name             = "app-db"
      address_prefixes = ["10.86.18.0/23"]
      skey             = "prod-c2c"
      product          = "aiva"
    }
    c2c3 = {
      name             = "lb"
      address_prefixes = ["10.86.22.0/24"]
      skey             = "prod-c2c"
      product          = "aiva"
    }

    cde1 = {
      name             = "app"
      address_prefixes = ["10.86.0.0/23"]
      skey             = "prod-cde"
      product          = "aiva"
    }
    cde2 = {
      name             = "app-db"
      address_prefixes = ["10.86.2.0/23"]
      skey             = "prod-cde"
      product          = "aiva"
    }
    cde3 = {
      name             = "lb"
      address_prefixes = ["10.86.6.0/24"]
      skey             = "prod-cde"
      product          = "aiva"
    }

    oos1 = {
      name             = "app"
      address_prefixes = ["10.86.32.0/23"]
      skey             = "prod-oos"
      product          = "aiva"
    }
    oos2 = {
      name             = "app-db"
      address_prefixes = ["10.86.34.0/23"]
      skey             = "prod-oos"
      product          = "aiva"
    }
    oos3 = {
      name             = "lb"
      address_prefixes = ["10.86.38.0/24"]
      skey             = "prod-oos"
      product          = "aiva"
    }

  }

  psr = {

    c2c1 = {
      name             = "app"
      address_prefixes = ["10.87.82.0/23"]
      skey             = "psr-c2c"
      product          = "aiva"
    }
    c2c2 = {
      name             = "app-db"
      address_prefixes = ["10.87.84.0/23"]
      skey             = "psr-c2c"
      product          = "aiva"
    }
    c2c3 = {
      name             = "lb"
      address_prefixes = ["10.87.87.0/24"]
      skey             = "psr-c2c"
      product          = "aiva"
    }

    cde1 = {
      name             = "app"
      address_prefixes = ["10.87.74.0/23"]
      skey             = "psr-cde"
      product          = "aiva"
    }
    cde2 = {
      name             = "app-db"
      address_prefixes = ["10.87.76.0/23"]
      skey             = "psr-cde"
      product          = "aiva"
    }
    cde3 = {
      name             = "lb"
      address_prefixes = ["10.87.79.0/24"]
      skey             = "psr-cde"
      product          = "aiva"
    }

    oos1 = {
      name             = "app"
      address_prefixes = ["10.87.90.0/23"]
      skey             = "psr-oos"
      product          = "aiva"
    }
    oos2 = {
      name             = "app-db"
      address_prefixes = ["10.87.92.0/23"]
      skey             = "psr-oos"
      product          = "aiva"
    }
    oos3 = {
      name             = "lb"
      address_prefixes = ["10.87.95.0/24"]
      skey             = "psr-oos"
      product          = "aiva"
    }

  }

  stb = {

    c2c1 = {
      name             = "app"
      address_prefixes = ["10.87.106.0/23"]
      skey             = "stb-c2c"
      product          = "aiva"
    }
    c2c2 = {
      name             = "app-db"
      address_prefixes = ["10.87.108.0/23"]
      skey             = "stb-c2c"
      product          = "aiva"
    }
    c2c3 = {
      name             = "lb"
      address_prefixes = ["10.87.111.0/24"]
      skey             = "stb-c2c"
      product          = "aiva"
    }

    cde1 = {
      name             = "app"
      address_prefixes = ["10.87.98.0/23"]
      skey             = "stb-cde"
      product          = "aiva"
    }
    cde2 = {
      name             = "app-db"
      address_prefixes = ["10.87.100.0/23"]
      skey             = "stb-cde"
      product          = "aiva"
    }
    cde3 = {
      name             = "lb"
      address_prefixes = ["10.87.103.0/24"]
      skey             = "stb-cde"
      product          = "aiva"
    }

    oos1 = {
      name             = "app"
      address_prefixes = ["10.87.114.0/24"]
      skey             = "stb-oos"
      product          = "aiva"
    }
    oos2 = {
      name             = "app-db"
      address_prefixes = ["10.87.116.0/24"]
      skey             = "stb-oos"
      product          = "aiva"
    }
    oos3 = {
      name             = "lb"
      address_prefixes = ["10.87.119.0/24"]
      skey             = "stb-oos"
      product          = "aiva"
    }

  }

  stg = {

    c2c1 = {
      name             = "app"
      address_prefixes = ["10.87.8.0/23"]
      skey             = "stg-c2c"
      product          = "aiva"
    }
    c2c2 = {
      name             = "app-db"
      address_prefixes = ["10.87.10.0/23"]
      skey             = "stg-c2c"
      product          = "aiva"
    }
    c2c3 = {
      name             = "lb"
      address_prefixes = ["10.87.14.0/24"]
      skey             = "stg-c2c"
      product          = "aiva"
    }

    cde1 = {
      name             = "app"
      address_prefixes = ["10.87.0.0/23"]
      skey             = "stg-cde"
      product          = "aiva"
    }
    cde2 = {
      name             = "app-db"
      address_prefixes = ["10.87.2.0/23"]
      skey             = "stg-cde"
      product          = "aiva"
    }
    cde3 = {
      name             = "lb"
      address_prefixes = ["10.87.6.0/24"]
      skey             = "stg-cde"
      product          = "aiva"
    }

    oos1 = {
      name             = "app"
      address_prefixes = ["10.87.16.0/23"]
      skey             = "stg-oos"
      product          = "aiva"
    }
    oos2 = {
      name             = "app-db"
      address_prefixes = ["10.87.18.0/23"]
      skey             = "stg-oos"
      product          = "aiva"
    }
    oos3 = {
      name             = "lb"
      address_prefixes = ["10.87.22.0/24"]
      skey             = "stg-oos"
      product          = "aiva"
    }

  }
}


