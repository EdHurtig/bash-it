# Eddie Hurtig's Personal Bash Plugin

alias paux="ps aux | grep -v iTerm | grep -v -- '-bash'"
alias ps2="ps | grep -v iTerm | grep -v -- '-bash'"

shopt -s cdspell
export PATH="~/bin:$PATH"
capture() {
    sudo dtrace -p "$1" -qn '
        syscall::write*:entry
        /pid == $target && arg0 == 1/ {
            printf("%s", copyinstr(arg1, arg2));
        }
    '
}

function from() {
    FROM_PWD=$PWD
    cd $1
    shift
    if [ "$1" == "do" ]; then
        shift
    fi
    $@
    cd $FROM_PWD
    unset FROM_PWD
}

export EDITOR="$(which vim)"
alias rdp='rdesktop -u $SUDBURY_USER -d $SUDBURY_DOMAIN -p $SUDBURY_PASS -f -g1920x1050'
alias google="firefox --search"
alias a="atom"
alias trash="rmtrash"
alias serve='python -m SimpleHTTPServer'
alias sourcetree='open -a SourceTree'
alias stree=sourcetree
if [ `which thefuck` ]; then
  eval $(thefuck --alias)
fi

for f in ~/.bashrc_*; do 
  source $f
done
