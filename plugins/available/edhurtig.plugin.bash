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

alias trash="rmtrash"

alias sourcetree='open -a SourceTree'
alias stree=sourcetree
eval $(thefuck --alias)
