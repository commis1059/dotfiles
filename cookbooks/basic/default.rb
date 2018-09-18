execute "customize devices" do
  command <<-EOS
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
defaults write -g com.apple.trackpad.scaling 16
defaults write -g com.apple.mouse.tapBehavior -int 1
defaults write -g com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
  EOS
end

execute "customize dock" do
  command <<-EOS
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock tilesize -int 30
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -int 0
defaults write com.apple.dock orientation -string "left"
killall Dock
  EOS
end

execute "customize finder" do
  command <<-EOS
defaults write com.apple.finder AppleShowAllFiles true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowTabView -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
chflags nohidden ~/Library
killall Finder
  EOS
end

execute "customize other" do
  command <<-EOS
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.clock "DateFormat" -string "M\u6708d\u65e5(EEE)  H:mm"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2
defaults write com.apple.screencapture location ~/Downloads
  EOS
end
