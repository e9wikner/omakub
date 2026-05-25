#!/bin/bash

# --- Group 1: Terminal CLI Apps ---
echo ""
if gum confirm "Install terminal CLI apps? (btop, fastfetch, GitHub CLI, lazydocker, lazygit, neovim, zellij)"; then
  CLI_APP_OPTIONS=("btop" "fastfetch" "github-cli" "lazydocker" "lazygit" "neovim" "zellij")
  export OMAKUB_INSTALL_CLI_APPS=$(gum choose "${CLI_APP_OPTIONS[@]}" --no-limit \
    --selected "btop,fastfetch,github-cli,lazydocker,lazygit,neovim,zellij" \
    --height 10 --header "Select terminal CLI apps")
fi

# --- Group 2: Terminal Utilities ---
echo ""
if gum confirm "Install terminal utilities? (fzf, ripgrep, bat, eza, zoxide, fd-find, plocate)"; then
  UTIL_OPTIONS=("fzf" "ripgrep" "bat" "eza" "zoxide" "fd-find" "plocate" "apache2-utils")
  export OMAKUB_INSTALL_TERMINAL_UTILS=$(gum choose "${UTIL_OPTIONS[@]}" --no-limit \
    --selected "fzf,ripgrep,bat,eza,zoxide,fd-find,plocate,apache2-utils" \
    --height 12 --header "Select terminal utilities" | tr '\n' ' ')
fi

# --- Group 3: Docker ---
echo ""
if gum confirm "Install Docker?"; then
  export OMAKUB_INSTALL_DOCKER=true
fi

# --- Group 4: Dev Languages ---
echo ""
AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
SELECTED_LANGUAGES="Ruby on Rails","Node.js"
export OMAKUB_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")

# --- Group 5: Databases ---
echo ""
AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
SELECTED_DBS="MySQL,Redis"
export OMAKUB_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")

# --- Group 6: Optional Terminal Tools ---
echo ""
if gum confirm "Install optional terminal tools? (ollama, tailscale)"; then
  OPT_TERMINAL_OPTIONS=("ollama" "tailscale")
  export OMAKUB_INSTALL_TERMINAL_OPTIONAL=$(gum choose "${OPT_TERMINAL_OPTIONS[@]}" --no-limit \
    --height 6 --header "Select optional terminal tools")
fi

# --- Desktop/GNOME-only groups ---
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then

  # --- Group 7: Desktop Apps ---
  echo ""
  if gum confirm "Install desktop apps? (alacritty, chrome, vscode, vlc, signal, obsidian, libreoffice, ...)"; then
    DESKTOP_APP_OPTIONS=("alacritty" "chrome" "flameshot" "gnome-sushi" "gnome-tweak-tool" \
      "libreoffice" "localsend" "obsidian" "pinta" "signal" "typora" "vlc" "vscode" \
      "wl-clipboard" "xournalpp")
    DEFAULT_DESKTOP="alacritty,chrome,flameshot,gnome-sushi,gnome-tweak-tool,libreoffice,localsend,obsidian,pinta,signal,typora,vlc,vscode,wl-clipboard,xournalpp"
    export OMAKUB_INSTALL_DESKTOP_APPS=$(gum choose "${DESKTOP_APP_OPTIONS[@]}" --no-limit \
      --selected "$DEFAULT_DESKTOP" \
      --height 18 --header "Select desktop apps")
  fi

  # --- Group 8: GNOME Configuration ---
  echo ""
  if gum confirm "Apply GNOME configuration? (theme, hotkeys, settings, extensions, dock, ...)"; then
    GNOME_CONFIG_OPTIONS=("theme" "hotkeys" "settings" "extensions" "dock" "app-grid" "xcompose" "alacritty-as-default")
    DEFAULT_GNOME_CONFIG="theme,hotkeys,settings,extensions,dock,app-grid,xcompose,alacritty-as-default"
    export OMAKUB_INSTALL_GNOME_CONFIG=$(gum choose "${GNOME_CONFIG_OPTIONS[@]}" --no-limit \
      --selected "$DEFAULT_GNOME_CONFIG" \
      --height 12 --header "Select GNOME configuration items")
  fi

  # --- Group 9: Fonts ---
  echo ""
  if gum confirm "Install fonts?"; then
    export OMAKUB_INSTALL_FONTS=true
  fi

  # --- Group 10: Ulauncher ---
  echo ""
  if gum confirm "Install Ulauncher (app launcher)?"; then
    export OMAKUB_INSTALL_ULAUNCHER=true
  fi

  # --- Group 11: Optional Desktop Apps ---
  echo ""
  OPTIONAL_APPS=("1password" "Spotify" "Zoom" "Dropbox" "Cursor" "Discord" "Brave" "Zed" \
    "Audacity" "Gimp" "Obs-Studio" "Steam" "VirtualBox" "Windsurf" "Doom-Emacs" \
    "Retroarch" "Minecraft")
  DEFAULT_OPTIONAL_APPS='1password,Spotify,Zoom'
  export OMAKUB_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit \
    --selected "$DEFAULT_OPTIONAL_APPS" \
    --height 20 --header "Select optional desktop apps" | tr ' ' '-')

fi
