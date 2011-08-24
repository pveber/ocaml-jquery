(*
  JQuery binding for Js_of_ocaml - 2011
  
  jQuery module

  @author : Gabriel Cardoso
*)

open Js

class type jQuery = object
  method add : js_string t -> jQuery t meth
  method add_element : #Dom_html.element t -> jQuery t meth
  method add_jquery : jQuery t -> jQuery t meth
  method addClass : js_string t -> jQuery t meth
  method addClass_fun : (int -> js_string t -> js_string t) -> jQuery t meth
  method after : (js_string t, #Dom_html.element t, jQuery t) Tools.Choice3.t
    -> jQuery t meth
  method after_fun : 
    (int -> (js_string t, #Dom_html.element t, jQuery t) Tools.Choice3.t) 
    -> jQuery t meth
  method ajaxComplete : 
    (#Dom_html.event t -> #XmlHttpRequest.xmlHttpRequest t -> 'a) 
    -> jQuery t meth
  method css_get : js_string t -> js_string t meth
  method css : js_string t -> js_string t -> jQuery meth
end

(** Construct the jQuery object i.e. "$" in jQuery **)
val jQuery : (js_string t, #Dom_html.element t, #Dom_html.element t js_array t,
	      jQuery t) Tools.Choice4.t ->
              (#Dom_html.element t, #Dom_html.document, 
	       jQuery t) Tools.Choice3.t opt -> jQuery t

val ajax : js_string t -> unit meth

