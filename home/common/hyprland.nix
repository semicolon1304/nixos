{ inputs, pkgs, lib, osConfig, ... }:

{
  # TODO: this later
  # Figure out how the fuck this works
  wayland.windowManager.hyprland = {
    enable = true;
    # systemd.enable = true;
    configType = "lua";
    extraConfig = lib.strings.join "" [
      (builtins.readFile ./hypr/configs/animations.lua)
      (builtins.readFile ./hypr/configs/autostart.lua)
      (builtins.readFile ./hypr/configs/env.lua)
      (builtins.readFile ./hypr/configs/keybinds.lua)
      (builtins.readFile (./. + "/hypr/configs/${osConfig.networking.hostName}_monitors.lua"))
      (builtins.readFile ./hypr/configs/settings.lua)
      (builtins.readFile ./hypr/configs/windowrules.lua)
      (builtins.readFile ./hypr/configs/workspaces.lua)
    ];
    systemd.variables = [ "--all" ]; # fixes theme in dbus activated apps?
  };
}
