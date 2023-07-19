cp -v ~/.config/i3/config ./dotfiles/i3/config

cp -v ~/.zshrc ./dotfiles/zsh/.zshrc

cp -v ~/.config/polybar/config.ini ./dotfiles/polybar/config.ini
cp -v ~/.config/polybar/launch.sh ./dotfiles/polybar/launch.sh

cp -v ~/.config/rofi/config.rasi ./dotfiles/rofi/config.rasi
cp -v ~/.config/rofi/theme.rasi ./dotfiles/rofi/theme.rasi

cp -v ~/.config/alacritty/alacritty.yml ./dotfiles/alacritty/alacritty.yml

git commit -am "update"
git push
