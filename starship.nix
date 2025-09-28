{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ starship ];

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
