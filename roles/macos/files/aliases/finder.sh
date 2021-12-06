#!/bin/bash
hidedesktop() {
  defaults write com.apple.finder CreateDesktop false
  killall Finder
}

showdesktop() {
  defaults write com.apple.finder CreateDesktop true
  killall Finder
}
