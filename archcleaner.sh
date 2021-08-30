#!/bin/bash
#Author: Inenarratus
#Website: https://inenarratus.com/

echo '                  -`'
echo '                 .o+`'
echo '                `ooo/'
echo '               `+oooo:'
echo '              `+oooooo:'
echo '              -+oooooo+:'
echo '            `/:-:++oooo+:'
echo '           `/++++/+++++++:'
echo '          `/++++++++++++++:'
echo '        `/+++ooooooooooooo/`'
echo '        ./ooosssso++osssssso+`'
echo '       .oossssso-````/ossssss+`'
echo '      -osssssso.      :ssssssso.'
echo '     :osssssss/        osssso+++.'
echo '    /ossssssss/        +ssssooo/-'
echo '  `/ossssso+/:-        -:/+osssso+-'
echo ' `+sso+:-`                 `.-/+oso:'
echo '`++:.                           `-/+/'
echo '.`                                 ` '
echo ''
echo "              Inenarratus             "
echo "            inenarratus.com           "               
echo ''
echo '====== Sync Database ====='
echo ''
sudo pacman -Syy


echo ''
echo "====== Optimize Pacman's Mirror ====="
echo ''
echo ''
read -p "Arch is installed on SSD [y/n] ?" choice
case "$choice" in 
  y|Y ) ;;
  n|N ) 
	sudo pacman-optimize && sync;;
  * ) ;;
esac


echo ''
echo '====== Clean Pacman Cache ====='
echo ''
echo ' his eliminates the possibility of using downgrade '
echo ''
sudo pacman -Scc


echo ''
echo '====== Removing unused packages ====='
echo ''
sudo pacman -Rns $(pacman -Qtdq)


echo ''
echo '====== Update mlocate database ====='
echo ''
sudo updatedb


echo ''
echo '====== Cleaner ====='
echo ''
if [  -f cleaner.py ]; then
   python cleaner.py 
else
echo "cleaner.py not found!"
echo 'Downloading....'
echo "Python File Found"
echo "Cleaner working..."
   python cleaner.py 
fi
