[ -f ~/.alias ] && source ~/.alias
[ -f ~/.librato/config ] && source ~/.librato/config
[ -f /usr/local/etc/bash_completion.d/git-prompt.sh ] && source /usr/local/etc/bash_completion.d/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM=(auto verbose)

# PS1='\[\033[1m\]\[\033[00;37m\]\u\[\033[0m\]\[\033[00;34m\]@\h\[\033[0m\]\[\033[00;30m\]:\[\033[0m\]\[\033[00;33m\]\W \[\033[0m\]\$ '
PS1='\[\033[1m\]\[\033[00;37m\]\u\[\033[0m\]\[\033[00;34m\]@\h\[\033[0m\]\[\033[00;30m\] \[\033[0m\]\[\033[00;33m\]\W \[\033[00;32m\]$(__git_ps1 "(%s)")\[\033[0m\]\$ '

JAVA_HOME=$(/usr/libexec/java_home)
EC2_HOME=/usr/local/ec2
GOPATH=$HOME/workspace/go
PATH="$HOME/bin:$HOME/.rbenv/bin:$EC2_HOME/bin:$JAVA_HOME/bin:/usr/local/bin:$PATH"

if [ -f ~/.aws/config ]; then
  AWS_ACCESS_KEY="$(grep aws_access_key ~/.aws/config | awk '{print $3}')"
  AWS_SECRET_KEY="$(grep secret_access ~/.aws/config | awk '{print $3}')"
fi

export PATH JAVA_HOME AWS_ACCESS_KEY AWS_SECRET_KEY GOPATH
eval "$(rbenv init -)"
eval "$(dvm env)"

function docker-enter() {
  dvm ssh -c '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  dvm ssh -c "sudo /var/lib/boot2docker/docker-enter $@"
}

function pt() { papertrail -f -d 5 $* | colortail -g papertrail; }
