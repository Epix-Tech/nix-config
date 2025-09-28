# NixOS Mini PC Headless Config (david)

## Usage

1. **Install NixOS** on your mini PC (minimal install, with UEFI or legacy boot).
2. **Clone this repo**:
   ```sh
   git clone https://github.com/Epix-Tech/nix-config.git
   ```
3. **Switch to your config**:
   ```sh
   sudo nixos-rebuild switch --flake .#mini-pc
   ```
4. **SSH in from another machine**:
   ```sh
   ssh david@mini-pc
   ```

## Features

- Tailscale VPN (Headscale-ready)
- Modern terminal tools: starship, bat, fd, ripgrep, exa, htop, ncdu, bottom, duf, zoxide, git, btop, curl, wget
- SSH only, no monitor needed
- Ready for remote headless management

## Change Password

Replace the hashed password in `configuration.nix` with your own for security. You can generate a hash with:
```sh
mkpasswd -m sha-512
```
Copy the output and add as `hashedPassword` in your user config.
