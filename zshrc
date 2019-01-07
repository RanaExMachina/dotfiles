###########
## NOTES ##
###########

# use with oh-my-zsh

###############
## OH-MY-ZSH ##
###############

# set PATH
export PATH_LOCAL=/home/nicolai/bin
export PATH_DOTFILES=/home/nicolai/dotfiles/bin
export PATH_RUBY=/home/nicolai/.gem/ruby/2.4.0/bin
export PATH_RUST=$HOME/.cargo/bin
export GOPATH=$HOME/dev/go

export PATH=$PATH_LOCAL:$PATH_DOTFILES:$PATH_RUBY:$PATH_RUST:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/nicolai/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="nidoranarion/nidoranarion"

# Enable auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/dotfiles/oh-my-zsh-themes

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  gitfast
  aws
  mvn
  gradle
  compleat
)

source $ZSH/oh-my-zsh.sh

##########################
### User configuration ###
##########################

# ZSH options
# ###########

# vim keybindings
# bindkey -v

# reduce key timeout from 0.4 seconds to 0.1 seconds
export KEYTIMEOUT=1

# execute history expansion immediately
unsetopt HIST_VERIFY

# share history between sessions
setopt SHARE_HISTORY

# don't match dotfiles
setopt noglobdots

# Variables
# #########

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if [[ -x "$(command -v v)" ]]; then
  export VISUAL='nvim-gtk'
fi

export TERMINAL=alacritty

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export JAVA_HOME=/usr/lib/jvm/default
export GIT_EDITOR=nvim
export NVIM_GTK_NO_HEADERBAR=1

# aliases
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset' --abbrev-commit --date=relative -n20"
# alias v="NVIM_GTK_NO_HEADERBAR=1 nvim-gtk 2>/dev/null"
alias v=nvim-qt
alias f="files . &"
alias l="ls -lsh"
alias o=open

# names directories: http://zshwiki.org/home/examples/aliasdirs
hash -d dotfiles=~/dotfiles
hash -d project=~/uni/Semester15/17-WS-Password-Hashing


if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

###############
## FUNCTIONS ##
###############

# prevent nested ranger instances
# ranger() {
#     if [ -z "$RANGER_LEVEL" ]; then
#         /usr/bin/ranger "$@"
#     else
#         exit
#     fi
# }

####################################
## SYSTEM DEPENDENT CONFIGURATION ##
####################################

# Mac OS stuff
case `uname` in
    Darwin)
        # variables
        export GNATPATH=/usr/bin/gnat

        #aliases
        alias gvim="mvim"

        #profiles
        zstyle ':chpwd:profiles:/Users/nicolai/Documents/Uni/Bachelor(|/|/*)' profile ada
        chpwd_profile_ada()
        {
            [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
            print "chpwd(): Switching to profile: $profile"
            export MACOSX_DEPLOYMENT_TARGET=10.9
            #export PATH="/usr/bin/gnat:$PATH"
        }
    ;;
esac

# Linux stuff
case `uname` in
    Linux)

        # aliases
        # alias hibernate="sudo pm-hibernate"

        #profiles
    ;;
esac

#####################################
## MACHINE DEPENDENT CONFIGURATION ##
#####################################

case `uname -n` in
    snitsig)

        # variables
        export GNATPATH=/opt/gnat2016/bin

        hash -d media=/media/nico/media

        #profiles
        zstyle ':chpwd:profiles:/home/nicolai/Documents/Uni/Bachelor(|/|/*)' profile ada
        chpwd_profile_ada()
        {
            [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
            print "chpwd(): Switching to profile: $profile"
            export PATH="$GNATPATH:$PATH"
        }
    ;;
esac

case `uname -n` in
    curie)

        hash -d research=~/uni/master/master-research
    ;;
esac

case `uname -n` in
    archbook)
        # variables
        export TERMINAL=termite
        export GNATPATH=/opt/gnat2016/bin


        #profiles
        zstyle ':chpwd:profiles:/home/nicolai/Documents/Uni/Bachelor(|/|/*)' profile ada
        chpwd_profile_ada()
        {
            [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
            print "chpwd(): Switching to profile: $profile"
            export PATH="$GNATPATH:$PATH"
        }
        ;;
esac

case `uname -n` in
    swagberrypi)
        # variables
        export TERM=linux
        ;;
esac

source /etc/profile.d/autojump.sh

export LS_COLORS="fi=0:di=34:ln=35:so=36:pi=33:ex=32:bd=34:cd=34:su=34:sg=34:tw=34:ow=34:"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
