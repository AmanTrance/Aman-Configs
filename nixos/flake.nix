{
  description = "Nixos config flake";

  inputs = {
    nixpkgs = {
	url = "github:nixos/nixpkgs/nixos-24.11";
    };	

    home-manager = {
    	url = "github:nix-community/home-manager/release-24.11";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      
      modules = [
        ./nixos/configuration.nix
      ];
    };
	
    homeConfigurations.amanfreecs = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}
