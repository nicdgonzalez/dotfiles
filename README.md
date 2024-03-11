# Dotfiles

## Introduction

This repository is a collection of my personalized dotfiles for Unix-like
systems. Feel free to peek at them for ideas, or use them as a starting
point for your own configurations.

* OS: Fedora 39
* Editor: Vim

## Installation

* Clone this repository

```bash
git clone https://github.com/nicdgonzalez/dotfiles && cd dotfiles
```

### Vim

If this is not your first time running Vim, you likely have existing files that
need to be moved:

```bash
mv ~/.vim ~/.vim.original-backup
mv ~/.vimrc ~/.vimrc.original-backup
```

#### Testing

```bash
# Symlink my `.vim` directory to the `$HOME` directory
ln -s $PWD/.vim ~/

# Install Vim plugins
vim -u $PWD/.vimrc -c 'PlugInstall' -- .
```

#### Install

```bash
# Symlink my `.vimrc` file to the `$HOME` directory
ln -s $PWD/.vimrc ~/
```

### tmux

If you have an existing configuration file for tmux, they need to be moved:

```bash
mv ~/.tmux.conf ~/.tmux.conf.original-backup
```

#### Testing

```bash
tmux -2 -L ndg -f ./.tmux.conf
```

#### Install

```bash
# Symlink my `.tmux.conf` file to the `$HOME` directory
ln -s $PWD/.tmux.conf ~/
```

### Fonts

Symlink the target font into `/usr/share/fonts`. For example,

```bash
sudo ln -s $PWD/fonts/Menlo-Regular.ttf /usr/share/fonts/
```

After restarting the terminal, go to **Preferences** and change the font.
