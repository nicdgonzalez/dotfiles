# Dotfiles

This repository contains a collection of my personalized Linux dotfiles. Feel
free to peek at them for ideas, or use them as a starting point for your own
configurations.

I'm currently running [Fedora Linux] as my operating system.

## 📦 Installation

First, clone the repository onto your machine:

```bash
git clone --depth=1 -- https://github.com/nicdgonzalez/dotfiles.git
```

Each installable subdirectory contains a `Makefile` with targets for
installing and uninstalling that configuration. For example:

> [!TIP]
> Don't forget to backup any existing configurations prior to installing!

```bash
make install --directory nvim
# or, to uninstall:
make uninstall --directory nvim
```

To display which subdirectories are installable:

```bash
for file in $(ls "$PWD"); do if [ -d "$file" ] && [ -e "$file/Makefile" ]; then echo "$file"; fi; done
```

For additional documentation, check the subdirectories.

[fedora linux]: https://fedoraproject.org/workstation/
[fork]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo
