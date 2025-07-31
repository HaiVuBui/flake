{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --------------------------------------------------- // Applications
    firefox # browser
    kitty # terminal
    kdePackages.dolphin # kde file manager
    vim # terminal text editor
    vscode
    gemini-cli    
    htop 
    yazi
    tty-clock
    cmatrix
    tmux
    code-cursor
    obsidian
    sublime4
  ];
}
