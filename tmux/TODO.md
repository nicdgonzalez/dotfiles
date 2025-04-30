# Automatic theme switching for tmux

- Poll `gsettings get org.gnome.desktop.interface color-scheme` every 3000
  milliseconds to get the current theme.
- Create a script that shifts the link to `./themes/current_theme.conf` when
  the theme changes.
- Figure out how to reload all tmux sessions at once when this change happens.
