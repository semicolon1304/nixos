hl.config({
    general = {
        border_size = 0,
        gaps_in = 5,
        gaps_out = 10,
        resize_on_border = true,
        layout = dwindle
        -- Window snapping for floating windows, may need to turn this off
        snap = {
            enabled = true
        }
    },
    decoration = {
        rounding = 20,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.9,
        fullscreen_opacity = 1.0,
        dim_inactive = false,
        dim_strength = 0.1,
        dim_special = 0.8,
        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            ignore_opacity = true,
            new_optimizations = true,
            vibrancy = 0.1696,
        },
            shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },
    },
    -- Default animations are probably good enough, come back to this later
    -- animations {},
    input = {
        kb_layout = "us",
        repeat_rate = 50,
        repeat_delay = 300,
        numlock_by_default = true,
        follow_mouse = 1,
    
        touchpad = {
            disable_while_typing = true,
            natural_scroll = false,
            scroll_factor = 0.2,
            middle_button_emulation = false,
            clickfinger_behavior = true,
            tap_to_click = true,
        },

    },
    gestures = {
        workspace_swipe_invert = false,
        workspace_swipe_create_new = false,
        workspace_swipe_forever = true,
    },
    -- Group settings could be added here, I don't currently use them so I won't configure them
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        vrr = 1,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        animate_manual_resizes = true,
        disable_autoreload = false, -- This is theoretically to save battery, dunno if it's worth having on
        enable_swallow = false,
        -- swallow_regex = "^(kitty)$",

        
        
    },
    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles = true,
        hide_special_on_workspace_change = true,
    },  
    
    xwayland = {
        force_zero_scaling = true, -- Keeps xwayland apps from being blurry/pixelated
    },

    opengl = {
        nvidia_anti_flicker = true, -- This may need to be on
    },

    -- Come back to this if you want to customize the cursor
    -- cursor {}, 
    ecosystem = {
        no_donation_nag = true,
    },
    debug = {
        vfr = true,
    },
})