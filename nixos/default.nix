{
  commonArgs,
}:
let
  inherit (commonArgs)
    system
    userConfig
    inputs
    userPkgs
    ;
in
inputs.hydenix-nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit userConfig inputs userPkgs;
  };
  modules = [
    {
      nixpkgs.pkgs = commonArgs.pkgs;
    }
    ./configuration.nix
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = false;
      home-manager.useUserPackages = true;
      home-manager.users.${userConfig.username} =
        { ... }:
        {
          imports = [
            ./home.nix
            inputs.nix-index-database.hmModules.nix-index
          ] ++ userConfig.homeModules;
          nixpkgs.config = {
            allowUnfree = true;
            permittedInsecurePackages = [
              "openssl-1.1.1w"
            ];
          };
        };
      home-manager.extraSpecialArgs = {
        inherit userConfig;
        inherit inputs;
      };
    }
  ] ++ userConfig.nixModules;
}
