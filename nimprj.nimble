# Package

version       = "0.1.0"
author        = "Rex Zhuo"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["nimprj"]
skipDirs      = @["spa", "tmpl", "web"]


# Dependencies

requires "nim >= 1.6.12"
requires "cliche"
requires "jester"
requires "karax"

# Tasks

task spa, "build spa applications":
  exec "nim js -o:public/login.js -d:kxiname=login ./src/spa/login.nim"
 