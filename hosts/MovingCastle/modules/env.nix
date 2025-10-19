{ userConfig, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Cudas
    # cudatoolkit

    # nix lsp
    nixd

    #nvim
    tree-sitter

    # Java/JS
    nodejs

    #Python
    basedpyright

    # C/Cpp
    stdenv.cc
    clang-tools
    zlib
    python310

    # Haskell
    cabal-install
    ormolu
    haskell-language-server
    ghc

    #Nvim
    ripgrep
    rsync

    # latex
    texlab
    texliveFull
  ];
    xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
  };

  environment.variables = 
  {
    LD_LIBRARY_PATH = pkgs.lib.concatStringsSep ":" [
      "${pkgs.stdenv.cc.cc.lib}/lib"
      # "${pkgs.cudatoolkit}/lib"
      "${pkgs.zlib}/lib" 
      # "/run/opengl-driver/lib"
      "$LD_LIBRARY_PATH"
    ];
    XDG_PICTURES_DIR = "$HOME/randomShits/Pictures";
    MOZ_ENABLE_WAYLAND = "1";
  };
}
