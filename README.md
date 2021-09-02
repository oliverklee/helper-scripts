# Helper shell scripts for working with git, Linux and open source projects

This is a collection of helper scripts that reside in `~/bin`.

## Provided scripts

### Git helper scripts

These git helper scripts automatically detect the default branch (`main` or `master`)
and come with all kinds of safeguards.

| Script            | Description                                        |
|-------------------|----------------------------------------------------|
| `pull`            | pulls the default branch                           |
| `rebase`          | rebases the current branch on the default branch   |
| `upstream`        | keeps a git fork in sync                           |
| `upstream-10-4`   | like `upstream`, but with `10.4` as default branch |

### Linux helper scripts

Most of these scripts probably are Ubuntu-specific.

| Script            | Description                                           |
|-------------------|-------------------------------------------------------|
| `backup-sync`     | synchronizes files to an external backup disk         |
| `fstrim-all`      | SSD-trims all ext partitions                          |
| `kwin-restart`    | restarts `kwin` (e.g., after a crash)                 |
| `memflush`        | flushes all memory caches and the swap file/partition |
| `package-cleanup` | purges all configured-but-not-installed packages      |
| `p55`…`p81`       | switch `mod_php` and the CLI PHP to a that version    |

### Libraries included by the other scripts

| Library                   | Description                                            |
|---------------------------|--------------------------------------------------------|
| `colors.sh`               | defines the ANSI escape codes for colored shell output | 
| `git-tools.sh`            | provides functions for the git-related scripts         |
| `output.sh`               | provides functions for outputting status messages      |
| `php-version-switcher.sh` | switches between the PHP versions                      |

### Other files

| File                    | Description                                           |
|-------------------------|-------------------------------------------------------|
| `shebang.sh`            | copy'n'paste template for the shell shebang           |
| `backup-sync.conf`      | the configuration file for `backup-sync` (not in git) |
| `backup-sync.conf.dist` | template for configuration file for `backup-sync`     |

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
