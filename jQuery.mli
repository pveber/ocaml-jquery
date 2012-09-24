(*
 * JQuery binding for Js_of_ocaml - 2011-2012  
 * jQuery module
 *
 * 2011 Gabriel Cardoso - gcardoso.w@gmail.com
 * 2012 Cagdas Bozman - cagdas.bozman@ocamlpro.com
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*)

open Js
open Effects

class type jQuery = object
  method add : js_string t -> jQuery t meth
  method add_element : #Dom_html.element t -> jQuery t meth
  method add_jquery : jQuery t -> jQuery t meth
  method addClass : js_string t -> jQuery t meth
  method addClass_ : (int -> js_string t -> js_string t) callback 
    -> jQuery t meth
  method after : (js_string t, #Dom_html.element t, jQuery t) Tools.Choice3.t
    -> jQuery t meth
  method after_fun : 
    (int -> (js_string t, #Dom_html.element t, jQuery t) Tools.Choice3.t) 
    -> jQuery t meth
  method ajaxComplete : 
    (#Dom_html.event t -> #XmlHttpRequest.xmlHttpRequest t -> 'a) callback
    -> jQuery t meth
  method animate : Dom_html.cssStyleDeclaration t -> duration_pre opt 
    -> easing_pre opt -> ('a, 'b) meth_callback opt -> jQuery t meth
  method append : js_string t -> jQuery t meth
  method appendTo : js_string t -> jQuery t meth
  method appendTo_jquery : jQuery t -> jQuery t meth
  method attr : js_string t -> js_string t optdef meth
  method attr_set : js_string t -> js_string t -> jQuery t meth
  method before : (js_string t, #Dom_html.element t, jQuery t) Tools.Choice3.t
    -> jQuery t meth
  method bind : js_string t -> ('a, 'b) meth_callback opt -> jQuery t meth
  method blur : ('a, 'b) meth_callback opt -> jQuery t meth
  method change : ('a, 'b) meth_callback opt -> jQuery t meth
  method clearQueue : js_string t opt -> jQuery t meth
  method click : ('a, 'b) meth_callback opt -> jQuery t meth
  method css_get : js_string t -> js_string t meth
  method css : js_string t -> js_string t -> jQuery t meth
  method delay : int -> js_string t opt -> jQuery t meth
  method dequeue : js_string t opt -> jQuery t meth
  method each : (int -> #Dom_html.element t -> 'a) callback -> jQuery t meth
  method eq : int -> jQuery t meth
  method fadeIn : duration_pre opt -> easing_pre opt -> ('a, 'b) meth_callback opt
    -> jQuery t meth
  method fadeOut : duration_pre opt -> easing_pre opt -> ('a, 'b) meth_callback opt
    -> jQuery t meth
  method fadeTo : duration_pre opt -> easing_pre opt -> ('a, 'b) meth_callback opt
    -> jQuery t meth
  method fadeToggle : duration_pre opt -> easing_pre opt -> ('a, 'b) meth_callback opt
    -> jQuery t meth
  method find : jQuery t -> jQuery t meth
  method focus : ('a, 'b) meth_callback opt -> jQuery t meth
  method has : js_string t -> jQuery t meth
  method hasClass : js_string t -> bool t meth
  method height : int meth
  method height_set : int -> jQuery t meth
  method hide : duration_pre opt -> easing_pre opt -> ('a, 'b) meth_callback opt
    -> jQuery t meth
  method hover : ('a, 'b) meth_callback -> ('a, 'b) meth_callback opt -> jQuery t meth
  method html : js_string t meth 
  method html_set : js_string t -> jQuery t meth
  method insertAfter : (js_string t, #Dom_html.element t, jQuery t)
    Tools.Choice3.t -> jQuery t meth
  method insertBefore : (js_string t, #Dom_html.element t, jQuery t)
    Tools.Choice3.t -> jQuery t meth
  method length : int readonly_prop
  method live : 'a Dom.Event.typ -> ('a, 'b) meth_callback -> jQuery t meth
  method prepend : js_string t -> unit meth
  method queue : js_string t opt -> js_string t js_array t meth
  method ready : ('a, 'b) meth_callback -> jQuery t meth
  method remove : unit meth
  method removeClass : js_string t opt -> jQuery t meth
  method removeClass_ : (int -> js_string t -> js_string t) callback 
    -> jQuery t meth
  method select : ('a, 'b) meth_callback opt -> jQuery t meth
  method serialize : unit -> js_string meth
  method show : duration_pre opt -> easing_pre opt -> ('a, 'b) meth_callback opt
    -> jQuery t meth
  method size : int meth
  method slideDown : duration_pre opt -> easing_pre opt -> ('a, 'b) meth_callback opt
    -> jQuery t meth
  method slideToggle : duration_pre opt -> easing_pre opt -> ('a, 'b) meth_callback opt
    -> jQuery t meth
  method slideUp : duration_pre opt -> easing_pre opt -> ('a, 'b) meth_callback opt
    -> jQuery t meth
  method stop : bool t opt -> bool t opt -> jQuery t meth
  method submit : ('a, 'b) meth_callback opt -> jQuery t meth
  method toggle : bool t -> jQuery t meth
  method toggleClass : js_string t -> jQuery t meth
  method toggle_ : duration_pre opt -> easing_pre opt -> ('a, 'b) meth_callback opt
    -> jQuery t meth
  method text : js_string t meth
  method text_set : js_string t -> jQuery t meth
  method unbind : js_string t -> jQuery t meth
  method val_ : string_array t meth
  method val_set : js_string t -> jQuery t meth
  method width : int meth
  method width_set : int -> jQuery t meth
  method tableFilter : unit meth
  method tableFilterApplyFilterValues : unit meth
end

(** Easy way to call the jQuery object jQ "#foo" <=> $("#foo") **)
val jQ : string -> jQuery t

(** Call the jQuery object i.e. "$" in jQuery **)
val jQuery : (js_string t, #Dom_html.element t, #Dom_html.element t js_array t,
	      jQuery t) Tools.Choice4.t ->
              (#Dom_html.element t, #Dom_html.document, 
	       jQuery t) Tools.Choice3.t opt -> jQuery t


val ajax : js_string t -> unit
val param : Unsafe.any t -> bool t opt -> js_string t
