# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
echo "══════════════════════════════════════════════════════════"
echo "🚀 You are using Zsh shell"
echo ""
echo "🐱 Notice: cat command is aliased to batcat"
echo "           ls command is aliased to exa"
echo "🔍 Ripgrep Usage: rg \"search_pattern\" target_file"
echo "📂 fd Usage: fd \"search_pattern\""
echo "📄 LS (exa) Display Options:"
echo "  -R, --recurse: recurse into directories"
echo "  -T, --tree: recurse into directories as a tree"
echo "  -D, --only-dirs: list only directories"
echo "══════════════════════════════════════════════════════════"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  enhancd
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
  # 他のプラグインをここに追加
)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval "$(starship init zsh)"
alias cat='batcat'
export PATH=$PATH:~/.local/bin
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
alias ls='exa --icons -F -H --group-directories-first -1 -aGF'

# pnpm
export PNPM_HOME="/home/tn/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export GPG_TTY=/dev/pts/7
source /home/tn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# run ls(exa) after cd
chpwd() {
	if [[ $(pwd) != $HOME ]]; then;
		ls
	fi
}

# setopt auto_list: 補完候補を一覧表示にする
# setopt auto_menu: TAB で順に補完候補を切り替える
# zstyle ':completion:*:default' menu select=1: 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
# :補完候補の色づけ
setopt auto_list
setopt auto_menu
zstyle ':completion:*:default' menu select=1 
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# function to alias npm to pnpm for interactive shells only
function npm() {
  # npm コマンドを pnpm にエイリアスする関数（インタラクティブシェルのみ）
  if [[ $- == *i* ]]; then
    if [[ -f $(command -v pnpm) ]]; then
      echo "pnpm で実行しています"
      pnpm "$@"
    else
      echo "pnpm がインストールされていません"
      command npm "$@"
    fi
  fi
}

# npm コマンドの色付け
function npm() {
  # npm コマンドを pnpm にエイリアスする関数（インタラクティブシェルのみ）
  if [[ $- == *i* ]]; then
    if [[ -f $(command -v pnpm) ]]; then
      echo "pnpm で実行しています"
      # pnpm コマンドの色付け
      export CLICOLOR=1
      export LSCOLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
      pnpm "$@"
    else
      echo "pnpm がインストールされていません"
      command npm "$@"
    fi
  fi
}

# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"

