git pull
hash=$(git log --pretty=format:'%h' -n 1)
echo $hash
folderstr=$(git diff-tree --no-commit-id --name-only -r $hash) # > /Users/diptripa/git-updated-files/difference.txt
#cat /Users/diptripa/git-updated-files/difference.txt
echo $folderstr

for file in $folderstr
do
curl -u admin:admin -T $file "http://localhost/artifactory/dipeshtest/$file"
done
