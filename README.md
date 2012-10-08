TeamPecan Project
========================
Here LG Optimus Me device folder for build Cyanogenmod 9, Android 4.0.4

1. Download source codes:
--------------------------------
- mkdir cm9
- cd cm9
- repo init -u git://github.com/TeamPecan/android.git -b ics
- repo sync -j16

2. Build ROM:
-------------
- cd cm9
- source build/envsetup.sh && brunch cm_p350-userdebug

3. Installing:
--------------
- Grab new file named cm-9-(DATE)-UNOFFICIAL-p350 from cm9/out/target/product/p350
- Push ZIP to SD Card and install
- Install Google Apps
