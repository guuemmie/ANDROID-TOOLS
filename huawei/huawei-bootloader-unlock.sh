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
#### Script to unlock your huawei bootloader                                  ####
####                                                                          ####
#### Enjoy another awesome 'bash' script from wuseman. Questions? Conact me!  ####
####                                                                          ####
##################################################################################
#### Begin of code  ##############################################################
##################################################################################


##################################################################################
# USER SETTINGS - EDIT THIS AFTER YOUR NEEDS                                     #
##################################################################################
BOOTLOADERKEY="ADDYOURBOOTLOADERKEYHERE"



# banner
banner() {
clear; sleep 1
echo -e "\e[1;32m
             _           _     _ 
            | |         (_)   | | Author: wuseman <info@wuseman.com>
__      ____| |_ __ ___  _  __| | Desc: Unlock your bootloader fully automated
\ \ /\ / / _  |  __/ _ \| |/ _  | - This script is only contains the unlocking section from my wdroid tool and was created
 \ V  V / (_| | | | (_) | | (_| | - for those who do not want to download the entire wdroid tool for just unlock the huawei bootloader.
  \_/\_/ \__,_|_|  \___/|_|\__,_| - wdroid can be downloaded from here: https://github.com/wuseman/wdroid

\e[0m"
}
# root required ..
if [[ $EUID -ne 0 ]]; then
  echo -e "\nYou must be Administrator to run this script\n" 2>&1
 exit 1
fi

# is your device connected..
if [ ! "$(adb devices -l | grep model)" ]; then
echo "Phone is not connected properly, please fix this."
exit
fi

if [[ -z "$BOOTLOADERKEY" ]]; then
  echo "No bootloaderkey has been found"
exit 1
fi

# did you boot into normal runmode
if [ ! "$(adb shell getprop | grep runmode | awk '{print $2}' | sed 's/\[//g' | sed 's/\]//g')" ]; then
echo "Your phone is not in normal mode, please enter bootloader mode manual or restart your device to a normal mode"
else
echo -e "\e[1;32m*\e[0m \e[1mPlease wait\e[0m \e[0;33m-->\e[0m \e[1mRebooting your device into bootloader mode..\e[0m" 
adb reboot bootloader &> /dev/nulll
echo -e "\e[1;32m*\e[0m \e[1mDone\e[0m \e[0;33m--------->\e[0m\e[1m Device are now in runmode: bootloader\e[0m."
echo -e "\e[1;32m*\e[0m \e[1mUnlock \e[0;33m------->\e[0m\e[1m Hacking the \e[0;31m\e[1mlocked\e[0m \e[1mbootloader for you so it will be fully \e[1;32m\e[1munlocked.\e[0m"
sleep 10

echo -e "\e[1;32m*\e[0m\e[1m $(whoami | tr [:lower:] [:upper:]) \e[0;33m------>\e[0m \e[0m\e[1mYour device need your attention, press volume up and press power button.\e[0m"
oemunlock=$(fastboot oem unlock $BOOTLOADERKEY | grep 'unlocked' &> /dev/null)
echo -e "\e[1;32m*\e[0m\e[1m Done \e[0;33m--------->\e[0m \e[1mSuccessfully \e[1;32m\e[1m\e[3mUnlocked\e[0m \e[1mbootloader..\e[0m"

if [ "$oemunlock &> /dev/null" ]; then
   echo "Your bootloader is already unlocked"
  exit
 else
      fastboot oem unlock $BOOTLOADERKEY 
 fi
fi

echo -e "\n\n\e[1m\e[1;32m*\e[0m \e[1mEnjoy another awesome tool by wuseman, now you - Now you have control over your phone - Dont touch your phone until \e[1;31m\e[1mreset\e[0m\e[1m is done.\e[0m\n\n\e[0m"

