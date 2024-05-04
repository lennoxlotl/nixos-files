{ config, lib, inputs, ...}: {
  imports = [
    ./home/git
    ./home/games
    ./home/vscode
    ./home/multimedia
    ./home/browser
    ./home/jetbrains
    ./home/gnome
    ./home/zsh
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
  jetbrains.enable = true;
  gnome.enable = true;
  zsh.enable = true;
}