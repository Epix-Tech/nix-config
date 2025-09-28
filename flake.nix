{
  description = "Headless NixOS config for mini PC (david) with tailscale, headscale, and modern terminal tools";

  # Inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  # Outputs
  outputs = { self, nixpkgs, flake-utils }: {
    # ✅ Your system configuration
    nixosConfigurations = {
      mini-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./tailscale.nix
          ./starship.nix
          ./terminal-tools.nix
        ];
      };
    };

    # ✅ Optional: keep flake-utils for dev shells / packages
    packages = flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        # example: a default package you can build with `nix build`
        defaultPackage = pkgs.hello;
      }
    );
  };
}
