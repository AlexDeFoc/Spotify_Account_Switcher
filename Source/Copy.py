import shutil
import os

# Get the script's directory
script_directory = os.getcwd()

# Construct the full path to the prefs file
full_path_to_prefs = os.path.join(script_directory, "prefs")

# Extract the user directory from the full path
user_directory = os.path.dirname(full_path_to_prefs)

# Source and destination paths
source_path = f"{user_directory}/prefs"
destination_path = "C:/Users/Alefan/AppData/Roaming/Spotify/prefs"

# Copy the file
shutil.copy(source_path, destination_path)

print(f"Preferences file for {user_directory} copied successfully!")


print(user_directory)
