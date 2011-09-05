#Install DMG for Alfred

An extension for Alfred.app that takes the pain out of applications distributed through .dmgs. 
When this command is run it:

1. finds the most recently downloaded .dmg file in the `~/Downloads` directory 
1. mounts it 
1. Copies any .app folders out of it to the `/Applications` directory
1. unmounts the dmg
1. deletes the dmg


# Installation

## Option 1: Download
Download the repo and double click the `InstallDMG.alfredextension` file inside.

## Option 2: Git Clone
Open up the terminal and run:
`git clone git@github.com:webartisan/Install-DMG.git [YOUR ALFRED EXTENSIONS DIRECTORY]/Install-DMG`

In my case the the Alfred extension directory is ~/Dropbox/Alfred/extensions/scripts/
This setting can be found in Alfred's preferences under General>Sync

# Usage
Bring up Alfred, type `dmg  ↩`
You can change this command in the extensions tab of Alfred's settings.

In the future I will add a query after `dmg` that would let you pick specific items to install. For now it just runs on the most recently downloaded one.


#Pull Requests
are welcome


