#!/bin/bash
clear

#    rpi-fbcp Installing by wdmomo

echo -e "       \033[0;32m█              █\033[0m     "
echo -e "  \033[0;33m█\033[0m     \033[0;32m█            █\033[0m     \033[0;33m█"
echo -e "\033[0;33m  █  ████████████████████  █"
echo -e "\033[0;33m  ███████\033[1;37m██\033[0;33m████████\033[1;37m██\033[0;33m███████"
echo -e "\033[0;33m  ██████████████████████████"
echo -e "\033[0;33m    ██████████████████████ "
echo -e "\033[0;33m     ████████████████████  "
echo -e "\033[0;33m        █             █   "
echo -e "\033[0;33m       █               █  "
echo ""
echo ""
echo "*****************************************************************"
echo "*                                                               *"
echo "*                      rpi-fbcp by wdmomo                       *"
echo "*                                                               *"
echo "*****************************************************************"
sleep 3
cd Pi3Binary/
sudo install fbcp /usr/local/bin/fbcp
cd /etc/
sudo sed -i 's/fbcp\ &//g' rc.local
sudo sed -i '/^exit\ 0/i\fbcp\ &' rc.local
sudo sed -i '$a spi-bcm2835' modules
sudo sed -i '$a flexfb' modules
sudo sed -i '$a fbtft_device' modules
sudo touch /etc/modprobe.d/fbtft.conf
sudo echo "options fbtft_device name=flexfb debug=3 rotate=0 bgr=1 fps=60 custom=1 height=240 width=240 speed=64000000 gpios=reset:7,dc:25,led:24" >> /etc/modprobe.d/fbtft.conf
sudo echo "options flexfb setaddrwin=0 buswidth=8  width=240 height=240 init=-1,0x11,-2,120,-1,0x36,0xC0,-1,0x37,0x00,80,-1,0x3A,0x05,-1,0xB1,6,1,1,-1,0xB2,0x0C,0x0C,0x00,0x33,0x33,-1,0xB7,0x35,-1,0xBB,55,-1,0xC0,0x2C,-1,0xC2,0x01,-1,0xC3,0x0B,-1,0xC4,0x20,-1,0xC6,0x0F,-1,0xD0,0xA4,0xA1,-1,0x21,-1,0xE0,0x00,0x19,0x1E,0x0A,0x09,0x15,0x3D,0x44,0x51,0x12,0x03,0x00,0x3F,0x3F,-1,0xE1,0x00,0x18,0x1E,0x0A,0x09,0x25,0x3F,0x43,0x52,0x33,0x03,0x00,0x3F,0x3F,-1,0x29,-3" >> /etc/modprobe.d/fbtft.conf
cd /boot/
sudo sed -i 's/#hdmi_safe=1/hdmi_safe=1/g' config.txt
sudo sed -i 's/#dtparam=spi=on/dtparam=spi=on/g' config.txt
#sudo sed -i '$a dtoverlay=pwm-2chan,pin=18,func=2,pin2=17,func2=4' config.txt
sudo sed -i '$a enable_uart=1' config.txt
sudo sed -i '$a arm_freq=1000' config.txt
sudo sed -i '$a gpu_mem_256=128' config.txt
sudo sed -i '$a gpu_mem_1024=256' config.txt
sudo sed -i '$a core_freq=500' config.txt
sudo sed -i '$a sdram_freq=600' config.txt
sudo sed -i '$a over_voltage=6' config.txt
sudo sed -i '$a overscan_scale=1' config.txt
sudo sed -i '$a hdmi_force_hotplug=1' config.txt
sudo sed -i '$a hdmi_group=2' config.txt
sudo sed -i '$a hdmi_mode=87' config.txt
sudo sed -i '$a hdmi_cvt=240 240 60 6 0 0 0' config.txt
sudo sed -i '$a hdmi_drive=2' config.txt
sudo sed -i '$a display_rotate=2' config.txt
sudo sed -i '$a display_rotate=0x10000' config.txt
sudo sed -i '$a avoid_warnings=1' config.txt
sudo rm -rf rpi-fbcp*
cd ~
sudo rm -rf rpi-fbcp*
sudo reboot
