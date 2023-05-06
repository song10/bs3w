#[
TODO:
  * to improve cliche (if cligen does not get better)
    * to parse arguments into an object
    * to accept delimiters {' ','=',':'} (currently only '=' supported!)
]#


import bs3wpkg/submodule
import web/ui

import cliche
import os
import osproc
import strformat
import strutils

proc cmd_list(sub: string, long: bool): int =
  result = 0
  let xlong = if long: "-al" else: ""
  let cmd = &"ls {sub} {xlong}"
  echo "+ " & cmd
  result = execCmd(cmd)

proc main: int =
  let args = commandLineParams()
  args.getOpt (
    cmd: "main command",
    sub: "sub command",
    long: false,
    )

  if cmd == "main command":
    let app = getAppFilename()
    quit(execCmd(&"{app} --help"))

  case cmd:
  of "list":
    result = cmd_list(sub, long)
  of "webui":
    result = cmd_webui()
  else:
    echo &"Unknown cmd `{cmd}`"

proc demo: int =
  echo(getWelcomeMessage())

when isMainModule:
  if true:
    quit main()
  else:
    quit demo()
