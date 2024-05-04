{ pkgs, lib, config, ... }: {
  options = {
    jetbrains.enable = lib.mkEnableOption "jetbrains";
  };

  config = lib.mkIf config.jetbrains.enable {
    # Jetbrains Toolbox doesn't have its own program
    home.packages = with pkgs; [
      jetbrains-toolbox
    ];
  };
}