open Spawn

(** Returns valid command to pass to Util.apply *)
let makeCommand map super x = map @ [super; fst x] @ snd x;;

(** Prints command for checking if passed command is valid *)
let prettyPrint command =
  print_endline @@ List.fold_left (fun x y -> x ^ " " ^ y) "" command;;

(** Launches riverctl with command arguments *)
let apply command =
  ignore @@ spawn ~prog:"/usr/bin/riverctl" ~argv:command ();;

(** Used to create tag function like "riverctl map normal Super 1 set-view-tags 1" *)
let makeTuples tags tagFun =
  let intTags = List.map (fun x -> Int.of_float(x) |> Int.to_string) tags in
  List.map2 (fun x y -> (x,y)) intTags tagFun;;

(** River uses powers of 2 to select tags, so we need to get them from tags list *)
let pow x = Int.of_float(2.**x) |> Int.to_string;;
