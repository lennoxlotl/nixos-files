{ pkgs, lib, ... }:
let
  pname = "labymodlauncher";
  version = "2.1.2";
  
  src = pkgs.fetchurl {
    url = "https://releases.r2.labymod.net/launcher/linux/x64/LabyMod%20Launcher-2.1.2.AppImage";
    sha256 = "sha256-Tsv2I02cjB1R99ay1Jb75XJRISpZ0kRZgxkP5sHUtJw=";
  };

  appimageContents = pkgs.appimageTools.extractType2 {
    name = "${pname}-${version}";
    inherit src;
  };
in
  pkgs.appimageTools.wrapType2 rec {
    inherit pname version src;
    name = "${pname}-${version}";

    extraPkgs = _: [ pkgs.libsecret ];

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications/${pname}.desktop
      for i in 16 32 48 64 128 256; do
        install -D ${appimageContents}/usr/share/icons/hicolor/''${i}x$i/apps/${pname}.png \
          $out/share/icons/hicolor/''${i}x$i/apps/${pname}.png
      done
      # The launcher does support wayland, it just doesn't activate it :(
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=labymodlauncher' 'Exec=labymodlauncher --ozone-platform=wayland --enable-features=WaylandWindowDecorations'
    '';
    
    meta = with lib; {
      description = "The launcher to start LabyMod";
      homepage = "https://labymod.net";
      maintainers = [];
      platforms = [ "x86_64-linux" ];
    }; 
  }