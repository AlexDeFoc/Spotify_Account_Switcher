import os
import shutil

def create_unique_user_folder_and_copy_files():
    # Get the current directory
    current_directory = os.getcwd()

    # Start with user number 1
    user_number = 1

    # Generate a unique folder name
    while True:
        folder_name = f"User_{user_number}"

        # Check if the folder already exists
        if not os.path.exists(os.path.join(current_directory, folder_name)):
            # Create the new folder
            os.makedirs(os.path.join(current_directory, folder_name))
            break

        # Increment the user number
        user_number += 1

    # Get the source directory path
    source_directory_path = "D:\App\Spotify swapper\Source"

    # Get the prefs file path
    prefs_file_path = "C:\Users\Alefan\AppData\Roaming\Spotify\prefs"

    # Copy the prefs file to the created user folder
    shutil.copy(prefs_file_path, os.path.join(current_directory, folder_name))

    # Copy the files from the source directory to the created user folder
    for file in os.listdir(source_directory_path):
        source_file_path = os.path.join(source_directory_path, file)
        destination_file_path = os.path.join(os.path.join(current_directory, folder_name), file)
        shutil.copy(source_file_path, destination_file_path)

if __name__ == "__main__":
    create_unique_user_folder_and_copy_files()
