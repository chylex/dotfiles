# Ansible Collection - chylex.dotfiles

Ansible roles for configuring and updating my dotfiles.

# Roles

### `chylex.dotfiles.bash_completion`

Configures Bash completion for `d` alias for Docker, and `dc` alias for Docker Compose.

### `chylex.dotfiles.detect_shell`

Sets the `shell` fact to the remote user's default shell.

### `chylex.dotfiles.repository`

Clones the dotfiles repository into `~/.dotfiles` and updates the user's dotfiles. **Do not use if you already use the `~/.dotfiles` folder for something else!**

### `chylex.dotfiles.vim_plugins`

Installs a bunch of Vim plugins.

# Licensing

The `roles/bash_completion/files/.bin` folder includes third-party scripts under their own licenses:
- [complete_alias](https://github.com/cykerway/complete-alias)
- [docker_compose](https://github.com/docker/compose/blob/1.28.x/contrib/completion/bash/docker-compose)
