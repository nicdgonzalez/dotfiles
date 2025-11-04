# Dotfiles

A collection of my personalized Linux dotfiles. Feel free to peek at them for
ideas, or use them as a starting point for your own configurations.

I run [Fedora Linux] as my operating system.

## Installation

Use git to clone the repository onto your machine:

```bash
git clone --depth=1 -- https://github.com/nicdgonzalez/dotfiles.git
```

Installable subdirectories have a `Makefile` ready:

```bash
make --directory nvim
```

To quickly install everything, run:

```bash
for directory in $(ls "$PWD"); do
    if [ -r "$directory/Makefile" ]; then
        make --directory "$directory" -- install;
    fi;
done
```

For additional documentation, see subdirectories.

[fedora linux]: https://www.fedoraproject.org/workstation
