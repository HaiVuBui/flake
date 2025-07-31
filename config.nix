{
  username = "hai";
  gitUser = "haivubui";
  gitEmail = "buivuhai1105@gmail.com";
  host = "MovingCastle";
  defaultPassword = "1105";
  timezone = "Asia/Ho_Chi_Minh";
  locale = "en_CA.UTF-8";

  # hardware config - sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
  hardwareConfig = ./hardware-configuration.nix;

  # List of drivers to install in ./nixos/drivers.nix
  drivers = [
    #"amdgpu"
    # "intel"
    # "nvidia"
    # "amdcpu"
    "intel-old"
  ];

  nixModules = [
    # ./modules/nvidia.nix
    ./modules/nixModules/hyprland.nix
    ./modules/nixModules/pkgs.nix
    ./modules/nixModules/docker.nix
    ./modules/nixModules/nopass.nix
    ./modules/nixModules/env.nix
    ./modules/nixModules/keyboard.nix
    ./modules/nixModules/power.nix
    # ./modules/vscode.nix

  ];

  homeModules = [
  ];

}
