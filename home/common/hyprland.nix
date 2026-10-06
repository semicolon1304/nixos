{ inputs, pkgs, lib, osConfig, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    # systemd.enable = true;
    configType = "lua";
    extraConfig = lib.strings.join "" [
      (builtins.readFile ./hypr/animations.lua)
      (builtins.readFile ./hypr/autostart.lua)
      (builtins.readFile ./hypr/env.lua)
      (builtins.readFile ./hypr/keybinds.lua)
      (builtins.readFile (./. + "/hypr/${osConfig.networking.hostName}_monitors.lua"))
      (builtins.readFile ./hypr/settings.lua)
      (builtins.readFile ./hypr/windowrules.lua)
      (builtins.readFile (./. + "/hypr/${osConfig.networking.hostName}_workspaces.lua"))
    ];
    systemd.variables = [ "--all" ]; # fixes theme in dbus activated apps?
  };
}
