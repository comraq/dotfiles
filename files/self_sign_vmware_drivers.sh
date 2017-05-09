#!/bin/sh

# VMWare requires unsigned drivers which are not loaded on a Linux host
# while secure boot is enabled. Thus, this script creates a key and self
# signs the drivers required for vmware.

# Must run under root

if [ "$(whoami)" != "root" ]; then
  echo "This script must run as root!"
  exit 1
fi

BASEDIR=/tmp

# Create new key
openssl req -new -x509 -newkey rsa:2048 -keyout $BASEDIR/MOK.priv -outform DER -out $BASEDIR/MOK.der -nodes -days 36500 -subj "/CN=VMware/"


# Sign the drivers with just created key
/usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 $BASEDIR/MOK.priv $BASEDIR/MOK.der $(modinfo -n vmmon)

/usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 $BASEDIR/MOK.priv $BASEDIR/MOK.der $(modinfo -n vmnet)

echo "Signing Complete!"
echo "Remember to run 'sudo mokutil --import $BASEDIR/MOK.der' to set a password. Then reboot to complete the MOK enrollment."
