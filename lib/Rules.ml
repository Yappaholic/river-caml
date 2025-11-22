let rule_add = [ "riverctl"; "rule-add"; "-app-id" ]

(** Add tag rule for app-id *)
let tag_rule tuple =
  let command = rule_add @ [ fst tuple; "tags"; snd tuple -. 1. |> Util.pow  ] in
  Util.apply command
;;

(** Add ssd rule for app-id *)
let ssd_rule app_id =
  let command = rule_add @ [ app_id; "ssd" ] in
  Util.apply command
;;

(** Add float rule for app-id *)
let float_rule app_id =
  let command = rule_add @ [ app_id; "float" ] in
  Util.apply command
;;
