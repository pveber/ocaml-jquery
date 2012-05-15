(* 
 * Utils module from https://github.com/OCamlPro/tryocaml/blob/master/ocp-jslib/utils.mli
 * http://www.ocamlpro.com - OCamlPro SAS
 *
 * (C) 2012 Fabrice Le Fessant - fabrice.le_fessant@inria.fr
 * (C) 2012 Cagdas Bozman - cagdas.bozman@ocamlpro.com
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

(** {1 Useful functions and alias} *)
val doc : Dom_html.document Js.t

val window : Dom_html.window Js.t

val loc : Dom_html.location Js.t

val _s : string -> Js.js_string Js.t

val _f : ('a -> 'b) -> ('c, 'a -> 'b) Js.meth_callback

val set_div_by_id : string -> string -> unit

val set_by_id : string -> string -> unit

val get_element_by_id : string -> Dom_html.element Js.t

val get_by_id : string -> string

val get_by_name : string -> string

(** {2 Constructors}  *)

(** [jsnew0] is a function to build an object using contructor [constr]
    without arguments. *)
val jsnew0 : 'a Js.t Js.constr -> unit -> 'a Js.t

(** [jsnew1] is a function to build an object using contructor [constr]
    and argument [a].*)
val jsnew1 : ('a -> 'b Js.t) Js.constr -> 'a -> 'b Js.t

(** [jsnew2] is a function to build an object using contructor [constr]
    and arguments [a] and [b].*)
val jsnew2 : ('a -> 'b -> 'c Js.t) Js.constr -> 'a * 'b -> 'c Js.t

(** [jsnew3] is a function to build an object using contructor [constr]
    and arguments [a], [b] and [c].*)
val jsnew3 : ('a -> 'b -> 'c -> 'd Js.t) Js.constr -> 'a * 'b * 'c -> 'd Js.t

val setIntervalUntilFalse : (unit -> bool) -> float -> unit
val setInterval : (unit -> unit) -> float -> (unit -> unit)
val setTimeout : (unit -> unit) -> float -> (unit -> unit)
