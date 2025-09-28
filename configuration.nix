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

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };

      directory = {
        style = "cyan bold";
      };

      git_branch = {
        symbol = "🌈 ";
        style = "bold purple";
      };

      git_status = {
        style = "bold yellow";
        ahead = "[⇡](bright-green)";
        behind = "[⇣](bright-red)";
        diverged = "[⇕](bright-purple)";
        conflicted = "[✖](bright-red)";
        untracked = "[?](bright-yellow)";
        stashed = "[💰](bright-blue)";
        modified = "[!](bright-magenta)";
        staged = "[+](bright-green)";
        renamed = "[»](bright-cyan)";
        deleted = "[✘](bright-red)";
      };

      hostname = {
        ssh_only = false;
        style = "bright-blue bold";
      };

      username = {
        style_root = "bold red";
        style_user = "bold green";
        show_always = true;
      };

      time = {
        disabled = false;
        format = "[$time]($style) ";
        style = "bright-white bold";
      };

      cmd_duration = {
        style = "bright-yellow";
      };

      package = {
        style = "bold bright-cyan";
      };
    };
  };
}
