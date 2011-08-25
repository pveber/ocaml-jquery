(*
  JQuery binding for Js_of_ocaml - 2011
  
  jQuery module

  @author : Gabriel Cardoso
*)

open Js
open Effects

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
  method animate : Dom_html.cssStyleDeclaration t -> duration_pre 
    -> easing_pre opt -> 'a callback t -> jQuery t
  method clearQueue : js_string t opt -> jQuery t meth
  method css_get : js_string t -> js_string t meth
  method css : js_string t -> js_string t -> jQuery t meth
  method delay : int -> js_string t opt -> jQuery t meth
  method dequeue : js_string t opt -> jQuery t meth
  method fadeIn : duration_pre -> easing_pre opt -> 'a callback t opt 
    -> jQuery t meth
  method fadeOut : duration_pre -> easing_pre opt -> 'a callback t opt 
    -> jQuery t meth
  method fadeTo : duration_pre -> float -> easing_pre opt -> 'a callback t opt
    -> jQuery t meth
  method fadeToggle : duration_pre opt -> easing_pre opt -> 'a callback t opt
    -> jQuery t meth
  method hide : duration_pre opt -> easing_pre opt -> 'a callback t opt
    -> jQuery t meth
  method queue : js_string t opt -> js_string t js_array t meth
  method show : duration_pre -> float -> easing_pre opt -> 'a callback t opt
    -> jQuery t meth
  method slideDown : duration_pre -> float -> easing_pre opt 
    -> 'a callback t opt -> jQuery t meth
  method slideToggle : duration_pre -> float -> easing_pre opt 
    -> 'a callback t opt -> jQuery t meth
  method slideUp : duration_pre -> float -> easing_pre opt -> 'a callback t opt
    -> jQuery t meth
  method stop : bool t opt -> bool t opt -> jQuery t meth
  method toggle : bool t -> jQuery t meth
  method toggle_ : duration_pre -> float -> easing_pre opt -> 'a callback t opt
    -> jQuery t meth 
end

(** Construct the jQuery object i.e. "$" in jQuery **)
val jQuery : (js_string t, #Dom_html.element t, #Dom_html.element t js_array t,
	      jQuery t) Tools.Choice4.t ->
              (#Dom_html.element t, #Dom_html.document, 
	       jQuery t) Tools.Choice3.t opt -> jQuery t

val ajax : js_string t -> unit meth

