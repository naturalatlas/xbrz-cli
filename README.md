# xbrz-cli

A repackaged version of [T1T4N/xBRZ-cli](https://github.com/T1T4N/xBRZ-cli) with minor differences:

- Adds `cimg_use_jpeg` flag for jpeg support (and links `libjpeg`)
- Adds `-quality 0-100` flag (only for JPEG output)
- Builds with a [Makefile](./Makefile) instead of XCode.
- [CImg.h](https://github.com/dtschump/CImg) is downloaded at build time instead of being bundled with the repository.

### Running
```
$ xbrz [input] [scale] [output] [-quality 0-1000]
```

The argument parsing isn't fancy – so make sure to use that format exactly.

### Building from Source

#### Linux
```sh
$ sudo apt-get install libpng-dev libjpeg-dev
$ make # builds ./dist/xbrz binary
```

#### OSX
```sh
$ brew install jpeg libpng
$ make # builds ./dist/xbrz binary
```

If you get libjpeg linking errors on OSX, try running `xcode-select --install` and `brew unlink jpeg && brew link jpeg` first.
