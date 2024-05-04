{ pkgs, lib, config, ... }: {
  options = {
    multimedia.enable = lib.mkEnableOption "multimedia";
  };

  config = lib.mkIf config.multimedia.enable {
    # Spotify doesn't have its own program
    home.packages = with pkgs; [
      spotify
    ];

    programs.obs-studio.enable = true;
  };
}