ln -fs ~/dotfiles/alacritty ~/.config/alacritty
ln -fs ~/dotfiles/electron-flags.conf ~/.config/electron-flags.conf
ln -fs ~/dotfiles/fontconfig ~/.config/fontconfig
ln -fs ~/dotfiles/kitty ~/.config/kitty
ln -fs ~/dotfiles/neofetch ~/.config/neofetch
ln -fs ~/dotfiles/npmrc ~/.npmrc
ln -fs ~/dotfiles/ranger ~/.config/ranger
# rime
ln -fs ~/dotfiles/rime ~/.local/share/fcitx5/rime
cd ~/.local/share/fcitx5/rime
rime_deployer --build
# zsh Theme
ln -fs ~/dotfiles/sway ~/.config/sway
ln -fs ~/dotfiles/waybar ~/.config/waybar
ln -fs ~/dotfiles/wofi ~/.config/wofi
ln -fs ~/dotfiles/zshenv ~/.zshenv
ln -fs ~/dotfiles/zshrc ~/.zshrc
