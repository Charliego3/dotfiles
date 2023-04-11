function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end
function _is_git_folder     -d "Check if current folder is a git folder"
  git status 1>/dev/null 2>/dev/null
end
function _prompt_git -a current_dir -d 'Display the actual git state'
  set -l dirty (command git diff --no-ext-diff --quiet --exit-code; or echo -n ' ')
  set -l flag_fg (set_color brgreen)
  set -l git_branch (_git_branch_name)
  set -l gs (_git_status)
  if [ "$dirty" -o "$staged" ]                                      # if either dirty or staged
    set flag_fg (set_color 62A)
  else if [ "$stashed" ]
    set flag_fg (set_color brred)
  end
  echo -n -s (set_color normal) "on " $flag_fg " $git_branch " (_git_status) (set_color normal)         #add space if dirty to separate from icons "$dirty"
end
function _git_status -d 'Check git status'
  set -l git_status (command git status --porcelain 2> /dev/null | cut -c 1-2)
  set -l ahead (_git_ahead); echo -n $ahead                                    #show # of commits ahead/behind
  if [ (echo -sn $git_status\n | egrep -c "[ACDMT][ MT]|[ACMT]D") -gt 0 ]      #added
    echo -n (set_color green)' '
  end
  #set -l staged  (command git diff --cached --no-ext-diff --quiet --exit-code; or echo -n '~')      #was '~'
  if [ (echo -sn $git_status\n | egrep -c "[ ACMRT]D") -gt 0 ]                  #deleted
    echo -n (set_color red)' '
  end
  if [ (echo -sn $git_status\n | egrep -c ".[MT]") -gt 0 ]                      #modified
    echo -n (set_color 708090)' '
  end
  if [ (echo -sn $git_status\n | egrep -c "R.") -gt 0 ]                         #renamed
    echo -n (set_color purple)' '
  end
  if [ (echo -sn $git_status\n | egrep -c "AA|DD|U.|.U") -gt 0 ]                #unmerged
    echo -n (set_color brred)''
  end
  if [ (echo -sn $git_status\n | egrep -c "\?\?") -gt 0 ]                       #untracked (new) files
    echo -n (set_color EE9A00)' '
  end
  if test (command git rev-parse --verify --quiet refs/stash >/dev/null)        #stashed (was '$')
    echo -n (set_color brred)' '
  end
  echo -n -s (set_color normal)
end
function _git_ahead -d         'Print the ahead/behind state for the current branch'
  if [ "$theme_display_git_ahead_verbose" = 'yes' ]
    _git_ahead_verbose
    return
  end
  command git rev-list --left-right '@{upstream}...HEAD' 2> /dev/null | awk '/>/ {a += 1} /</ {b += 1} {if (a > 0 && b > 0) nextfile} END {if (a > 0 && b > 0) print "⇕"; else if (a > 0) print ""; else if (b > 0) print ""}' #↑↓⇕⬍↕
end
function _git_ahead_verbose -d 'Print a more verbose ahead/behind state for the current branch'
  set -l commits (command git rev-list --left-right '@{upstream}...HEAD' 2> /dev/null)
  if [ $status != 0 ]
    return
  end
  set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
  set -l ahead  (count (for arg in $commits; echo $arg; end | grep -v '^<'))
  switch "$ahead $behind"
    case ''     # no upstream
    case '0 0'  # equal to upstream
      return
    case '* 0'  # ahead of upstream
      echo (set_color blue)"$ahead"
    case '0 *'  # behind upstream
      echo (set_color red)"$behind"
    case '*'    # diverged from upstream
      echo (set_color blue)"$ahead"(set_color red)"$behind"
  end
end
 
function _prompt_status_arrows -a exit_code
  if test $exit_code -ne 0
    set arrow_colors 600 900 c00 f00
  else
    set arrow_colors 060 090 0c0 0f0
  end
 
  for arrow_color in $arrow_colors
    set_color $arrow_color
    printf '»'
  end
end

function _UserSymbol  #prompt symbol: '#' superuser or '>' user
  if test (id -u $USER) -eq 0
    echo (set_color 458B74)" "
  else
    echo (set_color 458B74)" "
  end
end
 
function fish_prompt
  set -l exit_code $status
 
  set -l gray (set_color 666)
  set -l blue (set_color -o -u CD661D)
  set -l red (set_color red)
  set -l normal (set_color normal)
  set -l yellow (set_color yellow)
  set -l orange (set_color ff9900)
  set -l green (set_color 2E8B57 -o)
 
  set -l user_1 (string sub -l 1 $USER)
  set -l user_1_upper (string upper $user_1)
  printf '%s%s%s(%s)%s' $gray (_UserSymbol) $green (string replace -r "^$user_1" $user_1_upper $USER) $normal
  printf ' in %s%s%s ' $blue (string replace "$HOME" '~' (pwd)) (set_color normal)
  _is_git_folder; and _prompt_git
  _prompt_status_arrows $exit_code
  printf ' '
 
  set_color normal
end