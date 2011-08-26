open Js
open JQuery
open Effects

module D = Dom_html
let d = D.document

let jss = Js.string
let jq s = jQuery (Tools.Choice4.i1 (jss s)) Js.null

let _ = (jq "div.foo")##css (jss "color", jss "red")

let _ = 
  (jq "#clickme")##click (some (wrap_callback (fun _ ->
    (jq "#square")##slideDown (some (of_duration Slow), null, null))))

