# Short about this app:
* It's a very easy to use, flexible naming customisation and protability app. \
* It provides the user to make multiple "User Folders" which will store the spotify user data so you don't have to login again when wanting to switch accounts!

---

Platforms supported:
Platforms:
- Windows
- Linux
- MacOS (called darwin)

Architectures:
- AMD64 : for a cpu of 64 bit
- 386 : for a cpu of 32/86 bit
- ARM : for cpu of type arm
- ARM64 : for cpu of type arm64

---

How to download released archive:
1. Go to releases
2. Choose your version
3. Download the archive with the platform-architecture name from the chapters above
4. De-archive/Extract the contents in a folder where you want your "Spotify Account Switcher" app to be

How to use the app:
There are two parts of the program:
1. Main
2. Switch
- The main one, run it and it will:
  - create a folder called "New User"
  - copy the contents of the folder called Source into the new user folder
  - copy the "prefs" file from the spotify directory (this is the file that actually stores your profile data)
- The switch one, run it and it will:
  - copy or overide the "prefs" file from the spotify directory with the one inside your user folder

Customisation:
- This app is flexible for naming but robust for the actual structure
- Naming :
   - You can change the name of the folder newly create by the main executable to anything you want!
- Portability :
 - After you create a user folder you can move it anywhere you want!

---

How it all works:
1. The main executable
- creates a folder if it doesn't exist already called "New User"
- copy the switch executable from the source folder into the new user folder
- copy the prefs file from the spotify directory into your new user folder
2. How the app finds the prefs file:
 - based on the OS (operating system) it expands/goes to a directory through enviroment variables of the system or simply the path
3. The switch executable:
   - copies the prefs file within the directory of the switch executable and copies or overides the one from the spotify directory.
