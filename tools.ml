(*
  Tools module

  Provide some tools

  @author Gabriel Cardoso
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
