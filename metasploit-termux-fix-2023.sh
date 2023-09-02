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
echo -e "[${Green}+${clear}] Done..."
bars
echo
echo -e "[${Yellow}+${clear}] Please wait..."
sleep 3
echo "[+] Updating termux..."
sleep 3
echo -e "[${Yellow}+${clear}] Don't hit Enter use Y/y to update..."
sleep 3
clear
echo -e "
                
      SCRIPT BY |D|E|D|S|H|I|T| EDITED BY EFX TV
                  ${Green}[ ${Yellow}t.me/efxtv${clear} ${Green}]${clear}
"
echo
sleep 1
pkg update;pkg upgrade;apt update;apt upgrade

#-----------------------------------------------------------------
#  Script edited by efx-tv created by |b|y| |G|u|s|h|m|a|z|u|k|o|
#-----------------------------------------------------------------

echo -e "[${Yellow}+${clear}] Loading..."
sleep 1

echo -e "[${Yellow}+${clear}] Removing old repository..."
rm $PREFIX/etc/apt/sources.list.d/* 2>.log.txt

echo -e "[${Yellow}+${clear}] Repository signature..."
# pkg install -y gnupg

echo -e "[${Yellow}+${clear}] Ruby purge..."
sleep 1
apt purge ruby -y
rm -fr $PREFIX/lib/ruby/gems 2>.log.txt

pkg upgrade -y -o Dpkg::Options::="--force-confnew"

echo -e "[${Yellow}+${clear}] Installing missing repository..."
sleep 1
pkg install -y binutils python autoconf bison clang coreutils curl findutils apr apr-util postgresql openssl readline libffi libgmp libpcap libsqlite libgrpc libtool libxml2 libxslt ncurses make ncurses-utils ncurses git wget unzip zip tar termux-tools termux-elf-cleaner pkg-config git ruby -o Dpkg::Options::="--force-confnew"

python3 -m pip install --upgrade pip
python3 -m pip install requests

source <(curl -sL https://github.com/termux/termux-packages/files/2912002/fix-ruby-bigdecimal.sh.txt)

rm -rf $PREFIX/opt/metasploit-framework 2>.log.txt
sleep 3
rm -rf $HOME/metasploit-framework 2>.log.txt
mkdir -p $PREFIX/opt 2>.log.txt
echo
echo -e "[${Yellow}+${clear}] Downloading Metasploit termux...\c";latestverr
cd $PREFIX/opt
git clone https://github.com/rapid7/metasploit-framework.git --depth=1

echo
cd $PREFIX/opt/metasploit-framework

gem install bundler
declare NOKOGIRI_VERSION=$(cat Gemfile.lock | grep -i nokogiri | sed 's/nokogiri [\(\)]/(/g' | cut -d ' ' -f 5 | grep -oP "(.).[[:digit:]][\w+]?[.].")
#sed 's|nokogiri (1.*)|nokogiri (1.8.0)|g' -i Gemfile.lock

gem install nokogiri -v $NOKOGIRI_VERSION -- --use-system-libraries

# for aarch64 if nokogiri problem persist do this 

bundle config build.nokogiri "--use-system-libraries --with-xml2-include=$PREFIX/include/libxml2"; bundle install

gem install actionpack
bundle update activesupport
bundle update --bundler
bundle install -j$(nproc --all)

#$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;
# rm ./modules/auxiliary/gather/http_pdf_authors.rb
rm $PREFIX/bin/msf* 2>.log.txt
termux-elf-cleaner $PREFIX/lib/ruby/gems/*/gems/pg-*/lib/pg_ext.so
echo

# Warning occurs during payload generation
#sed -i '86 {s/^/#/};96 {s/^/#/}' $PREFIX/lib/ruby/gems/3.1.0/gems/concurrent-ruby-1.0.5/lib/concurrent/atomic/ruby_thread_local_var.rb
#sed -i '442, 476 {s/^/#/};436, 438 {s/^/#/}' $PREFIX/lib/ruby/gems/3.1.0/gems/logging-2.3.1/lib/logging/diagnostic_context.rb
sed -i 's#nio4r (2.5.8)#nio4r (2.5.9)#g' $PREFIX/opt/metasploit-framework/Gemfile.lock;sed -i 's#2.1.4#2.1.10#g' $PREFIX/opt/metasploit-framework/Gemfile.lock;cd $PREFIX/opt/metasploit-framework/;bundle
echo -e "[${Green}+${clear}] Watch full video to fix ${Blue}Link https://youtu.be/zxSN9TfWRLc"
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
echo -e "[${Green}+${clear}] Join T.me/efxtv"
bars
