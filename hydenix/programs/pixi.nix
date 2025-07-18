{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (pkgs.buildFHSUserEnv {
      name = "pixi-fhs";
      runScript = "bash";
      targetPkgs = pkgs: with pkgs; [
        pixi
        # Add any other packages you need
      ];
    })
  ];
}
