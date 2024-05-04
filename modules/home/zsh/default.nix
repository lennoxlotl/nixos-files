{ pkgs, lib, config, ... }: {
  options = {
    zsh.enable = lib.mkEnableOption "zsh";
  };

  config = lib.mkIf config.zsh.enable {
    home.packages = with pkgs; [
      krabby
    ];

    programs.zsh = {
      enable = true;

      shellAliases = {
        # Very illegal I know but can't do this otherwise
        mars = "/home/lennox/.mars/bin/mars";
      };

      # Install oh-my-zsh including plugins
      oh-my-zsh = {
        enable = true;
      };

      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.7.0";
            sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
          };
        }
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "0.8.0";
            sha256 = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
          };
        }
      ];
      
      # Append any required commands to .zshrc
      initExtraFirst = ''
        krabby random --no-title
      '';
    };

    programs.starship = {
      enable = true;
      settings = {
        format = lib.concatStrings [
          "$username[@](blue bold)"
          "$hostname"
          " [»](gray bold) "
        ];
        right_format = lib.concatStrings [
          "$directory"
          "$all"
        ];
        directory = {
          truncation_length = 1000;
          truncate_to_repo = false;
        };
        hostname = {
          ssh_only = false;
          style = lib.concatMapStrings (x: x + " ") [
            "blue"
            "bold"
          ];
          format = "[$ssh_symbol$hostname]($style)";
        };
        username = {
          show_always = true;
          style_user = lib.concatMapStrings (x: x + " ") [
            "blue"
            "bold"
          ];
          format = "[$user]($style)";
        };
        character = {
          format = "";
        };
      };
    };
  };
}