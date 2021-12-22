# reinsert

This folder contains all of the translated ASCII art artifacts ("*.new"), as well as the
scripts which insert them into the track2.bin file (and make other patch modifications).

## Overall Approach

Each "*.new" file represents an art artifact residing at a particular offset from the start of the data track;
the filenames represent the hex offsets.

Most of the art artifacts here are very straightforward, and easily viewed, even from the
web browser - just view the "xxx.new" file.

There are a couple of cases where you might wonder why there is a mismatched element; these were cases
where we just needed some extra space, and had to re-arrange things a bit.

The *.BAT files will reinsert the data into the track2.bin data file, including additional
single- and multi-byte patch adjustments.  there is no particular order to apply them... but just 
keep in mind that the graphics for the shop conversation are in this folder, but the actual text
is in its own folder.
