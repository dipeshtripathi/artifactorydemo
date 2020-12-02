git pull
hash=$(git log --pretty=format:'%h' -n 1)
folderstr=$(git diff-tree --no-commit-id --name-only -r $hash) # > /Users/diptripa/git-updated-files/difference.txt
#cat /Users/diptripa/git-updated-files/difference.txt


