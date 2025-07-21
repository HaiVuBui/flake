{ userConfig, pkgs, ... }:
{
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = [ "hai" ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
