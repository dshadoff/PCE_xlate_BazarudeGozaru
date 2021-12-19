# TO DO for insert:

## Wrong System Card
- There is no "wrong system card" screen for this Super CD-ROM, oddly
  It simply goes to a black screen and stays there (on real hardware; Mednafen eventually goes back to the boot screen)
  Rather, this behaviour is due to a bug.  It has a System card screen it should put up.

## Shop

- conversation between shop owner and Bazaru
Note: alphabet stored in VRAM, tile mode, 2 char high.
There is a list of strings on disk for these phrases:
- string pointers are every 8 byte starting at:
  - disk address 0xA7C5/in-memory 0x77C5 -> points to 0x78DF
  - 8 bytes seem to be position information
- strings start on disk at 0xA8DF (in memory 0x78DF)
- strings seem to end at disk 0xAACF (in memory 0x7ACF)
- strings are terminated with 0xff
- string contents reference VRAM alphabet (alphabet at 0x1F4000):
  A/I/U/E/O          = 00/01/02/03/04 
  KA/KI/KU/KE/KO     = 05/06/07/08/09 
  SA/SHI/SU/SE/SO    = 0A/0B/0C/0D/0E 
  TA/CHI/TSU/TE/TO   = 0F/20/21/22/23 
  NA/NI/NU/NE/NO     = 24/25/26/27/28 
  HA/HI/HU/HE/HO     = 29/2A/2B/2C/2D 
  MA/MI/MU/ME/MO     = 2E/2F/40/41/42 
  RA/RI/RU/RE/RO     = 43/44/45/46/47 
  YA/YU/YO           = 48/49/4A
  WA/WO/N/space/dots = 4B/4C/4D/4E/4F
  GA/GI/GU/GE/GO     = 60/61/62/63/64 
  ZA/JI/ZU/ZE/ZO     = 65/66/67/68/69 
  DA/CHI/DZU/DE/DO   = 6A/6B/6C/6D/6E 
  BA/BI/BU/BE/BO     = 6F/80/81/82/83 
  PA/PI/PU/PE/PO     = 84/85/86/87/88 
  -/xya/xyu/xyo/xtsu = 89/8A/8B/8C/8D
  ?/!                = 8E/8F

## Miscellaneous

- quite a few things were found which aren't matched to anything see in-game
