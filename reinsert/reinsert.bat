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
:: This is a pair of GOAL signs which are the same except for translation key (use 236800 for both since they are identical)
:: Note: Sign has two additional alternalte bottoms which need to be adjusted too
..\tools\pce_gfx put tile track2.bin 0x0236800 16 4 4 236800.new 0 0 ..\xlate\236800.xlate
..\tools\pce_gfx put tile track2.bin 0x0236400 16 4 2 236400.new 0 0 ..\xlate\236800.xlate
..\tools\pce_gfx put tile track2.bin 0x0236CC0 16 4 2 236CC0.new 0 0 ..\xlate\236800.xlate
..\tools\pce_gfx put tile track2.bin 0x0241040 16 4 4 236800.new 0 0 ..\xlate\241040.xlate



