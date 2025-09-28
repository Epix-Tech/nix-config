{ config, lib, pkgs, ... }:
{
  # Example hardware configuration
  boot.loader.grub.device = "/dev/sda"; # Change this if your disk is different
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };
  swapDevices = [
    { device = "/dev/sda2"; }
  ];
}
