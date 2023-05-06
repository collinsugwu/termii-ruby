#!/bin/bash
# cp pre-commit.sh .git/hooks/pre-commit
files=$(git status -s | grep -E 'A|M' | awk '{print $2}')
files="$files $(git status -s | grep -E 'R' | awk '{print $4}')"
echo $files | xargs bundle exec rubocop -A --display-cop-names --extra-details --parallel --force-exclusion