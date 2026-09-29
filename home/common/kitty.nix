{pkgs, lib, ...}: let
  font-name = "MesloLGS NF";
  font-pkg = pkgs.meslo-lgs-nf;
in {
  programs.kitty = {
    enable = true;
    themeFile = lib.mkDefault "gruvbox-dark";
    shellIntegration.enableBashIntegration = true;
    shellIntegration.enableZshIntegration = true;
    font.package = font-pkg;
    font.name = font-name;
    font.size = lib.mkDefault 12;
    quickAccessTerminalConfig = {
      lines = lib.mkDefault 15;
      background_opacity = lib.mkDefault 0.75;
    };
    settings = {
      confirm_os_window_close = lib.mkDefault (0);
      background_opacity = 0.8;
    };
    keybindings = {
      "super+shift+enter" = "new_os_window_with_cwd";
    };

  };
}
