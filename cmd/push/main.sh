[[ -d .git || -f .git ]]

$DDD echo Update \'$( dirname $BASH_SOURCE )\' repo

git checkout master
git config user.email "tisutoo@gmail.com"
git config user.name "seohasong"
git add .
git commit -m "continue previous working" || :
git push origin master
