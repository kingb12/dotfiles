# Path to your oh-my-zsh installation.
export ZSH=/Users/bking/.oh-my-zsh

POWERLEVEL9K_MODE='awesome-patched'
TERM=xterm-256color
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$ZSH/customizations

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git battery brew zsh-syntax-highlighting)

# User configuration
#source $HOME/.trello_config
source $HOME/.rvm/scripts/rvm
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:/users/bking/Library/Python/2.7/bin/"
PATH="$PATH:/usr/local/mysql/bin"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gitclean_preview="git branch --merged | grep -v '\*'"
alias gitclean="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"

# Extraction
function extract()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar x $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)
      echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias ls='ls -G'
alias ll='ls -laG'
alias la='ls -aG'
alias ..='cd ..'
alias .='pwd;ls -G'
alias ~='cd ~'
alias l='ls -G'
alias gpull='git pull --rebase'
alias gcom='git commit -am'
alias gfp='git fetch && git pull'
alias gpushforce='git push --set-upstream origin `git branch --show-current` --force'
alias gcam='git commit --amend -am'
alias gpush='git push'
alias gs='git status'
alias ggraph='git log --decorate --graph --all --pretty=format:"%C(yellow)%h %C(green)%ad %C(dim white)[%cn] %Creset%Cblue%s%Creset%b%Cred%d" --date=short'
alias gremote="git fetch -p && git for-each-ref --format='%(color:cyan)%(authordate:format:%m/%d/%Y %I:%M %p)    %(align:25,left)%(color:yellow)%(authorname)%(end) %(color:reset)%(refname:strip=3)' --sort=author refs/remotes"
alias glog='git log'
alias pips= 'sudo pip'
alias mci='mvn clean install'

# aliases for connecting to other hosts
alias attu='ssh kingb12@attu.cs.washington.edu'
alias attux='ssh -X kingb12@attu.cs.washington.edu'
alias kbox='ssh -i ~/.bking-kbase.pem `get_kbox_dns`'
alias kboxftp='sftp -i ~/.bking-kbase.pem `get_kbox_dns`'

function get_kbox_dns() {
    echo 'bking@'`aws ec2 describe-instances --instance-ids i-93b23c44 | grep 'PublicDnsName' | grep -o '"ec2.*"'| sed 's/"//g'`
}


# mysql service aliases
alias mysqlstart='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysqlstop='sudo /usr/local/mysql/support-files/mysql.server stop'

# postgresql service aliases
alias psqlstart='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias psqlstop='pg_ctl -D /usr/local/var/postgres -l logfile stop'

# Frontdoor Local DB aliases
alias fd_clear_db='echo "drop schema frontdoor; create schema frontdoor; drop schema frontdoor_audit; create schema frontdoor_audit;" | mysql -u root'
alias ppo_clear_db='echo "drop schema ppo; create schema ppo;" | mysql -u root'
alias chime_clear_db='echo "drop schema chime; create schema chime;" | mysql -u root'
alias fd_load_alpha_db='echo "source /users/bking/frontdoor-dw/fd-alpha.dump" | mysql -u root -D frontdoor'
alias whatisprodaws='aws sts get-caller-identity --profile production'
alias fd_load_users="mysql -u root < frontdoor-dw-service/other/sql/setupUsers_local.sql;  mysql -u root < frontdoor-dw-service/other/sql/setupUsers_local-audit.sql; echo \"GRANT ALL ON frontdoor.* TO 'fd-audit'@'localhost';\" | mysql -u root"
  
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('dir' 'vcs')
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('time') 
POWERLEVEL9K_RVM_BACKGROUND="red"
POWERLEVEL9K_RVM_FOREGROUND="black"
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=8
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_BATTERY_CHARGED="green"
POWERLEVEL9K_BATTERY_CHARGING="yellow"
POWERLEVEL9K_BATTERY_LOW_THRESHOLD=15
POWERLEVEL9K_BATTERY_LOW_COLOR="red"
POWERLEVEL9K_SHORTEN_STRATEGY=""
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# ssh keys for agent forwarding
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

PATH="/Users/bking/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/bking/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/bking/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/bking/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/bking/perl5"; export PERL_MM_OPT;

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Created by `userpath` on 2020-12-16 21:25:08
export PATH="$PATH:/Users/bking/.local/bin"
