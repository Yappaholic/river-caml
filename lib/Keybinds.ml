let mapNormal = ["riverctl"; "map"; "normal"];;
let mapPointer = ["riverctl"; "map-pointer"; "normal"];;

let defMap map super keybinds =
  let commands = List.map (fun x -> Util.makeCommand map super x) keybinds in
  List.iter Util.apply commands;;
 
let tagSwitch tags = List.map (fun x -> ["set-focused-tags"; Util.pow (x -. 1.)]) tags;;
let tagSwap tags = List.map (fun x -> ["set-view-tags"; Util.pow (x -. 1.)]) tags;;

let setTags switchKey swapKey =
  let tags = [1.; 2.; 3.; 4.] in 
      defMap mapNormal switchKey (Util.makeTuples tags @@ tagSwitch tags);
      defMap mapNormal swapKey (Util.makeTuples tags @@ tagSwap tags);;
    
let mouseMap super keybinds = defMap mapPointer super keybinds;;

let mapKeys super keybinds = defMap mapNormal super keybinds;;

let repeatRate tuple =
  let command = ["riverctl"; "set-repeat"; Int.to_string(fst tuple); Int.to_string(snd tuple)] in
    Util.apply command;;
