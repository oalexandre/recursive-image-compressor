# Recursive Image Compressor

Welcome, this is a simple script in bash using imageMagick to **compress** a group off images inside many folders/directories.  

**REQUIREMENTS**

Install imagemagick on you system :). In Ubuntu or Debian like use:

    sudo apt-get install imagemagick


# Script Usage

Usage:

    ./compressor.sh -t [type] -p [proportion] -q [quality] -d [directory]

Where:
 - type: Extension of file like jpg, png or others.
 - proportion: Proportion of image like 50, 80 or others
 - quality: Quality of image like 50, 80 or others
 - directory: Path of directory like /home/user/images

Example:

    compressor.sh -t jpg -p 50 -q 80 -d /home/user/images
