{pkgs, ...}: {
  home.packages = with pkgs; [
    # web browsers
    firefox
    brave

    #terminals
    kitty


    #shell
    tmux #window multiplier
    eza # file lister for zsh
    oh-my-zsh # plugin manager for zsh
    zsh-powerlevel10k # theme for zsh
    starship # customizable shell prompt
    fastfetch # system information fetch tool
    git # distributed version control system
    fzf # command line fuzzy finder
    yazi # cli files manager
    htop # monitors tool

    # UI tools
    waybar
    tofi
    rofi-wayland
    hyprlock
    swww
    wlogout
    udiskie
    xwayland-satellite
    kdePackages.dolphin
  ];
}


