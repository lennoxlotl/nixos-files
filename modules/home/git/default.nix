{ pkgs, lib, config, ... }: {
  options = {
    git.enable = lib.mkEnableOption "git";
  };

  config = lib.mkIf config.git.enable {
    # Enable git
    programs.git = {
      enable = true;
      userName = "lennoxlotl";
      userEmail = "le.schneider@protonmail.com";
    };

    # Enable lazygit (git tui)
    programs.lazygit = {
      enable = true;
    };
  };
}