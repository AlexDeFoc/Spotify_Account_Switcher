import os
import shutil

def create_unique_user_folder_and_copy_files():
    # Get the current directory
    current_directory = os.getcwd()

    # Generate a unique folder name by incrementing a counter
    user_number = 1
    while True:
        folder_name = f"User_{user_number}"

        # Check if the folder already exists
        if not os.path.exists(os.path.join(current_directory, folder_name)):
            # Create the new folder
            os.makedirs(os.path.join(current_directory, folder_name))
            break

        # Increment the counter
        user_number += 1

    # Get the current user's home directory
    current_user_home_directory = os.path.join(os.path.expanduser('~'), 'AppData', 'Roaming', 'Spotify')

    # Copy the prefs file and source files
    shutil.copy(os.path.join(current_user_home_directory, 'prefs'), os.path.join(current_directory, folder_name))
    for file in os.listdir('Source'):
        source_file_path = os.path.join('Source', file)
        destination_file_path = os.path.join(os.path.join(current_directory, folder_name), file)
        shutil.copy(source_file_path, destination_file_path)

if __name__ == "__main__":
    create_unique_user_folder_and_copy_files()
