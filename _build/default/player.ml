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