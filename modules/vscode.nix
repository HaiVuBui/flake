{pkgs, userConfig, ...}:{
  imports = [
    (fetchTarball {
      url = "https://github.com/nix-community/nixos-vscode-server/tarball/master";
      sha256 = "sha256-DlvJv33ml5UTKgu4b0HauOfFIoDx6QXtbqUF3vWeRCY=";
    })
  ];
  services.vscode-server.enable = true;
}
