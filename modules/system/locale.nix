{ config, ... }:

{
  # Set Time Zone Dynamically
  services.automatic-timezoned.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";
}