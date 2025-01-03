# MR Dotfiles

My dotfiles for backup and reproducibility. Trying to avoid restarting from the ground up each time 😉

----
## Usage
Clone the repository to the machine you want to configure and run the Python script.

The Python script will backup/overwrite/quit_before_modifying the existing configuration files with symlinks to the equivalent files in the cloned repository.

If you prefer you can access the specific config files on this remote reposiotry directly instead.

----
The repo is provided with:

1.  A python script `create_symlink.py`: used to automate the creation of the symlinks from the $HOME directory to the repo

2.  ./macos, ./windows, ./linux: folders containing the config files for different OSs.