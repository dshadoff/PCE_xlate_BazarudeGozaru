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


