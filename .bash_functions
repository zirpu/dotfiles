
## functions
snr(){
    _host=$1; shift
    tmux new-window -n $_host "ssh -X $_host  $*";
}

psg(){
    ps -ewf |egrep -i "$1" | grep -v grep
}

psm(){
    ps -ewf | sort | more
}

function gclone(){
    # just the last part of the path.
    a=$(basename $1)
    git clone $1 $a
    z.repos reg $a

}

function gclone2(){
    # into user/whatever.git
    a=$(basename $1)
    b=$(dirname $1); b=$(basename $b)
    git clone $1 $b/$a
    z.repos reg $b/$a
}
