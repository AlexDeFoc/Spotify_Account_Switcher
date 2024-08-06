# About this app:
* Get the power to switch spotify accounts without having to log in everytime
* Fully made in Go
* Very fast & simple
* Customisable user folder name
* Portable to store & move the user folder anywhere

# Platforms supported:
- Windows
- Linux
- MacOS (called darwin)

# Architectures supported:
- AMD64 : 64 bit cpu
- 386 : 32 bit cpu
- ARM : arm cpu
- ARM64 : arm 64 bit cpu

# How to install:
1. Go to [Releases](https://github.com/AlexDeFoc/Spotify_Account_Switcher/releases) page
2. Download the version for your platform & architecture
3. Extract files and put them where you want the app to be

# How to use

## Creating a new user:
1. Execute the main file

This creates a folder called "New User", and makes a copy of your Spotify profile called "prefs".

Now you can move and customise however you want your user profile folder.

## Switching user accounts:
1. Go inside your user profile folder that you want to switch to.
2. Execute the switch file

This puts the "prefs" file from the user profile into the Spotify directory.

# Automate switching accounts:
#### Notes:
This chapter is optional, as you can simply go to you _"Spotify Switcher App"_ folder and go to your user folder that you wish and execute the switch executable.

I provide a powershell script. In the future i may provide a bash version.

How i will make it even easier for me to switch accounts is to put this script into my Windows Terminal profile ps1 file, which is loaded whenever i open my terminal, and then i can assign aliases.

If you want to do the same google "Windows Terminal profile ps1 config".

```
function spotifySwitchGO {
    param (
        [Parameter(Mandatory = $true)]
        [string]$accountAlias
    )

    $spotifyAccountsFolderNames = @{
        sp1 = 'Main'
        sp2 = 'Mini-Alex'
        sp3 = 'Mini-Alex2'
    }

    foreach ($key in $spotifyAccountsFolderNames.Keys) {
        if ($key -eq $accountAlias) {
            $user = $spotifyAccountsFolderNames[$key]
            break
        }
    }

    $switcherPath = Join-Path 'C:/App/Spotify Switcher/' "$user" '/switch.exe'
    
    & "$switcherPath"
}

set-alias -Name sp -Value spotifySwitchGO
```
### Explanation of the code above:
1. We tell our console to get the name that we type after the _sp_ alias
2. We create a map with keys as our aliases for our accounts and keys for the name of the accounts folder
3. We loop through the map and check if what we provided in the console matches any key from our map and if yes then assign the value of that key to a variable
4. Join the path of our Spotify Switcher App, with the name of the user folder we wanted from the _$user_ variable, and with the name of our switch executable
5. Then using the _&_ symbol we ensure that we run the executable from that path
6. We assign a alias for our function so we can easily just type in our console, to switch to the _"Main"_ account:
```
sp sp1
```
7. That's it! It can be complicated but if you break it down it's easy, and if you don't want this much complexity you can make your own function with simple if and else if statements.

# Building & running from source
#### Notes:
I don't recommend this aproach because the releases are up to date with the source code. The only times they will be delayed is when i would want to update the documentation.

When running from source without building it is SLOWER than building or running the distributed executables from the [Release](https://github.com/AlexDeFoc/Spotify_Account_Switcher/releases) page.

You are required to have this tools:
- git (for cloning)
- go (for building & running)

## Building from source:
1. Clone the repository into a folder
2. Open a console/terminal and go inside that folder
3. Run the following command:
```
go build main.go
```
4. Then go inside the Source folder
5. Run the following command:
```
go build switch.go
```

## Running from source:
1. Clone the repository into a folder
2. Open a console/terminal and go inside that folder
3. Run the following command - to make a new user folder:
```
go run main.go
```
4. Then go inside your user folder
5. Run the following command - to switch to that user account
```
go run switch.go
```

# How to contribute:
#### Note:
You can contribute with scripts, examples, simpler or more optimised ones, maybe in bash or other scripting languages for making it a easier time for the linux community.

You can also contribute with optimisations to the main source code or the switcher one.

Any contribution is warm welcomed. Although i would ask from anyone wanting to contribute to the app to follow these goals of the project:
- Fast and simple
- Efficient
- Cross-compatible
