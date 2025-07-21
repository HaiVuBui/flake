{
  username = "hai";
  gitUser = "haivubui";
  gitEmail = "buivuhai1105@gmail.com";
  host = "MovingCastle";
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

  nixModules = [
    ./modules/hyprland.nix
    # (toString ./modules/nvidia.nix)
    # (toString ./modules/pkgs.nix)
    # (toString ./modules/docker.nix)
    ./modules/nopass.nix
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

  homeModules = [
    # (toString ./my-module.nix)
  ];

}
