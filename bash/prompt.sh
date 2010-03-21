# http://blog.bitfluent.com/post/27983389/git-utilities-you-cant-live-without
# http://superuser.com/questions/31744/how-to-get-git-completion-bash-to-work-on-mac-os-x

# henrik@Nyx ~/.dotfiles[master*]$ 

# MacPorts git bash completion
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\e[1;33m\]\u@\h \[\e[0;33m\]\w\[\e[0m\]\[\e[32m\]$(__git_ps1 "[%s]")\[\e[0m\]$ '
