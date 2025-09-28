{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ starship ];
  programs.starship.enable = true;
}
