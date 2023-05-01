include "../tmpl/app.nimf"

import "../spa/divs"

import htmlgen
import jester

proc cmd_web_ui*(): int =
  result = 0
  routes:
    get "/":
        resp h1("Hello world")
    get "/hello":
        resp divs_hello()
    get "/button0":
        resp divs_button(false)
    get "/button1":
        resp divs_button(true)
    get "/login":
        resp gen_app_html("login")

#[
import asyncdispatch, asyncnet

proc match(request: Request): Future[ResponseData] {.async.} =
  block route:
    case request.pathInfo
    of "/":
      resp "Hello World!"
    else:
      resp Http404, "Not found!"

proc cmd_web_ui*(): int =
    var server = initJester(match)
    server.serve()
]#
