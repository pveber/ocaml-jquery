let (>>=) = Lwt.bind
let dom = Dom_html.document

let js = Js.string
let append_text e s = Dom.appendChild e (dom##createTextNode (js s))

open Js

type jstring = js_string t

module type JQuery :
sig
  class type t = object
    method get : int -> Dom.node t meth
    method html : jstring meth
    method html_set : jstring -> jQuery t meth
    method length : int meth
  end

  val obj : unit -> t
  val selector : string -> t
  val of_node : #Dom.node t -> t
end
= 
struct
  class type t = object
    method get : int -> Dom.node t meth
    method html : jstring meth
    method html_set : jstring -> jQuery t meth
    method length : int meth
  end

  let obj () : jQuery t = 
    Unsafe.fun_call (Unsafe.variable "jQuery") [| |]
      
  let selector selector : jQuery t =
    Unsafe.fun_call (Unsafe.variable "jQuery") [| Unsafe.inject (js selector) |]

  let of_node (dom : #Dom.node t) : jQuery t =
    Unsafe.fun_call (Unsafe.variable "jQuery") [| Unsafe.inject dom |]
end 

let onload _ =
  Dom_html.window##alert ((jquery_sel "body")##html()) ;
  (jquery_of_node (jquery_sel "body > p")##get(1))##html_set (js"biquette") ;
  _false
  
  

let _ =
  Dom_html.window##onload <- Dom_html.handler onload

