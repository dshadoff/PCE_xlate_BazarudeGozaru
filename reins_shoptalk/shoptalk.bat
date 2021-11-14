:::: Title Screen:
::
:: Bazaru de Gozaru no (translated)
::
..\tools\yankbank out track2.bin 0x9000 1 txtblk.bin
pceas -raw -s -l 3 shoptalk.asm
..\tools\yankbank in track2.bin 0x9000 1 shoptalk.pce
