{ pkgs, lib, config, ... }: {
  options = {
    vscode.enable = lib.mkEnableOption "vscode";
  };

  config = lib.mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        jnoortheen.nix-ide
        k--kato.intellij-idea-keybindings
        vue.volar
        esbenp.prettier-vscode
        bradlc.vscode-tailwindcss
        rust-lang.rust-analyzer
      ];
    };
  };
}