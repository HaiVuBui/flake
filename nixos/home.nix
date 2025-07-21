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
  programs.home-manager.enable = true;

  # ===== Packages =====
  home.packages = with pkgs; [
    # Hyprland
    hyprland
    
    # Terminal
    kitty

    # App Launcher
    wofi
  ];

  # imports
  imports = [
    # ./hm/mutable
    # ../hydenix/packages/default.nix
    (import ../hydenix/programs/default.nix { inherit pkgs userConfig; })
    # ./sources
  ];

  # ===== Hyprland =====
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      monitor = ",preferred,auto,1";
      
      exec-once = [
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      ];
      
      input = {
        kb_layout = "us";
      };
      
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };
      
      decoration = {
        rounding = 10;
      };
      
      "$mainMod" = "SUPER";
      
      bind = [
        "$mainMod, Q, exec, kitty"
        "$mainMod, M, exit,"
        "$mainMod, R, exec, wofi --show drun"
      ];
    };
  };

  # ===== Kitty =====
  programs.kitty = {
    enable = true;
  };

  # ===== Git =====
  programs.git = {
    enable = true;
    userName = userConfig.gitUser;
    userEmail = userConfig.gitEmail;
  };
}
