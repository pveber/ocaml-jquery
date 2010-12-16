let (>>=) = Lwt.bind
let dom = Dom_html.document

let js = Js.string
let append_text e s = Dom.appendChild e (dom##createTextNode (js s))

module JQuery :
sig
  open Js

  class type obj = object
    method get : int -> Dom.node t meth
    method html : js_string t meth
    method html_set : js_string t -> obj t meth
    method length : int meth
  end

  val obj : unit -> obj t
  val selector : string -> obj t
  val of_node : #Dom.node t -> obj t
end
= 
struct
  open Js

  class type obj = object
    method get : int -> Dom.node t meth
    method html : js_string t meth
    method html_set : js_string t -> obj t meth
    method length : int meth
  end

  let obj () : obj t = 
    Unsafe.fun_call (Unsafe.variable "jQuery") [| |]
      
  let selector selector : obj t =
    Unsafe.fun_call (Unsafe.variable "jQuery") [| Unsafe.inject (js selector) |]

  let of_node (dom : #Dom.node t) : obj t =
    Unsafe.fun_call (Unsafe.variable "jQuery") [| Unsafe.inject dom |]
end 

let onload _ =
  Dom_html.window##alert ((JQuery.selector "body")##html()) ;
  ignore ((JQuery.of_node (JQuery.selector "body > p")##get(1))##html_set (js"biquette")) ;
  Js._false
  
  

let _ =
  Dom_html.window##onload <- Dom_html.handler onload

