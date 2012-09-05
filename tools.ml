(*
 * JQuery binding for Js_of_ocaml - 2011-2012  
 * Tools module
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

module Choice3 = struct
  type (+'a, +'b, +'c) t
  let i1 : 'a -> ('a, 'b, 'c) t = Obj.magic
  let i2 : 'b -> ('a, 'b, 'c) t = Obj.magic
  let i3 : 'c -> ('a, 'b, 'c) t = Obj.magic
end

module Choice4 = struct
  type (+'a, +'b, +'c, +'d) t
  let i1 : 'a -> ('a, 'b, 'c, 'd) t = Obj.magic
  let i2 : 'b -> ('a, 'b, 'c, 'd) t = Obj.magic
  let i3 : 'c -> ('a, 'b, 'c, 'd) t = Obj.magic
  let i4 : 'd -> ('a, 'b, 'c, 'd) t = Obj.magic
end
