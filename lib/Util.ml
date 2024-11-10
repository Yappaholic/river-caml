open Spawn
let makeCommand map super x = map @ [super; fst x] @ snd x;;

let prettyPrint command =
  print_endline @@ List.fold_left (fun x y -> x ^ " " ^ y) "" command;;

let apply command =
  ignore @@ spawn ~prog:"/usr/bin/riverctl" ~argv:command ();;

let makeTuples tags tagFun =
  let intTags = List.map (fun x -> Int.of_float(x) |> Int.to_string) tags in
  List.map2 (fun x y -> (x,y)) intTags tagFun;;

let pow x = Int.of_float(2.**x) |> Int.to_string;;
