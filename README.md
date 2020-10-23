# dotfiles
Personal config for my only editor: Emacs

Install Doom-Emacs
``` sh
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d -b develop
cd ~/.emacs.d
~/.emacs.d/bin/doom install
```

Install required packages
``` sh
apt-get install autoconf automake g++ gcc clang-format libpng-dev libpoppler-dev libpoppler-glib-dev libpoppler-private-dev libz-dev make pkg-config stow
```

Install personal config
``` sh
rm -R ~/.doom.d
git clone https://github.com/francescoalemanno/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow emacs
```

Install Fonts contained in fonts folder:

``` sh
mkdir -p ~/.local/share/fonts
cp fonts/* ~/.local/share/fonts/
fc-cache -f -v
```

Run Doom Sync

``` sh
cd ~/.emacs.d/bin
./doom sync
./doom doctor
```
