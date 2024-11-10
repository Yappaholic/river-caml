let borderColor tuple =
  let colorFocused = ["riverctl"; "border-color-focused"; fst tuple] in 
    Util.apply colorFocused;
  let colorUnfocused = ["riverctl"; "border-color-unfocused"; snd tuple] in
    Util.apply colorUnfocused;;

let layoutConfig name =
  let manager = ["riverctl"; "default-layout"; name] in 
    Util.apply manager;;
