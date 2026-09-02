{ lib, inputs, pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./kitty.nix
    ./vscodium.nix
    ./zen.nix
    ./noctalia.nix
    ./hyprland.nix
    ./theme.nix
    ./xdg.nix
  ];
  # nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];


  # USB Automount
  services.udiskie = {
    enable = true;
    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        file_manager = "${pkgs.nautilus}/bin/nautilus";
      };
    };
    tray = "never";
    notify = false;
  };
}
