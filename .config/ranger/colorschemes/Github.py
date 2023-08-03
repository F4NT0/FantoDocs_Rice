from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

# -------------------------------------------------------------------------
#     ____                                 ________                      
#    / __ \____ _____  ____ ____  _____   /_  __/ /_  ___  ____ ___  ___ 
#   / /_/ / __ `/ __ \/ __ `/ _ \/ ___/    / / / __ \/ _ \/ __ `__ \/ _ \
#  / _, _/ /_/ / / / / /_/ /  __/ /       / / / / / /  __/ / / / / /  __/
# /_/ |_|\__,_/_/ /_/\__, /\___/_/       /_/ /_/ /_/\___/_/ /_/ /_/\___/ 
#                  /____/                                               
# -------------------------------------------------------------------------
 
class Github(ColorScheme):
    progress_bar_color = white

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        # ---------------
        # GENERAL COLORS
        # --------------
        elif context.in_browser:

            # The selection area where is the current selected
            if context.selected:
                attr = white
                bg = black
            else:
                attr = normal

            # when the folder is empty or gives error
            if context.empty or context.error:
                attr |= bold
                fg = red
                bg = -1

            # when ranger has a border
            if context.border:
                fg = black
            
            # The color of the image links
            if context.image:
                fg = yellow
            
            # The color of the video links
            if context.video:
                fg = orange
            
            # The color of the audio links
            if context.audio:
                fg = magenta
            
            # The color of the documents links
            if context.document:
                fg = blue
            
            # The color of the container links
            if context.container:
                attr |= bold
                fg = red

            # The color of the directories
            if context.directory:
                attr |= bold
                fg = white

            # The color of the executable files   
            elif context.executable and not \
                    any((context.media, context.container, context.fifo, context.socket)):
                attr |= normal
                fg = magenta

            # The color of the socket files
            if context.socket:
                fg = cyan
                attr |= bold
            
            # The color of the fifo and devices
            if context.fifo or context.device:
                fg = cyan
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and red or blue
            if context.bad:
                fg = red
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (red, white):
                    fg = blue
                else:
                    fg = cyan
            if not context.selected and (context.cut or context.copied):
                fg = cyan
                bg = black
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = black
            if context.badinfo:
                if attr & reverse:
                    bg = red
                else:
                    fg = white

        # --------------------
        # TITTLE BAR AND TABS
        # --------------------
        elif context.in_titlebar:
            attr |= normal
            if context.hostname:
                fg = context.bad and red or cyan
            elif context.directory:
                fg = green
            elif context.tab:
                if context.good:
                    bg = blue
            elif context.link:
                fg = white

        # -----------
        # STATUS BAR
        # -----------
        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = yellow
                    bg = default
                elif context.bad:
                    fg = red
            if context.marked:
                attr |= bold | reverse
                fg = blue
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = cyan
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = green
                attr &= ~bold
            if context.vcscommit:
                fg = magenta
                attr &= ~bold

        # -----------------
        # GIT VERIFICATION
        # -----------------
        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = blue

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color


        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = cyan
            elif context.vcschanged:
                fg = green
            elif context.vcsunknown:
                fg = red
            elif context.vcsstaged:
                fg = white
            elif context.vcssync:
                fg = green
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync:
                fg = cyan
            elif context.vcsbehind:
                fg = blue
            elif context.vcsahead:
                fg = red
            elif context.vcsdiverged:
                fg = white
            elif context.vcsunknown:
                fg = black

        return fg, bg, attr
