let w = 1500
let h = 1000

let rec loop () = 
  if Raylib.window_should_close () then Raylib.close_window ()
  else let open Raylib in 
  begin_drawing ();
  clear_background Color.red;
  end_drawing ();
  loop ()

let () = 
  Raylib.init_window w h "OGeuleDeBois";
  loop ()