# Technical Notes:

This game had a few unique aspects which may need some explanation.

## Lack of "Wrong System Card" Screen

In fact, Bazaru de Gozaru **DOES** have a "Wrong System Card" screen, but due to
(one or more) bugs, it is not displayed.

In the boot routine, it obtains the version number and performs a comparison, but when
acting upon this information, it proceeds to jump to a function which returns... to an
address which isn't on the stack, so it crashes.  This was clearly a code path which
wasn't adequately tested, so I decided not to spend any further tie fixing all the
possible bugs along the way.  If you are able to fix this bug, I would be happy to
work with you to correct the Wrong System Card screen.

## Encoding of Background Graphics meta-tiles

I found during play that most of the text screens (except for the shop) were encoded in
a particular way:
 - VRAM contained all of the BG graphics from $1000 to $2EFF
 - the SAT was located at $2F00
 - Sprite graphics were generally from $3000-$7fff

There were two tables in memory, which associated individual background graphcis into
groups of 4 "metatiles", and a third table which created the background screen by
laying out the "metatiles" into a sequential top-left to bottom-right pattern.

### Metatiles

In one bank of RAM, metatiles would be defined:
Offset $0004-$0203 : metatiles $00-$7F, which relate to characters in VRAM from $1000-$1FFF
Offset $0204-$0403 : metatiles $80-$FF, which relate to characters in VRAM from $2000-$2FFF

Each metatile consists of 4 bytes, representing characters in the following order:
```
00  01
02  03
```

So, a 16x16 metatile could be created from 4 characters in this way.

Later in the bank, at Offset $0584, the overall display would be defined out of metatiles:
 - 16 metatiles across
 - 16 metatiles down

In this way, a 32x32 character screen would be defined.

This pattern is repeated throughout the game:
 - Most of the Help screens, including the icon descriptions
 - The credits at the end of the game

Because of the way that these are designed, I created programs to generate the actual
patch scripts (such as "reinsert_credits_01.bat")


## Encoding of Sprite Groups

Sprites are built in hierarchies... I didn't bother to look at the whole top-to-bottom
set; I was only concerned with how the sprites could be altered.

What I found was... in the $ACxx range of memory, there were sprite-group definitions.
For example, "Start de Gozaru" was two sprite groups - "Start de" and "Gozaru".

These sprite group definitions consisted of:
 - a 2-byte "number of sprites in group"  (for example, 02 00 = 2)
 - a list of triplets defining the attirbutes of an individual sprite:

These were in the form:
  pp xy aa (3 hexadecimal bytes)

 - 'pp' = reference to the sprite pattern:
   - The VRAM base address is based on some attribute of the parent, and will decode to $3000 or $4000 for example.
   - The 'pp' value is multiplied by 4 to obtain the middle two digits of the sprite address
   - For example, for a sprite pattern at $4280
     - the $4000 portion would derive from the parent
     - The 'pp' value would be 0x0A

 - 'xy' = relative position of sprite, compared to the base position (which comes from the parent somehow)
   - The first digit represents how many 16-pixel units this sprite is offset horizontally from that base
     - Value '0' is obvious; 1, 2, 3, etc. indicate jumps of 16 pixels each, to the right
     - When the high bit is set (values '9'-'F'), the bottom three bits are used to count how many 16-pixel steps __to the left__ that it is.  Example, '9' is one 16-pix jump to the left, 'A' is two steps, etc.
   - The second digit represents how many 16-pixel units this sprite is offset vertically from that base (positive values are down, negative values are up)

 - 'aa' = controls the remaining sprite attributes, primarily X-size and Y-size. The key here is that '00' = 16x16, 0x0C = 32x32, etc.  I didn't need to change these much, so I didn't dig too much.


