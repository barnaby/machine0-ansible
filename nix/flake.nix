{
  description = "machine0 base VM development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      # Build on the target VM, so system is determined at eval time.
      # Support both x86_64 and aarch64.
      mkHome = system: home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };
        modules = [ ./home.nix ];
      };
    in {
      # deploy.sh uses: nix run home-manager -- switch --flake .#ubuntu
      homeConfigurations.ubuntu = mkHome "x86_64-linux";
      homeConfigurations.ubuntu-arm = mkHome "aarch64-linux";
    };
}
