{ config, lib, inputs, ...}: {
  imports = [
    ./git
    ./games
    ./vscode
    ./multimedia
    ./browser
    ./gnome
    ./zsh
    ./jetbrains
    ./labymod
  ];
  
  # Configure home-manager
  home = {
    username = "lennox";
    homeDirectory = "/home/lennox";
    stateVersion = "23.11";
    
  };
  programs.home-manager.enable = true;

  # Enable modules
  git.enable = true;
  games.enable = true;
  vscode.enable = true;
  multimedia.enable = true;
  browser.enable = true;
  gnome.enable = true;
  zsh.enable = true;
  jetbrains.enable = true;
  labymod.enable = true;
}