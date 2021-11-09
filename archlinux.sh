###
# PASSOS INSTALAÇÃO ARCH LINUX - DEPOIS DO ARCH-CHROOT
###

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
vim /etc/locale.gen
nano /etc/locale.gen
locale-gen
nano /etc/locale.conf
nano /etc/pacman.conf 
nano /etc/pacman.d/mirrorlist 
nano /etc/vconsole.conf
nano /etc/hostname
nano /etc/hosts

passwd

pacman -S --needed grub efibootmgr networkmanager dialog wpa_supplicant mtools dosfstools git reflector snapper bluez bluez-utils xdg-utils xdg-user-dirs inetutils base-devel linux-lts-headers alsa-utils pulseaudio pulseaudio-bluetooth wget

nano /etc/mkinitcpio.conf

mkinitcpio -P

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id="Arch Linux"

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
useradd -mG wheel tui
passwd tui
EDITOR=vim visudo
pacman -S bash-completion os-prober
pacman -S --needed nvidia-lts bbswitch-dkms

pacman -S --needed xorg-server
pacman -S --needed sddm plasma-desktop
systemctl enable sddm
pacman -S --needed plasma-nm bluedevil plasma5-applets-active-window-control plasma5-applets-window-buttons plasma-pa powerdevil kdeplasma-addons kde-gtk-config sddm-kcm xdg-desktop-portal-kde kscreen kinfocenter libappindicator-gtk3 breeze-gtk qt5-imageformats
pacman -S --needed kde-applications

sudo timedatectl set-local-rtc 1 --adjust-system-clock
