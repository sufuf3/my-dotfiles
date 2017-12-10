# My Dotfiles

This is my dotfiles. It can be automatically initialized environment for Unix-like operating system.

# Setup
## Quick Setup

### Use curl
```sh
curl -Lo-  | bash
```

### Use wget
```sh
wget  -O-  | bash
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
- Bash Shell: alias, color
- Vim: setting, status bar, comfortable color scheme
- Tmux: status bar include avg load, color adjusment
- Git: alias, setting, gitignore(global), auto completion, diff-highlight
