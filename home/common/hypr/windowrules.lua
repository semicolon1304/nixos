hl.layer_rule({name = "noctalia", match = {namespace = "noctalia-background-.*$"}, ignore_alpha = true, blur = true, blur_popups = true})

-- Tagging
hl.window_rule({
  name = "tag-im-discord-family",
  match = {
    class = "^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$",
  },
  tag = "+im",
})

hl.window_rule({name = "Discord on 7", match = {tag = "im"}, workspace = 7})