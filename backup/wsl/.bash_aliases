#My aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias gs='git status -sb'
alias gaa='git add --all'
alias gc='git commit -m $2'
alias gp='git push'
alias gpo='git push origin'
alias gpl='git pull'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias ls='ls -F --color=auto --show-control-chars'
alias la='ls -A' # show all
alias ll='ls -l'
alias rm='rm -iv'

alias cls='clear'
alias py='python3'
alias ma='mamba activate $2'

alias ssp='sshpass -p "pass" ssh -o StrictHostKeyChecking=no $2'
alias cpy='sshpass -p "pass" scp -o StrictHostKeyChecking=no $2'

alias rubot='cd fga/rubot/ && py main.py'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'