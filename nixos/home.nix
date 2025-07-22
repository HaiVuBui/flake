{
  pkgs,
  userConfig,
  ...
}:
{
  # ===== Home Manager =====
  home.username = userConfig.username;
  home.homeDirectory = "/home/${userConfig.username}";
  home.stateVersion = "25.05";

  # imports
  imports = [
    # ./hm/mutable
    ../hm/packages/default.nix
    (import ../hm/programs/default.nix { inherit pkgs userConfig; })
  ];

    services = {
      blueman-applet.enable = true;
    };

    fonts.fontconfig.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
        libsForQt5.xdg-desktop-portal-kde
      ];
      config.common.default = "*";
      xdgOpenUsePortal = true;
    };
}
