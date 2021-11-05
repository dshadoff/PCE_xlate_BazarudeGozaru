:::: Title Screen:
::
:: Bazaru de Gozaru no
::
..\tools\pce_gfx put tile track2.bin 0x0172800 16 16 10 172800.new 0 0 ..\xlate\172800.xlate
::
:: Game de Gozaru
::
..\tools\pce_gfx put sprite track2.bin 0x0177800 2 2 4 177800.new 0 0 ..\xlate\177800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0178000 2 2 4 177800.new 32 0 ..\xlate\177800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0178800 2 2 4 177800.new 64 0 ..\xlate\177800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0179000 2 2 4 177800.new 96 0 ..\xlate\177800.xlate
::
:: Run button wo Osu de Gozaru
::
..\tools\pce_gfx put tile track2.bin 0x0174840 16 14 2 174840.new 0 0 ..\xlate\174840.xlate

::
:::: CHOOSE FILE SCREEN
::
:: File wo Erabu de Gozaru
::
..\tools\pce_gfx put tile track2.bin 0x0181C00 16 16 8 181C00.new 0 0 ..\xlate\181C00.xlate
::
:: File, Stage/Round
::
..\tools\pce_gfx put sprite track2.bin 0x0183800 2 2 2 183800.new 0 0 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0184000 2 2 2 183800.new 32 0 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0184800 2 2 2 183800.new 64 0 ..\xlate\183800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0185000 2 2 2 183800.new 96 0 ..\xlate\183800.xlate
::
:: Data ga nai
::
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
::
..\tools\pce_gfx put tile track2.bin 0x01829E0 1 1 1 1829E0.new 0 0 ..\xlate\1829E0.xlate
..\tools\pce_gfx put tile track2.bin 0x0182BE0 1 1 1 1829E0.new 0 8 ..\xlate\1829E0.xlate


:::: WORLD MAP
::
:: STAGE SELECT (screen heading)
::
..\tools\pce_gfx put sprite track2.bin 0x0162800 2 2 2 162800.new 0 0 ..\xlate\162800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0163000 2 2 2 162800.new 32 0 ..\xlate\162800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0163800 2 2 2 162800.new 64 0 ..\xlate\162800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0164000 2 2 2 162800.new 96 0 ..\xlate\162800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0162A00 2 2 2 162800.new 128 0 ..\xlate\162800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0163200 2 2 2 162800.new 160 0 ..\xlate\162800.xlate
::
:: Asobi kata
::
..\tools\pce_gfx put tile track2.bin 0x01A1400 16 6 4 1A1400.new 0 0 ..\xlate\1A1400.xlate

 
:::: HELP
::
:: "Asobi kata" page heading
::
..\tools\pce_gfx put tile track2.bin 0x017D400 16 14 4 17D400.new 0 0 ..\xlate\169000.xlate
::
:: How to Play initial screen
::
..\tools\pce_gfx put tile track2.bin 0x0190C00 16 16 8 190C00.new 0 0 ..\xlate\17C000.xlate
..\tools\pce_gfx put tile track2.bin 0x0192880 16 4 4 192880.new 0 0 ..\xlate\17C000.xlate
..\tools\pce_gfx put tile track2.bin 0x0193000 16 16 6 193000.new 0 0 ..\xlate\17C000.xlate


::
:::: AREA MAP
::
::Note: These are all the same - "World map ni Modoru"/"Return to World Map"
::Note: reinsertion only requires one image be translated
::
..\tools\pce_gfx put tile track2.bin 0x01A4C00 16 16 2 1A4C00.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01AA400 16 16 2 1A4C00.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01AFC00 16 16 2 1A4C00.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01B5400 16 16 2 1A4C00.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01BAC00 16 16 2 1A4C00.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01C0400 16 16 2 1A4C00.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01C5C00 16 16 2 1A4C00.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01CB400 16 16 2 1A4C00.new 0 0 ..\xlate\1A1400.xlate
::
::Note: These are all the same - "Stage"
::Note: reinsertion only requires one image be translated (except in one case)
::
..\tools\pce_gfx put tile track2.bin 0x01A6900 16 8 2 1A6900.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01AC100 16 8 2 1A6900.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01B1900 16 8 2 1A6900.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01B7100 16 8 2 1B7100.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01BC900 16 8 2 1A6900.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01C2100 16 8 2 1A6900.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01C7900 16 8 2 1A6900.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01CD100 16 8 2 1A6900.new 0 0 ..\xlate\1A1400.xlate
::
::These are the names of the levels
::
:: Stage 1 Trails:
..\tools\pce_gfx put tile track2.bin 0x01A6D00 16 8 2 1A6D00.new 0 0 ..\xlate\1A1400.xlate
::
:: Stage 2 Beach:
..\tools\pce_gfx put tile track2.bin 0x01AC500 16 8 2 1AC500.new 0 0 ..\xlate\1A1400.xlate
::
:: Stage 3 Arctic:
..\tools\pce_gfx put tile track2.bin 0x01B1D00 16 8 2 1B1D00.new 0 0 ..\xlate\1A1400.xlate
::
:: Stage 4 Cemetery:
:: Note: stage 4 uses reclaimed tiles, and the leg of the "Y" in "CEMETERY" is a reused leg of the "T" 
..\tools\pce_gfx put tile track2.bin 0x01B7500 16 8 2 1B7500.new 0 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01B7D00 2 2 1 1B7500.new 64 0 ..\xlate\1A1400.xlate
..\tools\pce_gfx put tile track2.bin 0x01B73E0 1 1 1 1B7500.new 64 8 ..\xlate\1A1400.xlate
:: Now, re-construct the meta-tile for "STAGE" to reclaim a tile:
..\tools\patch track2.bin 0x01B829C 0x8E 0x8F 0x9E 0x8F
:: Now, construct the meta-tile for the last 2 tiles:
..\tools\patch track2.bin 0x01B82D4 0xAE 0xAF 0xBE 0xBF 0xE8 0xE9 0x9F 0xBD
:: Now, address the meta-tiles on the overall map for the intro screen:
..\tools\patch track2.bin 0x01B860D 0xAD 0xAE 0xAF 0xB4 0xB5
::
:: Stage 5 Desert:
..\tools\pce_gfx put tile track2.bin 0x01BCD00 16 8 2 1BCD00.new 0 0 ..\xlate\1A1400.xlate
:: Now, address the meta-tiles on the overall map for the intro screen, to display more tiles:
..\tools\patch track2.bin 0x01BDE0D 0xAB 0xAC 0xAD 0xAE
::
:: Stage 6 Carnival:
..\tools\pce_gfx put tile track2.bin 0x01C24C0 16 10 2 1C24C0.new 0 0 ..\xlate\1A1400.xlate
:: Now, adjust the meta-tiles on the overall map for intro screen, to shift name slightly:
..\tools\patch track2.bin 0x01C360C 0x01 0xAB 0xAC 0xAD 0xAE 0xAF
::
:: Stage 7 City:
..\tools\pce_gfx put tile track2.bin 0x01C7D00 16 6 2 1C7D00.new 0 0 ..\xlate\1A1400.xlate
::
:: Stage 8 Space:
..\tools\pce_gfx put tile track2.bin 0x01CD500 16 8 2 1CD500.new 0 0 ..\xlate\1A1400.xlate
::
::
::Note: These are the names of the levels at the end of the Stage congratulations message
::      very similar to above, but monochrome
::
:: "Complete"
..\tools\pce_gfx put tile track2.bin 0x01D2020 16 7 2 1D2020.new 0 0 ..\xlate\1D2020.xlate
..\tools\pce_gfx put tile track2.bin 0x01D29A0 16 2 2 1D2020.new 56 0 ..\xlate\1D2020.xlate

:: Stage 1 Trails:
..\tools\pce_gfx put tile track2.bin 0x01D2100 16 8 2 1D2100.new 0 0 ..\xlate\1D2020.xlate
..\patch track2.bin 0x1D60BC 0x93 0x93 0x93 0x93
..\patch track2.bin 0x1D60DC 0x93 0x93 0x93 0x93
::
:: Stage 2 Beach:
..\tools\pce_gfx put tile track2.bin 0x01D2400 16 8 2 1D2400.new 0 0 ..\xlate\1D2020.xlate
..\patch track2.bin 0x1D68BC 0x93 0x93 0x93 0x93
..\patch track2.bin 0x1D68DC 0x93 0x93 0x93 0x93
::
:: Stage 3 Arctic:
..\tools\pce_gfx put tile track2.bin 0x01D2500 16 8 2 1D2500.new 0 0 ..\xlate\1D2020.xlate
..\patch track2.bin 0x1D70BC 0x93 0x93 0x93 0x93
..\patch track2.bin 0x1D70DC 0x93 0x93 0x93 0x93
::
:: Stage 4 Cemetery:
..\tools\pce_gfx put tile track2.bin 0x01D2C00 16 1 2 1D2800.new 0 0 ..\xlate\1D2020.xlate
..\tools\pce_gfx put tile track2.bin 0x01D2800 16 6 2 1D2800.new 8 0 ..\xlate\1D2020.xlate
..\tools\pce_gfx put tile track2.bin 0x01D2DE0 16 1 2 1D2800.new 56 0 ..\xlate\1D2020.xlate
..\tools\pce_gfx put tile track2.bin 0x01D31A0 16 1 2 1D2800.new 64 0 ..\xlate\1D2020.xlate
..\tools\pce_gfx put tile track2.bin 0x01D2BE0 16 1 1 1D2800.new 72 0 ..\xlate\1D2020.xlate
..\patch track2.bin 0x1D78B4 0x93 0x60 0x93 0x70
..\patch track2.bin 0x1D78B8 0x6F 0x8D 0x7F 0x9D
..\patch track2.bin 0x1D78BC 0x5F 0x93 0x7D 0x93
..\patch track2.bin 0x1D78DC 0x93 0x93 0x93 0x93
..\patch track2.bin 0x1D7E27 0x2C 0x10 0x11 0x12 0x2D
::
:: Stage 5 Desert:
..\tools\pce_gfx put tile track2.bin 0x01D28C0 16 7 2 1D28C0.new 0 0 ..\xlate\1D2020.xlate
..\patch track2.bin 0x1D80DC 0x93 0x93 0x93 0x93
..\patch track2.bin 0x1D8628 0x13 0x14 0x15 0x2E 0x01
::
:: Stage 6 Carnival:
..\tools\pce_gfx put tile track2.bin 0x01D2C00 16 10 2 1D2C00.new 0 0 ..\xlate\1D2020.xlate
..\patch track2.bin 0x1D88BC 0x93 0x93 0x93 0x93
..\patch track2.bin 0x1D88DC 0x93 0x93 0x93 0x93
::
:: Stage 7 City:
..\tools\pce_gfx put tile track2.bin 0x01D2D40 16 5 2 1D2D40.new 0 0 ..\xlate\1D2020.xlate
..\patch track2.bin 0x1D9080 0x6E 0x93 0x7E 0x93
..\patch track2.bin 0x1D90BC 0x93 0x93 0x93 0x93
..\patch track2.bin 0x1D90DC 0x93 0x93 0x93 0x93
::
:: Stage 8 Space:
..\tools\pce_gfx put tile track2.bin 0x01D30C0 16 7 2 1D30C0.new 0 0 ..\xlate\1D2020.xlate
..\patch track2.bin 0x1D9860 0x8C 0x93 0x9C 0x93
..\patch track2.bin 0x1D98BC 0x93 0x93 0x93 0x93
..\patch track2.bin 0x1D98DC 0x93 0x93 0x93 0x93


::
:::: IN-GAME
::
:: STAGE (top right corner)
::
..\tools\pce_gfx put sprite track2.bin 0x0111300 2 2 1 111300.new 0 0 ..\xlate\113000.xlate

:: Action choices
::
..\tools\pce_gfx put sprite track2.bin 0x0111400 2 2 4 111400.new 0 0 ..\xlate\114000.xlate
::
:: These are the monkey icons
::
..\tools\pce_gfx put sprite track2.bin 0x0151000 2 2 16 151000.new 0 0 ..\xlate\19B800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0152000 2 2 16 152000.new 0 0 ..\xlate\19B800.xlate
..\tools\pce_gfx put sprite track2.bin 0x019B800 2 2 16 19B800.new 0 0 ..\xlate\19B800.xlate
..\tools\pce_gfx put sprite track2.bin 0x019C800 2 2 16 19C800.new 0 0 ..\xlate\19B800.xlate
::
:: 10-yen moneybag
::
..\tools\pce_gfx put sprite track2.bin 0x0153400 2 2 2 153400.new 0 0 ..\xlate\0B6180.xlate
::
:: 1-yen moneybag
::
..\tools\pce_gfx put sprite track2.bin 0x0153B00 2 1 1 153B00.new 0 0 ..\xlate\0B6180.xlate
::
:: GOAL signs for Stages 1 & 2
:: These GOAL signs are the same except for translation key (use 236800 for both since they are identical)
::
..\tools\pce_gfx put tile track2.bin 0x0236800 16 4 4 236800.new 0 0 ..\xlate\236800.xlate
..\tools\pce_gfx put tile track2.bin 0x0241040 16 4 4 236800.new 0 0 ..\xlate\241040.xlate
:: Note: Sign has two additional alternate bottoms which need to be adjusted too
..\tools\pce_gfx put tile track2.bin 0x0236400 16 4 2 236400.new 0 0 ..\xlate\236800.xlate
..\tools\pce_gfx put tile track2.bin 0x0236CC0 16 4 2 236CC0.new 0 0 ..\xlate\236800.xlate
::
:: GOAL signs for Stage 3
::
..\tools\pce_gfx put tile track2.bin 0x024C180 16 4 4 24C180.new 0 0 ..\xlate\24C180.xlate
:: Note: Sign has two additional alternate bottoms which need to be adjusted too
..\tools\pce_gfx put tile track2.bin 0x024B800 16 4 2 24B800.new 0 0 ..\xlate\24C180.xlate
..\tools\pce_gfx put tile track2.bin 0x024C500 16 4 2 24C500.new 0 0 ..\xlate\24C180.xlate
::
:: GOAL signs for Stage 4
::
..\tools\pce_gfx put tile track2.bin 0x0259840 16 4 4 259840.new 0 0 ..\xlate\259840.xlate
:: Note: Sign has two additional alternate bottoms which need to be adjusted too
..\tools\pce_gfx put tile track2.bin 0x02598C0 16 4 2 2598C0.new 0 0 ..\xlate\259840.xlate
..\tools\pce_gfx put tile track2.bin 0x0259D40 16 4 2 259D40.new 0 0 ..\xlate\259840.xlate
::
:: GOAL signs for Stage 5
::
..\tools\pce_gfx put tile track2.bin 0x0267040 16 4 4 267040.new 0 0 ..\xlate\259840.xlate
:: Note: Sign has three additional alternate bottoms which need to be adjusted too
..\tools\pce_gfx put tile track2.bin 0x0266C80 16 4 2 266C80.new 0 0 ..\xlate\259840.xlate
..\tools\pce_gfx put tile track2.bin 0x0266E00 16 4 1 266E00.new 0 0 ..\xlate\259840.xlate
..\tools\pce_gfx put tile track2.bin 0x0266A80 16 4 1 266A80.new 0 0 ..\xlate\259840.xlate
::
:: GOAL signs for Stage 6
::
..\tools\pce_gfx put tile track2.bin 0x0276580 16 4 4 276580.new 0 0 ..\xlate\276580.xlate
::
:: GOAL signs for Stage 7
::
..\tools\pce_gfx put tile track2.bin 0x0284B80 16 4 4 284B80.new 0 0 ..\xlate\284B80.xlate
:: Note: Sign has three additional alternate bottoms which need to be adjusted too
..\tools\pce_gfx put tile track2.bin 0x0283880 16 4 2 283880.new 0 0 ..\xlate\284B80.xlate
..\tools\pce_gfx put tile track2.bin 0x0283F00 16 4 1 283F00.new 0 0 ..\xlate\284B80.xlate
..\tools\pce_gfx put tile track2.bin 0x0284700 16 4 2 284700.new 0 0 ..\xlate\284B80.xlate
::
:: GOAL signs for Stage 8
::
..\tools\pce_gfx put tile track2.bin 0x029A100 16 4 4 29A100.new 0 0 ..\xlate\29A100.xlate
::
::End of level heading
::
..\tools\pce_gfx put tile track2.bin 0x01D4000 16 16 5 1D4000.new 0 0 ..\xlate\1D4000.xlate
::
:: Note: These are discontiguous, but are connected
::
::..\tools\pce_gfx put tile track2.bin 0x01D2980 16 4 2 1D2980.new 0 0 ..\xlate\1D2020.xlate
::
:: End of level money tally yen sign
::
..\tools\pce_gfx put sprite track2.bin 0x11e700 1 1 1 11E700.new 0 0 ..\xlate\11E700.xlate
::
:: GAME OVER
::
..\tools\pce_gfx put tile track2.bin 0x018B020 16 16 12 18B020.new 0 0 ..\xlate\18B020.xlate


::
:::: Purchases at the store:
::
:: Store choices - Buy/Don't Buy
::
..\tools\pce_gfx put sprite track2.bin 0x0166800 2 2 2 166800.new 0 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0167000 2 2 2 166800.new 32 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0167800 2 2 2 166800.new 64 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0168000 2 2 2 166800.new 96 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0166A00 2 2 2 166800.new 128 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0167200 2 2 2 166800.new 160 0 ..\xlate\166800.xlate
..\tools\pce_gfx put sprite track2.bin 0x0167A00 2 2 2 166800.new 192 0 ..\xlate\166800.xlate
::
:: Wallet (contents)
::
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
::
:: Alphabet for conversation with shop owner
::
::  ..\tools\pce_gfx put tile track2.bin 0x01F4000 16 16 14 1F4000.new 0 0 ..\xlate\17C000.xlate


::
:::: Bazaru's house screen heading
::
..\tools\pce_gfx put tile track2.bin 0x01F7000 16 16 4 1F7000.new 0 0 ..\xlate\1F7000.xlate

