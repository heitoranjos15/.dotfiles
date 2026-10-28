#!/usr/bin/env bash
# Bootstrap a new Mac from these dotfiles.
# Usage:
#   git clone https://github.com/heitoranjos15/.dotfiles ~/.dotfiles
#   ~/.dotfiles/install.sh
# Safe to re-run.

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES=(zsh kitty ghostty nvim tmux copilot herdr)

log() { printf '\n\033[1;32m==> %s\033[0m\n' "$*"; }

# --- Xcode command line tools (git, compilers) ---
if ! xcode-select -p >/dev/null 2>&1; then
    log "Installing Xcode command line tools (finish the dialog, then re-run)"
    xcode-select --install
    exit 1
fi

# --- Homebrew ---
if ! command -v brew >/dev/null 2>&1; then
    log "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

log "Installing Brewfile packages"
brew bundle --file="$DOTFILES/Brewfile"

# --- oh-my-zsh + plugins ---
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    log "Installing oh-my-zsh"
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
if [[ ! -d "$ZSH_PLUGINS/zsh-fzf-history-search" ]]; then
    git clone https://github.com/joshskidmore/zsh-fzf-history-search "$ZSH_PLUGINS/zsh-fzf-history-search"
fi

# --- symlinks ---
# Pre-create these so stow links the files inside them instead of
# turning the whole dir into a symlink into the repo (apps write state there).
mkdir -p "$HOME/.config" "$HOME/.copilot" "$HOME/.config/herdr" "$HOME/.config/ghostty"

log "Stowing: ${PACKAGES[*]}"
for pkg in "${PACKAGES[@]}"; do
    # back up real files that would block stow (e.g. a default ~/.zshrc)
    while IFS= read -r file; do
        target="$HOME/${file#"$DOTFILES/$pkg/"}"
        # skip anything already pointing into the repo (incl. via a linked parent dir)
        if [[ -e "$target" && ! -L "$target" && "$(realpath "$target")" != "$(realpath "$file")" ]]; then
            echo "backing up $target -> $target.bak"
            mv "$target" "$target.bak"
        fi
    done < <(find "$DOTFILES/$pkg" -type f)

    stow --dir="$DOTFILES" --target="$HOME" --restow "$pkg"
done

# --- secrets (not in git) ---
if [[ ! -f "$HOME/.zsh_env" ]]; then
    log "Creating empty ~/.zsh_env (put tokens/API keys here)"
    printf '# machine-local secrets, not tracked in git\n' > "$HOME/.zsh_env"
    chmod 600 "$HOME/.zsh_env"
fi

# --- node + copilot cli ---
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
set +u # nvm isn't nounset-safe
# shellcheck disable=SC1091
source "$(brew --prefix nvm)/nvm.sh"
if [[ "$(nvm version default)" == "N/A" ]]; then
    log "Installing node LTS via nvm"
    nvm install --lts
    nvm alias default 'lts/*'
fi
set -u
if ! command -v copilot >/dev/null 2>&1; then
    log "Installing GitHub Copilot CLI"
    npm install -g @github/copilot
fi

# --- default shell ---
if [[ "$SHELL" != *zsh ]]; then
    chsh -s "$(command -v zsh)"
fi

# --- verify ---
log "Verifying install"
failed=0
ok()   { printf '  \033[32m✓\033[0m %s\n' "$*"; }
fail() { printf '  \033[31m✗\033[0m %s\n' "$*"; failed=1; }

if brew bundle check --no-upgrade --file="$DOTFILES/Brewfile" >/dev/null 2>&1; then
    ok "Brewfile packages"
else
    fail "Brewfile packages missing:"
    brew bundle check --no-upgrade --file="$DOTFILES/Brewfile" --verbose 2>&1 | grep '→' | sed 's/^/      /' || true
fi

for cmd in stow nvim tmux fzf fd rg jq eza gh herdr node npm copilot; do
    if command -v "$cmd" >/dev/null 2>&1; then ok "$cmd"; else fail "$cmd not found"; fi
done

[[ -d "$HOME/.oh-my-zsh" ]] && ok "oh-my-zsh" || fail "oh-my-zsh not installed"
[[ -d "$ZSH_PLUGINS/zsh-fzf-history-search" ]] && ok "zsh-fzf-history-search" || fail "zsh-fzf-history-search missing"

for pkg in "${PACKAGES[@]}"; do
    pkg_ok=1
    while IFS= read -r file; do
        target="$HOME/${file#"$DOTFILES/$pkg/"}"
        if [[ "$(realpath "$target" 2>/dev/null)" != "$(realpath "$file")" ]]; then
            fail "$target is not linked to the repo"
            pkg_ok=0
        fi
    done < <(find "$DOTFILES/$pkg" -type f)
    [[ $pkg_ok -eq 1 ]] && ok "links: $pkg"
done

if [[ $failed -ne 0 ]]; then
    printf '\n\033[1;31mSome checks failed, see above. Fix them and re-run install.sh.\033[0m\n'
    exit 1
fi

log "Done. Next steps:"
cat <<'EOF'
  - fill in ~/.zsh_env with your tokens
  - gh auth login && copilot   (log in to GitHub / Copilot)
  - open nvim once to let lazy.nvim + mason install everything
  - open a new terminal
EOF
