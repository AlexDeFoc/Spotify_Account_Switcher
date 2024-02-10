import os
import shutil

def new_save():
    # Get script location
    save_folder = os.path.join(os.getcwd(), 'User')
    # Get file path from spotify folder
    save_file_path = os.path.join(os.path.expanduser('~'), 'AppData', 'Roaming', 'Spotify', 'prefs')
    # Get source folder path
    source_path = os.path.join(os.path.join(os.getcwd(), 'Source'))
    # save_folder_source = os.path.join(save_folder, 'Source')

    # Copy the prefs file and source files
    if not os.path.exists(os.path.join(save_folder)):
        os.makedirs(save_folder)
        print("starting copy")
        shutil.copy(save_file_path, save_folder)
        shutil.copy(os.path.join(source_path, 'Copy.py'), save_folder)
        shutil.copy(os.path.join(source_path, 'Switch.bat'), save_folder)
    
new_save()