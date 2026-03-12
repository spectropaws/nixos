{ ... }:

{
  services = {
    # Enable dbus for desktop applications
    dbus.enable = true;
    
    # Enable udev for hardware detection
    udev.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;


  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support  
}
