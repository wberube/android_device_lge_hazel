TeamPecan Project
========================
Here LG Optimus Me device folder for build Cyanogenmod 9, Android 4.0.4

1. Operating System:
--------------------------------
First step is having a fully functional linux distro. You can choose what you prefer, I'm using ubuntu and I write commands for it. You can use OSX too, as I know, but I've completely no idea how, I never had a Mac.
Well, talking about linux, you need a 64bit distribution, so if you have an old 32 bit processor youn cannot go ahead. 

To check which version do you have, type in a shell
- uname -a

If the results include "x86_64" you're ok.

2. Installing Packages:
--------------------------------
You need to install some little packages, to be able to proceed, you can do this with your favorite package manager:
sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-dev:i386 g++-multilib mingw32 openjdk-6-jdk pngcrush schedtool tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386
Some systems need some trick to install all this package, is your care to check this process completed correctly and fix eventually problems.

3. Install "repo":
--------------------------------
Repo is the program that handles synchronization between our pc and the repository, in this case Cyanogen's one. To install do:
- mkdir -p ~/bin
- curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
- chmod a+x ~/bin/repo

4. Download source codes:
--------------------------------
- mkdir CM9
- cd CM9
- repo init -u git://github.com/TeamPecan/android.git -b ics
- repo sync -j16

5. Download Prebuilt files:
--------------------------------
There are some others files needed.
- . ~/CM9/vendor/cm/get-prebuilts

Another small wait time and we're ready!

6. Build ROM:
-------------
- cd CM9
- source build/envsetup.sh && brunch cm_p350-userdebug

7. Installing:
--------------
- Grab new file named cm-9-(DATE)-UNOFFICIAL-p350 from CM9/out/target/product/p350
- Push ZIP to SD Card and install
- Install Google Apps

8. Update Source:
--------------------------------
If you want to update your build, you have to do only this:
- cd CM9
- repo sync -j16

and build again :D
