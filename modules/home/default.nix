{ host, ... }:
# let
#   inherit (import ../../hosts/${host}/variables.nix)
#     alacrittyEnable
#     ghosttyEnable
#     tmuxEnable
#     waybarChoice
#     weztermEnable
#     vscodeEnable
#     helixEnable
#     doomEmacsEnable
#     ;
# in
{
  imports = [
    ./zsh.nix
    ./vscode.nix
    ./git.nix
    ./pixi.nix
    ./applications.nix
    ./stylix.nix
    ./qt.nix
    ./gtk.nix
    ./stylix.nix
  ];
}
