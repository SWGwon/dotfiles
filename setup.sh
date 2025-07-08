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


#iterm2 Shell Integration
if [ ! -f "$HOME/.iterm2_shell_integration.bash" ]; then
    echo "📥 Installing iTerm2 Shell Integration..."
    curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash
else
    echo "✅ iTerm2 Shell Integration already installed"
fi

# NVM (Node Version Manager)
if ! command -v nvm &> /dev/null; then
    echo "📥 Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
else
    echo "✅ NVM already installed"
fi

# Gemini CLI
# Ensure nvm is sourced for npm to be available
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if ! command -v gemini &> /dev/null; then
    echo "📥 Installing Gemini CLI..."
    nvm install --lts
    npm install -g @google/gemini-cli
else
    echo "✅ Gemini CLI already installed"
fi

