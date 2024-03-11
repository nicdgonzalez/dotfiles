# Dotfiles

## Introduction

This repository is a collection of my personalized dotfiles for Unix-like
systems. Feel free to peek at them for ideas, or use them as a starting
point for your own configurations.

* Operating System: Fedora 39
* Editor: Vim

## Installation

* Clone this repository

```bash
git clone https://github.com/nicdgonzalez/dotfiles && cd dotfiles
```

### Vim

#### Testing

```bash
# If this is not your first time running Vim,
# you have to move the existing `.vim` directory
mv ~/.vim ~/.vim.original-backup

# Symlink my `.vim` directory to the `$HOME` directory
ln -s ./.vim ~/

# Install Vim plugins
vim -u ./.vimrc -c 'PlugInstall' -- .
```

#### Install

```bash
# If this is not your first time running Vim,
# you have to move the existing `.vimrc` file
mv ~/.vimrc ~/.vimrc.original-backup

# Symlink my `.vimrc` file to the `$HOME` directory
ln -s ./.vimrc ~/
```

### tmux

#### Testing

```bash
tmux -2 -L ndg -f ./.tmux.conf
```

#### Install

```bash
# Move your existing configuration (if applicable)
mv ~/.tmux.conf ~/.tmux.conf.original-backup

# Symlink my `.tmux.conf` file to the `$HOME` directory
ln -s ./.tmux.conf ~/
```

### Fonts

Copy the target font into `/usr/share/fonts`.

```bash
# Example:
sudo ln -s $PWD/fonts/Menlo-Regular.ttf /usr/share/fonts/
```

After restarting the terminal, go to **Preferences** and change the font.
