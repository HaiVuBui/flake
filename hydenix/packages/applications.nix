{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --------------------------------------------------- // Applications
    firefox # browser
    kitty # terminal
    kdePackages.dolphin # kde file manager
    ark # kde file archiver
    vim # terminal text editor
    
    discord # chat client
    webcord # discord client
    vesktop # discord client
    htop 
    yazi
    tty-clock
    cmatrix
    tmux
    code-cursor
    obsidian
    #jetbrains.pycharm-professional
    #jetbrains.clion
    sublime4
  ];
}
