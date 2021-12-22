# PCE_xlate_BazarudeGozaru

This repository holds the information used during the creation of the translation patch
for the PC Engine game Bazaru de Gozaru.

## About the Game

Bazaru de Gozaru was a game released on the PC Engine console, in Super CDROM format.
It features a monkey, who needs to be guided by the player through various puzzles.
Along the way, there are opportunities to purchase home furnishings for Bazaru (the monkey).

While the monkey's Japanese name is "Bazaru de Gozaru", the English name has been indicated by NEC
to be "Bazar de Gozarre" (with an accent over the 'e' in 'de'). But I will refer to the money as "Bazaru".

## About the Translation

The items for translation in this game are primarily icons, signs and graphical representations
of text, rather than text itself.  As such, it is more suited to a person with some level of artistic
skill... unlike myself.

I started this translation in roughly May of 2005, creating some rudimentary tools
because graphic utilities at that time were not careful to respect palettes.  This, combined
with my lack of artisitic talent, drove me to export (and re-import) the art assets as
ASCII art.  I'm not sure whether this is a novel idea, but it worked for me.

After the initial extraction, I put the translation aside hoping that somebody else would pick
it up at some point, but recently I was motivated to make more progress on it, as more people
became interested in performing translations.

## About the Repository

This contains all the materials created/needed during the translation.
 - There is a walkthrough (which you shouldn't use, because you will miss out on the fun)
 - There are also Test_BRAM files, which were used in order to jump to certain portions
of the game for test purposes.

 - 'tools' contains all the source code and the required executables in order to reimplant
 - 'extract' contains the batch file used to extract all the ASCII art objects used for initial reference (in conjunction with 'xlate')
 - 'reins_shoptalk' contains the approach taken for reinserting the dialogue used in the shop when purchasing home furnishings
 - 'reinsert' contains all of the remaining batch files and translated art assets needed to reinsert.  Note that some of these scripts are actually generated code from tools within the subfolders under 'tools'.  More information can be found within those folders.

A few technical notes can be found in the "TECHNICAL.md" file in this folder.

## About the Team

The work broke down roughly as follows:

Dave Shadoff:
 - Identfication/Extraction of items to be translated
 - Tool Creation
 - Decode/Recode Sprite, Text, and background graphic encoding systems
 - Translation
 - Minor artwork

Diogo Ribeiro:
 - Fonts
 - Artwork (anything thicker than 1 pixel)
 - Testing

MooZ:
 - Miscellaneous Support
 - Testing

