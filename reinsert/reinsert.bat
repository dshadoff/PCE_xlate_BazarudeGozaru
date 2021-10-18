:::: Title Screen:
::
:: Run button wo Osu de Gozaru
..\tools\pce_gfx put tile track2.bin 0x0174840 16 14 2 174840.new 0 0 ..\xlate\174840.xlate

::
:::: CHOOSE FILE SCREEN
::
:: File, Stage/Round
..\tools\pce_gfx put sprite track2.bin 0x0183800 2 2 2 183800.new 0 0 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0184000 2 2 2 183800.new 32 0 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0184800 2 2 2 183800.new 64 0 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0185000 2 2 2 183800.new 96 0 ..\xlate\183800.xlate
::
:: Data ga nai
..\tools\pce_gfx put sprite track2.bin 0x0183800 2 2 2 183C00.new 0 0 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0183C80 1 1 1 183C00.new 32 0 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0183D80 1 1 1 183C00.new 32 16 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0184400 2 2 2 183C00.new 48 0 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0184C00 2 2 2 183C00.new 80 0 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0184680 1 1 1 183C00.new 64 32 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0184E00 2 2 1 183C00.new 80 32 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0185080 2 1 2 183C00.new 112 0 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0185180 1 1 1 183C00.new 112 32 ..\xlate\183800.xlate
::
:: Ko (money units)
..\tools\pce_gfx put tile track2.bin 0x01829E0 1 1 1 1829E0.new 0 0 ..\xlate\1829E0.xlate
..\tools\pce_gfx put tile track2.bin 0x0182BE0 1 1 1 1829E0.new 0 8 ..\xlate\1829E0.xlate


:::: WORLD MAP
::
:: Asobi kata
..\tools\pce_gfx put tile track2.bin 0x01A1400 16 6 4 1A1400.new 0 0 ..\xlate\1A1400.xlate

::
:::: AREA MAP
::

::
:::: IN-GAME
::
:: STAGE (top right corner)
..\tools\pce_gfx put sprite track2.bin 0x0111300 2 2 1 111300.new 0 0 ..\xlate\113000.xlate

:: Action choices
..\tools\pce_gfx put sprite track2.bin 0x0111400 2 2 4 111400.new 0 0 ..\xlate\114000.xlate
::
:: These are the monkey icons
..\tools\pce_gfx put sprite track2.bin 0x0151000 2 2 16 151000.new 0 0 ..\xlate\19B800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0152000 2 2 16 152000.new 0 0 ..\xlate\19B800.xlate
..\tools\pce_gfx put sprite track2.bin 0x019B800 2 2 16 19B800.new 0 0 ..\xlate\19B800.xlate
..\tools\pce_gfx put sprite track2.bin 0x019C800 2 2 16 19C800.new 0 0 ..\xlate\19B800.xlate
::
:: 10-yen moneybag
::..\tools\pce_gfx put sprite track2.bin 0x0153400 2 2 2 153400.new 0 0 ..\xlate\0B6180.xlate
:: 1-yen moneybag
..\tools\pce_gfx put sprite track2.bin 0x0153B00 2 1 1 153B00.new 0 0 ..\xlate\0B6180.xlate
::
:: GOAL signs for Stages 1 & 2
:: These GOAL signs are the same except for translation key (use 236800 for both since they are identical)
..\tools\pce_gfx put tile track2.bin 0x0236800 16 4 4 236800.new 0 0 ..\xlate\236800.xlate
..\tools\pce_gfx put tile track2.bin 0x0241040 16 4 4 236800.new 0 0 ..\xlate\241040.xlate
:: Note: Sign has two additional alternate bottoms which need to be adjusted too
..\tools\pce_gfx put tile track2.bin 0x0236400 16 4 2 236400.new 0 0 ..\xlate\236800.xlate
..\tools\pce_gfx put tile track2.bin 0x0236CC0 16 4 2 236CC0.new 0 0 ..\xlate\236800.xlate
::
:: GOAL signs for Stage 3
..\tools\pce_gfx put tile track2.bin 0x024C180 16 4 4 24C180.new 0 0 ..\xlate\24C180.xlate
:: Note: Sign has two additional alternate bottoms which need to be adjusted too
..\tools\pce_gfx put tile track2.bin 0x024B800 16 4 2 24B800.new 0 0 ..\xlate\24C180.xlate
..\tools\pce_gfx put tile track2.bin 0x024C500 16 4 2 24C500.new 0 0 ..\xlate\24C180.xlate
::
:: GOAL signs for Stage 4
..\tools\pce_gfx put tile track2.bin 0x0259840 16 4 4 259840.new 0 0 ..\xlate\259840.xlate
:: Note: Sign has two additional alternate bottoms which need to be adjusted too
..\tools\pce_gfx put tile track2.bin 0x02598C0 16 4 2 2598C0.new 0 0 ..\xlate\259840.xlate
..\tools\pce_gfx put tile track2.bin 0x0259D40 16 4 2 259D40.new 0 0 ..\xlate\259840.xlate
::
:: GOAL signs for Stage 5
..\tools\pce_gfx put tile track2.bin 0x0267040 16 4 4 267040.new 0 0 ..\xlate\259840.xlate
:: Note: Sign has three additional alternate bottoms which need to be adjusted too
..\tools\pce_gfx put tile track2.bin 0x0266C80 16 4 2 266C80.new 0 0 ..\xlate\259840.xlate
..\tools\pce_gfx put tile track2.bin 0x0266E00 16 4 1 266E00.new 0 0 ..\xlate\259840.xlate
..\tools\pce_gfx put tile track2.bin 0x0266A80 16 4 1 266A80.new 0 0 ..\xlate\259840.xlate
::
:: GOAL signs for Stage 6
..\tools\pce_gfx put tile track2.bin 0x0276580 16 4 4 276580.new 0 0 ..\xlate\276580.xlate
::
:: GOAL signs for Stage 7
..\tools\pce_gfx put tile track2.bin 0x0284B80 16 4 4 284B80.new 0 0 ..\xlate\284B80.xlate
:: Note: Sign has three additional alternate bottoms which need to be adjusted too
..\tools\pce_gfx put tile track2.bin 0x0283880 16 4 2 283880.new 0 0 ..\xlate\284B80.xlate
..\tools\pce_gfx put tile track2.bin 0x0283F00 16 4 1 283F00.new 0 0 ..\xlate\284B80.xlate
..\tools\pce_gfx put tile track2.bin 0x0284700 16 4 2 284700.new 0 0 ..\xlate\284B80.xlate
::
:: GOAL signs for Stage 8
..\tools\pce_gfx put tile track2.bin 0x029A100 16 4 4 29A100.new 0 0 ..\xlate\29A100.xlate



::
:::: Purchases at the store:
::
:: Store choices - Buy/Don't Buy
..\tools\pce_gfx put sprite track2.bin 0x0166800 2 2 2 166800.new 0 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0167000 2 2 2 166800.new 32 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0167800 2 2 2 166800.new 64 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0168000 2 2 2 166800.new 96 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0166A00 2 2 2 166800.new 128 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0167200 2 2 2 166800.new 160 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0167A00 2 2 2 166800.new 192 0 ..\xlate\166800.xlate
::
:: Wallet (contents)
..\tools\pce_gfx put tile track2.bin 0x01DA100 16 4 1 1DA100.new 0 0 ..\xlate\17C000.xlate
::
::Note: These are all the same: ** yen sign ** / Dollar Sign
..\tools\pce_gfx put tile track2.bin 0x01DC4C0 16 2 2 1DC4C0.new 0 0 ..\xlate\17C000.xlate
..\tools\pce_gfx put tile track2.bin 0x01DF4C0 16 2 2 1DF4C0.new 0 0 ..\xlate\17C000.xlate
..\tools\pce_gfx put tile track2.bin 0x01E24C0 16 2 2 1E24C0.new 0 0 ..\xlate\17C000.xlate
..\tools\pce_gfx put tile track2.bin 0x01E54C0 16 2 2 1E54C0.new 0 0 ..\xlate\17C000.xlate
..\tools\pce_gfx put tile track2.bin 0x01E84C0 16 2 2 1E84C0.new 0 0 ..\xlate\17C000.xlate
..\tools\pce_gfx put tile track2.bin 0x01EB4C0 16 2 2 1EB4C0.new 0 0 ..\xlate\17C000.xlate
..\tools\pce_gfx put tile track2.bin 0x01EE4C0 16 2 2 1EE4C0.new 0 0 ..\xlate\17C000.xlate
..\tools\pce_gfx put tile track2.bin 0x01F14C0 16 2 2 1F14C0.new 0 0 ..\xlate\17C000.xlate


