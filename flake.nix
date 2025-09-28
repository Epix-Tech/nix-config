{
  description = "Headless NixOS config for mini PC (david) with tailscale, headscale, and modern terminal tools";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        nixosConfigurations.mini-pc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/mini-pc/configuration.nix
            ./hosts/mini-pc/hardware-configuration.nix
            ./modules/tailscale.nix
            ./modules/starship.nix
            ./modules/terminal-tools.nix
          ];
        };
      }
    );
}
