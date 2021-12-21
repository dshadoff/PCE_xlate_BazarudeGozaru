# Extract

This folder contains the extract batch file, and will extract all of the
graphic assets from the "track2.bin" file (if placed in this folder).

The bat file is written to be executed on Windows, and relies on some tools
in the "tools" folder (immediately below the root of the project).

When run within the command prompt, over 100 files will be created containing
ASCII-art versions of the original art contained within the game.  In general,
only art assets with Japanese words or symbols (such as yen) were targeted.
These files will all be named as (hexoffset).orig .

Additionally, there are comments within the batch file to explain what element
is related to what hex offset.

