build:
  nixos-rebuild build --flake .

switch:
  sudo nixos-rebuild switch --flake .