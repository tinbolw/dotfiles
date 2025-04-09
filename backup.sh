echo "Backing up ./dotfiles..."

cp -vr ./dotfiles ./dotfiles-backup

echo "Starting backup..."

# cp -v ~/.zshrc ./dotfiles/zsh/.zshrc
# cp -v ~/.config/polybar/config.ini ./dotfiles/polybar/config.ini
# cp -v ~/.config/polybar/launch.sh ./dotfiles/polybar/launch.sh
# cp -vr ~/.config/alacritty/alacritty.yml ./dotfiles/alacritty/alacritty.yml

cp -vr ~/.config/i3/config ./dotfiles/i3/config
cp -vr ~/.config/i3status/config ./dotfiles/i3status/config
cp -vr ~/.config/picom/picom.conf ./dotfiles/picom/picom.conf

cp -vr ~/.config/ghostty/config ./dotfiles/ghostty/config

cp -vr ~/.config/rofi/config.rasi ./dotfiles/rofi/config.rasi
cp -vr ~/.config/rofi/theme.rasi ./dotfiles/rofi/theme.rasi
