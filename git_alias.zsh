# Influenced by https://github.com/hauntsaninja/my_git_aliases/

# add
alias ga='git add'
alias fga='git add $(git ls-files --modified --other --exclude-standard | fzf -m --preview "git diff --color -- {1}")'
alias gap='git add --patch'
alias gau='git add --update'
alias fgau='git add $(git ls-files --modified | fzf -m --preview "git diff --color -- {1}")'

# branch
alias gb='git branch'
alias gbc='git checkout -b'
alias gbcu='git checkout --track @{u} -b'
alias gbd='git branch --delete --force'
alias fgbd='git branch --delete --force $(git branch --sort=-authordate --color --verbose | fzf -m --ansi --preview "echo {} | pyp \"lines[0][1:].split()[0]\" | xargs -IXXX git log --stat --color -n 10 XXX --" | pyp "x[1:].split()[0]")'
alias gbm='git branch --move'
alias gbu='git branch --set-upstream-to'
alias gbv='git branch --verbose'
alias gbvv='git branch --verbose --verbose'
alias gbvl='git show-branch --topics origin/$(gbmaster)'

# checkout
alias gco='git checkout'
fgco () {git checkout $(git branch --sort=-authordate --color --format '%(HEAD) %(align:20)%(refname:short)%(end) %(color:dim)%(align:9)%(upstream:track)%(end) %(color:reset)%(contents:subject)' | fzf --ansi $([[ -z "$1" ]] && echo "" || echo "--query $@") --preview 'git log --stat --color -n 10 $(echo {} | pyp "lines[0][1:].split()[0]") --' | pyp "x[1:].split()[0]")}
alias gcom='git checkout $(gbmaster)'
alias gcoi='git checkout --'  # look into git restore at some point
alias fgcoi='git checkout $(git ls-files --modified | fzf -m --preview "git diff --color -- {1}")'

# merge
alias gm='git merge'

# commits
alias gc='git commit --verbose'
alias gc!='git commit --verbose --amend'
alias gcn!='git commit --verbose --no-edit --amend'
alias gca='git commit --verbose --all'
alias gca!='git commit --verbose --all --amend'
alias gcan!='git commit --verbose --all --no-edit --amend'

# restore
alias groi='git restore --'
alias grs='git restore --staged'

# log
alias glg='git log --stat'
fglg () {git log --color --oneline $@ | fzf --ansi --reverse --no-sort --preview 'git show --color {1}' | pyp 'x.split()[0]'}
alias glgp='git log --stat --patch'
alias glgpa='git log --stat --patch --author'

alias glgo="git log --date=local --pretty='%C(white)%h%C(yellow)%d %Cred%>|(30)%an%Creset: %s %<|(90)%C(yellow)(%cd)'"
alias glgoa="git log --date=local --pretty='%C(white)%h%C(yellow)%d %Cred%>|(30)%an%Creset: %s %<|(90)%C(yellow)(%cd)' --author"

# clone
alias gcl='git clone'
alias gd='git diff'

# pull/push
alias gl='git pull'
alias glu='git pull upstream $(git symbolic-ref --short HEAD)'
alias gloh='git pull origin --rebase $(git symbolic-ref --short HEAD)'
alias gp='git push'
alias gpoh='git push origin HEAD'

# status
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
