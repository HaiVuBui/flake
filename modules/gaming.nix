{ pkgs, ... }:

{
  # ===== Gaming Dependencies =====
  # This module provides the necessary libraries and packages for running games
  # through Wine/Proton on NixOS, especially for platforms like Lutris and Steam.

  # Essential packages for Wine, Vulkan, and DirectX translation.
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable  # Provides both 64-bit and 32-bit Wine
    winetricks              # Script to install various redistributable runtime libraries
    vulkan-tools            # Official Vulkan utilities and demos
    dxvk                    # Vulkan-based translation layer for Direct3D 9/10/11
    vkd3d                   # Vulkan-based translation layer for Direct3D 12
  ];

  # Enable 32-bit graphics driver support, which is crucial for many games.
  # hardware.graphics = {
  #   enable = true;
  #   driSupport32Bit = true;
  # };
}
