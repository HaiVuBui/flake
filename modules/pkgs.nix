{pkgs, userConfig, ...}:
{

	environment.systemPackages = [
	pkgs.brave
	pkgs.librewolf
	pkgs.htop
	pkgs.fastfetch
	pkgs.gcc13
	pkgs.yazi
	pkgs.youtube-music
	pkgs.cava
	pkgs.tty-clock
	pkgs.cmatrix
	pkgs.tmux
	pkgs.jetbrains.pycharm-professional
	pkgs.jetbrains.clion
	#pkgs.cudaPackages_11_8.cudatoolkit
	pkgs.bleachbit
	pkgs.cudatoolkit
	pkgs.obsidian
	pkgs.tldr
	pkgs.openvpn
	pkgs.tor-browser
	pkgs.nodejs
	pkgs.code-cursor
	pkgs.hyprlock
	];


	fonts.packages = with pkgs; [
	nerd-fonts.fira-code
	nerd-fonts.symbols-only
	];

	services.power-profiles-daemon.enable = true;

	#services.tor = {
	#enable = true;
	#client.enable = true;
	#};

}
