# Dotfiles

## Introduction

This repository is a collection of my personalized dotfiles for Unix-like
systems. Feel free to peek at them for ideas, or use them as a starting
point for your own configurations.

* OS: Fedora 40, Windows 10 (+ Git Bash)
* Editor: Vim

## Installation

<!-- TODO: Create a script that does all of the installing automatically -->

* Clone this repository

```bash
git clone https://github.com/nicdgonzalez/dotfiles && cd dotfiles
```

### Vim

> [!NOTE]
> If you have existing configuration files for Vim, they need to be moved:
> 
> ```bash
> mv ~/.vim ~/.vim.backup
> mv ~/.vimrc ~/.vimrc.backup
> ```

#### Test

```bash
ln -s $PWD/.vim ~/
vim -u $PWD/.vimrc -c 'PlugInstall' -- .
```

#### Install

```bash
# skip if you already did this in the Test section:
ln -s $PWD/.vim ~/
vim -c 'PlugInstall' -- .

ln -s $PWD/.vimrc ~/
```

### tmux

> [!NOTE]
> If you have existing configuration files for tmux, they need to be moved:
> 
> ```bash
> mv ~/.tmux ~/.tmux.backup
> mv ~/.tmux.conf ~/.tmux.conf.backup
> ```

#### Test

```bash
tmux -2 -L ndg -f $PWD/.tmux.conf
```

#### Install

```bash
ln -s $PWD/.tmux.conf ~/
```

### Fonts

Create symbolic links from the target font into `~/.local/share/fonts`
(or `/usr/local/share/fonts` for system-wide install).

For example, to install *Menlo* (the font I use in the terminal), I would do:

```bash
ln -s $PWD/fonts/Menlo-Regular.ttf ~/.local/share/fonts/
# to rebuild the font cache after making changes:
fc-cache -fv
```
