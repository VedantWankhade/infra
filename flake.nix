{
    description = "My NixOS";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

        home-manager = {
                url = "github:nix-community/home-manager/release-26.05";
          inputs.nixpkgs.follows = "nixpkgs";
              };

        zen-browser = {
                url = "github:youwen5/zen-browser-flake";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        sops-nix = {
            url = "github:Mic92/sops-nix";
            inputs.nixpkgs.follows = "nixpkgs";
          };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
      nixosConfigurations.hp15 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          };
        modules = [
            ./hosts/hp15/configuration.nix

            inputs.sops-nix.nixosModules.sops  

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              
	      home-manager.extraSpecialArgs = {
                inherit inputs;
                
              };
          home-manager.backupFileExtension = "backup";


              home-manager.sharedModules = [ inputs.sops-nix.homeManagerModules.sops ];

              home-manager.users.vedant = import ./home/home.nix; 
            }
        ];
      };
    };
}
