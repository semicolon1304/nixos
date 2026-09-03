for i = 1,5 do
    hl.workspace_rule({ workspace = i, monitor = "DP-2" })
    hl.workspace_rule({ workspace = i+5, monitor = "DP-3" })
end

hl.workspace_rule({workspace = "1", default = true, monitor = "DP-2"})
hl.workspace_rule({workspace = "6", default = true, monitor = "DP-3"})