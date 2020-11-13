=== Devuan ASCII minimal live ====

This image is a full-featured console-only live Devuan ASCII system,
with tons of command-line and curses utilities and a special focus on
accessibility. The system is a good starting point for a minimalist
environment, a powerful solution for rescue tasks, and a useful tool to
have in your pocket every day.

The image can be burnt on a CDROM or dd-ed on a USB stick.

The regular user is devuan/devuan. Become admin with root/toor.

Designed and maintained by Vincenzo 'Katolaz' Nicosia
Homepage: http://kalos.mine.nu
Iso files built and signed by fsmithred (key id 0xA73823D3094C5620 on pgp.mit.e$

=======================================


0) Boot options
1) Packages
2) Connecting to the Internet
3) About non-free firmware packages
4) Installing on a hard drive
5) Acknowledgements

=======================================

0) == Boot options ==

There are several boot options available:

- std: default, with selection of framebuffer resolution
- access: accessible boot, with audible boot feedback and autologin
- std-toram: as "std", but load squashfs into RAM 
- access-toram: as "access", but load squashfs into RAM
- no probe: disable apic/apm/dma/mce/smp
- memtest: perform a memory test (does not boot Linux)

The two accessible boot options ("access" and "access-toram",
respectively the second and the fourth on the boot menu) emit a "beep"
(CTRL+G) when they are selected, to be easily recognisable, and enter
into a dedicated runlevel (runlevel 4) which autologins root on tty1
and the user devuan on tty2-tty6. There is audible feedback on boot,
and a simple chime (C-E-G-E-C) signals the end of the boot.

=======================================

1) == Packages ===

This image contains around 590 packages in total, and includes:

  - _Base system_: bash, busybox, consoledata, GNU coreutils, dash,
    dialog, locales, syslinux, sysvinit, util-linux-locales, zsh

  - _Admin/Recovery_: debootstrap, entr, gddrescue, gdisk, htop,
    iftop, iotop, mtr-tiny, multitail, ncdu, parted, wavemon,
    wireless-tools, wpa_supplicant

  - _Editors_: vim-tiny, zile (Emacs clone), nano

  - _Networking_: bittornado, curl, edbrowse, fetchmail, ftp, irssi,
    lftp, links2, mcabber, minicom, mosh, msmtp, mutt, netcat, nrss,
    openssh-client, openssh-server, procmail, rsync, setnet, telnet,
    tin, twidge, w3m, wget

  - _Personal_productivity_: abook, aspell, calcurse, clex, dvtm,
    fbi/fbgs, fbterm, ghostscript, gpg, mc, parallel, sc, screen,
    taskwarrior, tmux

  - _Programming_ languages_: ANSI C (tcc + libc6-dev), Perl
    (minimal), python (minimal), awk (gawk), guile

  - _Games_: bastet, bombardier, bsdgames, cavezofphear, crawl,
    curseofwar, empire, freesweep, gnuchess, greed, matanza, moria,
    nethack, ninvaders, omega-rpg, pacman4console, pente, sudoku

  - _Accessibility_: beep, brltty, espeak, espeakup, yasr

  - _Multimedia_: caca-utils, hasciicam, imagemagick, jhead, moc,
    radio, sox
	
  - _Miscellanea_: cmatrix, cowsay, figlet, fortune-mod, gpm,
    termsaver, toilet, ttyrec
	
=======================================

2) == Connecting to the Internet ==

This image ships with "setnet.sh", a simple dialog tool to setup
networking. setnet allows to configure both wired and wireless
connections, with static or DHCP-based IP assignment, and can help you
setting up wi-fi authentication to open, WPA Personal (WPA/PSK and
WPA2/PSK), and WPA Enterprise (WPA/EAP or WPA/TLS) networks.

Just run:

  # setnet.sh

from a root console, and then select "Setup interfaces" for a list of
recognised devices. For more information please just:

  $ man setnet

=======================================

3) == About non-free firmware packages ==

Devuan minimal live comes with all the available firmware packages
pre-installed. This means that also *non-free* software is present in
this image. Actually, those non-free firmware packages are *the only*
non-free software packages installed in this image.

We highly value the freedom of Devuan users, and we would rather
prefer none of them to be ever forced to use non-free software, at
all. However, the choice of including non-free firmware was dictated
by the necessity to facilitate new users in getting their hardware,
and especially wifi cards, working out of the box.

We provide a simple script, that you can find in
"/root/remove_firmware.sh", which allows to remove all non-free
firmware from your installation. Just run the script, and all non-free
firmware will be removed.

=======================================

4) == Installing on a hard drive ==

The recommended way of installing Devuan is by using one of the
installation media or the desktop-live image available at
http://files.devuan.org under the folders "installer-iso" and
"desktop-live", respectively.

However, it is also possible to install this minimal live image on a
hard disk by using the refractainstaller script shipped with it. I
tested the installation on qemu and on bare-metal, and it worked quite
well, but I cannot guarantee that it will work for you as well, so
please use refractainstaller AT YOUR OWN RISK but feel free to drop me
a line if it works.

Again, INSTALLING AN OPERATING SYSTEM ON AN EXISTING HARD DRIVE MIGHT
POTENTIALLY DESTROY EXISTING DATA, ESPECIALLY IF YOU DON'T KNOW
EXACTLY WHAT YOU ARE DOING. SO PLEASE BE CAREFUL, BACKUP YOUR DATA,
AND DO NOT COMPLAIN IF ANYTHING GOES WRONG. IT WILL BE JUST *YOUR*
FAULT.

=======================================

5) == Acknowledgements ==

I thank the refracta team for providing refractasnapshot and
refractainstaller.

A very special thank goes to Gregory Nowak, Parham Doustdar, Jude
DaShiell, John G Heim, Rob, and all the people in the Linux-speakup
mailing list (http://www.linux-speakup.org/) for their encouragement
and support, and for providing invaluable feedback about
accessibility. Without their help, I couldn't have seen what was
needed in order to make the minimal live images easier to use for
visually-impaired users.

I feel indebted with all the people in the DNG Mailing List who have
provided feedback, suggestions, comments, and encouragement, and in
particular: aitor_czr, Boruch Baum, fsmithred, golinux, David Hare,
Irrwahn, Steve Litt, Daniel Reurich, Joel Roth, Ozi Traveller.

Comments, suggestions, criticisms, and bug reports are welcome, and
should be reported on the official Devuan Bug Tracking System:

  http://bugs.devuan.org

=======================================

