echo "Starting backup..."

# cp -v ~/.zshrc ./dotfiles/zsh/.zshrc
# cp -v ~/.config/polybar/config.ini ./dotfiles/polybar/config.ini
# cp -v ~/.config/polybar/launch.sh ./dotfiles/polybar/launch.sh
# cp -vr ~/.config/alacritty/alacritty.yml ./dotfiles/alacritty/alacritty.yml

# Common

echo "Copying common into common-backup..."

cp -Tvr ./common ./backups/common-backup

echo "Backing up common..."

cp -vr ~/.config/flameshot/flameshot.ini ./common/flameshot/
cp -vr ~/.config/ghostty/config ./common/ghostty/

# Version 1

echo "Copying version1 into version1-backup..."

cp -Tvr ./version1 ./backups/version1-backup

echo "Backing up version1..."

cp -vr ~/.config/hypr/hyprland.conf ./version1/hypr/
cp -vr ~/.config/hypr/hyprpaper.conf ./version1/hypr/
cp -vr ~/.config/hypr/hyprlock.conf ./version1/hypr/

cp -vr ~/.config/rofi/config.rasi ./version1/rofi/
cp -vr ~/.config/rofi/theme.rasi ./version1/rofi/

cp -vr ~/.config/waybar/config.jsonc ./version1/waybar/
cp -vr ~/.config/waybar/style.css ./version1/waybar/

# Version 2

# echo "Copying version2 into version2-backup..."

# cp -Tvr ./version2 ./backups/version2-backup

# echo "Backing up version2..."

# cp -vr ~/.config/i3/config ./version2/i3/
# cp -vr ~/.config/i3status/config ./version2/i3status/
# cp -vr ~/.config/picom/picom.conf ./version2/picom/
