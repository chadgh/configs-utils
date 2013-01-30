# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"
DEFAULT_USER='chadgh'

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
if [[ $HOST == 'chadbang' ]] then
	plugins=(git vi-mode pip virtualenvwrapper)
else
	plugins=(git vi-mode)
fi

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
bindkey -v
unsetopt correct_all

EDITOR='vim'
if [[ $HOST == 'chadbang' ]] then
	path+='/home/chadgh/mybin'
	PROJECT_HOME='/home/chadgh/projects'
	EDITOR='gvim'
else
	PS1+="[$HOST] $PS1"
fi


#alias
alias up='cd ..'
alias sz='source ~/.zshrc'
alias ez="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias vimv="$EDITOR ~/.vimrc"
alias packup="packer -Syyu"

#ssh aliases
myhosts=(dev:dev stg:stg2 prod:riker las:web5 web9:web9 web3:web3 web7:web7)
for h in $myhosts; do
	stuff=("${(s/:/)h}")
	key=$stuff[1] 
	value=$stuff[2]
	alias $key="ssh chansen4@$value.lib.byu.edu"
done

#functions
zshsync() {
	for h in $myhosts; do
		stuff=("${(s/:/)h}")
		key=$stuff[1] 
		value=$stuff[2]
		thehost="chansen4@$value.lib.byu.edu"
		scp -r ~/.oh-my-zsh $thehost
		scp ~/.zshrc $thehost
		echo "$thehost completed"
	done
}

vimsync() {
	for h in $myhosts; do
		stuff=("${(s/:/)h}")
		key=$stuff[1]
		value=$stuff[2]
		thehost="chansen4@$value.lib.byu.edu"
		scp -r ~/.vim $thehost
		scp ~/.vimrc $thehost
		echo "$thehost completed"
	done
}
