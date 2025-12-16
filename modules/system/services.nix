{ ... }:

{
  services = {
    # Enable dbus for desktop applications
    dbus.enable = true;
    
    # Enable udev for hardware detection
    udev.enable = true;
  };
}
