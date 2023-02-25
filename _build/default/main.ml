open Button
open Player
let w = 1500
let h = 1000
let sheet = ref 0

let rec firs_sheet (button_list: button list) text_box player_list=  
match text_box_action text_box with 
|Some a -> firs_sheet button_list text_box (a::player_list);
|None -> 
    let open Raylib in 
    begin_drawing ();
    clear_background Color.red;
    draw_text "OGeuleDeBois" 530 100 50 Color.white;
    draw_text_box text_box;
    draw_every_button button_list !sheet;
    draw_player_list player_list 0;
    end_drawing ();
player_list

let second_sheet (button_list: button list)  player_list str= 
  let joueur = extract_player player_list in 
  let open Raylib in 
  begin_drawing ();
  clear_background Color.red;
  draw_every_button button_list !sheet;
  draw_string_square joueur.name;
  Questions.draw_question str;
  end_drawing ()

let third_sheet (button_list: button list)  player_list =
  let open Raylib in 
  begin_drawing ();
  clear_background Color.red;
  draw_text "OGeuleDeBois" 530 100 50 Color.white;
  draw_leader_board player_list;
  draw_every_button button_list !sheet;
  end_drawing ();
  ()
let rec loop (button_list: button list) text_box player_list str= 
  if Raylib.window_should_close () then Raylib.close_window ()
  else
  match !sheet with 
  |0 -> let s,_ = test_every_button button_list None !sheet in sheet := s; loop button_list text_box (firs_sheet button_list text_box player_list) str
  |1 -> let a,b = test_every_button button_list (Some player_list) !sheet  in sheet := a; if Option.get b <> player_list then  (second_sheet button_list (Option.get b ) (Questions.generate_questions ()); loop button_list text_box (Option.get b) (Questions.generate_questions ())) else (second_sheet button_list (Option.get b ) str; loop button_list text_box (Option.get b) str)
  |2 -> let s,_ = test_every_button button_list None !sheet in sheet := s; third_sheet button_list player_list;loop button_list text_box player_list str
  |_ -> failwith "invalid sheet"

let init () = 
  Random.self_init ();
  Raylib.init_window w h "OGeuleDeBois";
  Raylib.set_target_fps 40;
  let button = init_button 100 100 100 50  "Jouer" 0 (fun x-> ignore x; 1, x) Raylib.Color.white in 
  let button2 = init_button 100 100 100 50  "Retour" 1 (fun x-> ignore x; 0,x) Raylib.Color.white in
  let button3 = init_button 400 620 200 70  "Validé" 1 (fun x->  1, Some (cycle_player_add (Option.get x))) Raylib.Color.green in
  let button4 = init_button 800 620 200 70  "Eclaté" 1 (fun x->  1, Some (cycle_player_withdraw (Option.get x))) Raylib.Color.maroon in
  let button5 = init_button 1000 100 200 50  "Score" 1 (fun x-> ignore x; 2, x) Raylib.Color.white  in 
  let button6 = init_button 100 100 100 50  "Retour" 2 (fun x-> ignore x; 1, x) Raylib.Color.white  in 
  [button6;button5;button4;button3; button2;button]

let () = 
  let text_box = init_text_box 300 200 800 100 "" 0 in 
  loop (init ()) text_box [] (Questions.generate_questions ())