type button = {
  x: int;
  y: int;
  w: int;
  h: int;
  value: string;
  sheet: int;
  action: Player.joueur option -> int; 
}
type text_box = {
  x: int;
  y: int;
  w: int;
  h:int;
  sheet: int;
  mutable value: string;
  mutable active: bool;
}

let draw_text_box t = 
  if t.active = true then 
  Raylib.draw_rectangle t.x t.y t.w t.h Raylib.Color.green
else 
  Raylib.draw_rectangle t.x t.y t.w t.h Raylib.Color.black;
  Raylib.draw_rectangle (t.x + 6) (t.y+6) (t.w - 12) (t.h - 12) Raylib.Color.white; Raylib.draw_text t.value (t.x + 5) (t.y + t.h /2 - 10) 20 Raylib.Color.black

let init_text_box x y w h s sheet= 
    {x=x;y=y;w=w;h=h;value = s; active = true; sheet = sheet}
  
let init_button x y w h s sheet f = 
  {x=x;y=y;w=w;h=h;value = s; sheet = sheet; action = f}

let rec draw_every_button (button_list:button list) sheet= 
  match button_list with 
  |t::q -> if t.sheet = sheet then (Raylib.draw_rectangle t.x t.y t.w t.h Raylib.Color.white; Raylib.draw_text t.value (t.x + t.w / 2 - 10) (t.y + t.h /2 - 10) 10 Raylib.Color.black);draw_every_button q sheet
  |[] -> ()

let button_action (button:button) player sheet= 
  let x,y = Raylib.get_mouse_x (), Raylib.get_mouse_y () in 
  if Raylib.is_mouse_button_pressed Raylib.MouseButton.Left && x > button.x  && y > button.y && x < button.x + button.w  && y < button.y + button.h then 
  button.action player
else sheet
  
let text_box_action (box:text_box) : Player.joueur option=
  let test = ref None in 
  let x,y = Raylib.get_mouse_x (), Raylib.get_mouse_y () in 
  if Raylib.is_mouse_button_pressed Raylib.MouseButton.Left && x > box.x  && y > box.y && x < box.x + box.w  && y < box.y + box.h then 
  box.active <- not box.active
  else if Raylib.is_mouse_button_pressed Raylib.MouseButton.Left then box.active <- false;
  if box.active then begin
    if Raylib.is_key_pressed Raylib.Key.Enter && box.value <> "" then  ( test := Some (Player.init_player box.value);box.value <- "");

  let key = Raylib.get_char_pressed () in 
  let c = int_of_char key in 
  if c >= 32 && c <= 125 then 
    box.value <- String.cat (box.value) (String.make 1 key);
  if Raylib.is_key_pressed Raylib.Key.Backspace && box.value <> "" then 
    let str_array = Array.of_seq (String.to_seq box.value) in 
    let final_str = String.init (Array.length str_array -1) (fun x -> str_array.(x)) in 
    box.value <- final_str;
  end;
  !test

let rec test_every_button (button_list:button list) player sheet = 
  match button_list with 
  |t::q -> if t.sheet = sheet then let a = button_action t player sheet in if a <> sheet then a else test_every_button q player sheet else test_every_button q player sheet 
  |[] -> sheet