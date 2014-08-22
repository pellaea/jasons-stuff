alias dir='ls -AF'
alias dirf='ls -AlF'
alias dirt='ls -AlrtF'
alias dirz='ls -lF'
alias dird='ls -lF | grep ^d'
alias dirx='ls -AdlF [^.]* | grep -v "^[ld]"'
alias cd..='cd ..'
alias rd='rmdir'
alias md='mkdir'
alias cls='clear'
alias del='rm -f'
alias mv='mv -i'
alias cp='cp -i'
alias grep='grep -s'

alias s='source ~/.bash_aliases'
alias aka='vim ~/.bash_aliases && source ~/.bash_aliases'
alias what='alias | egrep "^alias $(history -p !:1)="'

alias dos2unix='perl -p -i -e "s/[\r\n]*\$/\n/o"'
alias unix2dos='perl -p -i -e "s/[\r\n]*\$/\r\n/o"'
alias deutf='perl -pi -e "s/\A\xFE\xFF//xg; s/\A\xEF\xBB\xBF//xg; s/\s*\r\n\Z/\n/xg; \$_"'
alias lc='perl -e "foreach (@ARGV) { rename \$_, lc(\$_) }"'
alias uniq='perl -n -e "print unless \$seen{\$_}++"'

alias vgrep='vim `$(history -p !grep:0) -- $(history -p !grep:*)`'

function pfind {
  find $2 -type f -exec egrep -H $1 \{} \;
}

function vfind {
  vim `find $2 -type f -exec egrep -H -l $1 \{} \;`
}
