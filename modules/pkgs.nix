{pkgs, userConfig, ...}:
{

	environment.systemPackages = [
	pkgs.bleachbit
	pkgs.cudatoolkit
	pkgs.tldr
	pkgs.openvpn
	pkgs.nodejs
	pkgs.sublime4
	pkgs.wmctrl
	pkgs.sshfs
	pkgs.basedpyright
	];


	fonts.packages = with pkgs; [
	nerd-fonts.fira-code
	nerd-fonts.symbols-only
	];

}
