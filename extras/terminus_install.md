website:
http://terminus-font.sourceforge.net/

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

After the above, for ubuntu there needs to be a sym link to the `75-terminus-yes.conf` file in `/etc/fonts/conf.d`
