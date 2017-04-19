# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
alias rm='rm -if'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'


# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
alias ls='ls -1hF --color=tty'                  # joe customize
alias ls-al='ls -al'                            # fix typo missing space
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -lAXh'                           # show all, sort by extension
alias l='ls -CF'                              #


alias c='clear'

# vim aliases
alias mvim='vim -M'
alias rvim='vim -R'

# cd alias
alias .='echo $PWD'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cdxlxz='cd /cygdrive/d/迅雷下载/'
alias cddocument='cd /cygdrive/d/库/文档/AMyFiles/'
alias cddesktop='cd /cygdrive/c/Users/lenovo/Desktop/'

# useful alias list: https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

