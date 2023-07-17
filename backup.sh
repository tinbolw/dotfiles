cp ~/.config/i3/config ./dotfiles/i3/config

cp ~/.zshrc ./dotfiles/zsh/.zshrc

cp ~/.config/polybar/config.ini ./dotfiles/polybar/config.ini
cp ~/.config/polybar/launch.sh ./dotfiles/polybar/launch.sh

cp ~/.config/rofi/config.rasi ./dotfiles/rofi/config.rasi
cp ~/.config/rofi/theme.rasi ./dotfiles/rofi/theme.rasi

cp ~/.config/alacritty/alacritty.yml ./dotfiles/alacritty/alacritty.yml

git commit -am "update"
git push
