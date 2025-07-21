{
  username = "hai";
  gitUser = "haivubui";
  gitEmail = "buivuhai1105@gmail.com";
  host = "MovingCastle";
  /*
    Default password is required for sudo support in systems
    !REMEMBER TO USE passwd TO CHANGE THE PASSWORD!
  */
  defaultPassword = "1105";
  timezone = "Asia/Ho_Chi_Minh";
  locale = "en_CA.UTF-8";

  # hardware config - sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
  hardwareConfig = (toString ./hardware-configuration.nix);

  # List of drivers to install in ./nixos/drivers.nix
  drivers = [
    #"amdgpu"
    "intel"
    # "nvidia"
    # "amdcpu"
    # "intel-old"
  ];

  /*
    These will be imported after the default modules and override/merge any conflicting options
    !Its very possible to break hydenix by overriding options
    eg:
      # lets say hydenix has a default of:
      {
        services.openssh.enable = true;
        environment.systemPackages = [ pkgs.vim ];
      }
      # your module
      {
        services.openssh.enable = false;  #? This wins by default (last definition)
        environment.systemPackages = [ pkgs.git ];  #? This gets merged with hydenix
      }
  */
  # List of nix modules to import in ./nixos/default.nix
  nixModules = [
    # (toString ./modules/nvidia.nix)
    # (toString ./modules/pkgs.nix)
    # (toString ./modules/docker.nix)
    # (toString ./modules/nopass.nix)
    # (toString ./modules/env.nix)
    # (toString ./modules/keyboard.nix)
    # (toString ./modules/power.nix)
    # (toString ./modules/vscode.nix)

    # (toString ./my-module.nix)
    # in my-module.nix you can reference this userConfig
    # ({ userConfig, pkgs, ... }: {
    #   environment.systemPackages = [ pkgs.git ];
    # })
  ];
  # List of nix modules to import in ./lib/mkConfig.nix
  homeModules = [
    # (toString ./my-module.nix)
  ];

}
