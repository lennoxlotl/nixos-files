{ config, pkgs, ... }: {
  # Steam has to be installed through normal nix program (home-manager doesnt support it) 
  # (this also ensures the proper drivers are installed)
  programs.steam = {
    enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];
  };

  programs.gamemode.enable = true;
}