{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    fd
    ripgrep
    exa
    htop
    ncdu
    bottom
    duf
    zoxide
    git
    btop
    curl
    wget
  ];
}
