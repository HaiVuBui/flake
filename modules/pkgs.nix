{pkgs, userConfig, ...}:
{

	environment.systemPackages = [
	pkgs.bleachbit
	pkgs.tldr
	pkgs.openvpn
	pkgs.wmctrl
	pkgs.sshfs
	];


	fonts.packages = with pkgs; [
	nerd-fonts.fira-code
	nerd-fonts.symbols-only
	];

  i18n.inputMethod = {
    type = "ibus";
    enable = true;
    ibus.engines = with pkgs.ibus-engines; [
      bamboo
    ];
  };


}
