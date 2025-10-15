#!/bin/bash

# === 사용자 설정 ===
REPO_DIR="$PWD"        # git clone 해둔 디렉토리
VIMRC_SOURCE="$REPO_DIR/vimrc"   # 저장소 내 vimrc 경로
VIMRC_TARGET="$HOME/.vimrc"      # 실제로 링크할 위치
BACKUP_DIR="$REPO_DIR/vim_backup"    # 백업 저장 위치
PLUG_DIR="$HOME/.vim/autoload/plug.vim"

echo "🔧 Setting up vim config..."

# 1. 기존 vimrc 백업
if [ -f "$VIMRC_TARGET" ]; then
    echo "📦 Backing up existing vimrc to $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    mv "$VIMRC_TARGET" "$BACKUP_DIR/vimrc.backup.$(date +%s)"
fi

# 2. 심볼릭 링크 생성
echo "🔗 Creating symlink: $VIMRC_TARGET -> $VIMRC_SOURCE"
ln -sf "$VIMRC_SOURCE" "$VIMRC_TARGET"

# 3. vim-plug 설치
if [ ! -f "$PLUG_DIR" ]; then
    echo "📥 Installing vim-plug..."
    curl -fLo "$PLUG_DIR" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "✅ vim-plug already installed"
fi

# 4. 플러그인 설치
echo "📦 Installing plugins with vim-plug..."
vim +PlugInstall +qall

echo "✅ Done! Vim with vim-plug is ready 🎉"

#brew
git clone https://github.com/Homebrew/brew ~/.linuxbrew
echo 'eval "$($HOME/.linuxbrew/bin/brew shellenv)"' >> ~/.bash_rc
echo 'export CMAKE_PREFIX_PATH=$(brew --prefix)' >> ~/.bash_rc
source ~/.bash_rc
