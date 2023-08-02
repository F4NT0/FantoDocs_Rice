# Color configuration to bash shells

We can change the color from the files and directories using the `LS_COLORS` variable like below

```shell
LS_COLORS=$LS_COLORS:'di=1;33:ln=36' ; export LS_COLORS; ls
```

---

## Color codes

- 30  = black
- 31  = red
- 32  = green
- 33  = orange
- 34  = blue
- 35  = purple
- 36  = cyan
- 37  = grey
- 90  = dark grey
- 91  = light red
- 92  = light green
- 93  = yellow
- 94  = light blue
- 95  = light purple
- 96  = turquoise
- 97  = white

---

## Font style

- 0   = default color
- 1   = bold
- 4   = underlined
- 5   = flashing text (disabled on some terminals)
- 7   = reverse field (exchange foreground and background color)
- 8   = concealed (invisible)

---

## Background colors

- 40  = black background
- 41  = red background
- 42  = green background
- 43  = orange background
- 44  = blue background
- 45  = purple background
- 46  = cyan background
- 47  = grey background
- 100 = dark grey background
- 101 = light red background
- 102 = light green background
- 103 = yellow background
- 104 = light blue background
- 105 = light purple background
- 106 = turquoise background
- 107 = white background

---

## File types

- bd = (BLOCK, BLK)   Block device (buffered) special file
- cd = (CHAR, CHR)    Character device (unbuffered) special file
- di = (DIR)  Directory
- do = (DOOR) [Door][1]
- ex = (EXEC) Executable file (ie. has 'x' set in permissions)
- fi = (FILE) Normal file
- ln = (SYMLINK, LINK, LNK)   Symbolic link. If you set this to ‘target’ instead of a numerical value, the - color is as for the file pointed to.
- mi = (MISSING)  Non-existent file pointed to by a symbolic link (visible when you type ls -l)
- no = (NORMAL, NORM) Normal (non-filename) text. Global default, although everything should be something
- or = (ORPHAN)   Symbolic link pointing to an orphaned non-existent file
- ow = (OTHER_WRITABLE)   Directory that is other-writable (o+w) and not sticky
- pi = (FIFO, PIPE)   Named pipe (fifo file)
- sg = (SETGID)   File that is setgid (g+s)
- so = (SOCK) Socket file
- st = (STICKY)   Directory with the sticky bit set (+t) and not other-writable
- su = (SETUID)   File that is setuid (u+s)
- tw = (STICKY_OTHER_WRITABLE)    Directory that is sticky and other-writable (+t,o+w)
- *.extension = Every file using this extension e.g. *.rpm = files with the ending .rpm

---

## Example

```shell
LS_COLORS=$LS_COLORS:'di=1;33:ln=36' ; export LS_COLORS; ls
```