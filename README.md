# Another day, another River config in FP language!

This is a small example on how to configure River Window Manager
with Ocaml. Some features are not implemented because I don't need them,
so if you feel that something's missing, feel free to fork it and
maybe even send a PR :)

## Installing

### Cloning the repository

```bash
git clone https://github.com/yappaholic/river-caml
cd river-caml
```

### Configuration

To setup the config, check `bin/main.ml` file.
If you find yourself struggling, check associated library files
in `lib` directory.

For example:
```ocaml
(*This is a function in main.ml*)
Keybinds.mapKeys x y;;

(*To check the function definition,
  go to lib/Keybinds.ml or hover with LSP enabled*)
```
### Dependencies
* Ocaml
* Opam
* Dune
* Spawn (opam package)

### To build and install

Before installing, make sure to backup init file you use for River.
Then, in the build directory, run:

```bash
dune build
./install
```

`./install` is a bash script that tells dune to install init file
at `$HOME/.config/river/`. You can change directory path if needed.
