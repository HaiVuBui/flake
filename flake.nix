{
  inputs = {
    # NixOS official package source, here using the nixos-25.05 branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = inputs@{self, nixpkgs, ...}:
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
      ];
    };
  };
}
