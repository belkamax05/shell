if s-run is linux; then
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
fi
if s-run is darwin; then
    defaults osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
fi

