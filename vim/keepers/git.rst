using rebase to keep commit history in a merge
https://stackoverflow.com/questions/28407020/keep-commits-history-after-a-git-merge

git diff a b: b is the "newer" version, so green lines are lines that were
added in b, and red lines are lines that were deleted in b

remove a file from revision control completely, but keep it in working
directory
git rm --cached file.txt

# generate new ssh key and add to ssh-agent
https://help.github.com/enterprise/2.13/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#adding-your-ssh-key-to-the-ssh-agent

# adding an ssh key to git
https://help.github.com/enterprise/2.13/user/articles/adding-a-new-ssh-key-to-your-github-account/
then from the repository run
ssh -T git@github.com
and verify fingerprint
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
if push doesn't work, you might have to redefine the ssh url for remote origin
git config --get remote.origin.url
git remote set-url origin git@github.com:path/to/repository
git push
