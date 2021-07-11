# Github Sign In Commands
 
Config Username: git config --global user.name "wilcywilson"
Config email: git config --global user.email wilsonshresthaapps@gmail.com

# Github Commands to get started

git init (initialization)
git remote add origin https://github.com/WilcyWilson/7thSem-FinalProject-EncryptionApp (origin github link)
git pull <remote> <branch> (git pull origin branchname)
git branch (list branches in repo)
git status (displays changes made to the branch)
git add . (adds changes)
git commit -m ""  (commits changes)
git push -u origin master (push to current branch)

Now, to add a different branch make a different folder to make things easier. And, repeat the above steps.
To push to branch next time just type "git push"
New Folder for every new branch

# Github Setting Up a New Branch (Preferably in a new folder in pc to make things easy)

git init
git remote add origin https://github.com/WilcyWilson/7thSem-FinalProject-EncryptionApp
git pull origin splashscreen (Pulling the branch you want to add new features to.)
git checkout -b uisetup (Creates a new branch which will base it off the HEAD of current branch i.e. splashscreen.)
git branch (To check your current branch and available branches)
git push -u origin uisetup (Makes uisetup branch as upstream)

After this new branch will be created in the github website too.
