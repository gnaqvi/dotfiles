# dotfiles

- Clone to `$HOME/.dotfiles`
- Run `.local/bin/dfy -d` to dotify existing config files to `$HOME/.dotfiles` directory
- Run `.local/bin/dfy -r` to restore config files from `$HOME/.dotfiles` directory to $HOME
- Modify theme as needed in `$HOME/.config/base16/config.json`
- Run `.local/bin/themer --generate-theme` to generate theme.
- Run `.local/bin/themer --write-all` to write configuration.

Configuration templates reside in `.config/themer/templates`.

![Desktop](scrot.png)

### *TODO*
- Sleep/hibernate handles
- Implement scrollable Polybar news feed script
