# Helper shell scripts for working with git, Linux and open source projects

This is a collection of helper scripts that reside in `~/bin`.

## Provided scripts

### Git helper scripts

These git helper scripts automatically detect the default branch (`main` or `master`)
and come with all kinds of safeguards.

| Script            | Description                                        |
|-------------------|----------------------------------------------------|
| `main`            | switches to the default branch and pulls it        |
| `rebase`          | rebases the current branch on the default branch   |
| `upstream`        | keeps a git fork in sync                           |

### Linux helper scripts

Most of these scripts probably are Ubuntu-specific.

| Script                   | Description                                             |
|--------------------------|---------------------------------------------------------|
| `backup-sync`            | synchronizes files to an external backup disk           |
| `container-prune-unused` | prunes unused Docker and Podman containers              |
| `container-prune-all`    | prunes all re-downloadable Docker and Podman containers |
| `create-ssh-key`         | creates a new ed25519 SSH key                           |
| `fstrim-all`             | SSD-trims all ext partitions                            |
| `memflush`               | flushes all memory caches and the swap file/partition   |
| `package-cleanup`        | purges all configured-but-not-installed packages        |
| `setup-base-system`      | installs the most important applications and settings   |
| `setup-composer`         | installs Composer (but not PHP)                         |
| `setup-ddev`             | installs DDEV (and Docker CE)                           |
| `setup-docker`           | installs Docker (CE)                                    |
| `setup-git`              | installs and configures git                             |
| `setup-gpg`              | installs and configures GPG                             |
| `setup-local-php`        | sets up a local PHP version using the system packages   |
| `setup-personal`         | sets up my personal settings (useful only for me!)      |
| `setup-phpstorm`         | installs PhpStorm                                       |
| `setup-ruby`             | Installs Ruby, dip, RubyMine and the Heroku CLI         |
| `setup-social`           | installs Discord, Slack and Zoom                        |
| `update-everything`      | updates all DEB packages and snaps                      |

### Libraries included by the other scripts

| Library                   | Description                                            |
|---------------------------|--------------------------------------------------------|
| `colors.sh`               | defines the ANSI escape codes for colored shell output | 
| `git-tools.sh`            | provides functions for the git-related scripts         |
| `output.sh`               | provides functions for outputting status messages      |

### Other files

| File                    | Description                                       |
|-------------------------|---------------------------------------------------|
| `backup-sync.conf.dist` | template for configuration file for `backup-sync` |
| `bashrc-for-git.dist`   | template for git branch display for `.bashrc`     |
| `shebang.sh`            | copy'n'paste template for the shell shebang       |

## Installation

The `.gitignore` will ignore all existing files in your `~/bin`, making this
repository safe to use next to your own scripts:

1. Rename `~/bin` to something like `~/bin-backup`.
2. Clone this repository to `~/bin`.
3. Move all your files from `~/bin-backup` to `~/bin`.
4. Delete `~/bin-backup`.

Or as shell commands:

```shell
cd
mv bin bin-backup
git clone https://github.com/oliverklee/helper-scripts.git bin
mv bin-backup/* bin/
rmdir bin
```

## Contributing

I'll greatly appreciate pull requests that fix bugs or make the scripts more
readable.

If you cannot provide a pull request, tickets with bug reports will also be helpful.
