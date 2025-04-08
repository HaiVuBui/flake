{pkgs, userConfig,...}:{

  # Enable TLP service
  services.tlp = {
    enable = true;
    settings = {
      # Force battery mode even when plugged in (for maximum power saving)
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = 0;

      # CPU settings for low power
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "power";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 50;
      CPU_BOOST_ON_AC = 0;
      CPU_BOOST_ON_BAT = 0;
      CPU_HWP_ON_AC = "power";
      CPU_HWP_ON_BAT = "power";

      # Disk power management
      DISK_IDLE_SECS_ON_AC = 2;
      DISK_IDLE_SECS_ON_BAT = 1;
      MAX_LOST_WORK_SECS_ON_AC = 15;
      MAX_LOST_WORK_SECS_ON_BAT = 60;
      DISK_APM_LEVEL_ON_AC = "1";
      DISK_APM_LEVEL_ON_BAT = "1";
      SATA_LINKPWR_ON_AC = "min_power";
      SATA_LINKPWR_ON_BAT = "min_power";

      # Runtime power management
      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "on";

      # USB power saving
      USB_AUTOSUSPEND = 1;
      USB_BLACKLIST_WWAN = 0;
      USB_EXCLUDE_AUDIO = 0;

      # Wi-Fi and Bluetooth power saving
      WIFI_PWR_ON_AC = 5;
      WIFI_PWR_ON_BAT = 5;
      DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth wifi wwan";

      # Sound power saving
      SOUND_POWER_SAVE_ON_AC = 1;
      SOUND_POWER_SAVE_ON_BAT = 1;
      SOUND_POWER_SAVE_CONTROLLER = "Y";

      # PCIe and graphics power management
      #RUNTIME_PM_DRIVER_BLACKLIST = "amdgpu radeon nouveau nvidia";
      PCIE_ASPM_ON_AC = "powersave";
      PCIE_ASPM_ON_BAT = "powersave";
      RADEON_DPM_PERF_LEVEL_ON_AC = "low";
      RADEON_DPM_PERF_LEVEL_ON_BAT = "low";
      INTEL_GPU_FREQ_MIN_ON_AC = 100;
      INTEL_GPU_FREQ_MAX_ON_AC = 400;
      INTEL_GPU_FREQ_MIN_ON_BAT = 100;
      INTEL_GPU_FREQ_MAX_ON_BAT = 300;

      # Battery charging thresholds (if supported)
      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 60;
    };
  };
}
