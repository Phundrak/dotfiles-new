# emacs ansi-term support
if test -n "$EMACS"
    set -x TERM eterm-color
end

# this function may be required
function fish_title
    true
end

set -gx PATH $HOME/.local/bin $PATH
set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib
