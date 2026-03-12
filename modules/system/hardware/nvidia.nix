{ config, ... }:

{
  # hardware.nvidia.prime.offload.enable = true;
  # Optionally generate the offload wrapper:
  # hardware.nvidia.prime.enableOffloadCmd = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    nvidiaSettings = true;
    modesetting.enable = true;
    powerManagement.enable = false; 
    powerManagement.finegrained = false;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  # boot.blacklistKernelModules = [ "nouveau" ];
}
