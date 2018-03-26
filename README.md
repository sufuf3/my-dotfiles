# My Dotfiles

This is my dotfiles. It can be automatically initialized environment for Unix-like operating system.

# Setup
## Quick Setup

### Use curl
```sh
curl -Lo- https://goo.gl/pvswme | bash
```

### Use wget
```sh
wget  -O- https://goo.gl/pvswme | bash
```

## Setup locally
```sh
$ git clone https://github.com/sufuf3/my-dotfiles.git
$ cd my-dotfiles/
$ sh local_setup.sh
```

# Reset
## Reset locally
```sh
$ git clone https://github.com/sufuf3/my-dotfiles.git
$ cd my-dotfiles/
$ sh local_setup.sh --reset
```

# Configurations
- **Bash Shell**: alias, color
- **Vim**: setting, status bar, comfortable color scheme
    - Add `fatih/vim-go` plugin
        ```sh
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        git clone https://github.com/fatih/vim-go.git ~/.vim/plugged/vim-go
        ```

- **Tmux**: status bar include avg load, color adjusment
- **Git**: alias, setting, gitignore(global), auto completion, diff-highlight

# References
- https://github.com/PeterDaveHello/Unitial
- https://github.com/fatih/vim-go-tutorial
