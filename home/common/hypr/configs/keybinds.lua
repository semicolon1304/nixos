local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "nautilus"
local ipc = "noctalia msg "

-- Hyprland stuff
hl.bind("CTRL + ALT + Delete", hl.dsp.exit(0))

-- Window management
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({action = "toggle"}))
hl.bind(mainMod .. " + H", hl.dsp.layout("togglesplit")) 
hl.bind("ALT + F", hl.dsp.window.fullscreen())
hl.bind("ALT + TAB", hl.dsp.exec_cmd("noctalia-shell ipc call plugin:workspace-overview toggle"))

-- Workspace management
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + X", hl.dsp.workspace.toggle_special())
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({workspace = "e+1"}))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({workspace = "e-1"}))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   {mouse = true})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {mouse = true})

-- Function keys, stolen from the example config
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Application shortcuts
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("zen-beta"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("codium --ozone-platform=wayland"))
-- hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("webcord"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("vesktop"))

hl.bind("ALT + Space", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))

-- Misc
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("eject"))
hl.bind(mainMod .. "+ SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))

-- Noctalia binds
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(mainMod .. " + Comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(ipc .. "panel-toggle wallpaper"))

-- Gestures
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
