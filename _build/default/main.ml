open Button
open Player
let w = 1500
let h = 1200
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
let second_sheet (button_list: button list) = let open Raylib in 
  begin_drawing ();
  clear_background Color.red;
  draw_every_button button_list !sheet;
  draw_text "OGeuleDeBois" 530 100 50 Color.white;
  end_drawing ()

let rec loop (button_list: button list) text_box player_list= 
  if Raylib.window_should_close () then Raylib.close_window ()
  else
  match !sheet with 
  |0 -> sheet := test_every_button button_list None !sheet; loop button_list text_box (firs_sheet button_list text_box player_list)
  |1 -> sheet := test_every_button button_list None !sheet; second_sheet button_list; loop button_list text_box player_list
  |_ -> failwith "invalid sheet"

let init () = 
  Raylib.init_window w h "OGeuleDeBois";
  Raylib.set_target_fps 40;
  let button = init_button 100 100 50 50  "test" 0 (fun x-> ignore x; 1) in 
  let button2 =  init_button 100 100 50 50  "test1" 1 (fun x-> ignore x; 0) in
  [button2;button]
let () = 
  let text_box = init_text_box 300 200 800 100 "" 0 in 
  loop (init ()) text_box []