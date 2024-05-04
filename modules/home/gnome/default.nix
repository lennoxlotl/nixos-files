{ pkgs, lib, config, ... }: {
  options = {
    gnome.enable = lib.mkEnableOption "gnome";
  };
  
  config = lib.mkIf config.gnome.enable {
    # Install legacy gnome theme
    home.packages = with pkgs; [
      adw-gtk3
    ];

    home.file.".background".source = ./wallpaper.jpg;
    home.file.".background-light".source = ./wallpaper-light.jpg;

    # Apply legacy and dark theme
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          gtk-theme = "adw-gtk3-dark";
        };
        "org/gnome/desktop/background" = {
          picture-uri = "/home/lennox/.background-light";
          picture-uri-dark = "/home/lennox/.background";
        };
      };
    };
  };
}