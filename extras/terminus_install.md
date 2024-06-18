website:
http://terminus-font.sourceforge.net/

Note that terminus is a bitmap font.

download the latest and `tar -zvxf` the downloaded `tar.gz`

navigate to the unextracted directory, in accordance with its readme, patch "td2 -> td1" (for vertically centered '~') via
`patch -p1 -i alt/td1.diff`

install the fonts, copying a sample set of instructions from README for redundancy:

```
  1.2. Quick installation.

  The commands:

  $ ./configure [--prefix=PREFIX]
  $ make -j8
  # make install fontdir

  compile and install the Linux console and X11 Window System fonts.
  The default PREFIX is /usr/local.
```

After the above, for ubuntu there needs to be a sym link to the `75-yes-terminus.conf` file in `/etc/fonts/conf.d`. `conf.d` is setup that it has symlinks where the actual `.conf` files are in `/etc/fonts/conf.avail`.

Note: `75-yes-terminus.conf` can be found in the directory after extracting the terminus tar

Update: Post Ubuntu 20.04, Ubuntu only supports `otb` bitmap fonts. The updated instructions to install terminus can be found here:
https://askubuntu.com/a/1333995

Pasted below again:
```
tar zxvf terminus-font-4.49.1.tar.gz
cd terminus-font-4.49.1
./configure
make otb
sudo make install-otb
sudo cp 75-yes-terminus.conf /etc/fonts/conf.avail/
sudo ln -s /etc/fonts/conf.avail/75-yes-terminus.conf /etc/fonts/conf.d/75-yes-terminus.conf
sudo dpkg-reconfigure fontconfig
```

---
For use in windows consoles. Can use and install ttf version of terminus (non-ttf terminus font installed by the official terminus installer does not work for console fonts).
https://files.ax86.net/terminus-ttf

However, the above link only pre-compiles the default unpatched font. For a patched variant (such as `td1`), they can be found in this repo. Or we can patch and build a new set of `.bdf` files from terminus source. Then use the [`mkttf`](https://github.com/Tblue/mkttf) tool to build a ttf variant of this patched font, then install the ttf.

Sample command to build the ttf font with `mkttf`:
```
./mkttf.sh ~/Downloads/terminus-font-4.49.1 4.49.1 terminus-font terminus_font_td1_ttf
```

Note that `mkttf` requires `imagemagick`, `potrace`, `fontforge` and `mkitalic`. In addition, `fontforge` requires to be built as a python extension (available as a python module) as it is used in the `mkttf` python scripts. For ubuntu, this can be done by installing the package `python3-fontforge`.

On Ubuntu, if the major version of `imagemagick` is below 7, mkttf will error with `magick` command not being available. In this case, we need to manually build and install `imagemagick` from source:

```
git clone git@github.com:ImageMagick/ImageMagick.git
cd ImageMagick
./configure
make
sudo make install
sudo ldconfig /usr/local/lib
```

Original instructions [link](https://www.golinuxcloud.com/how-to-install-imagemagick-on-ubuntu/)
