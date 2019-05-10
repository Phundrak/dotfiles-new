# emacs ansi-term support
if test -n "$EMACS"
    set -x TERM eterm-color
end

# this function may be required
function fish_title
    true
end

set -gx PATH $HOME/.cargo/bin $HOME/.local/bin $PATH
set -gx PKG_CONFIG_PATH /usr/local/lib/pkgconfig/
