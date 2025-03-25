{pkgs, userConfig, ...}:{
	virtualisation.docker.enable = true;
  	virtualisation.docker.enableOnBoot = true;
  	users.users.hai.extraGroups = [ "docker" ];
}
