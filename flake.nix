{
  inputs = {
    base.url = "/home/chris/cdm-nixos-base";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };
  outputs = inputs:
    let
      system = "x86_64-linux";
      base = inputs.base.nixosModules.${system};
    in {
      nixosConfigurations.renzo = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./.
          base.authorized-keys
          base.essentials
          base.extra
          base.fonts
          base.location
          ./networking.nix
          base.nix
          base.printing
        ];
      };
    };
}
