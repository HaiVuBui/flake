{ userConfig, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    stdenv.cc
    cudatoolkit
    nodejs
    basedpyright
    zlib
    clang-tools
  ];

  environment.variables = {
    LD_LIBRARY_PATH = pkgs.lib.concatStringsSep ":" [
      "${pkgs.stdenv.cc.cc.lib}/lib"
      "${pkgs.cudatoolkit}/lib"
      "${pkgs.zlib}/lib" 
      "/run/opengl-driver/lib"
      "$LD_LIBRARY_PATH"
    ];
  };
}
