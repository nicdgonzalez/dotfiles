# Dotfiles

## Introduction

This repository is a collection of my personalized dotfiles for Unix-like
systems. Feel free to peek at them for ideas, or use them as a starting
point for your own configurations.

* OS: Fedora 39
* Editor: Vim

## Installation

<!-- TODO: Create a script that does all of the installing automatically -->

* Clone this repository

```bash
git clone https://github.com/nicdgonzalez/dotfiles && cd dotfiles
```

### Vim

If you have existing configuration files for Vim, they need to be moved:

```bash
mv ~/.vim ~/.vim.original-backup
mv ~/.vimrc ~/.vimrc.original-backup
```

#### Testing

```bash
ln -s $PWD/.vim ~/
vim -u $PWD/.vimrc -c 'PlugInstall' -- .
```

#### Install

```bash
ln -s $PWD/.vimrc ~/
```

### tmux

If you have existing configuration files for tmux, they need to be moved:

```bash
mv ~/.tmux ~/.tmux.original-backup
mv ~/.tmux.conf ~/.tmux.conf.original-backup
```

#### Testing

```bash
tmux -2 -L ndg -f ./.tmux.conf
```

#### Install

```bash
ln -s $PWD/.tmux.conf ~/
```

### Fonts

Create symbolic links from the target font into `/usr/share/fonts`. For example,

```bash
sudo ln -s $PWD/fonts/Menlo-Regular.ttf /usr/share/fonts/
```

After restarting the terminal, go to **Preferences** and change the font.
