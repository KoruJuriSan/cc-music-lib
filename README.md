<a name="top"></a>
![cc music lib](banner.jpg)

> A simple Computer Craft music library inspired by [Metalloriff](https://github.com/Metalloriff)'s [music player](https://github.com/Metalloriff/cc-music-player/blob/main/play.lua)

## 📦 Installation

1. In your terminal, type the following command to get the `play-lib.lua` file in your current directory.

```bash
wget https://raw.githubusercontent.com/KoruJuriSan/cc-music-lib/refs/heads/main/play-lib.lua play-lib.lua
```

---

2. Now, in any script you want, you can `require()` the `play-lib.lua` file to access the functions of this library detailed in the [how to use](#-how-to-use) section.

```lua
require("play-lib")
```
> my_file.lua


## 📃 How to use

The `.dfpwm` file must be stored on an HTTP/HTTPS server or directly on the ComputerCraft PC.
> It is recommended to store the file on an HTTP/HTTPS server due to the limited storage space on ComputerCraft PCs.

To create `.dfpwm` files, you can either create them from scratch or use an online converter to get your favorite songs directly into the game.
> e.g.: https://music.madefor.cc/

---

### play(uri, volume)
> This function plays the song at a specified volume.
- uri: link to the `.dfpwm` song (string)
- volume: the speaker volume in the range of `0` to `100` (number)

---

### play_playlist(uris, volume)
> This function plays all the songs in the `uris` list one after the other at a specified volume.
- uris: a table of links to `.dfpwm` songs (table of strings)
- volume: the speaker volume in the range of `0` to `100` (number)

---

### readfile_to_uris(path)
> This function returns a table of URIs from the file specified by its path. **Each line in the file should be a different URI!**
- path: path to the file where the URIs are stored
- returns: a table of URIs

---

### play_from_file(path, volume)
> This function plays all the songs listed in a specified file.
- path: path to the file where the URIs are stored
- volume: the speaker volume in the range of `0` to `100` (number)

## ✅🏷️ Licence
This project is under the [MIT LICENCE](LICENCE.txt).