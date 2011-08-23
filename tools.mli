(**
  Tools module

  Provide some tools

  @author Gabriel Cardoso
*)

module Choice3 : sig
  type (+'a, +'b, +'c) t
  val i1 : 'a -> ('a, 'b, 'c) t
  val i2 : 'b -> ('a, 'b, 'c) t
  val i3 : 'c -> ('a, 'b, 'c) t
end

module Choice4 : sig
  type (+'a, +'b, +'c, +'d) t
  val i1 : 'a -> ('a, 'b, 'c, 'd) t
  val i2 : 'b -> ('a, 'b, 'c, 'd) t
  val i3 : 'c -> ('a, 'b, 'c, 'd) t
  val i4 : 'd -> ('a, 'b, 'c, 'd) t
end
