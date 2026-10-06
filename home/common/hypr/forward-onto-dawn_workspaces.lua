for i = 1,5 do
    hl.workspace_rule({ workspace = i, monitor = "DP-1"})
    hl.workspace_rule({ workspace = i+5, monitor = "eDP-2"})
end

-- hl.workspace_rule({workspace = "1", default = true, monitor = "eDP-2"})
-- hl.workspace_rule({workspace = "6", default = true, monitor = "DP-1"})


