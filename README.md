<div align="center">

# 🛡️ Metasploit Framework in Termux
### Install Metasploit 6 on Android | Latest Fix 2023

[![Termux](https://img.shields.io/badge/Termux-F-Droid-3DDC84?style=for-the-badge&logo=android)](https://f-droid.org/)
[![Metasploit](https://img.shields.io/badge/Metasploit-v6.2.19-blue?style=for-the-badge)](https://github.com/rapid7/metasploit-framework)
[![Maintained](https://img.shields.io/badge/Maintained-Yes-success?style=for-the-badge)]()

*Tested & Working on Android 7+ | No Root Required*

</div>

---

## 📋 Requirements



> **Step 1:** Install **Termux** & **Termux:API** from [F-Droid](https://f-droid.org/en/) - Not from Play Store!

Play Store version is outdated and will break installation.

---

## 🚀 Installation Methods


### ✅ Script 1: One-Line Installer (Recommended - 2023 Fix)

This is the latest fixed backup

```bash
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/metasploit-termux-fix-2023.sh)
```

### 📦 Script 2: Standard Installer 2026 fix (6.2.19 and above )

```bash
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/Install-Metasploit-Framework-6-in-Termux/refs/heads/main/metasploit-termux-fix-2026.sh)
```

### 🔧 Method 3: Manual Installation

```bash
pkg update && pkg upgrade -y
pkg install wget curl -y

cd $HOME
wget https://raw.githubusercontent.com/efxtv/Install-Metasploit-Framework-6-in-Termux/refs/heads/main/metasploit-termux-fix-2026.sh -q
bash metasploit-6-termux.sh
```

---

## 🔄 Update Metasploit (best and works forever)

Run this anytime to update to latest version:

```bash
curl -L -o $PWD/mversion https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Scripts/mversion -s
chmod +x mversion
mv mversion ../usr/bin/
mversion -help
```

---

## 🐛 Fix: unsupported (OpenSSL::Cipher::CipherError)

If you get CipherError after installation, run this fix in your home:

```bash
cd metasploit-framework
sed -i '13,15 {s/^/#/}' /data/data/com.termux/files/usr/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/encryption_algorithm/functionable.rb
sed -i '14 {s/^/#/}' /data/data/com.termux/files/usr/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/server_host_key_algorithm/ecdsa_sha2_nistp256.rb
sed -i '14 {s/^/#/}' /data/data/com.termux/files/usr/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/server_host_key_algorithm/ecdsa_sha2_nistp384.rb
sed -i '14 {s/^/#/}' /data/data/com.termux/files/usr/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/server_host_key_algorithm/ecdsa_sha2_nistp521.rb

------------------------2026 Fix
Gem::Ext::BuildError: ERROR: Failed to build gem native
extension.

current directory:
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/nokogiri-1.18.10/ext/nokogiri
/data/data/com.termux/files/usr/bin/ruby extconf.rb
--use-system-libraries
--with-xml2-include\=/data/data/com.termux/files/usr/include/libxml2
--with-xml2-lib\=/data/data/com.termux/files/usr/lib
--with-xslt-include\=/data/data/com.termux/files/usr/include
--with-xslt-lib\=/data/data/com.termux/files/usr/lib
--with-cflags\=-Wno-implicit-function-declaration
-Wno-deprecated-declarations
checking for whether -std=c99 is accepted as CFLAGS...
no
checking for whether -Wno-declaration-after-statement is
accepted as CFLAGS... no
checking for whether -O2 is accepted as CFLAGS... no
checking for whether -g is accepted as CFLAGS... no
checking for whether -Winline is accepted as CFLAGS...
no
checking for whether -Wmissing-noreturn is accepted as
CFLAGS... no
checking for whether -Wconversion is accepted as
CFLAGS... no
Building nokogiri using system libraries.
checking for gzdopen() in -lz... yes
checking for xmlParseDoc() in -lxml2... yes
checking for xsltParseStylesheetDoc() in -lxslt... yes
checking for exsltFuncRegister() in -lexslt... yes
Using mini_portile version 2.8.9
---------- IMPORTANT NOTICE ----------
Building Nokogiri with a packaged version of
libgumbo-1.0.0-nokogiri.
Configuration options: --enable-shared --disable-static
Copying gumbo-parser files into
tmp/x86_64-pc-linux-android/ports/libgumbo/1.0.0-nokogiri/gumbo-parser...
Running 'compile' for libgumbo 1.0.0-nokogiri... OK
Activating libgumbo 1.0.0-nokogiri (from
ports/x86_64-linux-android/libgumbo/1.0.0-nokogiri)...
checking for whether
-I/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/nokogiri-1.18.10/ext/nokogiri/ports/x86_64-linux-android/libgumbo/1.0.0-nokogiri/include
is accepted as CPPFLAGS... no
checking for gumbo_parse_with_options() in
nokogiri_gumbo.h... yes
checking for xmlCtxtSetOptions()... yes
checking for xmlCtxtGetOptions()... yes
checking for xmlSwitchEncodingName()... yes
checking for rb_category_warning()... yes
checking for whether
-DNOKOGIRI_OTHER_LIBRARY_VERSIONS="\"libgumbo:1.0.0-nokogiri\""
is accepted as CPPFLAGS... no
creating Makefile

current directory:
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/nokogiri-1.18.10/ext/nokogiri
make DESTDIR\= sitearchdir\=./.gem.20260721-5691-zap5hm
sitelibdir\=./.gem.20260721-5691-zap5hm clean

current directory:
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/nokogiri-1.18.10/ext/nokogiri
make DESTDIR\= sitearchdir\=./.gem.20260721-5691-zap5hm
sitelibdir\=./.gem.20260721-5691-zap5hm
compiling gumbo.c
In file included from gumbo.c:30:
In file included from ./nokogiri.h:81:
In file included from
/data/data/com.termux/files/usr/include/ruby-3.4.0/ruby.h:38:
In file included from
/data/data/com.termux/files/usr/include/ruby-3.4.0/ruby/ruby.h:28:
In file included from
/data/data/com.termux/files/usr/include/ruby-3.4.0/ruby/internal/arithmetic.h:24:
In file included from
/data/data/com.termux/files/usr/include/ruby-3.4.0/ruby/internal/arithmetic/char.h:29:
/data/data/com.termux/files/usr/include/ruby-3.4.0/ruby/internal/core/rstring.h:398:24:
warning: default initialization of an object of type
'struct RString' with const member leaves the object
uninitialized [-Wdefault-const-init-field-unsafe]
  398 |         struct RString retval;
      |                        ^
/data/data/com.termux/files/usr/include/ruby-3.4.0/ruby/internal/core/rbasic.h:86:17:
note: member 'klass' declared 'const' here
   86 |     const VALUE klass;
      |                 ^
gumbo.c:32:10: fatal error: 'nokogiri_gumbo.h' file not
found
   32 | #include "nokogiri_gumbo.h"
      |          ^~~~~~~~~~~~~~~~~~
1 warning and 1 error generated.
make: *** [Makefile:251: gumbo.o] Error 1

make failed, exit code 2

Gem files will remain installed in
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/nokogiri-1.18.10
for inspection.
Results logged to
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/extensions/x86_64-linux-android/3.4.0/nokogiri-1.18.10/gem_make.out

/data/data/com.termux/files/usr/lib/ruby/3.4.0/rubygems/ext/builder.rb:126:in
'Gem::Ext::Builder.run'
/data/data/com.termux/files/usr/lib/ruby/3.4.0/rubygems/ext/builder.rb:52:in
'block in Gem::Ext::Builder.make'
/data/data/com.termux/files/usr/lib/ruby/3.4.0/rubygems/ext/builder.rb:44:in
'Array#each'
/data/data/com.termux/files/usr/lib/ruby/3.4.0/rubygems/ext/builder.rb:44:in
'Gem::Ext::Builder.make'
/data/data/com.termux/files/usr/lib/ruby/3.4.0/rubygems/ext/ext_conf_builder.rb:44:in
'Gem::Ext::ExtConfBuilder.build'
/data/data/com.termux/files/usr/lib/ruby/3.4.0/rubygems/ext/builder.rb:195:in
'Gem::Ext::Builder#build_extension'
/data/data/com.termux/files/usr/lib/ruby/3.4.0/rubygems/ext/builder.rb:229:in
'block in Gem::Ext::Builder#build_extensions'
/data/data/com.termux/files/usr/lib/ruby/3.4.0/rubygems/ext/builder.rb:226:in
'Array#each'
/data/data/com.termux/files/usr/lib/ruby/3.4.0/rubygems/ext/builder.rb:226:in
'Gem::Ext::Builder#build_extensions'
/data/data/com.termux/files/usr/lib/ruby/3.4.0/rubygems/installer.rb:844:in
'Gem::Installer#build_extensions'
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/bundler-2.5.22/lib/bundler/rubygems_gem_installer.rb:109:in
'Bundler::RubyGemsGemInstaller#build_extensions'
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/bundler-2.5.22/lib/bundler/rubygems_gem_installer.rb:28:in
'Bundler::RubyGemsGemInstaller#install'
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/bundler-2.5.22/lib/bundler/source/rubygems.rb:205:in
'Bundler::Source::Rubygems#install'
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/bundler-2.5.22/lib/bundler/installer/gem_installer.rb:55:in
'Bundler::GemInstaller#install'
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/bundler-2.5.22/lib/bundler/installer/gem_installer.rb:17:in
'Bundler::GemInstaller#install_from_spec'
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/bundler-2.5.22/lib/bundler/installer/parallel_installer.rb:133:in
'Bundler::ParallelInstaller#do_install'
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/bundler-2.5.22/lib/bundler/installer/parallel_installer.rb:124:in
'block in Bundler::ParallelInstaller#worker_pool'
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/bundler-2.5.22/lib/bundler/worker.rb:62:in
'Bundler::Worker#apply_func'
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/bundler-2.5.22/lib/bundler/worker.rb:57:in
'block in Bundler::Worker#process_queue'
  <internal:kernel>:168:in 'Kernel#loop'
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/bundler-2.5.22/lib/bundler/worker.rb:54:in
'Bundler::Worker#process_queue'
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/bundler-2.5.22/lib/bundler/worker.rb:90:in
'block (2 levels) in Bundler::Worker#create_threads'

An error occurred while installing nokogiri
(1.18.10), and Bundler cannot continue.

In Gemfile:
factory_bot_rails was resolved to 6.5.1, which depends
on
    railties was resolved to 8.0.5, which depends on
      actionpack was resolved to 8.0.5, which depends on
actionview was resolved to 8.0.5, which depends
on
rails-dom-testing was resolved to 2.3.0, which
depends on
            nokogiri
```

---

### ⭐ If this helped, give a star on GitHub!

**Original Repo:** [efxtv/Metasploit-in-termux](https://github.com/efxtv/Metasploit-in-termux)
[JOIN FOR LIVE CLASSES AND SUPPORT](https://t.me/efxtv) 


[![Buy Me A Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=&slug=efxtv&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff)](https://buymeacoffee.com/efxtv)

</div>
