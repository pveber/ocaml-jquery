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
    -> easing_pre opt -> 'a callback opt -> jQuery t meth
  method append : js_string t -> jQuery t meth
  method appendTo : js_string t -> jQuery t meth
  method appendTo_jquery : jQuery t -> jQuery t meth
  method attr : js_string t -> js_string t meth
  method attr_set : js_string t -> js_string t -> jQuery t meth
  method before : (js_string t, #Dom_html.element t, jQuery t) Tools.Choice3.t
    -> jQuery t meth
  method bind : js_string t -> 'a callback opt -> jQuery t meth
  method blur : 'a callback opt -> jQuery t meth
  method change : 'a callback opt -> jQuery t meth
  method clearQueue : js_string t opt -> jQuery t meth
  method click : 'a callback opt -> jQuery t meth
  method css_get : js_string t -> js_string t meth
  method css : js_string t -> js_string t -> jQuery t meth
  method delay : int -> js_string t opt -> jQuery t meth
  method dequeue : js_string t opt -> jQuery t meth
  method each : (int -> #Dom_html.element t -> 'a) callback -> jQuery t meth
  method eq : int -> jQuery t meth
  method fadeIn : duration_pre opt -> easing_pre opt -> 'a callback opt 
    -> jQuery t meth
  method fadeOut : duration_pre opt -> easing_pre opt -> 'a callback opt 
    -> jQuery t meth
  method fadeTo : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth
  method fadeToggle : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth
  method find : jQuery t -> jQuery t meth
  method focus : 'a callback opt -> jQuery t meth
  method has : js_string t -> jQuery t meth
  method hasClass : js_string t -> bool t meth
  method height : int meth
  method height_set : int -> jQuery t meth
  method hide : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth
  method hover : 'a callback -> 'a callback opt -> jQuery t meth
  method html : js_string t meth 
  method html_set : js_string t -> jQuery t meth
  method insertAfter : (js_string t, #Dom_html.element t, jQuery t)
    Tools.Choice3.t -> jQuery t meth
  method insertBefore : (js_string t, #Dom_html.element t, jQuery t)
    Tools.Choice3.t -> jQuery t meth
  method length : int readonly_prop
  method live : 'a Dom.Event.typ-> 'a callback -> jQuery t meth
  method prepend : js_string t -> unit meth
  method queue : js_string t opt -> js_string t js_array t meth
  method ready : 'a callback -> jQuery t meth
  method remove : unit meth
  method removeClass : js_string t opt -> jQuery t meth
  method removeClass_ : (int -> js_string t -> js_string t) callback 
    -> jQuery t meth
  method select : 'a callback opt -> jQuery t meth
  method serialize : unit -> js_string meth
  method show : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth
  method size : int meth
  method slideDown : duration_pre opt -> easing_pre opt -> 'a callback opt 
    -> jQuery t meth
  method slideToggle : duration_pre opt -> easing_pre opt -> 'a callback opt 
    -> jQuery t meth
  method slideUp : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth
  method stop : bool t opt -> bool t opt -> jQuery t meth
  method submit : 'a callback opt -> jQuery t meth
  method toggle : bool t -> jQuery t meth
  method toggle_ : duration_pre opt -> easing_pre opt -> 'a callback opt
    -> jQuery t meth
  method toggleClass : js_string t -> jQuery t meth
  method text : js_string t meth
  method text_set : js_string t -> jQuery t meth
  method unbind : js_string t -> jQuery t meth
  method val_ : string_array t meth
  method val_set : js_string t -> jQuery t meth
  method width : int meth
  method width_set : int -> jQuery t meth
  method tableFilter : unit meth
  method tableFilterApplyFilterValues : unit meth


(* TODO : implement the right types for these methods c.f. jQuery API
  method ajaxError
  method ajaxSend
  method ajaxStart
  method ajaxStop
  method ajaxSuccess
  method andSelf
  method change
  method children
  method click
  method clone
  method closest
  method contents
  method context
  method data
  method dblclick
  method delegate
  method die
  method each
  method empty
  method end_
  method error
  method filter
  method first
  method focusin
  method focusout
  method get
  method has
  method hasClass
  method height
  method hover
  method index
  method innerHeight
  method innerWidth
  method is
  method jquery
  method keydown
  method keypress
  method keyup
  method last
  method live
  method load
  method load
  method map
  method mousedown
  method mouseenter
  method mouseleave
  method mousemove
  method mouseout
  method mouseover
  method mouseup
  method next
  method nextAll
  method nextUntil
  method not
  method offset
  method offsetParent
  method one
  method outerHeight
  method outerWidth
  method parent
  method parents
  method parentsUntil
  method position
  method prependTo
  method prev
  method prevAll
  method prevUntil
  method promise
  method prop
  method pushStack
  method ready
  method removeAttr
  method removeData
  method removeProp
  method replaceAll
  method replaceWith
  method resize
  method scroll
  method scrollLeft
  method scrollTop
  method serializeArray
  method siblings
  method size
  method slice
  method toArray
  method trigger
  method triggerHandler
  method undelegate
  method unload
  method unwrap
  method width
  method wrap
  method wrapAll
  method wrapInner*)
end

let jQ s = Unsafe.fun_call 
  (Unsafe.variable "jQuery") [|Unsafe.inject (Js.string s)|]

let jQuery 
  (selector : (js_string t, 
	       #Dom_html.element t, 
	       #Dom_html.element t js_array t,
	       jQuery t) Tools.Choice4.t)
  (context_opt : (#Dom_html.element t, 
		  #Dom_html.document, 
		  jQuery t) Tools.Choice3.t opt) : jQuery t = 
  Unsafe.fun_call 
    (Unsafe.variable "jQuery") 
    [|Unsafe.inject selector; Unsafe.inject context_opt|]

let ajax : js_string t -> unit = Unsafe.variable "jQuery.ajax"
(* TODO implement these values as in the jQuery API *)
(*let ajaxPrefilter = Unsafe.variable "jQuery.ajaxPrefilter"
let ajaxSetup = Unsafe.variable "jQuery.ajaxSetup"
let boxModel = Unsafe.variable "jQuery.boxModel"
let browser = Unsafe.variable "jQuery.browser"
module Deferred = struct
  let always = Unsafe.variable "jQuery.deferred.always"
  let done_ = Unsafe.variable "jQuery.deferred.done"
  let fail = Unsafe.variable "jQuery.deferred.fail"
  let isRejected = Unsafe.variable "jQuery.deferred.isRejected"
  let isResolved = Unsafe.variable "jQuery.deferred.isResolved"
  let pipe = Unsafe.variable "jQuery.deferred.pipe"
  let promise = Unsafe.variable "jQuery.deferred.promise"
  let reject = Unsafe.variable "jQuery.deferred.reject"
  let rejectWith = Unsafe.variable "jQuery.deferred.rejectWith"
  let resolve = Unsafe.variable "jQuery.deferred.resolve"
  let resolveWith = Unsafe.variable "jQuery.deferred.resolveWith"
  let then_ = Unsafe.variable "jQuery.deferred.then"
end
let dequeue = Unsafe.variable "jQuery.browser"
let each = Unsafe.variable "jQuery.each"
let error = Unsafe.variable "jQuery.error"
module Event = struct
  let currentTarget = Unsafe.variable "jQuery.event.currentTarget"
  let data = Unsafe.variable "jQuery.event.data"
  let isDefaultPrevented = Unsafe.variable "jQuery.event.isDefaultPrevented"
  let preventDefault = Unsafe.variable "jQuery.event.preventDefault"
  let isImmediatePropagationStopped = 
    Unsafe.variable "jQuery.event.isImmediatePropagationStopped"
  let stopImmediatePropagation = 
    Unsafe.variable "jQuery.event.stopImmediatePropagation"
  let isPropagationStopped = 
    Unsafe.variable "jQuery.event.isPropagationStopped"
  let stopPropagation = Unsafe.variable "jQuery.event.stopPropagation"
  let namespace = Unsafe.variable "jQuery.event.namespace"
  let pageX = Unsafe.variable "jQuery.event.pageX"
  let pageY = Unsafe.variable "jQuery.event.pageY"
  let preventDefault = Unsafe.variable "jQuery.event.preventDefault"
  let relatedTarget = Unsafe.variable "jQuery.event.relatedTarget"
  let result = Unsafe.variable "jQuery.event.result"
  let stopImmediatePropagation = 
    Unsafe.variable "jQuery.event.stopImmediatePropagation"
  let stopPropagation = Unsafe.variable "jQuery.event.stopPropagation"
  let target = Unsafe.variable "jQuery.event.target"
  let timeStamp = Unsafe.variable "jQuery.event.timeStamp"
  let type_ = Unsafe.variable "jQuery.event.type"
  let which = Unsafe.variable "jQuery.event.which"
end
let extend = Unsafe.variable "jQuery.extend"
module Fx = struct 
  let interval = Unsafe.variable "jQuery.fx.interval"
  let off = Unsafe.variable "jQuery.fx.off"
end
let get = Unsafe.variable "jQuery.get"
let getJSON = Unsafe.variable "jQuery.getJSON"
let getScript = Unsafe.variable "jQuery.getScript"
let globalEval = Unsafe.variable "jQuery.globalEval"
let grep = Unsafe.variable "jQuery.grep"
let hasData = Unsafe.variable "jQuery.hasData"
let holdReady = Unsafe.variable "jQuery.holdReady"
let inArray = Unsafe.variable "jQuery.inArray"
let isArray = Unsafe.variable "jQuery.isArray"
let isEmptyObject = Unsafe.variable "jQuery.isEmptyObject"
let isFunction = Unsafe.variable "jQuery.isFunction"
let isPlainObject = Unsafe.variable "jQuery.isPlainObject"
let isWindow = Unsafe.variable "jQuery.isWindow"
let isXMLDoc = Unsafe.variable "jQuery.isXMLDoc"
let makeArray = Unsafe.variable "jQuery.makeArray"
let map = Unsafe.variable "jQuery.map"
let merge = Unsafe.variable "jQuery.merge"
let noConflict = Unsafe.variable "jQuery.noConflict"
let noop = Unsafe.variable "jQuery.noop"
let now = Unsafe.variable "jQuery.now"*)
let param : Unsafe.any t -> bool t opt -> js_string t = 
  Unsafe.variable "jQuery.param"
(*let parseJSON = Unsafe.variable "jQuery.parseJSON"
let parseXML = Unsafe.variable "jQuery.parseXML"
let post = Unsafe.variable "jQuery.post"
let proxy = Unsafe.variable "jQuery.proxy"
let queue = Unsafe.variable "jQuery.queue"
let removeData = Unsafe.variable "jQuery.removeData"
let sub = Unsafe.variable "jQuery.sub"
let suppo = Unsafe.variable "jQuery.suppo"
let trim = Unsafe.variable "jQuery.trim"
let type_ = Unsafe.variable "jQuery.type"
let unique = Unsafe.variable "jQuery.unique"
let when_ = Unsafe.variable "jQuery.when"
*)
