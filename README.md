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
```

---

### ⭐ If this helped, give a star on GitHub!

**Original Repo:** [efxtv/Metasploit-in-termux](https://github.com/efxtv/Metasploit-in-termux)
[JOIN FOR LIVE CLASSES AND SUPPORT](https://t.me/efxtv) 


[![Buy Me A Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=&slug=efxtv&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff)](https://buymeacoffee.com/efxtv)

</div>
