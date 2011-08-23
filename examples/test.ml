open Core

let jss = Js.string

let x = jQuery (Tools.Choice4.i1 (jss "div.foo")) Js.null
in x##css (jss "color", jss "red")

