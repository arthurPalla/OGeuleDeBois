let questions = [|"SHOOOT";"2 SHOOOOOT"; "1 SHOT OU 3 SHOOOOTS"; "1 SHOT OU 10 POMPES"; "SHOT ou dit la chose dont tu es le moins fier"; "Shot ou dit la personnes sur laquelle on peut pas compter"|]

let generate_questions () = 
  let value = Random.int (Array.length questions -1) in 
  questions.(value)

let draw_question str = 
  Raylib.draw_rectangle 300 300 800 300 Raylib.Color.black;
  Raylib.draw_rectangle (300 + 6) (300 +6) (800 - 12) (300 - 12) Raylib.Color.white; Raylib.draw_text (str) (400 + 10) (400) 25 Raylib.Color.black