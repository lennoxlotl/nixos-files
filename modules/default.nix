{lib, ... }: {
  imports = [
    ./nix/host
    ./nix/games
    ./nix/packages
    ./nix/gnome
    ./nix/vesktop
    ./nix/flatpak
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
  };

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # Enable additional services and virtualization components
  virtualisation.docker.enable = true;
}