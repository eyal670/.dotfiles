# .dotfiles
Just my Linux .dotfiles repository

### using GNU Stow

make a folder under $ HOME directory called `.dotfiles`
this folder will be the git repository,
inside this folder make sub folders for the dotfiles with the same exact path as the orig from the  $HOME directory
for example the orig file for Alacritty is:

`/home/eyal/.config/alacritty/alacrotty.yml`

inside the .dotfiles folder it will be:

`/home/eyal/.dotfiles/alacritty/.config/alacritty`

than delete the orig file and got to `/home/eyal/.dotfiles` folder and run the command: `stow */`

this go inside each sub folder inside `.dotfiles` folder and will mirror the path all the way down to the last file in the $HOME directory (one directory above the place where the stow command is runnig) as symbolic links.

for more info watch this video:

[Manage your dotfiles across multiple machines with GNU Stow and Git - YouTube](https://www.youtube.com/watch?v=90xMTKml9O0)
