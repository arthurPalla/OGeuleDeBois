(*let questions = [|"SHOOOT";"2 SHOOOOOT"; "1 SHOT OU 3 SHOOOOTS"; "1 SHOT OU 10 POMPES";"SHOT ou dit la chose dont tu es le moins fier"; "Shot ou dit la personnes sur laquelle on peut pas compter";
"tornade de biere ou 5 shots";"fait une roularde ou 2 shots";"Rentre chez toi ou 3 shots"; "SHOT ou anecdote heuteuse"; "Shot mannge un quart de citron"; "TEC PAF pour tous les joueurs"; "Tabasse safia ou 3 shots"; "tabasse safia ou 4 shots"; 
"Shot ou ne parle plus pendant 5 minutes"; "Shot ou baise la mère ta mère"; "SHOT"; "4 SHOTS"; "2 SHOT a PARTAGER"; "TU peux offir 3 shots à 2 personnes"; "Shot ou propose un qui a déjà"; "Shot ou bras de fer avec dorian"; "Shot ou donne 5 euro a arthur"
; "Noir au blanc les perdants boivent" ; "Saute ton tour"; "shot de ricard pur"; "Shot ou 15 pompes"; "Shot de 3 alcools mélangés"; "Bois ou donne une clope a saf"; "Shot piege (Eau/vodka)"; "Shot ou va faire des pates"
; "Shot ou fait lincher par les joueurs"; "Bois ou donne 5 qualités a arthur"; "Bois ou donne 5 qualités a Safia"; "Bois ou fait de story de merde"; "Tu as perdu un point"; "Boit jusqu'au vomi"
; "shot de ton choix à qui tu veux"; "Shot ou dorinne ta tatoue"; "Fait une blague si nulle boit"; "Si quelqu'un vomit va l'aider"; "Boit ou Saf(bourrée) te maquille";
"Shot ou dit ce que déteste chez le joueur à droite"; "Shot ou fait une dance"; "Distribue autant de shot que de joueurs (max 2/personnes)"; "Boit un trouve une question"
;"faire homme droit pendant 4 sec "|]*)
(*let questions = [|"Fracasse louis"; "Fracasse louis"; "Change un vetement avec la personne de ta droite"; "Fracasse safia"; "Dit ta plus grande honte"; "Racconte qq chose d'improbable"; "Dessin anmie preferé"; "Chose la plus fier" ;
"Citez vos trois pires défaux" ;"Tabasser dorian"; "Defi a qui tu veux"; "dit ce que du deteste du joueur a droite"; "Fait une blague nulle"; "donne 5 euros a arthur "; "Fait une story de merde"; "Trouve une questions pour tout le monde "; " fait toi lincher par tout le mond "
; "Saute ton tour"; "Donne 5 qualités en arthur" ; "Décrit la beauté de athur"; "action ou vérité à qui du veux"; " action a qui tu veux"; "5 pompes"; "anecdote honteuse";
"safia te maquille"; "mange un quart de citron"; "fait une dance honteuse" ; "fait un homme doit"; " Donne 6 euros a arthur";"massage a arthur"; "Chose la plus bizarre"; "Massage arthur"; "Tu t'es déjà branlé en penssant a louis ?";
"Safia sale pute"; "complimente tous les joueurs"; "Défauts de tous les joueurs"; "Chose que tu ne t'arrive pas a t'avouer"; "Arrete de fumer / de reagrder des films pedo pour les non joueurs"; " Comment ca va ?"
; "Massage arthur"; "Donne 10 euros a arthur"; "Suce arthur (sauf louis)"; "Suce louis (sauf tout le monde)"; "Envoie un message a la mère de sofia"; "dit au père de louis qu'il est gay";
"Massage a louis"; "Nique tes morts"; "tabasse louis"; "ton fantasme inavouable"; "Ta pire experience sexuelle (Ou culinaire pour saifa/dorian)"; "Capote / sans"; "QQ qui excite inavouable"; "Ou voudrai baiser"; "Plus longtemps sans te doucher"; "15 pompes"; "Avec qui échangerai tu ta vie"
; "Sucer ou sodo"; "Mikasa smah or pass"; "safia smash or pass"; "safia ou mikasa" ; "Arthur ou mikasa"; "Quelqu'un tombe dans le vie tu sauve a doite ou a gauche"|]
*)
let questions = [|"va dormir"|]
let generate_questions () = 
  let value = Random.int (Array.length questions ) in 
  questions.(value)

let draw_question str = 
  Raylib.draw_rectangle 300 300 800 300 Raylib.Color.black;
  Raylib.draw_rectangle (300 + 6) (300 +6) (800 - 12) (300 - 12) Raylib.Color.white; Raylib.draw_text (str) (400) (400) 25 Raylib.Color.black 