package main

import (
	"io"
	"log"
	"os"
	"path/filepath"
	"runtime"
)

func main(){
  err := copy("../prefs", getPrefsPath())
  if err != nil {
    log.Panic(err)
  }
}

// getPrefsPath returns the path to the prefs file based on the OS.
func getPrefsPath() string {
	var prefsPath string

	switch runtime.GOOS {
	case "windows":
		// On Windows, use the USERPROFILE environment variable and the typical Spotify path
		userProfile := os.Getenv("USERPROFILE")
		if userProfile != "" {
			prefsPath = filepath.Join(userProfile, "AppData", "Roaming", "Spotify", "prefs")
		}
	case "linux":
		// On Linux, use the typical Spotify config directory
		prefsPath = filepath.Join(os.Getenv("HOME"), ".config", "spotify", "prefs")
	case "darwin":
		// On macOS, use the typical Spotify Application Support directory
		prefsPath = filepath.Join(os.Getenv("HOME"), "Library", "Application Support", "Spotify", "prefs")
	default:
		return "Unsupported operating system."
	}

	return prefsPath
}

func copy(srcpath, dstpath string) (err error) {
  r, err := os.Open(srcpath)
  if err != nil {
    return err
  }
  defer r.Close()

  w, err := os.Create(dstpath)
  if err != nil {
    return nil
  }

  defer func() {
    if c := w.Close(); err == nil {
      err = c
    }
  }()

  _, err = io.Copy(w, r)
  return err
}
