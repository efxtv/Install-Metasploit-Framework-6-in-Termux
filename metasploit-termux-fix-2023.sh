#!/data/data/com.termux/files/usr/bin/bash
clear='\033[0m'
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'

latestverr(){
curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/Gemfile.lock -s|grep metasploit-framework|head -1|sed 's/ //g'|sed 's#(# #g;s#)##g;s# #: #g'|awk '{print $2}'
}

bars(){
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
LWVuICIuIgplY2hvCn0KCmRvdHM='|base64 -d|bash
}


bars
echo -e "
                
      SCRIPT BY |D|E|D|S|H|I|T| EDITED BY EFX TV
                  ${Green}[ ${Yellow}t.me/efxtv${clear} ${Green}]${clear}
"
bars
echo -e "[${Green}+${clear}] Latest version found ${Red}\c";latestverr
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
cd $HOME
echo -e "[${Green}+${clear}] Done"
bars
echo
echo -e "[${Green}+${clear}] Please wait"
sleep 3
echo -e "[${Green}+${clear}] Update termux"
sleep 3
clear
echo -e "
                
      SCRIPT BY |D|E|D|S|H|I|T| EDITED BY EFX TV
                  ${Green}[ ${Yellow}t.me/efxtv${clear} ${Green}]${clear}
"
echo
sleep 1

# Dependencies Installation
bars
echo -e "[${Green}+${clear}] Dependencies Installation"
pkg update -y
pkg upgrade -y -o Dpkg::Options::="--force-confnew"
pkg install -y binutils python autoconf bison clang coreutils curl findutils apr apr-util postgresql openssl readline libffi libgmp libpcap libsqlite libgrpc libtool libxml2 libxslt ncurses make ncurses-utils ncurses git wget unzip zip tar termux-tools termux-elf-cleaner pkg-config git ruby -o Dpkg::Options::="--force-confnew"
python3 -m pip install requests

echo -e "[${Green}+${clear}] Fix ruby BigDecimal"
# Fix ruby BigDecimal 
#center "* Fix ruby BigDecimal"
#source <(curl -sL https://github.com/termux/termux-packages/files/2912002/fix-ruby-bigdecimal.sh.txt)

echo -e "[${Green}+${clear}] Erase Old Metasploit Folder"
# Erase Old Metasploit Folder
bars
if [ -d "${PREFIX}/opt/metasploit-framework" ]; then
  rm -rf ${PREFIX}/opt/metasploit-framework
fi

echo -e "[${Green}+${clear}] Download Metasploit"
# Download Metasploit
bars
if [ ! -d "${PREFIX}/opt" ]; then
  mkdir ${PREFIX}/opt
fi
git clone https://github.com/rapid7/metasploit-framework.git --depth=1 ${PREFIX}/opt/metasploit-framework

echo -e "[${Green}+${clear}] Install Metasploit"
# Install Metasploit
bars
cd ${PREFIX}/opt/metasploit-framework
gem install bundler
NOKOGIRI_VERSION=$(cat Gemfile.lock | grep -i nokogiri | sed 's/nokogiri [\(\)]/(/g' | cut -d ' ' -f 5 | grep -oP "(.).[[:digit:]][\w+]?[.].")
# by overriding cflags nokogiri will install or you can simply declare a void function 
#  you might have seen this error while installing nokogiri `xmlSetStructuredErrorFunc((void *)rb_error_list, Nokogiri_error_array_pusher);`
#  solution : void xmlSetStructuredErrorFunc(void *rb_error_list, void *Nokogiri_error_array_pusher); you can set any parameter name 
#  for sake of simplicity tweaking cflags is better than declaring a void function for every c file

gem install nokogiri -v $NOKOGIRI_VERSION -- --with-cflags="-Wno-implicit-function-declaration -Wno-deprecated-declarations -Wno-incompatible-function-pointer-types" --use-system-libraries
bundle install
gem install actionpack
bundle update activesupport
bundle update --bundler
bundle install -j$(nproc --all)

echo -e "[${Green}+${clear}] Link Metasploit Executables"
# Link Metasploit Executables
# echo -e "[${Green}+${clear}] Watch full video to fix ${Blue}Link https://youtu.be/zxSN9TfWRLc"
echo -e "[${Green}+${clear}] Join for updates ${Blue}Link https://t.me/efxtv"
echo -e "[${Green}+${clear}] You can start ${Yellow}msfconsole ${clear}"
echo -e "[${Green}+${clear}] Connect db ${Yellow}msfdb init ${clear}"
echo -e "[${Green}+${clear}] Please wait...."
sleep 3
echo -e "[${Green}+${clear}] Soft Link msfconsole"
sleep 1
ln -s $PREFIX/opt/metasploit-framework/msfconsole $PREFIX/bin/

echo -e "[${Green}+${clear}] Soft Link msfvenom"
sleep 1
ln -s $PREFIX/opt/metasploit-framework/msfvenom $PREFIX/bin/
echo -e "[${Green}+${clear}] Soft Link msfrpcd"
sleep 1
ln -s $PREFIX/opt/metasploit-framework/msfrpcd $PREFIX/bin/
echo -e "[${Green}+${clear}] Soft Link msfdb"
sleep 1
ln -s $PREFIX/opt/metasploit-framework/msfdb $PREFIX/bin/
bars
echo -e "[${Green}+${clear}] Try msfconsole"
bars
echo -e "[${Green}+${clear}] Join T.me/efxtv for more"
bars
