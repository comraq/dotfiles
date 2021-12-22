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
