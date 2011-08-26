(**
  JQuery binding for Js_of_ocaml - 2011
  
  Effects module

  @author : Gabriel Cardoso
*)

open Js

type duration = Value of int | Slow | Fast
type duration_pre
val of_duration : duration -> duration_pre

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

type easing_pre
val of_easing : easing -> easing_pre
