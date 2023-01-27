#Variable for East US Region
location = "eastus"
sku      = "Standard"
prefix   = "tfs-ilb"
lbs = {
  prod = {
    prod-c2c = {
      name        = "prod-c2c"
      description = "aiva"
    }
    prod-cde = {
      name        = "prod-cde"
      description = "aiva"
    }
    prod-oos = {
      name        = "prod-oos"
      description = "aiva"
    }
  }
  hub = {
    hub = {
      name        = "hub"
      description = "aiva"
    }
  }
  psr = {
    psr-c2c = {
      name        = "psr-c2c"
      description = "aiva"
    }
    psr-cde = {
      name        = "psr-cde"
      description = "aiva"
    }
    psr-oos = {
      name        = "psr-oos"
      description = "aiva"
    }
  }

  dev = {
    dev-c2c = {
      name        = "dev-c2c"
      description = "aiva"
    }
    dev-cde = {
      name        = "dev-cde"
      description = "aiva"
    }
    dev-oos = {
      name        = "dev-oos"
      description = "aiva"
    }
  }

  qa = {
    qa-c2c = {
      name        = "qa-c2c"
      description = "aiva"
    }
    qa-cde = {
      name        = "qa-cde"
      description = "aiva"
    }
    qa-oos = {
      name        = "qa-oos"
      description = "aiva"
    }
  }

  stb = {
    stb-c2c = {
      name        = "stb-c2c"
      description = "aiva"
    }
    stb-cde = {
      name        = "stb-cde"
      description = "aiva"
    }
    stb-oos = {
      name        = "stb-oos"
      description = "aiva"
    }
  }

  stg = {
    stg-c2c = {
      name        = "stg-c2c"
      description = "aiva"
    }
    stg-cde = {
      name        = "stg-cde"
      description = "aiva"
    }
    stg-oos = {
      name        = "stg-oos"
      description = "aiva"
    }
  }
}
tags = {
  name    = "tfs"
  service = "terraform"
}
