#!/bin/bash

function hl() {
  echo "################################################################################"
}
function box() {
    hl
    echo "# $1"
    hl
}

function setShell() {
  chsh -s $(which zsh)
}

function installDependencies() {
  box "installing xcode"
  xcode-select --install
  box "installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
  source ~/.zshrc
}

function gitBundles() {
  cd ~
  git clone https://github.com/integral-io/BrewBundles.git
  mv BrewBundles .brew
  cd .brew
  git checkout $1
}

function setupFirstTime() {
  setShell
  installDependencies
  gitBundles $1
  setupAgain
}

function setupAgain() {
  cd ~/.brew/
  ./copy.sh out
  brew bundle install
}

function gitSave() {
  cd ~/.brew/
  git checkout -b $1
  git add .
  git commit -m "auto update"
  git push origin --delete $1
  git branch --set-upstream-to=origin/$1 $1
  git push
}

function compress() {
  tar -zcvf $(1).tar.gz $(1)
}

function extract() {
  tar -zxvf $(1).tar.gz
}

function save() {
  brew bundle dump -force
  cd ~/.brew/
  ./copy.sh in
  gitSave $1
}

$@
