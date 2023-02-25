let questions = [|"SHOOOT";"2 SHOOOOOT"; "1 SHOT OU 3 SHOOOOTS"; "1 SHOT OU 10 POMPES";"SHOT ou dit la chose dont tu es le moins fier"; "Shot ou dit la personnes sur laquelle on peut pas compter";
"tornade de biere ou 5 shots";"fait une roularde ou 2 shots";"Rentre chez toi ou 3 shots"; "SHOT ou anecdote heuteuse"; "Shot mannge un quart de citron"; "TEC PAF pour tous les joueurs"; "Tabasse safia ou 3 shots"; "tabasse safia ou 4 shots"; 
"Shot ou ne parle plus pendant 5 minutes"; "Shot ou baise la mère ta mère"; "SHOT"; "4 SHOTS"; "2 SHOT a PARTAGER"; "TU peux offir 3 shots à 2 personnes"; "Shot ou propose un qui a déjà"; "Shot ou bras de fer avec dorian"; "Shot ou donne 5 euro a arthur"
; "Noir au blanc les perdants boivent" ; "Saute ton tour"; "shot de ricard pur"; "Shot ou 15 pompes"; "Shot de 3 alcools mélangés"; "Bois ou donne une clope a saf"; "Shot piege (Eau/vodka)"; "Shot ou va faire des pates"
; "Shot ou fait lincher par les joueurs"; "Bois ou donne 5 qualités a arthur"; "Bois ou donne 5 qualités a Safia"; "Bois ou fait de story de merde"; "Tu as perdu un point"; "Boit jusqu'au vomi"
; "shot de ton choix à qui tu veux"; "Shot ou dorinne ta tatoue"; "Fait une blague si nulle boit"; "Si quelqu'un vomit va l'aider"; "Boit ou Saf(bourrée) te maquille";
"Shot ou dit ce que déteste chez le joueur à droite"; "Shot ou fait une dance"; "Distribue autant de shot que de joueurs (max 2/personnes)"; "Boit un trouve une question"
;"faire homme droit pendant 4 sec "|]

let generate_questions () = 
  let value = Random.int (Array.length questions ) in 
  questions.(value)

let draw_question str = 
  Raylib.draw_rectangle 300 300 800 300 Raylib.Color.black;
  Raylib.draw_rectangle (300 + 6) (300 +6) (800 - 12) (300 - 12) Raylib.Color.white; Raylib.draw_text (str) (400) (400) 25 Raylib.Color.black 