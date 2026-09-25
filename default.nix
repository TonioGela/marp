let
  pins = import ./npins;
  pkgs = import pins.nixpkgs-unstable { };
  inherit (pkgs) lib;

  wrangler = pkgs.writeText "wrangler.jsonc" (
    builtins.toJSON {
      name = "marp";
      compatibility_date = "2026-09-25";
      assets = {
        directory = "./public";
      };
      routes = [
        {
          pattern = "marp.toniogela.dev";
          custom_domain = true;
        }
      ];
    }
  );

  headers = pkgs.writeText "_headers" ''
    /*
      Content-Security-Policy: default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' data: https://cdn.jsdelivr.net; font-src 'self'; connect-src 'self'; object-src 'none'; base-uri 'none'; form-action 'none'; frame-ancestors 'self'
      X-Content-Type-Options: nosniff
      Referrer-Policy: strict-origin-when-cross-origin
      X-Frame-Options: SAMEORIGIN
      Permissions-Policy: accelerometer=(), camera=(), geolocation=(), gyroscope=(), microphone=(), payment=(), usb=()
  '';
in
pkgs.stdenvNoCC.mkDerivation {
  name = "marp";
  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.unions [
      ./.marprc.yml
      ./slides.md
      ./images
      ./theme
    ];
  };
  nativeBuildInputs = [ pkgs.marp-cli ];
  buildPhase = "marp --output public/index.html slides.md";
  installPhase = ''
    mkdir -p $out
    cp -r public $out/public
    cp -r images $out/public/images
    cp ${headers} $out/public/_headers
    cp ${wrangler} $out/wrangler.jsonc
  '';
}
