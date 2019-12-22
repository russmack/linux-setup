#!/bin/bash


# This is a UK setup.


echo "Setting time zone"
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc

echo "Setting localization"
sed -i '/en_GB/!d' /etc/locale.gen
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
echo KEYMAP=uk > /etc/vconsole.conf

passwd

echo archer > /etc/hostname

systemctl enable dhcpcd

pacman -S grub os-prober

grub-install /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

echo "Done."
