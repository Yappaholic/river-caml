open Config
let defSuper = "Super";;
let shiftSuper = "Super+Shift";;

let wideriverConfig = "wideriver \
    --layout left \
    --layout-alt monocle \
    --stack dwindle \
    --count-master 1 \
    --ratio-master 0.50 \
    --count-wide-left 0 \
    --ratio-wide 0.35 \
    --smart-gaps \
    --inner-gaps 4 \
    --outer-gaps 4 \
    --border-width 2 \
    --border-width-monocle 0 \
    --border-width-smart-gaps 1 \
    --border-color-focused 0x93a1a1 \
    --border-color-focused-monocle 0x586e75 \
    --border-color-unfocused 0x586e75 \
    --log-threshold info";;

let normalKeybinds =
  [("C", ["close"]);
   ("Q", ["spawn"; "alacritty"]);
   ("B", ["spawn"; "qutebrowser"]);
   ("R", ["spawn"; "bemenu-run"]);
   ("J", ["focus-view"; "next"]);
   ("K", ["focus-view"; "previous"])] in
Keybinds.mapKeys defSuper normalKeybinds;

let shiftKeybinds = 
  [("E", ["exit"]);
   ("J", ["swap"; "next"]);
   ("K", ["swap"; "previous"])] in
Keybinds.mapKeys shiftSuper shiftKeybinds;

let mouseKeybinds =
  [("BTN_LEFT", ["move-view"]);
   ("BTN_RIGHT", ["resize-view"])] in
Keybinds.mouseMap defSuper mouseKeybinds;

Keybinds.setTags defSuper shiftSuper;
Keybinds.repeatRate (50,300);

Decorations.borderColor ("0x002b36", "0x93a1a1");
Decorations.layoutConfig "wideriver";

let autostart =
   ["pipewire";
    "i3bar-river";
    "swww-daemon";
    "swww img ~/Downloads/kanagawa-inverted-darker.jpg";
    wideriverConfig] in
List.iter (fun x -> Util.apply @@ ["riverctl"; "spawn"] @ [x]) autostart;

Util.apply ["riverctl"; "keyboard-layout"; "-options"; 
            "ctrl:nocaps,grp:ctrl_space_toggle"; "us,ru"];
Util.apply ["riverctl"; "focus-follows-cursor"; "always"];


