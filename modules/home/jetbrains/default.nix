{ pkgs, lib, config, ... }: {
  options = {
    jetbrains.enable = lib.mkEnableOption "jetbrains";
  };

  config = lib.mkIf config.jetbrains.enable {
    home.packages = with pkgs; [
      jetbrains.clion
      jetbrains.datagrip
      jetbrains.idea-ultimate
    ]; 
  };
}