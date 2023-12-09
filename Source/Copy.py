import shutil
import os

script_directory = os.getcwd()
full_path_to_prefs = os.path.join(script_directory, "prefs")
user_directory = os.path.dirname(full_path_to_prefs)

source_path = os.path.join(user_directory, "prefs")
destination_path = os.path.join(os.path.expanduser("~"), "AppData/Roaming/Spotify", "prefs")

shutil.copy(source_path, destination_path)

print(f"Account switched successfully!")
