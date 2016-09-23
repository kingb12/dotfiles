# Custom aliases I'm using
alias gitclean_preview="git branch --merged | grep -v '\*'"
alias gitclean="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"
alias rsync="/usr/local/bin/rsync"
#alias ssh="/usr/local/bin/mosh"
#alias sssh="/usr/bin/ssh"
