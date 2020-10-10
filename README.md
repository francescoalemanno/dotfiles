# dotfiles
Personal config for my only editor: Emacs

Install Doom-Emacs
``` sh
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d -b develop
cd ~/.emacs.d
make quickstart
```

Install personal config
``` sh
git clone https://github.com/francescoalemanno/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow emacs
```

Run Doom Sync

``` sh
cd ~/.emacs.d/bin
./doom sync
./doom doctor
```
