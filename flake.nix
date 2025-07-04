{
  inputs = {
    base.url = "github:chris-martin/cdm-nixos-base";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
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
          base.home
          base.networking
          base.nix
          base.printing
        ];
      };
    };
}
