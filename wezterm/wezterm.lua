local wezterm = require 'wezterm'

return {

  font_size = 11.5,
  color_scheme = "Tokyo Night",
  enable_tab_bar = false,
  window_background_opacity = 0.95,

  keys = {
    {
      key = "f",
      mods = "CTRL",
      action = wezterm.action.SpawnCommandInNewTab {
         args = { "/bin/bash", "-l", "-c", "tmux-sessionizer" },
      },
    },
  },
}

