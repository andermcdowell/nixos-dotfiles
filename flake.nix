{
	description = "Niri NixOS";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
        noctalia = {
            url = "github:noctalia-dev/noctalia-shell";
            inputs.nixpkgs.follows = "nixpkgs";
        };
	};


	outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
		nixosConfigurations.nixBox = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
            specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager {
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.milk = import ./home.nix;
						backupFileExtension = "backup";
					};
				}
                ./noctalia.nix
			];
		};
	};
}
