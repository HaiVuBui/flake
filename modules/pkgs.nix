{pkgs, userConfig, ...}:
{

	environment.systemPackages = [
	pkgs.brave
	pkgs.htop
	pkgs.fastfetch
	pkgs.docker
	pkgs.gcc13
	pkgs.yazi
	pkgs.youtube-music
	pkgs.cava
	pkgs.tty-clock
	pkgs.cmatrix
	pkgs.tmux
	pkgs.jetbrains.pycharm-professional
		#pkgs.cudaPackages_11_8.cudatoolkit
	#pkgs.bleachbit
	#pkgs.python312 
	#pkgs.python312Packages.pytorch 
	pkgs.cudatoolkit

	];


	fonts.packages = with pkgs; [
	nerd-fonts.fira-code
	nerd-fonts.symbols-only
];
}
