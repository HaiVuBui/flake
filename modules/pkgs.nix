{pkgs, userConfig, ...}:
{

	environment.systemPackages = [
	pkgs.bleachbit
	pkgs.tldr
	pkgs.openvpn
	pkgs.wmctrl
	pkgs.sshfs
	pkgs.tmux
	pkgs.nvim
	pkgs.kitty
	];


	fonts.packages = with pkgs; [
	nerd-fonts.fira-code
	nerd-fonts.symbols-only
	];

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      bamboo
    ];
  };


}
