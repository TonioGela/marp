let
  pins = import ./npins;
  pkgs = import pins.nixpkgs-unstable { };
  inherit (pkgs) lib;

  commands = {
    build = {
      description = "builds the presentation";
      runtimeInputs = [ pkgs.marp-cli ];
      text = "marp slides.md";
    };
    preview = {
      description = "builds, watches for changes and opens a live preview window";
      runtimeInputs = [ pkgs.marp-cli ];
      text = "marp --preview slides.md";
    };
    pdf = {
      description = "builds the presentation as pdf (requires Chrome or Edge)";
      runtimeInputs = [ pkgs.marp-cli ];
      text = "marp --pdf -- slides.md";
    };
    theme = {
      description = "builds the theme from scss (useful if scss gets changed)";
      runtimeInputs = [ pkgs.dart-sass ];
      text = "sass --no-source-map theme/toniogela.scss:theme/toniogela.css";
    };
    clean = {
      description = "removes temp build files";
      text = "rm -f slides.html index.html";
    };
    bundle = {
      description = "creates a single self-contained easy-to-deploy index.html file";
      runtimeInputs = [
        pkgs.marp-cli
        pkgs.monolith
      ];
      text = ''
        marp slides.md
        monolith slides.html --quiet --output index.html
      '';
    };
  };
in
pkgs.mkShellNoCC {
  packages = [
    pkgs.marp-cli
    pkgs.dart-sass
    pkgs.monolith
  ]
  ++ lib.mapAttrsToList (
    name: cmd:
    pkgs.writeShellApplication {
      inherit name;
      inherit (cmd) text;
      runtimeInputs = cmd.runtimeInputs or [ ];
      meta.description = cmd.description;
    }
  ) commands;

  shellHook = lib.concatLines (
    [ "echo 'Available commands:'" ]
    ++ lib.mapAttrsToList (name: cmd: "echo '  ${name} - ${cmd.description}'") commands
  );
}
