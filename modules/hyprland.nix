{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  hardware.graphics = {
    enable = true;
  };

  programs.dconf.enable = true;
}
