{pkgs, userConfig, ...}:
{

	environment.systemPackages = [
	pkgs.brave
	pkgs.librewolf
	pkgs.htop
	pkgs.fastfetch
	pkgs.docker
	pkgs.yazi
	pkgs.youtube-music
	pkgs.cava
	pkgs.tty-clock
	pkgs.cmatrix
	pkgs.tmux
	pkgs.jetbrains.pycharm-professional
	];


	fonts.packages = with pkgs; [
	nerd-fonts.fira-code
	nerd-fonts.symbols-only
];
}
