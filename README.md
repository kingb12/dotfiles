# Personal dotfiles

## Installation

### CentOS 6 Specific 

You need python-argparse install

```
yum install python-argparse
```

Should be okay on Ubuntu and OS X

Then do

```
git clone --recursive https://github.com/kingb12/dotfiles.git
sudo bash install
```

Then go get the patched fonts: https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy/patched

```
git clone https://github.com/gabrielelana/awesome-terminal-fonts.git
cd awesome-terminal-fonts
git co patching-strategy
cd patched
# one I use:
cp SourceCodePro+Powerline+Awesome+Regular.ttf /Library/Fonts
```
Then pick that font in iTerm2 > Profile

## Adding files

There's lots of submodules here, need to make sure they're tracked.

To add a new submodule do:

```
git submodule add <gitrepo>
```
