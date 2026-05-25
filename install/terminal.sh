#!/bin/bash

# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

# Always install: shell config (backs up ~/.bashrc and ~/.inputrc), build libraries, mise, git aliases
source ~/.local/share/omakub/install/terminal/a-shell.sh
source ~/.local/share/omakub/install/terminal/libraries.sh
source ~/.local/share/omakub/install/terminal/mise.sh
source ~/.local/share/omakub/install/terminal/set-git.sh

# Terminal CLI Apps
if [[ -n "$OMAKUB_INSTALL_CLI_APPS" ]]; then
  [[ "$OMAKUB_INSTALL_CLI_APPS" == *"btop"* ]]       && source ~/.local/share/omakub/install/terminal/app-btop.sh
  [[ "$OMAKUB_INSTALL_CLI_APPS" == *"fastfetch"* ]]   && source ~/.local/share/omakub/install/terminal/app-fastfetch.sh
  [[ "$OMAKUB_INSTALL_CLI_APPS" == *"github-cli"* ]]  && source ~/.local/share/omakub/install/terminal/app-github-cli.sh
  [[ "$OMAKUB_INSTALL_CLI_APPS" == *"lazydocker"* ]]  && source ~/.local/share/omakub/install/terminal/app-lazydocker.sh
  [[ "$OMAKUB_INSTALL_CLI_APPS" == *"lazygit"* ]]     && source ~/.local/share/omakub/install/terminal/app-lazygit.sh
  [[ "$OMAKUB_INSTALL_CLI_APPS" == *"neovim"* ]]      && source ~/.local/share/omakub/install/terminal/app-neovim.sh
  [[ "$OMAKUB_INSTALL_CLI_APPS" == *"zellij"* ]]      && source ~/.local/share/omakub/install/terminal/app-zellij.sh
fi

# Terminal Utilities (space-separated package names)
if [[ -n "$OMAKUB_INSTALL_TERMINAL_UTILS" ]]; then
  sudo apt install -y $OMAKUB_INSTALL_TERMINAL_UTILS
fi

# Docker
if [[ "$OMAKUB_INSTALL_DOCKER" == "true" ]]; then
  source ~/.local/share/omakub/install/terminal/docker.sh
fi

# Dev Languages (prompts interactively if env var not set)
source ~/.local/share/omakub/install/terminal/select-dev-language.sh

# Databases (prompts interactively if env var not set)
source ~/.local/share/omakub/install/terminal/select-dev-storage.sh

# Optional Terminal Tools
if [[ -n "$OMAKUB_INSTALL_TERMINAL_OPTIONAL" ]]; then
  [[ "$OMAKUB_INSTALL_TERMINAL_OPTIONAL" == *"ollama"* ]]    && source ~/.local/share/omakub/install/terminal/optional/app-ollama.sh
  [[ "$OMAKUB_INSTALL_TERMINAL_OPTIONAL" == *"tailscale"* ]] && source ~/.local/share/omakub/install/terminal/optional/app-tailscale.sh
fi
