#Variable for East US Region
location = "eastus"
sku      = "Standard"
prefix   = "tfs-ilb"
lbs = {
  prod = {
    prod-c2c = {
      name        = "prod-c2c"
      description = "speech"
    }
    prod-cde = {
      name        = "prod-cde"
      description = "speech"
    }
    prod-oos = {
      name        = "prod-oos"
      description = "speech"
    }
  }
  hub = {
    hub = {
      name        = "hub"
      description = "speech"
    }
  }
  psr = {
    psr-c2c = {
      name        = "psr-c2c"
      description = "speech"
    }
    psr-cde = {
      name        = "psr-cde"
      description = "speech"
    }
    psr-oos = {
      name        = "psr-oos"
      description = "speech"
    }
  }

  dev = {
    dev-c2c = {
      name        = "dev-c2c"
      description = "speech"
    }
    dev-cde = {
      name        = "dev-cde"
      description = "speech"
    }
    dev-oos = {
      name        = "dev-oos"
      description = "speech"
    }
  }

  qa = {
    qa-c2c = {
      name        = "qa-c2c"
      description = "speech"
    }
    qa-cde = {
      name        = "qa-cde"
      description = "speech"
    }
    qa-oos = {
      name        = "qa-oos"
      description = "speech"
    }
  }

  stb = {
    stb-c2c = {
      name        = "stb-c2c"
      description = "speech"
    }
    stb-cde = {
      name        = "stb-cde"
      description = "speech"
    }
    stb-oos = {
      name        = "stb-oos"
      description = "speech"
    }
  }

  stg = {
    stg-c2c = {
      name        = "stg-c2c"
      description = "speech"
    }
    stg-cde = {
      name        = "stg-cde"
      description = "speech"
    }
    stg-oos = {
      name        = "stg-oos"
      description = "speech"
    }
  }
}
tags = {
  name    = "tfs"
  service = "terraform"
}
