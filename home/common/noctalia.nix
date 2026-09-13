{ inputs, pkgs, lib, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  # TODO: Fix this (I'm so good at commenting)
  programs.noctalia = {
    enable = true;
    settings = {
      weather.enabled = true;
      weather.unit = "imperial";
      location.auto_locate = true;
      nightlight.enabled = true;

      shell = {
        font = "Source Sans";
        font_family = "Source Sans";
        launcher.categories = false;
        panel = {
          borders = false;
          session_placement = "floating";
          session_position = "center";
          transparency_mode = "glass";
          wallpaper_placement = "floating";
          wallpaper_position = "center";
        };
        # weather.unit = "metric";
      };

      theme = lib.mkForce {
        mode = "dark";
        builtin = "Gruvbox";
        # community_palette = "Gruvbox";
        # source = "builtin";
        templates = {
          builtin_ids = [ "gtk3" "gtk4" "hyprland" "qt" ];
          community_ids = [ "zen-browser" "neovim" "obsidian" "discord" ];
        };
      };

      wallpaper = {
        directory = "~/Pictures/Wallpapers";
        default.path = "~/Pictures/Wallpapers/cool_building.jpg";
        # last.path = "~/Pictures/Wallpapers/cool_building.jpg";
      };

      bar.default = {
        enabled = true;
        position = "top";
        margin_ends = 5;
        margin_edge = 5;
        margin_opposite_edge = 1;
        reserve_space = true;
        concave_edge_corners = false;
        shadow = false;
        thickness = 30;

        # Widgets
        start = [ "clock" "group:g1" ];
        capsule_group = {
          enabled = true;
          fill = "surface_variant";
          id = "g1";
          members = [ "cpu" "ram" "temp" ];
          opacity = 1.0;
          padding = 6.0;
        };
        end = [ "tray" "clipboard" "battery" "volume" "brightness" "control-center" ];

      };
      lockscreen_widgets = {
        # Hope I don't have to do this
        enabled = false;
        schema_version = 2;
        widget_order = [
          "lockscreen-login-box@eDP-2"
          "lockscreen-login-box@DP-2"
          "lockscreen-login-box@DP-1"
          "lockscreen-widget-clock"
          "lockscreen-widget-0000000000000002"
          "lockscreen-widget-0000000000000003"
        ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget = {
          "lockscreen-login-box@DP-1" = {
            box_height = 70.0;
            box_width = 400.0;
            cx = 960.0;
            cy = 961.0;
            output = "DP-1";
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_password_hint = true;
            };
          };
          "lockscreen-login-box@DP-2" = {
            box_height = 70.0;
            box_width = 400.0;
            cx = 1024.0;
            cy = 1033.0;
            output = "DP-2";
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_password_hint = true;
            };
          };
          "lockscreen-login-box@eDP-2" = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            input_opacity = 1.0;
            input_radius = 6.0;
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_password_hint = true;
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_password_hint = true;
            };
          };
          "lockscreen-widget-clock" = {
            box_height = 160.0;
            box_width = 352.0;
            cx = 800.0;
            cy = 484.0;
            output = "eDP-2";
            rotation = 0.0;
            type = "clock";
          };
          "lockscreen-widget-power" = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 1060.0;
            cy = 888.0;
            output = "eDP-2";
            rotation = 0.0;
            type = "button";
            settings = {
              background = true;
              command = "noctalia msg panel-toggle session";
              glyph = "power";
              variant = "default";
            };
          };
          "lockscreen-widget" = {
            box_height = 128.0;
            box_width = 288.0;
            cx = 800.0;
            cy = 692.0;
            output = "eDP-2";
            rotation = 0.0;
            type = "weather";
          };
        };
      };
      widget = {
        battery = {
          capsule = true;
          display_mode = "graphic";
          show_label = false;
        };
        clipboard.capsule = true;
        clock = {
          capsule = true;
          format = "{:%H:%M %a, %B %d}";
        };
        control-center = {
          capsule = true;
          custom_image = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          custom_image_colorize = false;
          icon_color = "primary";
        };
        cpu.show_label = false;
        ram.show_label = false;
        temp.show_label = false;
        sysmon.show_label = false;
        tray.capsule = true;
        volume = {
          capsule = true;
          show_label = false;
        };
        workspaces.display = "none";
      };
    };
  };
}
