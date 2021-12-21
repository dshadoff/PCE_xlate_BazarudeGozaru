# reins_shoptalk

This folder is where the text surrounding the dialogue in the shop takes place
(where Bazaru buys the home furnishings at the end of each Stage).

The font is inserted as part of the overall graphics, but the text is done here.

## Overall Approach

The text is set up as a table of pointers to text, within a bank.  The text is
basically all consecutive, but updating the set of pointers would be tedious
if the text were to change... so I decided that the assembler (PCEAS) was
designed precisely for this purpose, so why not use it ?

The pceas assembler can '.incbin' blocks of binary to use as a base, in order
to assemble over top of - in effect, patching it - but is limited in how much
binary can be managed in this way.  Additionally, the CDROM binaries are not
aligned to bank boundaries, so the sections under construction need to be extracted
and then re-inserted back into the binary.

...So I wrote 'yankbank', a utility which will extract or re-insert a prescribed
number of banks of data from a larger binary, in order to work on it and replace
it later.

Within the assembler program, I created constants for capital letters - for example,
the letter 'L' would be 'cL', and lowercase letters - 'm' would be 'lM'.  In this
way, virtually any character encoding could be used, and the messages would end up
more or less readable, within '.db' constructs.  Not perfect, but definitely workable.

The 'shoptalk.bat' batch file accesses a local 'track2.bin' file, and extracts a
block named 'txtblk.bin', which is then used for layering the dialogue in the shop,
and the output is replaced into track2.bin.

Note: You must have the pceas assembler in your execution path.
