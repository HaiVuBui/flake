{pkgs, userConfig, ...}:
{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
}

