# Andy's git zsh config, consisting of:
#
# 1. A subset of the aliases defined in the oh-my-zsh git plugin (see
#    https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) - this is
#    still a large list but the full set is overwhelming and most of it
#    I never ever used.
#
# 2. Some aliases of my own (a few of which override the ones the
#    oh-my-zsh git plugin would define).
#
# 3. A few handy functions.
#
# Note that your ~/.gitconfig maybe also contain an [alias] section,
# though really it's subcommands.  Perhaps some of the things here
# could be moved to there, really...



# SECTION 1: Stuff lifted from the oh-my-zsh git plugin, defined in
#            the same order as they appear in that plugin.

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
compdef _git _git_log_prettily=git-log

alias ga='git add'
alias gau='git add --update'

alias gb='git branch'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

# These next 3 _are_ from the oh-my-zsh git plugin, but we remove the -v flag,
# preferring to set it by hand when desired.
alias gc='git commit'
alias gc!='git commit --amend'
alias gcn!='git commit --no-edit --amend'
alias gclean='git clean -id'
alias gpristine='git reset --hard && git clean -dfx'
# Restore: discard unstaged changes, retain staged ones
alias grs='git restore --'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'

alias gf='git fetch'

alias gfg='git ls-files | grep'

alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias ghh='git help'

alias gl='git pull'
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp="_git_log_prettily"

alias gm='git merge'
alias gma='git merge --abort'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gpv='git push -v'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase develop'
alias grbi='git rebase -i'
alias grbm='git rebase `gwm`'

alias grh='git reset'
alias gru='git reset --'
alias grhh='git reset --hard'
alias grm='git rm'
alias grmc='git rm --cached'

alias gsh='git show'
alias gstd='git stash drop'
alias gstl='git stash list | cat'
alias gstp='git stash pop'
alias gstall='git stash --all'

alias gsw='git switch'
alias gswm='git switch `gwm`'  # Slightly different implementation to oh-my-zsh

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'



# SECTION 2: My own aliases

alias g='git status --short'
alias gap='git add -p'
alias gcm='git commit -m'
alias gcme='git commit -e -m'
alias gcmq='SKIP=pytest git commit -m'
alias gcmqq='git commit --no-verify -m'
alias gdc='git diff --cached'
# Copy the current commit hash to the clipboard
alias ghcp="git rev-parse HEAD | tr -d '\n' | pbcopy"
# Compact summary log of last 20 commits
alias glor='git --no-pager log --oneline --decorate --graph -n20'
# git reflog with more detail
alias glr='glg -g'
alias gmn='git merge --no-ff'
# merge master or main into the current branch
alias gmm='git merge `gwm`'
# reset to origin status of current branch
alias gorigin='git reset --hard origin/`git rev-parse --abbrev-ref HEAD`'
alias gptag='git push && git push --tags'
alias grbid='git rebase -i develop'
alias grbim='git rebase -i `gwm`'
alias grbi0='git rebase -i --root'
alias grbi1='git rebase -i HEAD~1'
alias grbi2='git rebase -i HEAD~2'
alias grbi3='git rebase -i HEAD~3'
alias grbi4='git rebase -i HEAD~4'
alias grbi5='git rebase -i HEAD~5'
alias grbi6='git rebase -i HEAD~6'
alias grbi7='git rebase -i HEAD~7'
alias grbi8='git rebase -i HEAD~8'
alias grbi9='git rebase -i HEAD~9'
alias grbi10='git rebase -i HEAD~10'
# Restore with extreme prejudice: discard staged and unstaged changes
alias grs!='git restore --staged --worktree --'
alias gs='git status'
alias gsta='git stash apply'
alias gstpu='git stash push'
alias gsts='git stash show'
alias gs-='git switch -'
alias gu='git unstage'
# "which main/master?"
alias gwm='git branch -l main master | head -n 1 | cut -c3-'

# Sneaking this in here as it's strongly git-related
alias pcra='pre-commit run --all-files'


# SECTION 3: Handy functions

autoload -Uz git-clean-branches git-shrink git-branch-tips
