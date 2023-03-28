ln -fs ~/dotfiles/alacritty ~/.config/alacritty
ln -fs ~/dotfiles/electron-flags ~/.config/electron-flags
ln -fs ~/dotfiles/fontconfig ~/.config/fontconfig
ln -fs ~/dotfiles/kitty ~/.config/kitty
ln -fs ~/dotfiles/neofetch ~/.config/neofetch
ln -fs ~/dotfiles/npmrc ~/.npmrc
ln -fs ~/dotfiles/ranger ~/.config/ranger
# rime
ln -fs ~/dotfiles/rime ~/.local/share/fcitx5/rime
cd ~/.local/share/fcitx5/rime
rime_deployer --build

ln -fs ~/dotfiles/sway ~/.config/sway
ln -fs ~/dotfiles/waybar ~/.config/waybar
ln -fs ~/dotfiles/wofi ~/.config/wofi
ln -fs ~/dotfiles/zshenv ~/.zshenv
ln -fs ~/dotfiles/zshrc ~/.zshrc
