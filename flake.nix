{
  inputs = {
    # NixOS official package source, here using the nixos-25.05 branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, nixpkgs, home-manager, ...}:
  let
      system = "x86_64-linux";
      userConfig = import ./config.nix;
  in
  {
    nixosConfigurations.MovingCastle = nixpkgs.lib.nixosSystem {
    inherit
      system
      ;
    specialArgs = {
    inherit 
      nixpkgs
      userConfig
      ;
  };
      modules = [
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.${userConfig.username} = import ./hydenix/default.nix;
          home-manager.extraSpecialArgs = {
            inherit userConfig;
            inherit inputs;
      };
        }
      ];
    };
  };
}
