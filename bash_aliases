###alias###

# ls
alias lal='ls -lha'

# tmux color
alias tmux='tmux -2'

# Memory
alias free='free -h'

# Network tool
alias p='ping'
alias n='nslookup'
alias d='dig'
alias t='mtr'
alias ssh='ssh -v'

# cd
alias cd..='cd ..'
alias cd...='cd ../..'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# other alias
alias c='clear'
alias sudo='sudo -E'
alias less='less -R'
alias du='du -h'
alias df='df -hT'
alias wgetncc='wget --no-check-certificate'
alias last='last | less'
alias tree='tree -C'
alias optipng='optipng -o7 -zm1-9 -preserve'

# Kubernetes alias
alias k="kubectl"
alias ka="kubectl get all -o wide"
alias kaceph="kubectl get all -n ceph -o wide"
alias kasys="kubectl get all -n kube-system -o wide"
