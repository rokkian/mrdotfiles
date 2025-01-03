-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

--config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font = wezterm.font("Agave Nerd Font Mono")

-- config.font_size = 19 -- control the font size

-- keep adding conf options here
-- Permette di creare terms con cmd + t, muoversi con cmd + shift [ 0 ]
config.enable_tab_bar = true

-- mostra o meno l'header mac di default
config.window_decorations = "TITLE | RESIZE" -- "NONE", "RESIZE", "TITLE | RESIZE"

-- set the terminals colors
-- config.colors = {}

-- set opacity and blur
config.window_background_opacity = 1 -- 0.0,1 
config.macos_window_background_blur = 10 -- 0,100 


return config
