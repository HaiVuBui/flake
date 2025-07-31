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
     ../modules/packages/default.nix
     (import ../modules/programs/default.nix { inherit pkgs userConfig; })
  ] ++ userConfig.homeModules;

}
