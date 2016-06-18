# Mercurial Commands

## Basic hg commands

Show affected files
``` bash
$ hg status
```

Show recent hg commits
``` bash
$ hg log

# View smart log
$ hg sl
```

## Working with Bookmarks
List all bookmarks and show active one
```bash
# List bookmarks
$ hg bookmarks

# List heirachiey (most useful one)
$ hg sl
$ hg smartlog
```

Create bookmark
```bash
# Create a new bookmark
$ hg bookmark <bookmark_name>

# Switch to another bookmark
$ hg update <bookmark_name>

# Switch to another commit
$ hg co -r <commi-id>
```

Temporarily keep aside local changes
```bash
# Put aside all local changes and remember for later
$ hg shelve
$ hg shelve -n <name>

# Get back the previously shelved changes
$ hg unshelve
$ hg unshelve <name>
```

Rebasing
```bash
# Simplest one to update the bookmark with latest commit on master
$ hg pull --rebase

# Interactive rebase on current stack of commits upto <dst-commit-id>
$ hg rebase -i -d <dst-commit-id>

# Super powerful rebase
hg rebase -s <source-commit> -d <dest-commit>
```

Cleanup of code changes/bookmarks
```bash
# Undo changes in a file/dir
$ hg revert <path-to-dir/file>

# Undo all local changes
$ hg revert --all

# Delete bookmark
$ hg bookmarks -d <bookmark-name>

# Delete a commit
$ hg strip -r <commit-id>
```
