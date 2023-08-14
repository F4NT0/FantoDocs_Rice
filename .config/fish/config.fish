
# ----------------------------
# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# ----------------------------                          

if status is-interactive
    # -------------------------
    # OH MY POSH CONFIGURATION
    # -------------------------
    oh-my-posh init fish --config ~/.config/oh-my-posh/fantodocs.omp.json | source

    # --------------------
    # REMOVE INTRO MESSAGE
    # --------------------
    set fish_greeting
    
    # ------------
    # GITHUB THEME
    # ------------
    source $__fish_config_dir/themes/github_dark.fish

    # ---------------
    # LSCOLORS THEME
    # ---------------
    set -Ux LS_COLORS 'di=1;32:ln=31:so=37:pi=37:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

    # --------
    # ALIASES
    # --------
    alias ls="lsd"
    alias c="clear"
    alias f="firefox"


end