# Brew file and associated configurations
## Goals
- Share tooling with team mates
 - Achieved with Brew Bundle feature
- Get up and running quickly with minimal manual effort
 - Achieved utilizing the following files and scripts
  - config/{dot files folders}
   - copy of essential dot files which go in your user home directory
  - copyin.sh
   - scans the config directory of this project
   - copies files and folders from your user home directory (if they are named/listed in the config of this project) into the config of this project
  - copyout.sh
   - copies the contents of this projects config directory to your user home.
## How to use
ensure you have installed:
- git
- xtools cli and gcc compiler
- homebrew
### Clean setup
- use git to clone this project
- run `brew bundle`
- run `./copyout.sh`
### Merging an existing setup
- use git to clone this project
- decide how you want to manage your bundles
 - if you choose to fork:
  - commit to master
 - if you choose to branch:
  - run `git checkout -b users/{your-name}/{whatever-criteria-you-want}
  - run `git push`
- run `brew bundle dump`
- run `git merge master`
- resolve git conflicts
 - de-duplicate packages
 - keep packages you want from yours
 - remove packages you don't want from theirs
- run `brew bundle`
- if you want the configurations in this package run `./copyout.sh`
- if you want to add your own configurations ~ copy them into `/config`
 - if you want to update these files contents in the future run `./copyin.sh`
- run `git commit`
- run `git push`

