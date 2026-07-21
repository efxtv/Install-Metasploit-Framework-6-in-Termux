<div align="center">

# 🛡️ Metasploit Framework in Termux
[JOIN FOR LIVE CLASSES AND Tutorials](https://t.me/efxtv) 

[![Termux](https://img.shields.io/badge/Termux-F-Droid-3DDC84?style=for-the-badge&logo=android)](https://f-droid.org/)
[![Metasploit](https://img.shields.io/badge/Metasploit-v6.2.19-blue?style=for-the-badge)](https://github.com/rapid7/metasploit-framework)
[![Maintained](https://img.shields.io/badge/Maintained-Yes-success?style=for-the-badge)]()

[![Buy Me A Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=&slug=efxtv&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff)](https://buymeacoffee.com/efxtv)



*Tested & Working on Android 7+ | No Root Required*

</div>

---

**A tested MSFCONSOLE installer 2026**

*Script by [EFXTv](https://t.me/efxtv)*

</div>

---

- [Overview](#-overview)
- [Technical Challenges Solved](#-technical-challenges-solved)
- [Architecture](#-architecture)
- [Installation](#-installation)
- [Technical Deep Dive](#-technical-deep-dive)
- [Ethical Usage Guidelines](#-ethical-usage-guidelines)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)
- [License](#-license)

---



This installer provides a fully automated solution for installing Metasploit Framework on Termux (Android), addressing critical compilation issues specific to the x86_64 and AARCH64 Android platform.

### Features

- ✅ **Automated dependency management** with correct Termux package names
- ✅ **Nokogiri compilation fix** for Android's clang compiler
- ✅ **System library integration** (libxml2, libxslt)
- ✅ **Gumbo parser header resolution**
- ✅ **Proper gem registration** and extension building
- ✅ **Fresh installation support** - works on wiped Termux

### Why This Script?

Standard Metasploit installation methods fail on Termux due to:
1. Platform mismatch (Android vs Linux)
2. Nokogiri's gumbo parser compilation issues
3. CPPFLAGS validation failures in mkmf
4. Pre-compiled gem incompatibility

This script solves all these issues systematically.

---

## 🔧 Technical Challenges Solved

### Challenge 1: Platform Detection Mismatch

**Problem:** Bundler attempts to use pre-compiled gems built for `x86_64-linux-gnu`, but Termux runs on `x86_64-linux-android`.

**Solution:**
```bash
bundle config set --local force_ruby_platform true
```

This forces Bundler to compile all gems from source, ensuring Android compatibility.

---

### Challenge 2: Nokogiri Gumbo Parser Compilation

**Problem:** Nokogiri 1.18.10 bundles libgumbo, but the header file `nokogiri_gumbo.h` cannot be found during compilation.

**Root Cause:** Android's clang compiler fails CPPFLAGS validation checks in Ruby's mkmf library, preventing the gumbo include path from being added to the Makefile.

**Evidence from build logs:**
```
checking for whether -I.../libgumbo/.../include is accepted as CPPFLAGS... no
gumbo.c:32:10: fatal error: 'nokogiri_gumbo.h' file not found
```

**Solution:**
```bash
# Find gumbo headers
find . -type d -name "include" -path "*/libgumbo/*" | while read GPATH; do
  if [ -f "$GPATH/nokogiri_gumbo.h" ]; then
    # Copy headers directly to compilation directory
    cp -f "$GPATH"/*.h .
    
    # Patch Makefile INCFLAGS
    FULL_GPATH=$(cd "$GPATH" && pwd)
    sed -i "s|^INCFLAGS = |INCFLAGS = -I${FULL_GPATH} |" Makefile
  fi
done
```

This bypasses the failed CPPFLAGS check by:
1. Copying headers directly to where the compiler expects them
2. Manually patching the Makefile's INCFLAGS variable

---

### Challenge 3: System Library Detection

**Problem:** Nokogiri's extconf.rb fails to properly detect Termux's system libraries (libxml2, libxslt), attempting to compile them from source instead.

**Symptoms:**
```
Running 'compile' for libxslt 1.1.43... ERROR
ld.lld: error: undefined symbol: xmlXPathValuePush
```

**Solution:**
```bash
export CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/libxml2"
export LDFLAGS="-L${PREFIX}/lib"
export CPPFLAGS="-I${PREFIX}/include -I${PREFIX}/include/libxml2"
export PKG_CONFIG_PATH="${PREFIX}/lib/pkgconfig"

ruby extconf.rb \
  --use-system-libraries \
  --with-xml2-dir=${PREFIX} \
  --with-xml2-include=${PREFIX}/include/libxml2 \
  --with-xml2-lib=${PREFIX}/lib \
  --with-xslt-dir=${PREFIX} \
  --with-xslt-include=${PREFIX}/include \
  --with-xslt-lib=${PREFIX}/lib
```

Explicit paths ensure nokogiri uses Termux's pre-installed libraries.

---

### Challenge 4: Extension Registration

**Problem:** After manual compilation, Bundler doesn't recognize nokogiri as installed and attempts to rebuild it.

**Solution:**
```bash
# Place compiled .so in expected location
mkdir -p "${GEM_DIR}/lib/nokogiri/3.4"
cp -f nokogiri.so "${GEM_DIR}/lib/nokogiri/3.4/"

# Register extension as built
EXT_REG_DIR="${PREFIX}/lib/ruby/gems/3.4.0/extensions/x86_64-linux-android/3.4.0/nokogiri-1.18.10"
mkdir -p "$EXT_REG_DIR"
cp -f nokogiri.so "$EXT_REG_DIR/"
touch "${EXT_REG_DIR}/gem.build_complete"  # ← Critical marker
```

The `gem.build_complete` file tells RubyGems the extension is already compiled.

---

### Challenge 5: Build Dependencies

**Problem:** Nokogiri requires `mini_portile2` gem during compilation, even when using system libraries.

**Error:**
```
Could not find 'mini_portile2' (~> 2.8.2) among 88 total gem(s)
```

**Solution:**
```bash
# Install nokogiri's build dependencies first
gem install bundler
gem install mini_portile2 -v 2.8.9
gem install racc
```

---

## 🏗️ Architecture

### Installation Flow

```
┌─────────────────────────────────────────────────────────────┐
│  Phase 1: Environment Setup                                 │
├─────────────────────────────────────────────────────────────┤
│  • Update Termux packages                                   │
│  • Install system dependencies (ruby, libxml2, libxslt)    │
│  • Install build tools (clang, make, pkg-config)           │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  Phase 2: Nokogiri Pre-Installation                         │
├─────────────────────────────────────────────────────────────┤
│  • Install bundler, mini_portile2, racc                     │
│  • Download nokogiri source gem                             │
│  • Configure with system libraries                          │
│  • Apply gumbo header fix                                   │
│  • Compile nokogiri.so                                      │
│  • Install to gem directories                               │
│  • Mark as built (gem.build_complete)                       │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  Phase 3: Metasploit Installation                           │
├─────────────────────────────────────────────────────────────┤
│  • Clone metasploit-framework from GitHub                   │
│  • Configure bundler (force_ruby_platform=true)            │
│  • Run bundle install (skips nokogiri)                      │
│  • Create symlinks (msfconsole, msfvenom, etc.)            │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  Phase 4: Verification                                      │
├─────────────────────────────────────────────────────────────┤
│  • Verify nokogiri loads correctly                          │
│  • Test bundle exec ruby                                    │
│  • Confirm symlinks work                                    │
└─────────────────────────────────────────────────────────────┘
```

### Directory Structure

```
/data/data/com.termux/files/
├── usr/
│   ├── bin/
│   │   ├── msfconsole → ../opt/metasploit-framework/msfconsole
│   │   ├── msfvenom → ../opt/metasploit-framework/msfvenom
│   │   ├── msfdb → ../opt/metasploit-framework/msfdb
│   │   └── msfrpcd → ../opt/metasploit-framework/msfrpcd
│   ├── lib/
│   │   └── ruby/
│   │       └── gems/
│   │           └── 3.4.0/
│   │               ├── gems/
│   │               │   └── nokogiri-1.18.10/
│   │               │       ├── ext/nokogiri/
│   │               │       │   └── nokogiri.so (compiled)
│   │               │       └── lib/nokogiri/3.4/
│   │               │           └── nokogiri.so (installed)
│   │               ├── extensions/
│   │               │   └── x86_64-linux-android/3.4.0/
│   │               │       └── nokogiri-1.18.10/
│   │               │           ├── nokogiri.so
│   │               │           └── gem.build_complete
│   │               └── specifications/
│   │                   └── nokogiri-1.18.10.gemspec
│   └── opt/
│       └── metasploit-framework/
│           ├── msfconsole
│           ├── msfvenom
│           ├── Gemfile
│           └── ... (metasploit source)
└── home/
    └── metasploit_termux_installer.sh
```

---

## 📦 Installation

### Prerequisites

- Termux installed from [F-Droid](https://f-droid.org/packages/com.termux/) (recommended) or Play Store
- Android 7.0+ with x86_64 architecture
- At least 2GB free storage space
- Stable internet connection

### Quick Start

```bash
# 1. Update Termux
pkg update && pkg upgrade

# 2. Install git
pkg install git

# 3. Clone or download the installer
git clone https://github.com/efxtv/metasploit-termux-installer
cd metasploit-termux-installer

# 4. Make executable and run
chmod +x metasploit_termux_installer.sh
./metasploit_termux_installer.sh

# 5. Initialize database
msfdb init

# 6. Start Metasploit
msfconsole
```

### Manual Installation (Single Script)

```bash
# Download the script
curl -o metasploit_termux_installer.sh https://raw.githubusercontent.com/efxtv/metasploit-termux-installer/main/metasploit_termux_installer.sh

# Make executable
chmod +x metasploit_termux_installer.sh

# Run installer
./metasploit_termux_installer.sh
```

---

## 🔬 Technical Deep Dive

### Understanding mkmf CPPFLAGS Validation

Ruby's mkmf (MakeMakefile) library validates compiler flags before adding them to the Makefile. On Termux, this validation fails for certain flags:

```ruby
# From mkmf.rb
def try_cppflags(flags, opts = {})
  # ... validation code ...
  # Returns false on Android for -I flags with certain paths
end
```

**Why it fails:**
- Android's clang has stricter path validation
- Termux's non-standard prefix (`/data/data/com.termux/files/usr`) triggers validation failures
- mkmf interprets this as "flag not supported" and omits it from Makefile

**Our workaround:**
Instead of relying on mkmf's validation, we directly patch the generated Makefile:

```bash
sed -i "s|^INCFLAGS = |INCFLAGS = -I${GUMBO_PATH} |" Makefile
```

---

### Nokogiri Extension Loading Mechanism

When Ruby requires nokogiri, it follows this path:

```ruby
# lib/nokogiri.rb
require_relative 'nokogiri/extension'

# lib/nokogiri/extension.rb
RUBY_VERSION =~ /(\d+.\d+)/
require_relative "#{$1}/nokogiri"  # → lib/nokogiri/3.4/nokogiri.so
```

This is why we must place `nokogiri.so` at:
```
/data/data/com.termux/files/usr/lib/ruby/gems/3.4.0/gems/nokogiri-1.18.10/lib/nokogiri/3.4/nokogiri.so
```

---

### Bundler's Extension Build Detection

Bundler checks for compiled extensions using:

```
${GEM_HOME}/extensions/${PLATFORM}/${RUBY_VERSION}/${GEM_NAME}-${VERSION}/gem.build_complete
```

If this file exists, Bundler skips compilation. Our script creates this marker after manual compilation.

---

## ⚖️ Ethical Usage Guidelines

### Legal Framework

Metasploit Framework is a powerful security testing tool. Its use is governed by:

1. **Computer Fraud and Abuse Act (CFAA)** - United States
2. **Computer Misuse Act** - United Kingdom
3. **Information Technology Act, 2000** - India
4. **GDPR** - European Union
5. **Local cybersecurity laws** in your jurisdiction

### Authorized Usage Only

✅ **LEGAL Use Cases:**
- Penetration testing with **written authorization**
- Security research on **systems you own**
- Educational purposes in **controlled lab environments**
- Vulnerability assessment for **clients with signed contracts**
- CTF (Capture The Flag) competitions
- Bug bounty programs with **defined scope**

❌ **ILLEGAL Use Cases:**
- Unauthorized access to computer systems
- Stealing data or credentials
- Deploying ransomware or malware
- Disrupting services (DoS/DDoS)
- Testing systems without explicit permission
- Violating privacy or confidentiality

### Responsible Disclosure

If you discover vulnerabilities using Metasploit:

1. **Document** the vulnerability thoroughly
2. **Notify** the vendor/organization privately
3. **Allow** reasonable time for patching (typically 90 days)
4. **Coordinate** public disclosure with the vendor
5. **Never** exploit vulnerabilities beyond proof-of-concept

### Best Practices

1. **Always obtain written permission** before testing
2. **Define scope clearly** in engagement contracts
3. **Use isolated environments** for testing
4. **Log all activities** for accountability
5. **Report findings responsibly**
6. **Stay within legal boundaries**
7. **Respect privacy and data protection laws**

### Disclaimer

```
THIS TOOL IS PROVIDED FOR EDUCATIONAL AND ETHICAL SECURITY TESTING ONLY.

The authors and contributors are not responsible for any misuse, damage, 
or legal consequences resulting from the use of this installer or 
Metasploit Framework.

Users are solely responsible for:
- Obtaining proper authorization before testing
- Complying with all applicable laws and regulations
- Using the tool ethically and responsibly
- Understanding the legal implications of their actions

Unauthorized access to computer systems is ILLEGAL and punishable 
by law in most jurisdictions. Always obtain explicit written 
permission before conducting any security testing.

By using this installer, you agree to use Metasploit Framework 
only for legitimate, authorized security testing purposes.
```

---

## 🐛 Troubleshooting

### Issue 1: "Could not find nokogiri in locally installed gems"

**Cause:** Nokogiri extension not properly registered

**Solution:**
```bash
cd $PREFIX/opt/metasploit-framework
gem pristine nokogiri
bundle install
```

---

### Issue 2: "nokogiri_gumbo.h file not found"

**Cause:** Gumbo headers not copied to compilation directory

**Solution:**
```bash
cd $PREFIX/lib/ruby/gems/3.4.0/gems/nokogiri-1.18.10/ext/nokogiri

# Find and copy headers
find . -name "nokogiri_gumbo.h" -exec cp {} . \;

# Recompile
make clean
make -j$(nproc)

# Install
cp nokogiri.so ../lib/nokogiri/3.4/
```

---

### Issue 3: "libxslt compilation failed with linker errors"

**Cause:** Nokogiri trying to compile system libraries from source

**Solution:**
```bash
# Ensure system libraries are installed
pkg install libxml2 libxslt

# Set environment variables
export CFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"
export PKG_CONFIG_PATH="${PREFIX}/lib/pkgconfig"

# Reconfigure with explicit system library paths
cd $PREFIX/lib/ruby/gems/3.4.0/gems/nokogiri-1.18.10/ext/nokogiri
ruby extconf.rb --use-system-libraries \
  --with-xml2-dir=${PREFIX} \
  --with-xslt-dir=${PREFIX}
```

---

### Issue 4: "mini_portile2 not found"

**Cause:** Nokogiri build dependency missing

**Solution:**
```bash
gem install mini_portile2 racc
```

---

### Issue 5: Bundle install fails after nokogiri fix

**Cause:** Bundler cache corrupted

**Solution:**
```bash
cd $PREFIX/opt/metasploit-framework
rm -rf vendor/bundle .bundle
bundle config set --local force_ruby_platform true
bundle install
```

---

### Issue 6: msfconsole command not found

**Cause:** Symlinks not created

**Solution:**
```bash
ln -sf $PREFIX/opt/metasploit-framework/msfconsole $PREFIX/bin/msfconsole
ln -sf $PREFIX/opt/metasploit-framework/msfvenom $PREFIX/bin/msfvenom
ln -sf $PREFIX/opt/metasploit-framework/msfdb $PREFIX/bin/msfdb
```

---

### Issue 7: Database connection failed

**Cause:** PostgreSQL not initialized

**Solution:**
```bash
# Initialize database
msfdb init

# Start PostgreSQL
pg_ctl -D $PREFIX/var/lib/postgresql start

# Verify connection
msfconsole -x "db_status; exit"
```

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Test thoroughly on fresh Termux installation
4. Commit your changes (`git commit -m 'Add amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

### Code Style

- Use descriptive variable names
- Comment complex logic
- Follow bash best practices
- Test on fresh Termux installation

---

## 📄 License

This installer is released under the MIT License.

**Metasploit Framework** is copyrighted by Rapid7, Inc. and licensed under the BSD License.

---

## 🙏 Acknowledgments

- **EFXTv** - Original script author and community contributor
- **Rapid7** - Metasploit Framework developers
- **Termux Team** - Android terminal emulator
- **Nokogiri Team** - XML/HTML parser
- **Ruby Community** - Programming language and ecosystem

---

## 📞 Support

- **Telegram:** [t.me/efxtv](https://t.me/efxtv)
- **Issues:** [GitHub Issues](https://github.com/efxtv/metasploit-termux-installer/issues)
- **Discussions:** [GitHub Discussions](https://github.com/efxtv/metasploit-termux-installer/discussions)

---

<div align="center">

**⚠️ USE RESPONSIBLY • STAY LEGAL • HACK ETHICALLY ⚠️**

Made with ❤️ by [EFXTv](https://t.me/efxtv)

</div>

### ⭐ If this helped, give a star on GitHub!

**Original Repo:** [efxtv/Metasploit-in-termux](https://github.com/efxtv/Metasploit-in-termux)


