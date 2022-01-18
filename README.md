# dotfiles

- Clone to ~/.dotfiles
- Use `.local/bin/dfy -d` to dotify existing config files to `~/.dotfiles` directory
- Use `.local/bin/dfy -r` to restore config filess from `~/.dotfiles` directory to $HOME
- Theme can be modified in `~/.config/base16/config.json`
- Run `.local/bin/themer --generate-theme` to generate theme.
- Run `.local/bin/themer --write-all` to write configuration.

See `.local/bin/themer` for more information.

![Desktop](scrot.png)

### *TODO*
- Sleep/hibernate lock handles
- Implement scrollable Polybar newsfeed script
