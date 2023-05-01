import karax / [karaxdsl, vdom]

const places = @["boston", "cleveland", "los angeles", "new orleans"]

proc divs_hello*(): string =
  let vnode = buildHtml(tdiv(class = "mt-3")):
    h1: text "My Web Page"
    p: text "Hello world"
    ul:
      for place in places:
        li: text place
    dl:
      dt: text "Can I use Karax for client side single page apps?"
      dd: text "Yes"

      dt: text "Can I use Karax for server side HTML rendering?"
      dd: text "Yes"
  result = $vnode

proc divs_button*(dataIsValid: bool): string =
  let vnode = buildHtml(tdiv):
    button(disabled = not dataIsValid):
      if dataIsValid:
        text "Submit"
      else:
        text "Cannot submit, data is invalid!"
  result = $vnode
