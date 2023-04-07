# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# use windows git if path is from /mnt
# checks to see if we are in a windows or linux dir
function isWinDir() {
  path=`realpath $PWD`
  case $path/ in
    /mnt/*) return $(true);;
    *) return $(false);;
  esac
}
# wrap the git command to either run windows git or linux
function git() {
  if isWinDir
  then
    git.exe "$@"
  else
    /usr/bin/git "$@"
  fi
}
# https://github.com/microsoft/WSL/issues/4401

# User specific environment and startup programs

PATH=$PATH:$HOME/bin
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

export PATH
