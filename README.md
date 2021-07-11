# Github Workflow

## Explorer Workflow Pic
<img src="workflow.png" width="400" height="270"> 

## Github Sign In Commands

<pre>
Config Username: git config --global user.name "wilcywilson"
Config email: git config --global user.email wilsonshresthaapps@gmail.com
</pre>

## Commands to get started

<pre>
git init (initialization)
git remote add origin https://github.com/WilcyWilson/7thSem-FinalProject-EncryptionApp (origin github link)
git pull origin branchname(git pull remote branch )
git branch (list branches in repo)
git checkout branchname
git status (displays changes made to the branch)
git add . (adds changes)
git commit -m ""  (commits changes)
git push -u origin branchname (push to current branch)

Now, to add a different branch make a different folder to make things easier. And, repeat the above steps.
To push to branch next time just type "git push"
New Folder for every new branch
</pre>

## Setting Up a New Extending Branch (Preferably in a new folder in pc to make things easy)

<pre>
git init
git remote add origin https://github.com/WilcyWilson/7thSem-FinalProject-EncryptionApp
git pull origin splashscreen (Pulling the branch you want to add new features to.)
git checkout -b uisetup (Creates a new branch which will base it off the HEAD of current branch i.e. splashscreen.)
git branch (To check your current branch and available branches)
git push -u origin uisetup (Makes uisetup branch as upstream)

After this new branch will be created in the github website too.
</pre>

## Setting Up a New Empty Branch (Preferably in a new folder in pc to make things easy)

<pre>
git init
git remote add origin https://github.com/WilcyWilson/7thSem-FinalProject-EncryptionApp
git checkout --orphan NEWBRANCH (Creating Empty Branch)
Add files and changes.
git add .
git commit -m "commit for empty branch"
git push -u origin NEWBRANCH (Makes NEWBRANCH branch as upstream)
git pull (get remote branches info)

After this new branch will be created in the github website too.
</pre>
