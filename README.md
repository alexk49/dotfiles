# dotfiles 

Personal dotfiles stored in seperate folder. Best way to set this up is with a sym link to the usual location on the home folder. 

In powershell that would be:

## .gitconfig
```powershell
New-Item -Path .gitconfig -ItemType SymbolicLink -Value .\dotfiles\git\.gitconfig
```
```linux
ln -s repos/dotfiles/git/.gitconfig .gitconfig 
```

## .bashrc
```powershell
New-Item -Path .bashrc -ItemType SymbolicLink -Value .\dotfiles\bashrc\.bashrc
```

```linux
ln -s /repos/dotfiles/bash/.bashrc .bashrc
```
