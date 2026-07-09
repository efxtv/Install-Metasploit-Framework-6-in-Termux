#!/data/data/com.termux/files/usr/bin/bash

set -e

# Colors
clear='\033[0m'
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'

latestverr() {
  curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/Gemfile.lock -s \
    | grep metasploit-framework | head -1 \
    | sed 's/ //g' | sed 's#(# #g;s#)##g;s# #: #g' \
    | awk '{print $2}'
}

bars() {
  echo 'ZG90cygpewplY2hvIC1lbiAiLiIKc2xlZXAgMC4xCmVjaG8gLWVuICIuIgpzbGVlcCAwLjEKZWNo
byAtZW4gIi4iCnNsZWVwIDAuMQplY2hvIC1lbiAiLiIKZWNobyAtZW4gIi4iCnNsZWVwIDAuMQpl
Y2hvIC1lbiAiLiIKc2xlZXAgMC4xCmVjaG8gLWVuICIuIgpzbGVlcCAwLjEKZWNobyAtZW4gIi4i
CnNsZWVwIDAuMQplY2hvIC1lbiAiLiIKc2xlZXAgMC4xCmVjaG8gLWVuICIuIgpzbGVlcCAwLjEK
ZWNobyAtZW4gIi4iCnNsZWVwIDAuMQplY2hvIC1lbiAiLiIKc2xlZXAgMC4xCmVjaG8gLWVuICIu
IgpzbGVlcCAwLjEKZWNobyAtZW4gIi4iCnNsZWVwIDAuMQplY2hvIC1lbiAiLiIKc2xlZXAgMC4x
CmVjaG8gLWVuICIuIgpzbGVlcCAwLjEKZWNobyAtZW4gIi4iCnNsZWVwIDAuMQplY2hvIC1lbiAi
LiIKc2xlZXAgMC4xCmVjaG8gLWVuICIuIgpzbGVlcCAwLjEKZWNobyAtZW4gIi4iCnNsZWVwIDAu
MQplY2hvIC1lbiAiLiIKc2xlZXAgMC4xCmVjaG8gLWVuICIuIgpzbGVlcCAwLjEKZWNobyAtZW4g
Ii4iCnNsZWVwIDAuMQplY2hvIC1lbiAiLiIKc2xlZXAgMC4xCmVjaG8gLWVuICIuIgpzbGVlcCAw
LjEKZWNobyAtZW4gIi4iCnNsZWVwIDAuMQplY2hvIC1lbiAiLiIKc2xlZXAgMC4xCmVjaG8gLWVu
ICIuIgpzbGVlcCAwLjEKZWNobyAtZW4gIi4iCnNsZWVwIDAuMQplY2hvIC1lbiAiLiIKc2xlZXAg
MC4xCmVjaG8gLWVuICIuIgpzbGVlcCAwLjEKZWNobyAtZW4gIi4iCnNsZWVwIDAuMQplY2hvIC1l
biAiLiIKc2xlZXAgMC4xCmVjaG8gLWVuICIuIgpzbGVlcCAwLjEKZWNobyAtZW4gIi4iCmVjaG8g
LWVuICIuIgplY2hvCn0KCmRvdHM=' | base64 -d | bash
}

banner() {
  echo -e "
                
      SCRIPT BY |D|E|D|S|H|I|T| EDITED BY EFX TV
                  ${Green}[ ${Yellow}t.me/efxtv${clear} ${Green}]${clear}
"
}

# ── Intro ──────────────────────────────────────────────
bars
banner
bars

echo -e "[${Green}+${clear}] Latest version found ${Red}\c"; latestverr
echo -e "${clear}[${Green}+${clear}] No clean..."
sleep 1
echo -e "[${Green}+${clear}] No Gem Problem..."
sleep 1
echo -e "[${Green}+${clear}] Nokogiri fixed..."
sleep 1
echo -e "[${Green}+${clear}] ${Green}nio4r 2.5.8${clear} fixed..."
sleep 1
echo -e "[${Green}+${clear}] Follow the video shared in ${Yellow}t.me/efxtv ${clear}"
sleep 1

cd "$HOME"
echo -e "[${Green}+${clear}] Done"
bars
echo
echo -e "[${Green}+${clear}] Please wait"
sleep 3
echo -e "[${Green}+${clear}] Update termux"
sleep 3
clear
banner
echo
sleep 1

# ── Erase Old Metasploit ───────────────────────────────
bars
echo -e "[${Green}+${clear}] Erase Old Metasploit Folder"
rm -rf "$PREFIX/opt/metasploit-framework"

# ── Update & Upgrade ───────────────────────────────────
bars
echo -e "[${Green}+${clear}] Update Termux packages"
pkg update -y
pkg upgrade -y

# ── Dependencies ───────────────────────────────────────
bars
echo -e "[${Green}+${clear}] Dependencies Installation"
pkg install -y \
  git curl wget unzip zip tar \
  ruby python clang make pkg-config \
  libxml2 libxslt openssl readline libffi \
  libgmp libpcap postgresql autoconf bison \
  coreutils findutils apr apr-util \
  libsqlite libgrpc libtool ncurses \
  termux-tools termux-elf-cleaner

# ── Clone Metasploit ───────────────────────────────────
bars
echo -e "[${Green}+${clear}] Download Metasploit"
mkdir -p "$PREFIX/opt"
git clone --depth=1 \
  https://github.com/rapid7/metasploit-framework.git \
  "$PREFIX/opt/metasploit-framework"

# ── Install Gems ───────────────────────────────────────
bars
echo -e "[${Green}+${clear}] Install Metasploit"
cd "$PREFIX/opt/metasploit-framework"

gem install bundler

bundle config build.nokogiri \
  --use-system-libraries \
  --with-xml2-include=$PREFIX/include/libxml2 \
  --with-xml2-lib=$PREFIX/lib \
  --with-xslt-include=$PREFIX/include \
  --with-xslt-lib=$PREFIX/lib \
  --with-cflags="-Wno-implicit-function-declaration -Wno-deprecated-declarations"

bundle install -j$(nproc)

# ── Soft Links ─────────────────────────────────────────
bars
echo -e "[${Green}+${clear}] Link Metasploit Executables"

echo -e "[${Green}+${clear}] Soft Link msfconsole"
sleep 1
ln -sf "$PREFIX/opt/metasploit-framework/msfconsole" "$PREFIX/bin/msfconsole"

echo -e "[${Green}+${clear}] Soft Link msfvenom"
sleep 1
ln -sf "$PREFIX/opt/metasploit-framework/msfvenom" "$PREFIX/bin/msfvenom"

echo -e "[${Green}+${clear}] Soft Link msfrpcd"
sleep 1
ln -sf "$PREFIX/opt/metasploit-framework/msfrpcd" "$PREFIX/bin/msfrpcd"

echo -e "[${Green}+${clear}] Soft Link msfdb"
sleep 1
ln -sf "$PREFIX/opt/metasploit-framework/msfdb" "$PREFIX/bin/msfdb"

# ── Done ───────────────────────────────────────────────
bars
echo
echo -e "[${Green}+${clear}] Metasploit Installed Successfully"
echo
echo -e "[${Green}+${clear}] You can start ${Yellow}msfconsole${clear}"
echo -e "[${Green}+${clear}] Connect db ${Yellow}msfdb init${clear}"
echo
echo -e "[${Green}+${clear}] Run:"
echo -e "    ${Cyan}msfdb init${clear}"
echo -e "    ${Cyan}msfconsole${clear}"
echo
bars
echo -e "[${Green}+${clear}] Join T.me/efxtv for more"
bars
