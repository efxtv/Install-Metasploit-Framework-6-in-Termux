#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#  METASPLOIT FRAMEWORK INSTALLER FOR TERMUX (aarch64 & x86_64 Android)
#  Complete fresh installation with all fixes
# ============================================================

PREFIX="/data/data/com.termux/files/usr"
MSF_URL="https://github.com/rapid7/metasploit-framework.git"
MSF_DIR="${PREFIX}/opt/metasploit-framework"

# Colors
clear='\033[0m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Cyan='\033[0;36m'

bars() {
  for i in $(seq 1 50); do
    echo -n "."
    sleep 0.02
  done
  echo
}

info() { echo -e "[${Green}+${clear}] $1"; }
warn() { echo -e "[${Yellow}!${clear}] $1"; }
fail() { echo -e "[${Red}X${clear}] $1"; exit 1; }

# ── Banner ───────────────────────────────────────────────────
clear
echo -e "
  ╔══════════════════════════════════════════════════╗
  ║   METASPLOIT FRAMEWORK - TERMUX INSTALLER        ║
  ║   Complete installation with Nokogiri fix        ║
  ║            SCRIPT BY Tech ${Green}EFXTv${clear}                  ║
  ╚══════════════════════════════════════════════════╝
"
bars

# ═══════════════════════════════════════════════════════════
# STEP 1: UPDATE & UPGRADE
# ═══════════════════════════════════════════════════════════
info "Step 1/7: Updating Termux packages..."
pkg update -y
pkg upgrade -y

# ═══════════════════════════════════════════════════════════
# STEP 2: INSTALL DEPENDENCIES
# ═══════════════════════════════════════════════════════════
bars
info "Step 2/7: Installing dependencies..."

pkg install -y git curl wget unzip zip tar ruby python clang make
pkg install -y pkg-config autoconf bison coreutils findutils
pkg install -y libxml2 libxslt openssl readline libffi
pkg install -y postgresql sqlite
pkg install -y ncurses-utils termux-tools
pkg install -y libpcap apr apr-util libtool 2>/dev/null || warn "Some optional packages skipped"

# ═══════════════════════════════════════════════════════════
# STEP 3: INSTALL & FIX NOKOGIRI FIRST
# ═══════════════════════════════════════════════════════════
bars
info "Step 3/7: Installing and fixing Nokogiri..."

# Set environment
export CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/libxml2"
export LDFLAGS="-L${PREFIX}/lib"
export CPPFLAGS="-I${PREFIX}/include -I${PREFIX}/include/libxml2"
export PKG_CONFIG_PATH="${PREFIX}/lib/pkgconfig"

# Install bundler and nokogiri dependencies first
info "Installing bundler and nokogiri dependencies..."
gem install bundler
gem install mini_portile2 -v 2.8.9
gem install racc

# Download and unpack nokogiri
info "Downloading nokogiri..."
cd "$HOME"
rm -rf nokogiri-1.18.10 nokogiri-1.18.10.gem 2>/dev/null || true
gem fetch nokogiri -v 1.18.10
gem unpack nokogiri-1.18.10.gem
rm -f nokogiri-1.18.10.gem

# Go to extension directory
cd nokogiri-1.18.10/ext/nokogiri

# Clean any previous builds
rm -rf tmp/ ports/ 2>/dev/null || true

# Configure with system libraries
info "Configuring nokogiri with system libraries..."
ruby extconf.rb \
  --use-system-libraries \
  --with-xml2-dir=${PREFIX} \
  --with-xml2-include=${PREFIX}/include/libxml2 \
  --with-xml2-lib=${PREFIX}/lib \
  --with-xslt-dir=${PREFIX} \
  --with-xslt-include=${PREFIX}/include \
  --with-xslt-lib=${PREFIX}/lib

if [ ! -f "Makefile" ]; then
  fail "extconf.rb failed to create Makefile"
fi

# Apply gumbo header fix
info "Applying gumbo header fix..."
find . -type d -name "include" -path "*/libgumbo/*" 2>/dev/null | while read GPATH; do
  if [ -f "$GPATH/nokogiri_gumbo.h" ]; then
    FULL_GPATH=$(cd "$GPATH" && pwd)
    info "Found gumbo headers: $FULL_GPATH"
    cp -f "$GPATH"/*.h .
    sed -i "s|^INCFLAGS = |INCFLAGS = -I${FULL_GPATH} |" Makefile
  fi
done

# Compile
info "Compiling nokogiri..."
make clean 2>/dev/null || true
make -j$(nproc)

if [ ! -f "nokogiri.so" ]; then
  fail "nokogiri.so compilation failed!"
fi

info "nokogiri.so compiled successfully!"

# Install to proper gem location
GEMS_DIR="${PREFIX}/lib/ruby/gems/3.4.0/gems"
EXT_DIR="${PREFIX}/lib/ruby/gems/3.4.0/extensions/x86_64-linux-android/3.4.0/nokogiri-1.18.10"
SPEC_DIR="${PREFIX}/lib/ruby/gems/3.4.0/specifications"

mkdir -p "${GEMS_DIR}/nokogiri-1.18.10"
mkdir -p "$EXT_DIR"
mkdir -p "$SPEC_DIR"

# Copy gem files
cp -rf "$HOME/nokogiri-1.18.10/"* "${GEMS_DIR}/nokogiri-1.18.10/"

# Copy compiled extension
cp -f nokogiri.so "$EXT_DIR/"
mkdir -p "${GEMS_DIR}/nokogiri-1.18.10/lib/nokogiri/3.4"
cp -f nokogiri.so "${GEMS_DIR}/nokogiri-1.18.10/lib/nokogiri/3.4/"
cp -f nokogiri.so "${GEMS_DIR}/nokogiri-1.18.10/lib/nokogiri/"

# Mark as built
touch "${EXT_DIR}/gem.build_complete"

# Create gemspec
cat > "${SPEC_DIR}/nokogiri-1.18.10.gemspec" << 'GEMSPEC'
# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = "nokogiri"
  s.version = "1.18.10"
  s.required_rubygems_version = Gem::Requirement.new(">= 0")
  s.require_paths = ["lib"]
  s.authors = ["Mike Dalessio", "Yoko Harada", "Tim Elliott", "Akinori MUSHA", "John Shahid", "Lars Kanis"]
  s.description = "Nokogiri makes it easy and painless to work with XML and HTML from Ruby."
  s.email = ["nokogiri-talk@googlegroups.com"]
  s.extensions = ["ext/nokogiri/extconf.rb"]
  s.files = Dir["lib/**/*.rb", "ext/**/*"]
  s.homepage = "https://nokogiri.org"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0")
  s.summary = "Nokogiri is an XML/HTML parser"
  s.add_runtime_dependency "mini_portile2", "~> 2.8.2"
  s.add_runtime_dependency "racc", "~> 1.4"
end
GEMSPEC

info "Nokogiri installed and registered!"

# Verify
ruby -e "require 'nokogiri'; puts \"✓ Nokogiri #{Nokogiri::VERSION} loaded!\"" || warn "Verification failed, continuing..."

# ═══════════════════════════════════════════════════════════
# STEP 4: CLONE METASPLOIT
# ═══════════════════════════════════════════════════════════
bars
info "Step 4/7: Downloading Metasploit Framework..."
rm -rf "$MSF_DIR"
mkdir -p "${PREFIX}/opt"
git clone --depth=1 "$MSF_URL" "$MSF_DIR"

# ═══════════════════════════════════════════════════════════
# STEP 5: BUNDLE INSTALL (nokogiri already installed)
# ═══════════════════════════════════════════════════════════
bars
info "Step 5/7: Installing Metasploit gems..."

cd "$MSF_DIR"
bundle config set --local force_ruby_platform true
bundle config set --local without 'development test coverage'

# Bundle should skip nokogiri since it's already installed
bundle install -j$(nproc) --retry 5

# ═══════════════════════════════════════════════════════════
# STEP 6: CREATE SYMLINKS
# ═══════════════════════════════════════════════════════════
bars
info "Step 6/7: Creating symlinks..."

ln -sf "${MSF_DIR}/msfconsole" "${PREFIX}/bin/msfconsole"
ln -sf "${MSF_DIR}/msfvenom" "${PREFIX}/bin/msfvenom"
ln -sf "${MSF_DIR}/msfrpcd" "${PREFIX}/bin/msfrpcd"
ln -sf "${MSF_DIR}/msfdb" "${PREFIX}/bin/msfdb"

# ═══════════════════════════════════════════════════════════
# STEP 7: VERIFY
# ═══════════════════════════════════════════════════════════
bars
info "Step 7/7: Verifying installation..."

cd "$MSF_DIR"
bundle exec ruby -e "require 'nokogiri'; puts '[✓] Nokogiri OK'" && info "All dependencies verified!"

# ── Done ─────────────────────────────────────────────────────
bars
echo
echo -e "  ${Green}╔══════════════════════════════════════════════════╗${clear}"
echo -e "  ${Green}║   ✓ INSTALLATION COMPLETE t.me/efxtv !                       ║${clear}"
echo -e "  ${Green}╚══════════════════════════════════════════════════╝${clear}"
echo
echo -e "  ${Green}[+]${clear} Start Metasploit: ${Cyan}msfconsole${clear}"
echo
bars
