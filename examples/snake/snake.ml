(* Snake Game
 * http://www.ocsigen.org/js_of_ocaml/
 * https://github.com/gabriel-cardoso/ocaml-jquery
 * http://www.ocamlpro.com
 *
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

open JQuery
open Effects
open Utils

module Html = Dom_html

let direction = ref "right"  
let speed = ref 100
let ticker : Html.interval_id ref = 
  ref (Html.window##setInterval ((Js.wrap_callback (fun _ -> ())), 10.))
let fruit_cell : (int * int ) ref = ref (15, 15)
let score = ref 0
let size = 40

let snake_cells = 
  let arr = jsnew Js.array_empty () in
  ignore (arr##push ((10, 14)));
  ignore (arr##push ((10, 13)));
  ignore (arr##push ((10, 12)));
  ignore (arr##push ((10, 11)));
  ignore (arr##push ((10, 10)));
  ignore (arr##push ((10, 9)));
  ignore (arr##push ((10, 8)));
  ignore (arr##push ((10, 7 )));
  arr

let snake_head = ref (10, 14)

let render_snake () =
    let _ =
      (jQ "td")##removeClass (Js.some (_s "snakeCell")) in
    let _ =
      (jQ "td")##removeClass (Js.some (_s "snakeHead")) in
    for i = 0 to (snake_cells##length - 1) do
      let cell = Js.Optdef.to_option (Js.array_get snake_cells i) in
      let cell = 
        match cell with
          | None -> assert false
          | Some t -> t in
      let fst, snd = fst cell, snd cell in
      ignore (((((jQ "tr")##eq (fst))##find (jQ "td"))##eq (snd))##addClass (_s "snakeCell"))
    done;
    ignore (((((jQ "tr")##eq (fst !snake_head))##find (jQ "td"))##eq (snd !snake_head))##addClass (_s "snakeHead"))
      
let get_random_number limit =
  int_of_float ((Js.to_float (Js.math##random ())) *. (float_of_int (limit mod limit)))

let get_fruit_cell () =
  fruit_cell := (
    Random.int ((jQ "tr")##length), 
    Random.int ((jQ "tr:eq(0)>td")##length)
  )
  
let game_over () =
  let fast = Js.some (of_duration Fast) and
      slow = Js.some (of_duration Slow) in
  let _ =
    (jQ "div.gameOver")##show (fast, Js.null, Js.some
      (Js.wrap_callback (fun _ ->
        let this = get_element_by_id "gameOver" in
        this##style##top <- _s "250";
        (jQ "this")##animate (this##style, slow, Js.null, Js.null)))) in
  window##clearInterval (!ticker);
  failwith ("Game Over")

let render_fruit_cell () = 
  ignore ((jQ "td")##removeClass (Js.some (_s "fruitCell")));
  ignore (((((jQ "tr")##eq (fst !fruit_cell)##find ((jQ "td")))##eq (
    snd !fruit_cell))##addClass ( _s "fruitCell")))

let rec start_game () =
  ticker := window##setInterval (Js.wrap_callback (fun () -> update_snake_cell ()), 
                                 float_of_int !speed)

and update_snake_cell () = 
  let snake_new_head = ref (0, 0) in
  let () =
    match !direction with
      | "left"  ->
          snake_new_head := fst !snake_head, (snd !snake_head) - 1 
      | "up"    ->
          snake_new_head := (fst !snake_head) - 1, snd !snake_head
      | "right" ->
          snake_new_head := fst !snake_head, (snd !snake_head) + 1            
      | "down"  ->
          snake_new_head := (fst !snake_head) + 1, snd !snake_head
      | _ -> () in
  let () =
    if fst !snake_new_head < 0 || snd !snake_new_head < 0 then
      game_over ()
    else if fst !snake_new_head >= size || snd !snake_new_head >= size then
      game_over ()
    else () in
  let new_cell = (((jQ "tr")##eq (fst !snake_new_head))##find (jQ "td"))##eq (
    snd !snake_new_head) in 
  if new_cell##length = 0 then game_over ()
  else begin 
    if (Js.to_bool (new_cell##hasClass (_s "snakeCell"))) then
      game_over ()
    else begin 
      if (Js.to_bool (new_cell##hasClass (_s "fruitCell"))) then begin
        get_fruit_cell ();
        render_fruit_cell ();
        score := !score + 100;
        let score_board = get_element_by_id "scoreBoard" in
        score_board##innerHTML <- _s (Printf.sprintf "Your score : %d\n" !score);
        speed := if !speed - 10 > 5 then !speed - 10 else !speed;
        window##clearInterval (!ticker);
        start_game ()
      end;

      for i = (snake_cells##length - 1) downto 1 do
        let value = 
          match Js.Optdef.to_option (Js.array_get snake_cells (i - 1)) with
          | None -> assert false
          | Some t -> t in
        Js.array_set snake_cells i value
      done;

      Js.array_set snake_cells 0 (!snake_new_head);
      snake_head := !snake_new_head;
      render_snake ()
    end
  end

let get_new_direction keyCode = 
  let codes = function
    | 37 -> "left"
    | 38 -> "up"
    | 39 -> "right"
    | 40 -> "down"
    | _ -> "" in  
  let new_direction = codes keyCode and
      change_direction = ref true in
  let () =
    match !direction with
      | "left"  ->
          change_direction := new_direction <> "right"
      | "up"    -> 
          change_direction := new_direction <> "down"
      | "right" ->
          change_direction := new_direction <> "left"
      | "down"  ->
          change_direction := new_direction <> "up" 
      | _ -> () in
  direction := if !change_direction then new_direction else !direction
    
let render_board () = 
  let rowhtml = ref "" in
  for i = 0 to size do
    rowhtml := !rowhtml ^ "<td cellpadding=\"0\" cellspacing=\"0\"></td>"
  done;
  let html = jsnew Js.array_empty () in
  for i = 0 to size do
    ignore (html##push (_s ("<tr cellpadding=\"0\" cellspacing=\"0\">" ^ !rowhtml ^"</tr>")))
  done;
  ignore ((jQ "body")##append ((_s "<table>")##concat_2 (html##join (_s "\n"), _s "</table>")));
  get_fruit_cell ()


let main () =
  (jQ "document")##ready (Js.wrap_callback (fun _ ->
    render_board ();
    render_fruit_cell ();
    Html.document##onkeydown <- 
      (Html.handler (fun e -> get_new_direction (e##keyCode); Js._true));
    start_game ()))

let _ = 
  main ()
  




