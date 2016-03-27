# Git Commands

## Basic git commands

Show affected files
```bash
$ git status
```

Show actual code changes
```bash
$ git diff
```

Show recent git commits
```bash
$ git log
$ git log --oneline
```

## Working with Branches
List all branch and show active one
```bash
# List branch
$ git branch

# List branch with tree heirachiey (very useful info)
$ git sl
```

Create branch
```bash
# Create a new branch
$ git branch <test_branch>

# Create and switch to new branch
$ git checkout -b <test_branch>
```

Rebase branch with master (assuming you are on that branch)
```bash
$ git branch --set-upstream-to=origin/master
$ git pull --rebase
```

Pushing out commits on one branch
```bash
# Switch to master branch
$ git checkout master

# Pull latest changes from remote
$ git pull origin master

# Merge your branch onto master and resolve conflicts if any
$ git merge <test_branch>

# Push out your changes
$ git push
```

Deleting branch
```bash
# Beware as this can delete your content completely without any warning
$ git branch -D <test_branch>
```
