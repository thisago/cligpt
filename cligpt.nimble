# Package

version       = "0.1.1"
author        = "Thiago Navarro"
description   = "Command line interface for ChatGPT"
license       = "GPL-3.0"
srcDir        = "src"
bin           = @["cligpt"]
binDir = "build"


# Dependencies

requires "nim >= 1.6.0"

requires "cligen"

requires "dirtygpt >= 0.1.0"
