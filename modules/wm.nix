{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    # xwayland.enable = true;
  };

  programs.dconf.enable = true;
}
