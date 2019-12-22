#!/bin/bash


# This is a UK setup.
# This is a BIOS setup, not UEFI.
# This starts fdisk on /dev/sda.
# This expects swap on /dev/sda1.


echo "Setting keyboard layout"
loadkeys uk

fdisk /dev/sda

mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt

mkswap /dev/sda1
swapon /dev/sda1

timedatectl set-ntp true

sudo sed -i '/uk/!d' /etc/pacman.d/mirrorlist

pacstrap /mnt base base-devel linux linux-firmware vim

pacstrap /mnt netctl iw wpa_supplicant dialog wpa_actiond

genstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

