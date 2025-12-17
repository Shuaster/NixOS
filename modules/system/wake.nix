{ config, pkgs, ... }:

{
  services.udev.extraRules = ''
    # Disable PCIe Root Port Wake
    ACTION=="add", SUBSYSTEM=="pci", ATTR{power/wakeup}="disabled"
  '';
}