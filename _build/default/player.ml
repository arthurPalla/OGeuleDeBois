type joueur = {
  name: string;
  mutable shots: int;
  mutable points: int;
}

let init_player nom = 
  {name = nom; shots = 0; points = 0}