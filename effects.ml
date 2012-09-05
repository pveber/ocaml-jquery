(*
 * JQuery binding for Js_of_ocaml - 2011-2012
 * Effects module
 *
 * 2011 Gabriel Cardoso - gcardoso.w@gmail.com
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

type duration = Value of int | Slow | Fast
type duration_pre

let of_duration = function
  | Value i -> (Obj.magic i : duration_pre)
  | Slow -> (Obj.magic (Js.string "slow") : duration_pre)
  | Fast -> (Obj.magic (Js.string "fast") : duration_pre)

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
