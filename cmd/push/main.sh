[[ -e .git ]]

$DDD echo "Update Git-repository \'$PWD\'."

git checkout master
git config user.email "tisutoo@gmail.com"
git config user.name "seohasong"
git add .
git commit -m "continue previous working" || :
git push origin master
