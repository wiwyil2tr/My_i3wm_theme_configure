#!/bin/bash
copyinstall(){
	mkdir -p ${HOME}/.config
cat dotfiles/vim.tar.gz.* > vim.tar.gz
tar -xvf vim.tar.gz
sudo rm -r vim.tar.gz.*
mv vim* dotfiles/
cp -r dotfiles/config/* ${HOME}/.config
cp -r dotfiles/.conky ${HOME}/
cp -r dotfiles/wallpapers `xdg-user-dir PICTURES`
cp -r dotfiles/bin ${HOME}/
sudo cp -r dotfiles/etc/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf
}
linkinstall(){
mkdir -p ${HOME}/.config
cat dotfiles/vim.tar.gz.* > vim.tar.gz
tar -xvf vim.tar.gz
sudo rm -r vim.tar.gz.*
mv vim* dotfiles/
ln -sf ${HOME}/My_i3wm_theme_configure/dotfiles/config/* ${HOME}/.config
cp -r dotfiles/wallpapers `xdg-user-dir PICTURES`
cp -r dotfiles/bin ${HOME}/
ln -sf dotfiles/.conky ${HOME}/
sudo ln -sf ${HOME}/My_i3wm_theme_configure/dotfiles/etc/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf
}
if ! whiptail --title "Welcome" --yesno "Welcome to i3wm Theme Configure!\nPlease read README.md first. \nThis script will automatically install the packages below:\n xfce4-screensaver xfce4-power-manager i3-gaps conky copyq dunst blueman kitty ranger rofi ccal lunar-date xbindkeys brightnessctl i3lock-fancy-git neofetch ranger\nand then you can choose copy or link the config files to the corresponding directories. Do you want to continue?" 20 60; then
	exit
fi

distro=$(whiptail --title "Select Distro" --menu "Choose your Linux distribution:" 15 60 3 \
	"Arch" "" \
	"Debian" "" \
	"Red Hat" "" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
	exit
fi
case "$distro" in
	"Arch")
		sudo pacman -S xfce4-screensaver xfce4-power-manager polybar i3-gaps conky copyq dunst blueman kitty ranger rofi ccal lunar-date xbindkeys brightnessctl neofetch light ttf-font-awesome autotiling
		yay -S i3lock-fancy-git lunar-date 
		;;
	"Debian")
		sudo apt install xfce4-screensaver xfce4-power-manager i3-gaps polybar conky copyq dunst blueman kitty ranger rofi i3lock-fancy ccal lunar-date xbindkeys brightnessctl neofetch light ttf-font-awesome autotiling
		;;
	"Red Hat")
		sudo yum install xfce4-screensaver xfce4-power-manager  mako nwg-bar polybar swaylock waybar kitty ccal brightnessctl i3lock-fancy neofetch light ttf-font-awesome autotiling
		;;
esac
sudo  cp /usr/share/locale/zh_CN/LC_MESSAGES/lunar-date.mo /usr/share/locale/en_GB/LC_MESSAGES/lunar-date.mo 
method=$(whiptail --title "Select Installation Method" --menu "Choose your prefered installation method:\n" 15 60 3 \
	"Install by copying files" "" \
	"Install by creating symbolic links" "" \
	"Quit" "" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
	exit
fi
case "$method" in
	"Install by copying files")
		copyinstall
		;;
	"Install by creating symbolic links")
		linkinstall
		;;
	"Quit")
		exit
		;;
esac
configurations=$(whiptail --title "Optional Configurations" --checklist "Do you want to install extra configurations? Choose the configurations to install. For vim, choose one option from either copying or linking. If not, leave blank or select "Cancel":" 15 60 4 \
	"vim(install by copying)" "Install Vim configuration by copying" OFF \
	"vim(install by linking)" "Install Vim configuration by linking" OFF \
	"zsh" "Zsh configuration" OFF \
	3>&1 1>&2 2>&3)
configurations=${configurations//\"/}
if [[ $configurations =~ "vim(install by copying)" ]] then
	sudo cp -r dotfiles/vim ${HOME}/.vim
	sudo cp -r dotfiles/vimrc ${HOME}/.vimrc
	sudo ln -s ~/.vim /root
	sudo ln -s ~/.vimrc /root
	echo "vim configuration installed"
fi
if [[ $configurations =~ "vim(install by linking)" ]] then
	sudo ln -sf ${HOME}/My_i3wm_theme_configure/dotfiles/vim ${HOME}/.vim
	sudo ln -sf ${HOME}/My_i3wm_theme_configure/dotfiles/vimrc ${HOME}/.vimrc
	sudo ln -s ~/.vimrc /root
	echo "vim configuration installed"
fi
if [[ $configurations =~ "zsh" ]] then
	case "$distro" in
		"Arch")
			[[ $(command -v curl) ]] || sudo pacman -Syu curl
			bash -c "$(curl -L l.tmoe.me/ee/zsh)"
			;;
		"Debian")
			sudo apt update || su -c "apt update"
			[[ $(command -v eatmydata) ]] || sudo apt install -y eatmydata || su -c "apt install -y eatmydata"
			[[ $(command -v wget) ]] || sudo eatmydata apt install -y wget || su -c "apt install -y wget"
			bash -c "$(wget -qO- l.tmoe.me/ee/zsh)"
			;;
		"Red Hat")
			if ! grep -q 'Fedora' "/etc/os-release";then
				[[ -s "/etc/yum.repos.d/epel.repo" ]] || sudo yum install --skip-broken -y epel-release tar dnf
			fi
			[[ $(command -v curl) ]] || sudo dnf install -y curl || sudo yum install -y curl
			bash -c "$(curl -fsSL https://l.tmoe.me/ee/zsh)"
			;;
	esac
	echo "zsh configuration installed"
fi
whiptail --title "Done" --msgbox "Installation and configuration completed successfully." 10 60

