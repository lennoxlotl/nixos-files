{ config, lib, pkgs, ... }: {
  options = {
    games.enable = lib.mkEnableOption "games";
  };

  config = lib.mkIf config.games.enable {
    home.packages = with pkgs; [
      lutris
      winetricks
    ];

    # Enable mangohud (performance display)
    programs.mangohud.enable = true;
  };
}