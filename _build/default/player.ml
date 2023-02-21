type joueur = {
  mutable name: string;
  mutable shots: int;
  mutable points: int;
}

let init_player nom = 
  {name = nom; shots = 0; points = 0}

let rec draw_player_list player_list y= 
match player_list with 
|t::q -> Raylib.draw_rectangle (300) (y*50 + 350) (800) (50) Raylib.Color.white;ignore t; Raylib.draw_text (t.name) (670) (y*50 + 363) 25 Raylib.Color.black; draw_player_list q (y+1)
|[] -> ()

let draw_leader_board player_list= 
let temp = List.sort (fun x -> fun y-> y.points - x.points) player_list in 
let rec aux list y =
match list with 
|t::q -> Raylib.draw_rectangle (300) (y*50 + 350) (800) (50) Raylib.Color.white;ignore t; Raylib.draw_text (t.name) (550) (y*50 + 363) 25 Raylib.Color.black; Raylib.draw_text (string_of_int t.points) (900) (y*50 + 363) 25 Raylib.Color.black; aux q (y+1)
|[] -> ()
in aux temp 0

let cycle_player_add player_list = 
  match player_list with
  | t::q -> t.points <- t.points + 1; q@[t]
  |_ -> failwith "liste vide"


let cycle_player_withdraw player_list = 
  match player_list with
  | t::q -> t.points <- t.points - 1; q@[t]
  |_ -> failwith "liste vide"

let extract_player player_list = 
  match player_list with
  | t::_ -> t
  |_ -> failwith "liste vide"