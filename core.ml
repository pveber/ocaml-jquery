(**
  JQuery binding for Js_of_ocaml - 2011
  
  Core module

  @author : Gabriel Cardoso
*)

open Js

class type jQuery = object
  
  method ajax : js_string t -> unit meth
  method css : js_string t -> js_string t -> unit meth
end

let jQuery : (js_string t, Dom_html.element t, Dom_html.element t array t,
	      jQuery t) Tools.Choice4.t ->
              (Dom_html.element t, Dom_html.document, 
	       jQuery t) Tools.Choice3.t opt -> jQuery t = 
  Js.Unsafe.variable "jQuery"

