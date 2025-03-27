{
  userConfig,
  ...
}:

{

  imports = [
    ../hydenix
  ];

  hydenix = {
    enable = userConfig.hyde.enable or true;
    themes =
      userConfig.hyde.themes or [
       "Gruvbox Retro"
      ];
    activeTheme = userConfig.hyde.activeTheme or "Gruvbox Retro";
  };

  # Don't change this
  home.stateVersion = "24.11";
}
