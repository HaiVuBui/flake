{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          asvetliakov.vscode-neovim
          ms-python.python
          catppuccin.catppuccin-vsc
          ms-toolsai.jupyter
          # sainnhe.gruvbox-material-vscode
        ];
      };
    };
  };
}
