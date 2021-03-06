#!/bin/bash

mount -t proc none /proc/
mount -t sysfs none /sys/

#Here is the chroot env , do something here

#Everything inside /root dir
cd /root

#Update before fetching packages
#apt-get update -y
apt-get update

#Chinese language support
apt-get install fcitx-frontend-gtk2 myspell-en-au thunderbird-locale-zh-hans fcitx-frontend-qt4 libreoffice-help-en-gb hyphen-en-us firefox-locale-zh-hans thunderbird-locale-en-us fcitx-ui-qimpanel thunderbird-locale-zh-cn fcitx-ui-classic fcitx-table-wubi thunderbird-locale-en-gb fonts-arphic-ukai mythes-en-au mythes-en-us libreoffice-help-en-us fcitx-frontend-qt5 libreoffice-l10n-en-gb wbritish thunderbird-locale-en fcitx-frontend-gtk3 fcitx-pinyin openoffice.org-hyphenation libreoffice-help-zh-cn fonts-arphic-uming libreoffice-l10n-zh-cn myspell-en-gb fcitx-sunpinyin myspell-en-za libreoffice-l10n-en-za fcitx-module-cloudpinyin hunspell-en-ca fcitx -y

#restricted-extras
apt-get install ubuntu-restricted-extras -y
#Graphic sudo
apt-get install gksu -y

#Web servers and languages
#apt-get install apache2 php5 mysql-server php5-mysql -y
cat > /usr/share/applications/apache2-start.desktop <<EOF
[Desktop Entry]
Type=Application
Name=apache2-start
Exec=xfce4-terminal -e 'sh -c "gksudo service apache2 start; exec bash"'
Icon=application-default-icon
EOF

cat > /usr/share/applications/apache2-stop.desktop <<EOF
[Desktop Entry]
Type=Application
Name=apache2-stop
Exec=xfce4-terminal -e 'sh -c "gksudo service apache2 stop; exec bash"'
Icon=application-default-icon
EOF

cat > /usr/share/applications/mysql-start.desktop <<EOF
[Desktop Entry]
Type=Application
Name=mysql-start
Exec=xfce4-terminal -e 'sh -c "gksudo service mysql start; exec bash"'
Icon=application-default-icon
EOF

cat > /usr/share/applications/mysql-stop.desktop <<EOF
[Desktop Entry]
Type=Application
Name=mysql-stop
Exec=xfce4-terminal -e 'sh -c "gksudo service mysql stop; exec bash"'
Icon=application-default-icon
EOF

#Download tools & torrent downloader
apt-get install uget aria2 curl -y

#rar 7z
apt-get install rar unrar p7zip -y

#Lantern
wget https://github.com/getlantern/lantern-binaries/raw/master/lantern-installer-64.deb
dpkg -i lantern-installer-64.deb
rm lantern-installer-64.deb

#Shadowsocks proxychains
apt-get install shadowsocks proxychains -y

#sshuttle
apt-get install sshuttle -y

#openssh-server
apt-get install openssh-server -y
service ssh stop

#VLC
apt-get install vlc -y

#Chromium-browser
apt-get install chromium-browser -y
apt-get install browser-plugin-freshplayer-pepperflash -y

#cairo-dock
apt-get install cairo-dock -y

#woobuntu self build
apt-get install squashfs-tools dchroot mkisofs -y

#Vim
apt-get install vim -y

#Vim color
cat > /etc/skel/.vimrc <<EOF
syntax enable
set background=dark
colorscheme evening
EOF

#Terminalrc
mkdir -p /etc/skel/.config/xfce4/terminal
cat > /etc/skel/.config/xfce4/terminal/terminalrc <<EOF
[Configuration]
ColorForeground=#b7b7b7
ColorBackground=#131926
ColorCursor=#0f4999
ColorSelection=#163b59
ColorSelectionUseDefault=FALSE
ColorBoldUseDefault=FALSE
ColorPalette=#000000000000;#aaaa00000000;#4444aaaa4444;#aaaa55550000;#11156066fda5;#aaaa2222aaaa;#1a1a9292aaaa;#aaaaaaaaaaaa;#777777777777;#ffff87878787;#4c4ce6e64c4c;#deded8d82c2c;#25ed925efe50;#cccc5858cccc;#4c4ccccce6e6;#ffffffffffff
FontName=文泉驿等宽微米黑 11
MiscAlwaysShowTabs=FALSE
MiscBell=FALSE
MiscBordersDefault=TRUE
MiscCursorBlinks=FALSE
MiscCursorShape=TERMINAL_CURSOR_SHAPE_BLOCK
MiscDefaultGeometry=80x24
MiscInheritGeometry=FALSE
MiscMenubarDefault=TRUE
MiscMouseAutohide=FALSE
MiscToolbarDefault=FALSE
MiscConfirmClose=TRUE
MiscCycleTabs=TRUE
MiscTabCloseButtons=TRUE
MiscTabCloseMiddleClick=TRUE
MiscTabPosition=GTK_POS_TOP
MiscHighlightUrls=TRUE
MiscScrollAlternateScreen=TRUE
ScrollingLines=999999
TabActivityColor=#0f4999
ScrollingOnOutput=FALSE
EOF

#conky
apt-get install git conky-all curl -y

cat > /etc/skel/.conkyrc <<EOF
# set to yes if you want Conky to be forked in the background
 background yes

cpu_avg_samples 2
net_avg_samples 2

out_to_console no

 # X font when Xft is disabled, you can pick one with program xfontsel
#font 7x12
#font 6x10
#font 7x13
#font 8x13
#font 7x12
#font *mintsmild.se*
#font -*-*-*-*-*-*-34-*-*-*-*-*-*-*
#font -artwiz-snap-normal-r-normal-*-*-100-*-*-p-*-iso8859-1

# Use Xft?
 use_xft yes

 # Xft font when Xft is enabled
 xftfont Sans:size=8

own_window_transparent no
#own_window_colour hotpink
# Text alpha when using Xft
xftalpha 0.8

# on_bottom yes

# mail spool
mail_spool \$MAIL

# Update interval in seconds
update_interval 1
# Create own window instead of using desktop (required in nautilus)
own_window yes
own_window_transparent yes
own_window_hints undecorated,below,sticky,skip_taskbar,skip_pager
own_window_type override

# Use double buffering (reduces flicker, may not work for everyone)
double_buffer yes

# Minimum size of text area
minimum_size 260 5
maximum_width 400

# Draw shades?
draw_shades no

# Draw outlines?
draw_outline no

# Draw borders around text
draw_borders no

# Stippled borders?
stippled_borders no

# border margins
border_margin 4

# border width
border_width 1

# Default colors and also border colors
default_color white
default_shade_color white
default_outline_color white

# Text alignment, other possible values are commented
#alignment top_left
#minimum_size 10 10
gap_x 15
gap_y 70
alignment top_right
#alignment bottom_left
#alignment bottom_right

# Gap between borders of screen and text

# Add spaces to keep things from moving about?  This only affects certain objects.
use_spacer none

# Subtract file system buffers from used memory?
no_buffers yes

# set to yes if you want all text to be in uppercase
uppercase no

# none, xmms, bmp, audacious, infopipe (default is none)
# xmms_player bmp

# boinc (seti) dir
# seti_dir /opt/seti

# Possible variables to be used:
#
#      Variable         Arguments                  Description                
#  acpiacadapter                     ACPI ac adapter state.                   
#  acpifan                           ACPI fan state                           
#  acpitemp                          ACPI temperature.                        
#  adt746xcpu                        CPU temperature from therm_adt746x       
#  adt746xfan                        Fan speed from therm_adt746x             
#  battery           (num)           Remaining capasity in ACPI or APM        
#                                    battery. ACPI battery number can be      
#                                    given as argument (default is BAT0).     
#  buffers                           Amount of memory buffered                
#  cached                            Amount of memory cached                  
#  color             (color)         Change drawing color to color            
#  cpu                               CPU usage in percents                    
#  cpubar            (height)        Bar that shows CPU usage, height is      
#                                    bar's height in pixels                   
#  downspeed         net             Download speed in kilobytes              
#  downspeedf        net             Download speed in kilobytes with one     
#                                    decimal                                  
#  exec              shell command   Executes a shell command and displays    
#                                    the output in torsmo. warning: this      
#                                    takes a lot more resources than other    
#                                    variables. I'd recommend coding wanted   
#                                    behaviour in C and posting a patch :-).  
#  execi             interval, shell Same as exec but with specific interval. 
#                    command         Interval can't be less than              
#                                    update_interval in configuration.        
#  fs_bar            (height), (fs)  Bar that shows how much space is used on 
#                                    a file system. height is the height in   
#                                    pixels. fs is any file on that file      
#                                    system.                                  
#  fs_free           (fs)            Free space on a file system available    
#                                    for users.                               
#  fs_free_perc      (fs)            Free percentage of space on a file       
#                                    system available for users.              
#  fs_size           (fs)            File system size                         
#  fs_used           (fs)            File system used space                   
#  hr                (height)        Horizontal line, height is the height in 
#                                    pixels                                   
#  i2c               (dev), type, n  I2C sensor from sysfs (Linux 2.6). dev   
#                                    may be omitted if you have only one I2C  
#                                    device. type is either in (or vol)       
#                                    meaning voltage, fan meaning fan or temp 
#                                    meaning temperature. n is number of the  
#                                    sensor. See /sys/bus/i2c/devices/ on     
#                                    your local computer.                     
#  kernel                            Kernel version                           
#  loadavg           (1), (2), (3)   System load average, 1 is for past 1     
#                                    minute, 2 for past 5 minutes and 3 for   
#                                    past 15 minutes.                         
#  machine                           Machine, i686 for example                
#  mails                             Mail count in mail spool. You can use    
#                                    program like fetchmail to get mails from 
#                                    some server using your favourite         
#                                    protocol. See also new_mails.            
#  mem                               Amount of memory in use                  
#  membar            (height)        Bar that shows amount of memory in use   
#  memmax                            Total amount of memory                   
#  memperc                           Percentage of memory in use              
#  new_mails                         Unread mail count in mail spool.         
#  nodename                          Hostname                                 
#  outlinecolor      (color)         Change outline color                     
#  pre_exec          shell command   Executes a shell command one time before 
#                                    torsmo displays anything and puts output 
#                                    as text.                                 
#  processes                         Total processes (sleeping and running)   
#  running_processes                 Running processes (not sleeping),        
#                                    requires Linux 2.6                       
#  shadecolor        (color)         Change shading color                     
#  stippled_hr       (space),        Stippled (dashed) horizontal line        
#                    (height)        
#  swapbar           (height)        Bar that shows amount of swap in use     
#  swap                              Amount of swap in use                    
#  swapmax                           Total amount of swap                     
#  swapperc                          Percentage of swap in use                
#  sysname                           System name, Linux for example           
#  time              (format)        Local time, see man strftime to get more 
#                                    information about format                 
#  totaldown         net             Total download, overflows at 4 GB on     
#                                    Linux with 32-bit arch and there doesn't 
#                                    seem to be a way to know how many times  
#                                    it has already done that before torsmo   
#                                    has started.                             
#  totalup           net             Total upload, this one too, may overflow 
#  updates                           Number of updates (for debugging)        
#  upspeed           net             Upload speed in kilobytes                
#  upspeedf          net             Upload speed in kilobytes with one       
#                                    decimal                                  
#  uptime                            Uptime                                   
#  uptime_short                      Uptime in a shorter format               
#
#  seti_prog                         Seti@home current progress
#  seti_progbar      (height)        Seti@home current progress bar
#  seti_credit                       Seti@hoome total user credit


# variable is given either in format \$variable or in \${variable}. Latter
# allows characters right after the variable and must be used in network
# stuff because of an argument
#\${font Dungeon:style=Bold:pixelsize=10}I can change the font as well
#\${font Verdana:size=10}as many times as I choose
#\${font Perry:size=10}Including UTF-8,
# stuff after 'TEXT' will be formatted on screen
#\${font Grunge:size=12}\${time %a  %b  %d}\${alignr -25}\${time %k:%M}


TEXT
\${color white}SYSTEM \${hr 1}\${color}

Hostname: \$alignr\$nodename
Kernel: \$alignr\$kernel
Uptime: \$alignr\$uptime
Temp: \${alignr}\${acpitemp}°C

CPU: \${alignr}\${freq dyn} MHz
Processes: \${alignr}\$processes (\$running_processes running)
Load: \${alignr}\$loadavg

CPU1 \${alignr}\${cpu cpu1}%
\${cpubar 4 cpu1}

Ram \${alignr}\$mem / \$memmax (\$memperc%)
\${membar 4}
swap \${alignr}\$swap / \$swapmax (\$swapperc%)
\${swapbar 4}

Highest CPU \$alignr CPU%  MEM%
\${top name 1}\$alignr\${top cpu 1}   \${top mem 1}
\${top name 2}\$alignr\${top cpu 2}   \${top mem 2}
\${top name 3}\$alignr\${top cpu 3}   \${top mem 3}

Highest MEM \$alignr CPU%  MEM%
\${top_mem name 1}\$alignr\${top_mem cpu 1}   \${top_mem mem 1}
\${top_mem name 2}\$alignr\${top_mem cpu 2}   \${top_mem mem 2}
\${top_mem name 3}\$alignr\${top_mem cpu 3}   \${top_mem mem 3}

\${color white}FILE SYSTEM \${hr 1}\${color}

Root: \${alignr}\${fs_free /} / \${fs_size /}
\${fs_bar 4 /}
Home: \${alignr}\${fs_free /home} / \${fs_size /home}
\${fs_bar 4 /home}

\${color white}NETWORK \${hr 1}\${color}

Down \${downspeed wlan0} k/s \${alignr}Up \${upspeed wlan0} k/s
\${downspeedgraph wlan0 25,107} \${alignr}\${upspeedgraph wlan0 25,107}
Total \${totaldown wlan0} \${alignr}Total \${totalup wlan0}
EOF

#Fonts - source code pro
#wget https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip
#unzip 1.030R-it.zip
#cp source-code-pro-2.010R-ro-1.030R-it/OTF/*.otf /usr/local/share/fonts/
#rm 1.030R-it.zip
#rm -rf source-code-pro-2.010R-ro-1.030R-it

#fonts
apt-get install ttf-wqy-microhei -y

#dev-tools - only for developers
#apt-get install ia32-libs -y
#apt-get install bison build-essential curl flex git gnupg gperf libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk2.8-dev libxml2 libxml2-utils lzop openjdk-7-jdk openjdk-7-jre pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev -y
apt-get install git-core build-essential libssl-dev libncurses5-dev unzip -y
apt-get install subversion mercurial -y
apt-get install build-essential subversion libncurses5-dev gawk gcc-multilib flex git-core gettext libssl-dev -y

apt-get install bison g++-multilib git gperf libxml2-utils make python-networkx zip bison build-essential curl flex git gnupg gperf libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk2.8-dev libxml2 libxml2-utils lzop openjdk-7-jdk openjdk-7-jre pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev g++-multilib gcc-multilib lib32ncurses5-dev lib32readline6-dev -y

#adb
apt-get install android-tools-adb android-tools-fastboot -y

#Whois
apt-get install whois -y

#steghide
apt-get install steghide -y

#chntpw
apt-get install chntpw -y

#foremost
apt-get install foremost -y

#zenmap
apt-get install zenmap -y

#httrack
apt-get install httrack -y

#dsniff - dnsspoof
apt-get install dsniff -y

#sslsplit
apt-get install sslsplit -y

#sslstrip
apt-get install sslstrip -y

#siege
apt-get install siege -y

#medusa
apt-get install medusa -y

#binwalk
apt-get install binwalk -y

#radare2
apt-get install radare2 -y

#edb-debugger
sudo apt-get install build-essential libboost-dev libqt5xmlpatterns5-dev qtbase5-dev qt5-default -y
mkdir -p /opt/woobuntu
cd /opt/woobuntu
git clone --recursive https://github.com/eteran/edb-debugger.git
cd edb-debugger
git clone --depth=50 --branch=3.0.4 https://github.com/aquynh/capstone.git
pushd capstone
./make.sh
sudo ./make.sh install
popd
qmake
make
make install
cd /root
cat > /usr/share/applications/edb-debugger.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=edb-debugger
Icon=application-default-icon
Exec=edb
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF

#Wireshark
apt-get install wireshark -y
cat > /usr/share/applications/wireshark-asroot.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=wireshark
Icon=application-default-icon
Exec=gksudo wireshark
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF

#reaver
apt-get install reaver -y

#Aircrack-ng
apt-get install libssl-dev -y
apt-get install git libsqlite3-dev libnl-3-dev libnl-genl-3-dev -y
git clone https://github.com/aircrack-ng/aircrack-ng
cd aircrack-ng
make
make strip
make install
cd /root
rm -rf aircrack-ng

#mdk3
tar -zxvf mdk3-v6-fix.tar.gz
cd mdk3-v6
make
make install
cd /root
rm -rf mdk3-v6
rm mdk3-v6-fix.tar.gz

#hackrf
apt-get install gnuradio gr-osmosdr hackrf -y

#hostapd-wpe
mkdir -p /opt/woobuntu/config
cd /opt/woobuntu
git clone https://github.com/hph86/hostapd-wpe.git
wget http://hostap.epitest.fi/releases/hostapd-2.5.tar.gz
tar -zxf hostapd-2.5.tar.gz
cd hostapd-2.5
patch -p1 < ../hostapd-wpe/hostapd-wpe.patch 
cd hostapd
sed -r 's/#CONFIG_LIBNL32=y/CONFIG_LIBNL32=y/' .config -i
make
cd ../../hostapd-wpe/certs
./bootstrap
cd /opt/woobuntu/config
wget https://raw.githubusercontent.com/sensepost/mana/master/run-mana/conf/hostapd-karma.conf
cd /root
cat > /opt/woobuntu/wifi_hijack.sh <<EOF
#!/bin/bash
source /etc/profile.d/rvm.sh
cd /opt/woobuntu/metasploit-framework
./msfconsole -r /opt/woobuntu/config/msf_capture.rc
EOF

chmod 777 /opt/woobuntu/wifi_hijack.sh

cat > /opt/woobuntu/config/dnsmasq.conf <<EOF
domain-needed 
bogus-priv 
expand-hosts 
domain=example.com 
dhcp-range=192.168.1.20,192.168.1.125,24h 
EOF

#android-tools
mkdir -p /opt/woobuntu/android-tools
cd /opt/woobuntu/android-tools
wget https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.1.0.jar
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.0.2.jar
cd /root

#Wifite
apt-get install git tshark pyrit -y
mkdir -p /opt/woobuntu/wifite
cd /opt/woobuntu/wifite
wget https://raw.github.com/derv82/wifite/master/wifite.py
chmod +x wifite.py
sed -r 's/\/usr\/share\/wfuzz\/wordlist\/fuzzdb\/wordlists-user-passwd\/passwds\/phpbb.txt/\/opt\/woobuntu\/dict\/10_million_password_list_top_100000.txt/' wifite.py -i
cd /usr/bin
ln -s /opt/woobuntu/wifite/wifite.py wifite
cd /root
cat > /usr/share/applications/wifite.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=wifite
Icon=application-default-icon
Exec=xfce4-terminal -e 'sh -c "gksudo airmon-ng check kill;sudo wifite --aircrack;exec bash"'
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF

#SecList
mkdir -p /opt/woobuntu/dict
cd /opt/woobuntu/dict
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/10_million_password_list_top_100.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/10_million_password_list_top_500.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/10_million_password_list_top_1000.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/10_million_password_list_top_10000.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/10_million_password_list_top_100000.txt
cd /root

#Burp
apt-get install default-jre -y
mkdir -p /opt/woobuntu/burp
cd /opt/woobuntu/burp
wget https://portswigger.net/DownloadUpdate.ashx?Product=Free --content-disposition 
ln -s *.jar burp.jar
cd /root
cat > /usr/share/applications/burp.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=burp
Icon=application-default-icon
Exec=java -jar /opt/woobuntu/burp/burp.jar
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF

#jd-gui
wget https://github.com/java-decompiler/jd-gui/releases/download/v1.4.0/jd-gui_1.4.0-0_all.deb
dpkg -i jd-gui_1.4.0-0_all.deb
rm jd-gui_1.4.0-0_all.deb

#sqlmap
apt-get install git -y
mkdir -p /opt/woobuntu
cd /opt/woobuntu
git clone https://github.com/sqlmapproject/sqlmap
cd /usr/bin
ln -s /opt/woobuntu/sqlmap/sqlmap.py sqlmap
cd /root

#docker.io
#wget -qO- https://get.docker.com/ | sh

#service docker start
#docker pull lxj616/docker-kali-custom-tools
#service docker stop

#cat > /usr/share/applications/docker-metasploit.desktop <<EOF
#[Desktop Entry]
#Version=1.0
#Type=Application
#Name=docker-metasploit
#Icon=application-default-icon
#Exec=xfce4-terminal -e 'sh -c "sudo docker run --rm --name=lxj616 --cap-add=ALL --privileged=true -t -i lxj616/docker-kali-custom-tools /usr/bin/msfconsole;exec bash"'
#NoDisplay=false
#Categories=woobuntu;
#StartupNotify=true
#Terminal=false
#EOF

#Metasploit-community
mkdir -p /opt/woobuntu
cd /opt/woobuntu
wget http://downloads.metasploit.com/data/releases/metasploit-latest-linux-x64-installer.run
chmod +x metasploit-latest-linux-x64-installer.run
#./metasploit-latest-linux-x64-installer.run
#rm metasploit-latest-linux-x64-installer.run
cd /root
#cat > /usr/share/applications/service_metasploit_start.desktop <<EOF
#[Desktop Entry]
#Version=1.0
#Type=Application
#Name=service_metasploit_start
#Icon=application-default-icon
#Exec=xfce4-terminal -e '/bin/bash -c "service metasploit start; exec bash"'
#NoDisplay=false
#Categories=woobuntu;
#StartupNotify=true
#Terminal=true
#EOF
#cat > /usr/share/applications/service_metasploit_stop.desktop <<EOF
#[Desktop Entry]
#Version=1.0
#Type=Application
#Name=service_metasploit_stop
#Icon=application-default-icon
#Exec=xfce4-terminal -e '/bin/bash -c "service metasploit stop; exec bash"'
#NoDisplay=false
#Categories=woobuntu;
#StartupNotify=true
#Terminal=true
#EOF
#cat > /usr/share/applications/metasploit.desktop <<EOF
#[Desktop Entry]
#Version=1.0
#Type=Application
#Name=metasploit_console
#Icon=application-default-icon
#Exec=xfce4-terminal -e '/bin/bash -c "sudo msfconsole; exec bash"'
#NoDisplay=false
#Categories=woobuntu;
#StartupNotify=true
#Terminal=true
#EOF

#Metasploit
apt-get install git ruby ruby-dev nmap git-core curl zlib1g-dev build-essential libpq5 libpq-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev libpcap-dev autoconf libgmp-dev -y
mkdir -p /opt/woobuntu
cd /opt/woobuntu
git clone https://github.com/rapid7/metasploit-framework
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://get.rvm.io | bash -s stable --autolibs=enabled --ruby=2.1.7
source /usr/local/rvm/scripts/rvm
echo "source /etc/profile.d/rvm.sh" >> /root/.bashrc
echo "source /etc/profile.d/rvm.sh" >> /etc/skel/.bashrc
rvm install 2.1.7
rvm use 2.1.7 --default
cd /opt/woobuntu/metasploit-framework
rvm --default use ruby-2.1.7@metasploit-framework
gem install bundler
bundle install
cd /root
cat > /usr/share/applications/metasploit.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=metasploit
Icon=application-default-icon
Exec=xfce4-terminal -e '/bin/bash -c "source /etc/profile.d/rvm.sh;cd /opt/woobuntu/metasploit-framework;./msfconsole; exec bash"'
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=true
EOF
#armitage
mkdir -p /opt/woobuntu
cd /opt/woobuntu
wget http://www.fastandeasyhacking.com/download/armitage150813.tgz
tar -zxvf armitage150813.tgz
rm armitage150813.tgz
cd /root
cat > /usr/share/applications/armitage.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=armitage
Icon=application-default-icon
Exec=/bin/bash -c "service metasploit start;cd /opt/woobuntu/armitage;gksudo ./armitage"
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF

#Arachni
mkdir -p /opt/woobuntu
cd /opt/woobuntu
wget https://github.com/Arachni/arachni/releases/download/v1.3.2/arachni-1.3.2-0.5.9-linux-x86_64.tar.gz
tar -zxvf arachni-1.3.2-0.5.9-linux-x86_64.tar.gz
rm arachni-1.3.2-0.5.9-linux-x86_64.tar.gz
mv arachni* arachni
sed -r 's/(.*)"/\1:\/opt\/woobuntu\/arachni\/bin"/' /etc/environment -i
cd /root
cat > /usr/share/applications/arachni.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=arachni
Icon=application-default-icon
Exec=xfce4-terminal -e '/bin/bash -c "gksudo /opt/woobuntu/arachni/bin/arachni_web; exec bash"'
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=true
EOF

#BDFactory

apt-get install python-pip -y
mkdir -p /opt/woobuntu
cd /opt/woobuntu
git clone https://github.com/secretsquirrel/the-backdoor-factory
cd the-backdoor-factory
./install.sh
cd /root

#beEF
apt-get install ruby sqlite3 ruby-sqlite3 -y
mkdir -p /opt/woobuntu
cd /opt/woobuntu
git clone https://github.com/beefproject/beef
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://get.rvm.io | bash -s stable --autolibs=enabled --ruby=2.1.5
source /usr/local/rvm/scripts/rvm
echo "source /etc/profile.d/rvm.sh" >> /root/.bashrc
echo "source /etc/profile.d/rvm.sh" >> /etc/skel/.bashrc
rvm install 2.1.5
rvm use 2.1.5 --default
cd /opt/woobuntu/beef
rvm --default use ruby-2.1.5@beef
gem install bundler
bundle install
cd /root
cat > /usr/share/applications/beef.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=beef
Icon=application-default-icon
Exec=xfce4-terminal -e '/bin/bash -c "source /etc/profile.d/rvm.sh;cd /opt/woobuntu/beef;./beef; exec bash"'
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=true
EOF
chmod -R a+w /opt/woobuntu/beef

#Weevely
apt-get install python-dev python-dateutil python-pip -y
pip install prettytable Mako PyYAML PySocks
mkdir -p /opt/woobuntu
cd /opt/woobuntu
git clone https://github.com/epinna/weevely3.git
ln -s /opt/woobuntu/weevely3/weevely.py /usr/bin/weevely
cd /root

#Mitmf
mkdir /opt/woobuntu
cd /opt/woobuntu
apt-get install python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev  python-pip -y
#pip install virtualenvwrapper
#source /usr/local/bin/virtualenvwrapper.sh
#mkvirtualenv MITMf -p /usr/bin/python2.7
git clone https://github.com/byt3bl33d3r/MITMf
cd MITMf && git submodule init && git submodule update --recursive
pip install -r requirements.txt
cd /root

#dnsmasq
#apt-get install dnsmasq -y
#service dnsmasq stop

#wine
dpkg --add-architecture i386 
apt-get update
apt-get install wine -y
apt-get install zlib1g-dev:i386 -y

#wine-qq
unzip wine-qqintl.zip
cd wine-qqintl
dpkg -i wine-qqintl_0.1.3-2_i386.deb
apt-get -f install -y 
cd /root

#firefox
mv mozilla_profile.tar.gz /etc/skel
cd /etc/skel
tar -zxvf mozilla_profile.tar.gz
chmod -R 777 .mozilla
rm mozilla_profile.tar.gz
cd /root
mkdir -p /opt/woobuntu
mv wooyun-firefox.tar.gz /opt/woobuntu
cd /opt/woobuntu
tar -zxvf wooyun-firefox.tar.gz
chmod -R 777 wooyun-firefox
rm wooyun-firefox.tar.gz
cd /root

#pyobfuscate
mkdir -p /opt/woobuntu
cd /opt/woobuntu
git clone https://github.com/astrand/pyobfuscate
cd pyobfuscate
python setup.py install
cd /root

#Configure the system

#User-dirs
mkdir -p /etc/skel/.config
cat > /etc/skel/.config/user-dirs.dirs <<EOF
XDG_DESKTOP_DIR="\$HOME"
XDG_DOWNLOAD_DIR="\$HOME"
XDG_TEMPLATES_DIR="\$HOME"
XDG_PUBLICSHARE_DIR="\$HOME"
XDG_DOCUMENTS_DIR="\$HOME"
XDG_MUSIC_DIR="\$HOME"
XDG_PICTURES_DIR="\$HOME"
XDG_VIDEOS_DIR="\$HOME"
EOF

#timezone
#dpkg-reconfigure tzdata

#Locale
#locale-gen zh_CN.UTF-8
#update-locale LANG=zh_CN.utf8

#Disable web service auto start on boot
#/usr/sbin/update-rc.d -f postgresql disable
/usr/sbin/update-rc.d -f ssh disable
service metasploit stop
/usr/sbin/update-rc.d -f metasploit disable
#/usr/sbin/update-rc.d -f docker disable
#/usr/sbin/update-rc.d -f apache2 disable
#echo "manual" > /etc/init/mysql.override

#Woobuntu menu
sed '$s/<\/Menu>/    <Menu>\n        <Name>woobuntu<\/Name>\n        <Directory>woobuntu.directory<\/Directory>\n        <Include>\n            <Category>woobuntu<\/Category>\n        <\/Include>\n    <\/Menu>\n<\/Menu>/' /etc/xdg/xdg-xubuntu/menus/xfce-applications.menu -i

sed '$s/<\/Menu>/    <Menu>\n        <Name>woobuntu<\/Name>\n        <Directory>woobuntu.directory<\/Directory>\n        <Include>\n            <Category>woobuntu<\/Category>\n        <\/Include>\n    <\/Menu>\n<\/Menu>/' /etc/xdg/menus/xfce-applications.menu -i

cat > /usr/share/desktop-directories/woobuntu.directory <<EOF
[Desktop Entry]
Version=1.0
Type=Directory
Name=Woobuntu
Icon=applications-other
NoDisplay=false
Categories=X-XFCE;X-Xfce-Toplevel;
StartupNotify=false
Terminal=false
EOF

#resource
mkdir -p /opt/woobuntu/config
mkdir -p /opt/woobuntu/log
cat > /opt/woobuntu/config/msf_capture.rc <<EOF
use auxiliary/server/capture/pop3
set SRVPORT 110
set SSL false
run
spool /opt/woobuntu/log/console.log

use auxiliary/server/capture/pop3
set SRVPORT 995
set SSL true
run
spool /opt/woobuntu/log/console.log

use auxiliary/server/capture/imap
set SSL false
set SRVPORT 143
run
spool /opt/woobuntu/log/console.log

use auxiliary/server/capture/imap
set SSL true
set SRVPORT 993
run
spool /opt/woobuntu/log/console.log

use auxiliary/server/capture/smtp
set SSL false
set SRVPORT 25
run
spool /opt/woobuntu/log/console.log

use auxiliary/server/capture/smtp
set SSL true
set SRVPORT 465
run
spool /opt/woobuntu/log/console.log

EOF

#End of chroot env , cleanup and repack

apt-get clean
apt-get -d install apache2 php5 mysql-server php5-mysql -y
rm -rf /tmp/*
echo "" > /etc/hosts
cat > /etc/resolv.conf <<EOF
nameserver 8.8.8.8
nameserver 114.114.114.114
EOF
umount /proc/
umount /sys/
exit

