# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, ... }: {
  imports = [ 
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../modules/nix/default.nix
  ];

  # Define user account
  users.users.lennox = {
    isNormalUser = true;
    description = "lennox";
    extraGroups = [ 
      "networkmanager"
      "wheel"
      "docker"
      "flatpak"
    ];
  };

  users.defaultUserShell = pkgs.zsh;
  # zsh is installed using home-manager, it will definitely exist
  users.users.root.ignoreShellProgramCheck = true;
  users.users.lennox.ignoreShellProgramCheck = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}
