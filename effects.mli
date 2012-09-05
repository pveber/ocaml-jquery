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
