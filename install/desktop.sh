#!/bin/bash

# Desktop Apps
if [[ -n "$OMAKUB_INSTALL_DESKTOP_APPS" ]]; then
  # Flatpak system package manager (required by some optional apps)
  source ~/.local/share/omakub/install/desktop/a-flatpak.sh

  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"alacritty"* ]]        && source ~/.local/share/omakub/install/desktop/app-alacritty.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"chrome"* ]]           && source ~/.local/share/omakub/install/desktop/app-chrome.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"flameshot"* ]]        && source ~/.local/share/omakub/install/desktop/app-flameshot.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"gnome-sushi"* ]]      && source ~/.local/share/omakub/install/desktop/app-gnome-sushi.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"gnome-tweak-tool"* ]] && source ~/.local/share/omakub/install/desktop/app-gnome-tweak-tool.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"libreoffice"* ]]      && source ~/.local/share/omakub/install/desktop/app-libreoffice.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"localsend"* ]]        && source ~/.local/share/omakub/install/desktop/app-localsend.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"obsidian"* ]]         && source ~/.local/share/omakub/install/desktop/app-obsidian.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"pinta"* ]]            && source ~/.local/share/omakub/install/desktop/app-pinta.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"signal"* ]]           && source ~/.local/share/omakub/install/desktop/app-signal.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"typora"* ]]           && source ~/.local/share/omakub/install/desktop/app-typora.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"vlc"* ]]              && source ~/.local/share/omakub/install/desktop/app-vlc.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"vscode"* ]]           && source ~/.local/share/omakub/install/desktop/app-vscode.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"wl-clipboard"* ]]     && source ~/.local/share/omakub/install/desktop/app-wl-clipboard.sh
  [[ "$OMAKUB_INSTALL_DESKTOP_APPS" == *"xournalpp"* ]]        && source ~/.local/share/omakub/install/desktop/app-xournalpp.sh

  # GNOME web app shortcuts for installed apps
  source ~/.local/share/omakub/install/desktop/applications.sh
fi

# GNOME Configuration
if [[ -n "$OMAKUB_INSTALL_GNOME_CONFIG" ]]; then
  [[ "$OMAKUB_INSTALL_GNOME_CONFIG" == *"theme"* ]]               && source ~/.local/share/omakub/install/desktop/set-gnome-theme.sh
  [[ "$OMAKUB_INSTALL_GNOME_CONFIG" == *"settings"* ]]            && source ~/.local/share/omakub/install/desktop/set-gnome-settings.sh
  [[ "$OMAKUB_INSTALL_GNOME_CONFIG" == *"hotkeys"* ]]             && source ~/.local/share/omakub/install/desktop/set-gnome-hotkeys.sh
  [[ "$OMAKUB_INSTALL_GNOME_CONFIG" == *"extensions"* ]]          && source ~/.local/share/omakub/install/desktop/set-gnome-extensions.sh
  [[ "$OMAKUB_INSTALL_GNOME_CONFIG" == *"dock"* ]]                && source ~/.local/share/omakub/install/desktop/set-dock.sh
  [[ "$OMAKUB_INSTALL_GNOME_CONFIG" == *"app-grid"* ]]            && source ~/.local/share/omakub/install/desktop/set-app-grid.sh
  [[ "$OMAKUB_INSTALL_GNOME_CONFIG" == *"xcompose"* ]]            && source ~/.local/share/omakub/install/desktop/set-xcompose.sh
  [[ "$OMAKUB_INSTALL_GNOME_CONFIG" == *"alacritty-as-default"* ]] && source ~/.local/share/omakub/install/desktop/set-alacritty-default.sh
fi

# Framework laptop text scaling (auto-detects hardware, harmless on other machines)
source ~/.local/share/omakub/install/desktop/set-framework-text-scaling.sh

# Fonts
if [[ "$OMAKUB_INSTALL_FONTS" == "true" ]]; then
  source ~/.local/share/omakub/install/desktop/fonts.sh
fi

# Ulauncher
if [[ "$OMAKUB_INSTALL_ULAUNCHER" == "true" ]]; then
  source ~/.local/share/omakub/install/desktop/ulauncher.sh
fi

# Optional Desktop Apps (select-optional-apps.sh reads OMAKUB_FIRST_RUN_OPTIONAL_APPS)
source ~/.local/share/omakub/install/desktop/select-optional-apps.sh

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot || true
