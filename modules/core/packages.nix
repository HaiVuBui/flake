{
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    firefox.enable = false; # Firefox is not installed by default
    niri = {
      enable = true; # set this so desktop file is created
    };
    # dconf.enable = true;
    # seahorse.enable = true;
    # fuse.userAllowOther = true;
    # mtr.enable = true;
    # adb.enable = true;
    # hyprlock.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    #essentials
    cliphist #clipboard history
    wl-clipboard #clipboard 
  ];
}

