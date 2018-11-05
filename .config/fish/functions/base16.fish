if test -z "$BASE16_HOME"
  if test -z "$XDG_CONFIG_HOME"
    set XDG_CONFIG_HOME ~/.config
  end
  set -g BASE16_HOME $XDG_CONFIG_HOME/base16-shell
end

set themes (ls "$BASE16_HOME/scripts" | sed -e 's/base16-\(.*\).sh/\1/')
complete -x -c base16 -a "$themes" -d "Theme"

function base16
  if test (count $argv) -ne 1
    _base16_help > /dev/stderr
    return 1
  end
  switch "$argv"
    case -h {,-,--}help
      _base16_help > /dev/stderr
    case \*
      _base16 $argv
  end
end

function _base16_help
  set -l c (set_color $fish_color_command) (set_color normal)
  echo "$c[1]base16$c[-1] <theme>"
  echo
  echo "Available themes:"
  echo
  _base16_list
end

function _base16_list
  echo $themes | tr ' ' \n | column
end

function _base16
  set theme $argv[1]
  set script "$BASE16_HOME/scripts/base16-$theme.sh"
  eval sh $script
  ln -sf $script ~/.base16_theme
  echo -e "if !exists('g:colors_name') || g:colors_name != 'base16-$theme'\n  colorscheme base16-$theme\nendif" > ~/.vimrc_background
end
