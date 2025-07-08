#!/bin/bash

# === 사용자 설정 ===
REPO_DIR="$PWD"        # git clone 해둔 디렉토리
VIMRC_SOURCE="$REPO_DIR/vimrc"   # 저장소 내 vimrc 경로
VIMRC_TARGET="$HOME/.vimrc"      # 실제로 링크할 위치
BACKUP_DIR="$REPO_DIR/vim_backup"    # 백업 저장 위치
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

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

# 3. Vundle 설치
if [ ! -d "$VUNDLE_DIR" ]; then
    echo "📥 Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
else
    echo "✅ Vundle already installed"
fi

# 4. 플러그인 설치
echo "📦 Installing plugins with Vundle..."
vim +PluginInstall +qall

echo "✅ Done! Vim with Vundle is ready 🎉"


#iterm2 Shell Integration
curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash
