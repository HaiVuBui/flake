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
}
