# ----------------------------------------------------
#
# ░░░██████╗░░█████╗░░██████╗██╗░░██╗██████╗░░█████╗░
# ░░░██╔══██╗██╔══██╗██╔════╝██║░░██║██╔══██╗██╔══██╗
# ░░░██████╦╝███████║╚█████╗░███████║██████╔╝██║░░╚═╝
# ░░░██╔══██╗██╔══██║░╚═══██╗██╔══██║██╔══██╗██║░░██╗
# ██╗██████╦╝██║░░██║██████╔╝██║░░██║██║░░██║╚█████╔╝
# ╚═╝╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░
#
# -----------------------------------------------------

# --------------------
# BASIC CONFIGURATION
# --------------------

# Check the window size after every command.
shopt -s checkwinsize

# Disable hashing (i.e. caching) of command lookups.
set +h

# ------------
# VI COMMANDS
# ------------

set -o vi

# ------------------
# GIT CONFIGURATION
# ------------------

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# --------------
# COLOR EXAMPLES
# --------------

blk='\033[0;30m'   # Black
red='\033[0;31m'   # Red
grn='\033[0;32m'   # Green
ylw='\033[0;33m'   # Yellow
blu='\033[0;34m'   # Blue
pur='\033[0;35m'   # Purple
cyn='\033[0;36m'   # Cyan
wht='\033[0;37m'   # White
clr='\033[00m'     # Reset

# -------------
# BASIC PROMPT
# -------------

PS1="$grn[\u : \W ] $cyn\$(parse_git_branch) $ylw > $clr"
export PS1

# -------
# ALIAS
# -------

# You need to install lsd 
# add lsd into the programs in the NixOS configuration file

alias -- l='lsd -alh'
alias -- ll='lsd -l'
alias -- ls='lsd'
alias -- lod='lsd -la'
alias -- c='clear'
alias -- f='firefox &'

# ------------------------
# LS_COLORS CONFIGURATION
# 
# The colors using ls command
# ------------------------

LS_COLORS=$LS_COLORS:'di=1;97:ex=0;32:*.png=0;93:*.jpg=0;93:*.zip=0;97:*deb=0;31:fi=0;34:*.nix=0;95:*.conf=0;95:*.java=0;33:*.class=1;33:*.cs=0;96:*.csproj=0;96:*.md=0;94:*.json=0;32:*.sh=0;92:*.py=0;94:*.=0;42';
export LS_COLORS;

# -------------------------
# OH MY POSH CONFIGURATION
# -------------------------

# you need to install oh-my-posh
# curl -s https://ohmyposh.dev/install.sh | bash -s

eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/fantodocs.omp.json)"
