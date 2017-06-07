from gidsi/archlinux

run pacman -Sy --noconfirm base-devel

run useradd -G wheel -G uucp -G lock arduino

run pacman -Sy --noconfirm gtk2 java-runtime java-rxtx desktop-file-utils icoutils
add https://aur.archlinux.org/cgit/aur.git/snapshot/arduino10.tar.gz arduino10.tar.gz
run tar xf arduino10.tar.gz
run chown -R arduino:arduino arduino10

run pacman -Sy --noconfirm python2 python2-pyserial python2-jinja python2-configobj python2-six picocom avrdude
add https://aur.archlinux.org/cgit/aur.git/snapshot/ino.tar.gz ino.tar.gz
run tar xf ino.tar.gz
run chown -R arduino:arduino ino

user arduino
run cd arduino10 && makepkg

user root
run cd arduino10 && pacman -U --noconfirm $(ls *.tar.xz)

user arduino
run cd ino && makepkg

user root
run cd ino && pacman -U --noconfirm $(ls *.tar.xz)
