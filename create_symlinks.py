import os
import sys
import argparse
import shutil

system_mapping = { "linux": "linux", "linux2": "linux", "darwin": "macos", "win32": "windows" }
DOTFILES_DIR_NAME = os.path.join(os.path.dirname(os.path.realpath(__file__)), system_mapping.get(sys.platform)) # The name of the directory containing the dotfiles repo

HOME_DIR = os.path.expanduser("~/test_home") # Where the config files will be symlinked to
# HOME_DIR = os.path.expanduser("~") # Where the config files will be symlinked to

parser = argparse.ArgumentParser(description="Create symlinks for the dotfiles in the dotfiles directory")
parser.add_argument("-f", "--force", help="Overwrite files, dirs and symlinks with new symlinks", action="store_true")
parser.add_argument("-y", "--yes", help="Accept directly execution", action="store_true")
parser.add_argument("-b", "--backup", help="Back up all deleted files in a config_backup folder", action="store_true")

args = parser.parse_args()
FORCE = args.force if args.force is not None else False
YES = args.yes if args.yes is not None else False
BACKUP = args.backup if args.backup is not None else False

def create_backup_files_dir(dotfiles, HOME_DIR):
    # Check if the dotfiles already exist in the home directory
    for dotfile in dotfiles:
        dotfile_path = os.path.join(HOME_DIR, dotfile)

        if os.path.exists(dotfile_path):
            # Create a backup directory
            backup_dir = os.path.join(HOME_DIR, "config_backup")
            print("Creating backup directory: " + backup_dir)
            os.makedirs(backup_dir, exist_ok=True)
            break

def create_symlinks(dotfiles, DOTFILES_DIR_NAME, HOME_DIR):
    # Create symlinks for each file in the dotfiles directory
    for dotfile in dotfiles:
        dotfile_path = os.path.join(DOTFILES_DIR_NAME, dotfile)
        symlink_path = os.path.join(HOME_DIR, dotfile)

        # devo: capire se esiste qualcosa in symlink_path, se si torva file/dir dovrei poter distruggere e scrivere il symlink, se vi si trova un symlink devo chiedere se sovrascrivere
        try:
            # if the symlink file already exists, ask the user if they want to overwrite it
            if os.path.exists(symlink_path):
                if BACKUP:
                    print("Creating backup of: " + symlink_path)
                    shutil.copy(symlink_path, os.path.join(HOME_DIR, "config_backup", dotfile))

                if os.path.islink(symlink_path):
                    print("Symlink already exists: " + symlink_path + " Force is set to " + str(FORCE))
                    #overwrite_symlinks = input().lower() == "y"

                    if FORCE:
                        print("Removing symlink: " + symlink_path)
                        os.remove(symlink_path)

                elif os.path.isfile(symlink_path) or os.path.isdir(symlink_path):
                    print("File found existing: " + symlink_path + " Force is set to " + str(FORCE))
                    # overwrite_files_with_symlinks = input().lower() == "y"

                    if FORCE:
                        print("Removing file/dir: " + symlink_path)
                        os.remove(symlink_path)
            
            print("Creating symlink: " + symlink_path)
            os.symlink(dotfile_path, symlink_path)
        except FileExistsError:
            print("File already exists: " + symlink_path + " Skipping...")
        else:
            print("Created symlink: " + symlink_path)

if __name__=="__main__":
    # Get the directory path of the script
    # Get the list of files in the dotfiles directory
    dotfiles = os.listdir(DOTFILES_DIR_NAME)
    dotfiles = [f for f in dotfiles if f != ".git" and not f.endswith(".py") and not f == "README.md"]

    print(f"The system detected is: {sys.platform}/{system_mapping.get(sys.platform)}")
    print(f"Using the dotfiles from: {DOTFILES_DIR_NAME}")
    print(f"Running in FORCE mode: {FORCE}")
    print(f"Running in BACKUP mode: {BACKUP}")
    print(f"\nCreating symlinks in {HOME_DIR} for the following files:")
    print(dotfiles)

    print("Proceed? [y/n]")

    if not YES:
        proceed = input().lower() == "y"
    else:
        proceed = True

    if proceed:
        if BACKUP:
            create_backup_files_dir(dotfiles, HOME_DIR)

        # Create symlinks for each file in the dotfiles directory
        create_symlinks(dotfiles, DOTFILES_DIR_NAME, HOME_DIR)
    else:
        print("Exiting...")
        sys.exit(0)
