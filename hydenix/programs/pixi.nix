{ pkgs, ... }:
{
home.packages = with pkgs; [
  (pkgs.buildFHSUserEnv {
    name = "pixi";
    runScript = "pixi";
    targetPkgs = pkgs: with pkgs; [
      pixi
    ];
  })
];
}
