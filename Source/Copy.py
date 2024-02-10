import shutil
import os

file_destination = os.path.join(os.path.expandvars('%USERPROFILE%'), 'AppData', 'Roaming', 'Spotify')
file_source = os.path.join(os.getcwd(), 'prefs')

shutil.copy(file_source, file_destination)