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
      # withUWSM = false;
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
    # web browsers
    firefox

    #terminals
    kitty

    #essentials
    cliphist
    wl-clipboard

    #shell
    tmux 
    eza # file lister for zsh
    oh-my-zsh # plugin manager for zsh
    zsh-powerlevel10k # theme for zsh
    starship # customizable shell prompt
    fastfetch # system information fetch tool
    git # distributed version control system
    fzf # command line fuzzy finder
    # comma # package runner

    # UI tools
    waybar
    tofi
    rofi-wayland
    hyprlock
    swww
    wlogout
  ];
}

