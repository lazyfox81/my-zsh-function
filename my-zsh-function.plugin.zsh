#--------------------------------------------------------------
# My Zsh aliases and functions
#-------------------------------------------------------------

#aliases
alias св='cd'
alias rm='rm -rfv'
alias cp='cp -rv'
alias zs='source $HOME/.zshrc'
alias mv='mv -v'
alias update='yaourt -Syua --noconfirm'
alias emkey='nohup feh $HOME/dotfiles/ergoemacs-layout-us.png &'
alias fetch2="fetch \
--ascii distro \
--block_range 0 15 \
--line_wrap off \
--uptime_shorthand on \
--gpu_shorthand on \
--gtk_shorthand on \
--shell_path off \
--shell_version on \
"

alias steam='$HOME/bin/steam.sh'

alias android-mnt='jmtpfs ~/mtp'
alias android-umnt='fusermount -u ~/mtp'
alias clock='tty-clock -s -c -C 4 -D'
alias -s {avi,mpeg,mpg,mov,m2v,flv}=mplayer
alias -s {ogg,mp3,wav,wma}=mplayer
alias -s {png,gif,jpg,jpeg}='feh -g 800x600'
alias -s txt=$PAGER
alias -s {pdf,djvu}=zathura

#aliases for git
alias gash='git add . && git commit --message "Update files" && git push'

# simple calculator
calc() printf '%.6g\n' $(($*))

# noglob prevents processing of special characters
alias calc='noglob calc'

# cat with line numbers
ncat() {
if [ -z $1 ]
then
	echo "Add file name"
else
	FILE=$1
	sed '=' $FILE | sed 'N; s/\n/ /'
fi
}

# colorized less
cless() {ncat $1 | colorize | less;}
alias -s cpp=cless

# my IP
myip() {links -source http://www.formyip.com/ | grep The | awk {'print $5'}}

# create a directory and move into it
mkcd(){ mkdir $1; cd $1 }

# http://muhas.ru/?p=55
unpk() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xjvf $1      ;;
            *.tgz)       tar xzvf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "I don't know how to unpack '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

pk() {
    if [ $1 ] ; then
        case $1 in
            tbz)   	tar cjvf $2.tar.bz2 $2                  ;;
            tgz)   	tar czvf $2.tar.gz  $2                  ;;
            tar)  	tar cpvf $2.tar  $2                     ;;
            bz2)	bzip $2                                 ;;
            gz)		gzip -c -9 -n $2 > $2.gz                ;;
            zip)   	zip -r $2.zip $2                        ;;
            7z)    	7z a $2.7z $2                           ;;
            *)     	echo "'$1' cannot been packed via pk()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

pkl() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar jtf $1                   ;;
            *.tar.gz)    tar ztf $1                   ;;
            *.rar)       unrar l $1                   ;;
            *.tar)       tar tf $1                    ;;
            *.tbz2)      tar jtf $1                   ;;
            *.tgz)       tar ztf $1                   ;;
            *.zip)       7z l -tzip $1                ;;
            *.7z)        7z l $1                      ;;
            *)           echo "I cannot list '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
alias -s {bz2,gz,rar,tar,tbz2,tgz,zip,7z}=pkl
