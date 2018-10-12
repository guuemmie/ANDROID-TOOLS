#!/bin/bash
##################################################################################
##### GREETINGS ##################################################################
##################################################################################
####                                                                          ####
#### To all developers that contributes to all kind of open source projects   ####
#### Keep up the good work!                                                   #<3#
####                                                                          ####
#### https://sendit.nu & https://github.com/wuseman                           ####
####                                                                          ####
##################################################################################
#### DESCRIPTION #################################################################
##################################################################################
####                                                                          ####
#### Root your huawei p8 lite without lift a finger more then be around and   ####
#### setup phone after reset                                                  ####
####                                                                          ####
#### THIS SCRIPT DOES NOT INCLUDE BOOTLOADER UNLOCK, USE BELOW SCRIPT FOR THIS ###
#### https://github.com/ANDROID-TOOLS/huawei/huawei-bootloader-unlock.sh      ####
####                                                                          ####
#### Enjoy another awesome 'bash' script from wuseman. Questions? Conact me!  ####
####                                                                          ####
##################################################################################
#### Begin of code  ##############################################################
##################################################################################


##################################################################################
# USER SETTINGS - EDIT THIS AFTER YOUR NEEDS                                     #
##################################################################################
# NO SETTINGS NEEDED                                                             #
##################################################################################

# banner
echo -e "\e[1;32m
             _           _     _ 
            | |         (_)   | | Author: wuseman <info@wuseman.com>
__      ____| |_ __ ___  _  __| | Desc: Root your phone within 3 minutes - It's you who decides how fast this will be done..
\ \ /\ / / _  |  __/ _ \| |/ _  | - This script is only contains the rooting section from my wdroid tool and was created
 \ V  V / (_| | | | (_) | | (_| | - for those who do not want to download the entire wdroid tool for just rooting the device.
  \_/\_/ \__,_|_|  \___/|_|\__,_| - wdroid can be downloaded from here: https://github.com/wuseman/wdroid

\e[0m"


echo -e "\e[1;32m*\e[0m \e[1mHold\e[0m\e[0;33m --->\e[0m \e[1mRebooting your device into bootloader mode..\e[0m" ; adb reboot bootloader; sleep 10
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m \e[0m\e[1m Device is now in bootloader mode...\e[0m."
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m Downloading w-recovery-v2(TWRP) from https://sendit.nu/ ..."; wget -P /tmp/ https://sendit.nu/f/w-recovery-v2.zip
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m Extracting w-recovery-v2.zip into /tmp ..."; unzip /tmp/w-recovery-v2.zip -d /tmp
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m We will now flash recovery mode with TWRP..."
echo -e "\e[1;32m*\e[0m < \e[1;32m Press any key twice when you are ready to flash recovery mode (TWRP)...\e[0m > "; read -N 2
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m Flashing recovery mode to get TWRP installed.. (\e[0;31mDO NOT REMOVE CABLE\e[0m)"
fastboot flash recovery_ramdisk /tmp/w-recovery-v2.img; sleep 2
fastboot reboot
echo -e "\e[1;32m*\e[0m < \e[1;32m Press any key twice when your device has booted to your system (We will reboot into recovery mode and join TWRP)..\e[0m > "; read -N 2
adb reboot recovery
echo -e "\e[1m========================================================================================================\e[0m"
echo -e "\e[1;32m*\e[0m\e[1m INFO) \e[0m \e[0;33m-------->\e[0m\e[1m              Device is now booting into recovery mode (TWRP)"
echo -e "\e[1;32m*\e[0m\e[1m INFO) \e[0m \e[0;33m-------->\e[0m\e[1m              and now you need to follow the steps below very carefully:\e[0m."
echo -e "\e[1;32m*\e[0m\e[1m INFO) \e[0m \e[0;33m-------->\e[0m\e[1m              Go to WIPE in upper right corner" 
echo -e "\e[1;32m*\e[0m\e[1m INFO) \e[0m \e[0;33m-------->\e[0m\e[1m              Press on 'Advanced Wipe' the left button"
echo -e "\e[1;32m*\e[0m\e[1m INFO) \e[0m \e[0;33m-------->\e[0m\e[1m              Mark: Dalvik / Art Cache, Cache, Data, Internal Storage and System"
echo -e "\e[1;32m*\e[0m\e[1m INFO) \e[0m \e[0;33m-------->\e[0m\e[1m              --> Swipe to wipe when you have marked above fields"              
echo -e "\e[1;32m*\e[0m\e[1m INFO) \e[0m \e[0;33m-------->\e[0m\e[1m              |   You will see that everything gets wiped from /data/media etc."     
echo -e "\e[1;32m*\e[0m\e[1m INFO) \e[0m \e[0;33m-------->\e[0m\e[1m              --> When this is done press arrow back and go into advanved mode." 
echo -e "\e[1;32m*\e[0m\e[1m INFO) \e[0m \e[0;33m-------->\e[0m\e[1m              In twrp mode go to start menu and press 'Advanced'"
echo -e "\e[1;32m*\e[0m\e[1m INFO) \e[0m \e[0;33m-------->\e[0m\e[1m              Down in left corner press on 'ADB Sideload'"
echo -e "\e[1m========================================================================================================\e[0m"
echo -e "\e[1;32m*\e[0m < \e[1;32m Press any key twice when you see the message 'listening for files from adb sideload'..\e[0m > "; read -N 2
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m Downloading update-data-full.zip from https://sendit.nu into /tmp..."
wget -P /tmp/ https://sendit.nu/f/update-data-full.zip
echo -e "\e[1;32m*\e[0m < \e[1;32m Press enter twice when you are ready to send the package via sideload..." ;read -N 2
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m Flashing your p8 lite device with update-data-full.zip package... (\e[0;31mDO NOT REMOVE THE CABLE\e[0m)"
adb sideload  /tmp/update-data-full.zip
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m Now mark Wipe Daviik-Cache followed by press on reboot and then press bootloader, we gonna flash ramdisk now (\e[0;31mDO NOT REMOVE CABLE\e[0m)";sleep 1
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m Downloading kernel and ramdisk in meanwhile device is rebooting to bootloader mode (w-kernel-and-ramdisk-images-v2.zip) ..."
wget -P /tmp/ https://sendit.nu/f/w-kernel-and-ramdisk-images-v2.zip; sleep 1
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m\e[1m Extracting /tmp/w-kernel-and-ramdisk-images-v2.zip into /tmp/{w-kernel-v2.img/w-ramdisk-v2.img}..."; unzip /tmp/w-kernel-and-ramdisk-images-v2.zip -d /tmp; sleep 1
echo -e "\e[1;32m*\e[0m < \e[1;32m  Press any key twice when you are ready to flash ramdisk.. >" ;read -N 2
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m  Flashing ramdisk... (\e[0;31mDO NOT REMOVE CABLE\e[0m)"
fastboot flash ramdisk /tmp/kernel-and-ramdisk-images-v2/w-ramdisk-v2.img
echo -e "\e[1;32m*\e[0m < \e[1;32m Press any key twice when you are ready to flash kernel... >" ;read -N 2
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m Flashing kernel ... (\e[0;31mDO NOT REMOVE CABLE\e[0m)"
fastboot flash kernel /tmp/kernel-and-ramdisk-images-v2/w-kernel-v2.img
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m\e[0;33m --->\e[0m \e[1m Flashing kernel has been successfully done -> Dont touch your phone until \e[1;31m\e[1mEMUI reset\e[0m\e[1m is done.\e[0m\n\n\e[0m"

echo -e "\n\n\e[1m\e[1;32m*\e[0m \e[1mEnjoy another awesome tool by wuseman. Now you have full control over your phone \n\n"
