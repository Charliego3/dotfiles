#!/bin/bash
VERSION="v0.0.1"
automatically=0
install=0

function checkInstalled() {
    app="$1"
    # make first letter to uppercase
    func=$(echo "$app" | awk '{print toupper(substr($0,1,1))substr($0,2)}')
    if which "$app" >/dev/null 2>&1; then
        eval "update$func"
        return
    fi
    if [[ $# -gt 1 ]]; then
        echo "$app is not installed, skipped"
        return
    fi
    eval "install$func"
}

function installBrew() {
    if [[ $automatically -ne 1 ]]; then
        gum confirm "Would you like to install Homebrew?" && install=1 || install=0
    fi
    gum style --foreground 212 "👉 Start install brew...."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function updateBrew() {
    gum style --foreground 212 'Updating Homebrew formula and cask'
    brew update -v && \
        brew upgrade --greedy
}

function installGum() {
    brew install gum
}

gum style --foreground 212 --border-foreground 212 --border double \
    --align center --width 50 --margin "1 2" --padding "1 2" \
    "Welcome to install.sh ($VERSION)"
prompt=$(echo -e "Would you like to install\nautomatically without confirmation?")
gum confirm "$prompt" && automatically=1 || automatically=0

if [[ $automatically -ne 1 ]]; then
    gum confirm "Would you like to install Homebrew?" && install=1 || install=0
fi
echo "install = $install"
checkInstalled "brew" &&
checkInstalled "gum"

