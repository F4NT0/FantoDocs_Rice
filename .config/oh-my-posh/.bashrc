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

# -----------------------
# STARTING CONFIGURATION
# -----------------------

# Only execute this file once per shell.
if [ -n "$__ETC_BASHRC_SOURCED" ] || [ -n "$NOSYSBASHRC" ]; then return; fi
__ETC_BASHRC_SOURCED=1

# If the profile was not loaded in a parent process, source
# it.  But otherwise don't do it because we don't want to
# clobber overridden values of $PATH, etc.
if [ -z "$__ETC_PROFILE_DONE" ]; then
    . /etc/profile
fi

# We are not always an interactive shell.
if [ -n "$PS1" ]; then

# ----------------------
# PROMPT CONFIGURATION
# ----------------------


if [ "$TERM" != "dumb" ] || [ -n "$INSIDE_EMACS" ]; then
  PROMPT_COLOR="1;31m"
  ((UID)) && PROMPT_COLOR="1;32m"
  if [ -n "$INSIDE_EMACS" ] || [ "$TERM" = "eterm" ] || [ "$TERM" = "eterm-color" ]; then
    # Emacs term mode doesn't support xterm title escape sequence (\e]0;)
    PS1="\n\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
  else
    PS1="\n\[\033[$PROMPT_COLOR\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] "
  fi
  if test "$TERM" = "xterm"; then
    PS1="\[\033]2;\h:\u:\w\007\]$PS1"
  fi
fi

# --------------------------------------
# Programmable completion verification
# --------------------------------------

# Check whether we're running a version of Bash that has support for
# programmable completion. If we do, enable all modules installed in
# the system and user profile in obsolete /etc/bash_completion.d/
# directories. Bash loads completions in all
# $XDG_DATA_DIRS/bash-completion/completions/
# on demand, so they do not need to be sourced here.
if shopt -q progcomp &>/dev/null; then
  . "/nix/store/65y2ssyppr6f23dpbpy4i8f37vabfc8i-bash-completion-2.11/etc/profile.d/bash_completion.sh"
  nullglobStatus=$(shopt -p nullglob)
  shopt -s nullglob
  for p in $NIX_PROFILES; do
    for m in "$p/etc/bash_completion.d/"*; do
      . "$m"
    done
  done
  eval "$nullglobStatus"
  unset nullglobStatus p m
fi

# -------------
# ALIAS
# -------------

# OBS: need to install lsd into your NixOS
# add lsd into your NixOS configuration file

alias -- l='lsd -alh'
alias -- ll='lsd -l'
alias -- ls='lsd'
alias -- lod='lsd -la'

# --------------------
# COLOR CONFIGURATION
# --------------------

# ---------------------
# EXTRA CONFIGURATIONS
# ---------------------

# Disable hashing (i.e. caching) of command lookups.
set +h

# Check the window size after every command.
shopt -s checkwinsize

# ------------
# OH MY POSH
# ------------