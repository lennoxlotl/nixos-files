{
  description = "lennox application flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
     self,
     nixpkgs,
     ... 
  } @ inputs: let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    inherit (self) outputs;
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs outputs;};
      modules = [ 
        inputs.home-manager.nixosModules.home-manager
        ./host/configuration.nix 
        # TODO: Remove this from here
        {
          home-manager = {
            extraSpecialArgs = {inherit inputs;};
            useGlobalPkgs = true;
            users.lennox = import ./modules/home/default.nix;
          };
        }
      ];
    };
  };
}
