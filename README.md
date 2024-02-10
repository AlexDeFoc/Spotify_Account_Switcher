# Spotify Account Switcher

This tool is a combination of Python and batch scripts designed to facilitate the seamless switching between multiple Spotify accounts without the need to log out and log back in each time.

## Installation:

1. **Download** the ZIP file from releases "App Files" and extract it to your desired location. Choose from the App Files what version you want, Python or Exe one. (Exe one enables you to run the program without the program but it WILL be slower by 1 second)

## Adding and Switching Between Accounts:

1. To save a Spotify account, double-click the "`New_User.py`" file. This will create a new folder called "`User" and copy the necessary files from the parent "`Source`" folder into it. The "`PREFS`" file containing encrypted account data will also be copied.
2. To add another account, disconnect from Spotify and connect to the desired account. Then, double-click the "`New_User.py`" file again to create a new user folder.
3. After creating multiple user folders, you can rename them as per your preference.

## Changing Accounts:

1. Navigate to the folder of the account you want to switch to.
2. Double-click the "`Switch.bat`" file to activate the selected account.

## Automation:

This program is highly flexible and can be automated using tools such as FlowLauncher and Espanso. For example, you can create a command like "`:sp1`" or "`:sp2`" and with the help of espanso these would expand to the path of the batch file apropriate to the user i want to switch to "`User_1`" or "`User_2`". And with the help of FlowLauncher for pasting the path of the command into cmd thus running the batch file.

## How It Works:

Spotify stores account data locally in a file called "`prefs`". By replacing this file with one from another account, you can change the active account. This program simply copies and replaces the "`prefs`" file to switch accounts.
