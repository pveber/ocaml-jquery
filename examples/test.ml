open Js
open JQuery

module D = Dom_html
let d = D.document

let jss = Js.string
let gebi s = Js.Opt.get (d##getElementById (Js.string s))
    (fun () -> assert false)

let x = jQuery (Tools.Choice4.i1 (jss "div.foo")) Js.null
in x##css (jss "color", jss "red")

let p = jQuery (Tools.Choice4.i1 (jss "p")) Js.null
in p##add_element (gebi "toto")
