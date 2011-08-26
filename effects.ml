(*
  JQuery binding for Js_of_ocaml - 2011
  
  jQuery module

  @author : Gabriel Cardoso
*)

open Js

type duration = Value of int | Slow | Fast
type duration_pre = Name of js_string t | ValueP of int

let of_duration = function
  | Value i -> ValueP i
  | Slow -> Name (Js.string "slow")
  | Fast -> Name (Js.string "fast")

type easing = 
  | Def
  | Jswing
  | Easeinquad
  | Easeoutquad
  | Easeinoutquad
  | Easeincubic
  | Easeoutcubic
  | Easeinoutcubic
  | Easeinquart
  | Easeoutquart
  | Easeinoutquart
  | Easeinsine
  | Easeoutsine
  | Easeinoutsine
  | Easeinexpo
  | Easeoutexpo
  | Easeinoutexpo
  | Easeinquint
  | Easeoutquint
  | Easeinoutquint
  | Easeincirc
  | Easeoutcirc
  | Easeinoutcirc
  | Easeinelastic
  | Easeoutelastic
  | Easeinoutelastic
  | Easeinback
  | Easeoutback
  | Easeinoutback
  | Easeinbounce
  | Easeoutbounce
  | Easeinoutbounce

type easing_pre = js_string t

let of_easing = function 
  | Def -> Js.string "def"
  | Jswing -> Js.string "jswing"
  | Easeinquad -> Js.string "easeinquad"
  | Easeoutquad -> Js.string "easeoutquad"
  | Easeinoutquad -> Js.string "easeinoutquad"
  | Easeincubic -> Js.string "easeincubic"
  | Easeoutcubic -> Js.string "easeoutcubic"
  | Easeinoutcubic -> Js.string "easeinoutcubic"
  | Easeinquart -> Js.string "easeinquart"
  | Easeoutquart -> Js.string "easeoutquart"
  | Easeinoutquart -> Js.string "easeinoutquart"
  | Easeinsine -> Js.string "easeinsine"
  | Easeoutsine -> Js.string "easeoutsine"
  | Easeinoutsine -> Js.string "easeinoutsine"
  | Easeinexpo -> Js.string "easeinexpo"
  | Easeoutexpo -> Js.string "easeoutexpo"
  | Easeinoutexpo -> Js.string "easeinoutexpo"
  | Easeinquint -> Js.string "easeinquint"
  | Easeoutquint -> Js.string "easeoutquint"
  | Easeinoutquint -> Js.string "easeinoutquint"
  | Easeincirc -> Js.string "easeincirc"
  | Easeoutcirc -> Js.string "easeoutcirc"
  | Easeinoutcirc -> Js.string "easeinoutcirc"
  | Easeinelastic -> Js.string "easeinelastic"
  | Easeoutelastic -> Js.string "easeoutelastic"
  | Easeinoutelastic -> Js.string "easeinoutelastic"
  | Easeinback -> Js.string "easeinback"
  | Easeoutback -> Js.string "easeoutback"
  | Easeinoutback -> Js.string "easeinoutback"
  | Easeinbounce -> Js.string "easeinbounce"
  | Easeoutbounce -> Js.string "easeoutbounce"
  | Easeinoutbounce -> Js.string "easeinoutbounce"
