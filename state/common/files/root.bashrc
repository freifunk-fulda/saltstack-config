# THIS FILE IS CONTROLLED BY SALTSTACK!

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth
# disable history
export HISTFILESIZE=0
export HISTSIZE=500

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
      # We have color support; assume it's compliant with Ecma-48
      # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
      # a case would tend to support setf rather than setaf.)
      color_prompt=yes
  else
      color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
   PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

alias halt='echo Wrong PC! Use /sbin/halt'
alias reboot='echo Wrong PC! Use /sbin/reboot'
alias shutdown='echo Wrong PC! Use /sbin/shutdown'

alias ls='ls --color'
alias la='ls -la'
alias ls-al='ls -al'
alias l='ls -lh'
alias ..='cd ..'
alias ...='cd ../..'
alias listen='netstat -anp |grep LISTEN'
alias batctl="batctl -m fffd.bat"
