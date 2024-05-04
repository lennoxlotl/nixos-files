{ pkgs, lib, config, ... }: {
  options = {
    labymod.enable = lib.mkEnableOption "labymod";
  };

  config = lib.mkIf config.jetbrains.enable {
    home.packages = with pkgs; [
      (pkgs.callPackage ../../nix/labymod/default.nix {})
    ]; 
  };
}