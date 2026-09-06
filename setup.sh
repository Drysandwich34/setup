sudo -v && curl -fsSL https://install.danklinux.com | sh -s -- -c hyprland -t ghostty -y --danksearch --replace-configs hyprland


curl -s https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh -o install.sh
chmod u+x install.sh
./install.sh --help

./install.sh install FiraCode

curl https://github.com/Drysandwich34/setup/raw/refs/heads/main/dms-backup-20260905-205533.tar.gz > dms.tar.gz

dms backup restore dms.tar.gz

sudo dnf install adw-gtk3-theme -y
sudo dnf install qt6ct-kde -y

mkdir -p ~/.config/environment.d
tee ~/.config/environment.d/qt-theme.conf > /dev/null <<'EOF'
QT_QPA_PLATFORMTHEME=qt6ct
EOF

mkdir -p ~/.config/zed
curl -fsSL https://raw.githubusercontent.com/Drysandwich34/setup/main/zed/settings.json -o ~/.config/zed/settings.json
curl -fsSL https://raw.githubusercontent.com/Drysandwich34/setup/main/zed/keymap.json -o ~/.config/zed/keymap.json

sudo dnf install zsh zoxide -y

grep -qxF 'eval "$(zoxide init zsh)"' ~/.zshrc || echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

sudo chsh -s $(which zsh) $USER

curl https://raw.githubusercontent.com/typecraft-dev/dotfiles/refs/heads/master/starship/.config/starship.toml > ~/.config/starship.toml

git clone https://github.com/Drysandwich34/poovim.git ~/.config/nvim

sudo curl -fsSL https://raw.githubusercontent.com/Drysandwich34/setup/main/firefox/dashboard.xpi -o /usr/lib64/firefox/distribution/dashboard.xpi
sudo tee /usr/lib64/firefox/distribution/policies.json > /dev/null <<'EOF'
{
  "policies": {
    "ExtensionSettings": {
      "dashboard@potato.local": {
        "installation_mode": "normal",
        "install_url": "https://raw.githubusercontent.com/Drysandwich34/setup/main/firefox/dashboard.xpi",
        "updates_url": null
      },
      "*": {
        "installation_mode": "allowed"
      }
    }
  }
}
EOF
