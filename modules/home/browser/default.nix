{ pkgs, lib, config, ... }: {
  options = {
    browser.enable = lib.mkEnableOption "browser";
  };

  config = lib.mkIf config.browser.enable {
    programs.chromium = {
      enable = true;
      extensions = [
        # 7TV - Nightly
        {
          id = "fphegifdehlodcepfkgofelcenelpedj";
        }
        # ProtonPass
        {
          id = "ghmbeldphafepmbegfdlkpapadhbakde";
        }
        # Return Youtube Dislike
        {
          id = "gebbhagfogifgggkldgodflihgfeippi";
        }
        # uBlock Origin
        {
          id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
        }
        # SponsorBlock
        {
          id = "mnjggcdmjocbbbhaepdhchncahnbgone";
        }
      ];
      commandLineArgs = [
        "--enable-features=UseOzonePlatform,VaapiVideoEncoder,VaapiVideoDecoder"
        "--ozone-platform=wayland"
      ];
    };
  };
}