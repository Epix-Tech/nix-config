{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "mini-pc";
  networking.firewall.allowedTCPPorts = [ 22 ];
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false; # Only SSH keys

  users.users.david = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    # hashedPassword = "YOUR_HASH_HERE"; # Optional: generate with mkpasswd -m sha-512
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.journald.extraConfig = "Storage=persistent";

  environment.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake .#mini-pc";
  };
  programs.zsh.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake .#mini-pc";
  };
}
