{ config, lib, pkgs, ... }:
{

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nVidia Driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphic corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.fingegrained = false;

    # Use nVidia open source kernel module (different from "nouveau" open source driver).
    # Support is limited to Turing and later archs. Full list on nVidia's Github.
    # Currently buggy. Recommended to keep off.
    open = false;

    # Enable the nVidia settings menu,
    # accessible via 'nvidia-settings'
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    # Other options: beta, production(installs 550), vulkan_beta, legacy_xxx (470, 390, 340)
  };
  
}
