; Bazaru de Gozaru - shop dialogue text
; -------------------------------------

	include	"alphabet.inc"
	.list

	.code
	.bank	0 
	.incbin	"txtblk.bin"

	.bank	0 

	.ORG	$77BF

ptrtbl:

; Pointer table:
; 00 = x-location on line
; 01 = y-location (line ?)
; 02 = related to number of blanks at end (02 above)
; 03 = unclear
; 04 = horizontal position of word-bubble pointer (01 above)
; 05 = unclear
; 06/07 = pointer location ($7902 above)

msgptr01:	; May I help you ?
;	.db	$0A,$0C,$07,$04,$02,$60
	.db	$0A,$0C,$06,$04,$02,$60
	.dw	msg01		; orig $78DF

msgptr02:	; What do you have today ?
;	.db	$03,$0C,$06,$04,$01,$40
	.db	$03,$0C,$0A,$04,$01,$40
	.dw	msg02		; orig $78F1

msgptr03:	; Hmmm...
;	.db	$05,$0C,$04,$04,$01,$20
	.db	$05,$0C,$02,$04,$01,$20
	.dw	msg03		; orig $7902

msgptr04:	; Nice.
;	.db	$06,$0C,$02,$04,$01,$20
	.db	$06,$0C,$01,$04,$01,$20
	.dw	msg04		; orig $790E

msgptr05:	; Very Nice !
	.db	$04,$0C,$04,$04,$01,$20
	.dw	msg05		; orig $7917

msgptr06:	; Would you like to buy it ?
;	.db	$0D,$0C,$03,$04,$02,$20
	.db	$02,$0C,$0B,$04,$02,$20
	.dw	msg06		; orig $7924

msgptr07:	; I don't have enough
;	.db	$03,$0C,$06,$04,$01,$20
	.db	$04,$0C,$08,$04,$01,$20
	.dw	msg07		; orig $792E

msgptr08:	; .....
	.db	$0D,$0C,$03,$04,$02,$20
	.dw	msg08		; orig $793E

msgptr09:	; Another item perhaps ?
;	.db	$0C,$0C,$05,$04,$02,$20
	.db	$03,$0C,$0A,$04,$02,$20
	.dw	msg09		; orig $7949

msgptr10:	; Come again !
;	.db	$0E,$0C,$02,$04,$02,$40
	.db	$0E,$0C,$04,$04,$02,$40
	.dw	msg10		; orig $7956

msgptr11:	; Thank you !
	.db	$0C,$0C,$04,$04,$02,$20
	.dw	msg11		; orig $795F

msgptr12:	; I'll have it delivered.
;	.db	$0A,$0C,$08,$04,$02,$20
	.db	$03,$0C,$0A,$04,$02,$20
	.dw	msg12		; orig $796B

msgptr13:	; That's an Orange Crate.
;	.db	$0C,$0C,$05,$04,$02,$20
	.db	$05,$0C,$0A,$04,$02,$20
	.dw	msg13		; orig $797E

msgptr14:	; This is a Basic Table.
;	.db	$0C,$0C,$05,$04,$02,$20
	.db	$05,$0C,$09,$04,$02,$20
	.dw	msg14		; orig $798C

msgptr15:	; How about a Fancy Table ?
;	.db	$0C,$0C,$05,$04,$02,$20
	.db	$04,$0C,$0B,$04,$02,$20
	.dw	msg15		; orig $799A

msgptr16:	; That's a Futon.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$07,$0C,$06,$04,$02,$20
	.dw	msg16		; orig $79A7

msgptr17:	; This is a Hammock.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$06,$0C,$07,$04,$02,$20
	.dw	msg17		; orig $79B3

msgptr18:	; How about a Bed ?
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$06,$0C,$07,$04,$02,$20
	.dw	msg18		; orig $79C1

msgptr19:	; That's a Snowman.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$06,$0C,$07,$04,$02,$20
	.dw	msg19		; orig $79CD

msgptr20:	; This is a Sunflower.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$06,$0C,$09,$04,$02,$20
	.dw	msg20		; orig $79DB

msgptr21:	; How about a Tanuki Statue ?
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$02,$0C,$0C,$04,$02,$20
	.dw	msg21		; orig $79E8

msgptr22:	; That's a Lantern.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$06,$0C,$07,$04,$02,$20
	.dw	msg22		; orig $79F9

msgptr23:	; This is a Ceiling Light.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$03,$0C,$0A,$04,$02,$20
	.dw	msg23		; orig $7A07

msgptr24:	; How about a Chandelier ?
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$03,$0C,$0A,$04,$02,$20
	.dw	msg24		; orig $7A16

msgptr25:	; Those are Dog Curtains.
;	.db	$0A,$0C,$08,$04,$02,$20
	.db	$03,$0C,$0A,$04,$02,$20
	.dw	msg25		; orig $7A25

msgptr26:	; This is a Noren.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$06,$0C,$06,$04,$02,$20
	.dw	msg26		; orig $7A39

msgptr27:	; How about Banana Curtains ?
;	.db	$0A,$0C,$08,$04,$02,$20
	.db	$02,$0C,$0C,$04,$02,$20
	.dw	msg27		; orig $7A45

msgptr28:	; That's a Straw Mat.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$06,$0C,$08,$04,$02,$20
	.dw	msg28		; orig $7A5A

msgptr29:	; This is a Cushion.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$06,$0C,$07,$04,$02,$20
	.dw	msg29		; orig $7A65

msgptr30:	; How about a Chair ?
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$06,$0C,$08,$04,$02,$20
	.dw	msg30		; orig $7A72

msgptr31:	; That's a Portable Stereo.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$03,$0C,$0B,$04,$02,$20
	.dw	msg31		; orig $7A7D

msgptr32:	; This is a Television.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$05,$0C,$09,$04,$02,$20
	.dw	msg32		; orig $7A8A

msgptr33:	; How about a Computer ?
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$03,$0C,$0A,$04,$02,$20
	.dw	msg33		; orig $7A96

msgptr34:	; That's a Tin-Can Phone.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$03,$0C,$0A,$04,$02,$20
	.dw	msg34		; orig $7AA3

msgptr35:	; This is a Rotary Phone.
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$03,$0C,$0A,$04,$02,$20
	.dw	msg35		; orig $7AB1

msgptr36:	; How about a Cellphone ?
;	.db	$0C,$0C,$07,$04,$02,$20
	.db	$03,$0C,$0A,$04,$02,$20
	.dw	msg36		; orig $7ABF



; Now for the messages - space is good until $7ADF
; After that, if more space is needed, start at $7C50

	.org	$78DF
msg01:	; irasshaimase kaimonodesuka ?
	; May I help you ?
;	.db	$01,$43,$8D,$0B,$8A,$01,$2E,$0D
;	.db	$4E,$05,$01,$42,$28,$6D,$0C,$05
;	.db	$8E
;	.db	$FF
	.db	cM,lA,lY,spc,cI,spc,lH,lE
	.db	lL,lP,spc,lY,lO,lU,spc
	.db	qust
	.db	$FF

msg02:	; Nanika utte hoshii degozaru
	; What do you have today ?
;	.db	$24,$25,$05,$4E,$02,$8D,$22,$4E
;	.db	$2D,$0B,$01,$6D,$64,$65,$89,$45
;	.db	$FF
	.db	cW,lH,lA,lT,spc,lD,lO
	.db	spc,lY,lO,lU,spc,lH,lA,lV,lE,spc
	.db	lT,lO,lD,lA,lY,spc
	.db	qust
	.db	$FF

msg03:	; Hoshikunai de gozaru
	; Hmmm...
;	.db	$2D,$0B,$07,$24,$01,$4F,$6D,$64
;	.db	$65,$89,$45
;	.db	$FF
	.db	cH,lM,lM,lM,perid,perid,perid
	.db	$FF

msg04:	; Hoshii degozaru
	; Nice.
;	.db	$2D,$0B,$01,$6D,$64,$65,$89,$45
;	.db	$FF
	.db	cN,lI,lC,lE,perid
	.db	$FF

msg05:	; sugokuhoshii! degozaru
	; Very Nice !
;	.db	$0C,$64,$07,$2D,$0B,$01,$8F,$6D
;	.db	$64,$65,$89,$45
;	.db	$FF
	.db	cV,lE,lR,lY,spc,cN,lI,lC,lE,spc,excl
	.db	$FF

msg06:	; kordeiidesuka?
	; Would you like to buy it ?
;	.db	$09,$46,$6D,$01,$01,$6D,$0C,$05
;	.db	$8E
;	.db	$FF
	.db	cW,lO,lU,lL,lD,spc,lY,lO,lU,spc
	.db	lL,lI,lK,lE,spc,lT,lO,spc
	.db	lB,lU,lY,spc,lI,lT,spc
	.db	qust
	.db	$FF

msg07:	; tarinai! zannendegozaru
	; I don't have enough.
;	.db	$0F,$44,$24,$01,$8F,$4E,$65,$4D
;	.db	$27,$4D,$6D,$64,$65,$89,$45
;	.db	$FF
	.db	cI,spc,lD,lO,lN,apost,lT,spc
	.db	lH,lA,lV,lE,spc,lE,lN,lO,lU,lG,lH,perid
;	.db	lM,lO,lN,lE,lY
	.db	$FF

msg08:	; ....
;	.db	$4F,$4F,$4F,$4F,$4F,$4F,$4F,$4F
;	.db	$4F,$4F
;	.db	$FF
	.db	perid,perid,perid,perid,perid,perid,perid,perid
	.db	perid,perid
	.db	$FF

msg09:	; kaimonowotsudzukemasuka?
	; Another item perhaps ?
;	.db	$05,$01,$42,$28,$4C,$21,$6C,$08
;	.db	$2E,$0C,$05,$8E
;	.db	$FF
	.db	cA,lN,lO,lT,lH,lE,lR,spc
	.db	lI,lT,lE,lM,spc
	.db	lP,lE,lR,lH,lA,lP,lS
	.db	spc,qust
	.db	$FF

msg10:	; matakitekudasai
	; Come again !
;	.db	$2E,$0F,$06,$22,$07,$6A,$0A,$01
;	.db	$FF
	.db	cC,lO,lM,lE,spc
	.db	lA,lG,lA,lI,lN,spc,excl
	.db	$FF

msg11:	; arigatougozaimashita
	; Thank You !
;	.db	$00,$44,$60,$23,$02,$64,$65,$01
;	.db	$2E,$0B,$0F
;	.db	$FF
	.db	cT,lH,lA,lN,lK,spc
	.db	cY,lO,lU,spc,excl
	.db	$FF

msg12:	; shinamonohaieni okutteokimasune
	; I'll have it delivered.
;	.db	$0B,$24,$42,$28,$29,$01,$03,$25
;	.db	$4E,$04,$07,$8D,$22,$04,$06,$2E
;	.db	$0C,$27
;	.db	$FF
	.db	cI,apost,lL,lL,spc,lH,lA,lV,lE,spc
	.db	lI,lT,spc,lD,lE,lL,lI,lV,lE,lR,lE,lD
	.db	perid
	.db	$FF

msg13:	; mikanbakoha douesuka?
	; That's an orange crate.
;	.db	$2F,$05,$4D,$6F,$09,$29,$4E,$6E
;	.db	$02,$6D,$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lA,lT,apost,lS,spc,lA,lN,spc
	.db	cO,lR,lA,lN,lG,lE,spc
	.db	cC,lR,lA,lT,lE
	.db	perid
	.db	$FF

msg14:	; chabudaiha doudesuka?
	; This is a Basic table.
;	.db	$20,$8A,$81,$6A,$01,$29,$4E,$6E
;	.db	$02,$6D,$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lI,lS,spc,lI,lS,spc,lA,spc
	.db	cB,lA,lS,lI,lC,spc
	.db	cT,lA,lB,lL,lE
	.db	perid
	.db	$FF

msg15:	; te-buruha doudeska?
	; How about a Fancy table ?
;	.db	$22,$89,$81,$45,$29,$4E,$6E,$02
;	.db	$6D,$0C,$05,$8E
;	.db	$FF
	.db	cH,lO,lW,spc,lA,lB,lO,lU,lT,spc,lA,spc
	.db	cF,lA,lN,lC,lY,spc
	.db	cT,lA,lB,lL,lE
	.db	spc,qust
	.db	$FF

msg16:	; futonha doudesuka?
	; That's a Futon.
;	.db	$2B,$23,$4D,$29,$4E,$6E,$02,$6D
;	.db	$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lA,lT,apost,lS,spc,lA,spc
	.db	cF,lU,lT,lO,lN
	.db	perid
	.db	$FF

msg17:	; hanmokkuha doudesuka?
	; This is a Hammock.
;	.db	$29,$4D,$42,$8D,$07,$29,$4E,$6E
;	.db	$02,$6D,$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lI,lS,spc,lI,lS,spc,lA,spc
	.db	cH,lA,lM,lM,lO,lC,lK
	.db	perid
	.db	$FF

msg18:	; beddoha doudesuka?
	; How about a bed ?
;	.db	$82,$8D,$6E,$29,$4E,$6E,$02,$6D
;	.db	$0C,$05,$8E
;	.db	$FF
	.db	cH,lO,lW,spc,lA,lB,lO,lU,lT,spc,lA,spc
	.db	cB,lE,lD
	.db	spc,qust
	.db	$FF

msg19:	; yukidarumaha doudesuka?
	; That's a Snowman.
;	.db	$49,$06,$6A,$45,$2E,$29,$4E,$6E
;	.db	$02,$6D,$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lA,lT,apost,lS,spc,lA,spc
	.db	cS,lN,lO,lW,lM,lA,lN
	.db	perid
	.db	$FF

msg20:	; himawariha doudesuka?
	; This is a Sunflower.
;	.db	$2A,$2E,$4B,$44,$29,$4E,$6E,$02
;	.db	$6D,$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lI,lS,spc,lI,lS,spc,lA,spc
	.db	cS,lU,lN,lF,lL,lO,lW,lE,lR
	.db	perid
	.db	$FF

msg21:	; tanukinookimonoha doudesuka
	; How about a Tanuki Statue ?
;	.db	$0F,$26,$06,$28,$04,$06,$42,$28
;	.db	$29,$4E,$6E,$02,$6D,$0C,$05,$8E
;	.db	$FF
	.db	cH,lO,lW,spc,lA,lB,lO,lU,lT,spc,lA,spc
	.db	cT,lA,lN,lU,lK,lI,spc
	.db	cS,lT,lA,lT,lU,lE
	.db	spc,qust
	.db	$FF

msg22:	; chouchinha doudesuka?
	; That's a Lantern.
;	.db	$20,$8C,$02,$20,$4D,$29,$4E,$6E
;	.db	$02,$6D,$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lA,lT,apost,lS,spc,lA,spc
	.db	cL,lA,lN,lT,lE,lR,lN
	.db	perid
	.db	$FF

msg23:	; keikoutouha doudesuka?
	; This is a Ceiling Light.
;	.db	$08,$01,$09,$02,$23,$02,$29,$4E
;	.db	$6E,$02,$6D,$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lI,lS,spc,lI,lS,spc,lA,spc
	.db	cC,lE,lI,lL,lI,lN,lG,spc
	.db	cL,lI,lG,lH,lT
	.db	perid
	.db	$FF

msg24:	; shanderiaha doudesuka?
	; How about a Chandelier ?
;	.db	$0B,$8A,$4D,$6D,$44,$00,$29,$4E
;	.db	$6E,$02,$6D,$0C,$05,$8E
;	.db	$FF
	.db	cH,lO,lW,spc,lA,lB,lO,lU,lT,spc,lA,spc
	.db	cC,lH,lA,lN,lD,lE,lL,lI,lE,lR
	.db	spc,qust
	.db	$FF

; move some messages into the empty space at the end
; (just in case)

	.ORG	$7C50

msg25:	; burunonoyounoka-tenha doudesuka?
	; Those are Dog Curtains.
;	.db	$81,$45,$28,$42,$4A,$02,$28,$05
;	.db	$89,$22,$4D,$29,$4E,$6E,$02,$6D
;	.db	$0C,$05,$8E
	.db	cT,lH,lO,lS,lE,spc,lA,lR,lE,spc
	.db	cD,lO,lG,spc
	.db	cC,lU,lR,lT,lA,lI,lN,lS
	.db	perid
	.db	$FF

msg26:	; norenha doudesuka
	; This is a Noren.
;	.db	$28,$46,$4D,$29,$4E,$6E,$02,$6D
;	.db	$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lI,lS,spc,lI,lS,spc,lA,spc
	.db	cN,lO,lR,lE,lN
	.db	perid
	.db	$FF

msg27:	; banananomoyounoka-tenha doudesuka
	; How about Banana Curtains ?
;	.db	$6F,$24,$24,$28,$42,$4A,$02,$28
;	.db	$05,$89,$22,$4D,$29,$4E,$6E,$02
;	.db	$6D,$0C,$05,$8E
	.db	cH,lO,lW,spc,lA,lB,lO,lU,lT,spc
	.db	cB,lA,lN,lA,lN,lA,spc
	.db	cC,lU,lR,lT,lA,lI,lN,lS
	.db	spc,qust
	.db	$FF

msg28:	; gozaha doudesuka?
	; That's a Straw Mat.
;	.db	$64,$65,$29,$4E,$6E,$02,$6D,$0C
;	.db	$05,$8E
;	.db	$FF
	.db	cT,lH,lA,lT,apost,lS,spc,lA,spc
	.db	cS,lT,lR,lA,lW,spc
	.db	cM,lA,lT
	.db	perid
	.db	$FF

msg29:	; zabutonha doudesuka
	; This is a Cushion.
;	.db	$65,$81,$23,$4D,$29,$4E,$6E,$02
;	.db	$6D,$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lI,lS,spc,lI,lS,spc,lA,spc
	.db	cC,lU,lS,lH,lI,lO,lN
	.db	perid
	.db	$FF

msg30:	; isuha doudesuka
	; How about a Chair ?
;	.db	$01,$0C,$29,$4E,$6E,$02,$6D,$0C
;	.db	$05,$8E
;	.db	$FF
	.db	cH,lO,lW,spc,lA,lB,lO,lU,lT,spc,lA,spc
	.db	cC,lH,lA,lI,lR
	.db	spc,qust
	.db	$FF

msg31:	; rajikaseha doudesuka
	; That's a Portable Stereo.
;	.db	$43,$66,$05,$0D,$29,$4E,$6E,$02
;	.db	$6D,$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lA,lT,apost,lS,spc,lA,spc
	.db	cP,lO,lR,lT,lA,lB,lL,lE
	.db	spc,cS,lT,lE,lR,lE,lO
	.db	perid
	.db	$FF

msg32:	; terebiha doudesuka
	; This is a Television.
;	.db	$22,$46,$80,$29,$4E,$6E,$02,$6D
;	.db	$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lI,lS,spc,lI,lS,spc,lA,spc
	.db	cT,lE,lL,lE,lV,lI,lS,lI,lO,lN
	.db	perid
	.db	$FF

msg33:	; pasokonha doudesuka?
	; How about a Computer ?
;	.db	$84,$0E,$09,$4D,$29,$4E,$6E,$02
;	.db	$6D,$0C,$05,$8E
;	.db	$FF
	.db	cH,lO,lW,spc,lA,lB,lO,lU,lT,spc,lA,spc
	.db	cC,lO,lM,lP,lU,lT,lE,lR
	.db	spc,qust
	.db	$FF

msg34:	; itodenha doudesuka?
	; That's a Tin-Can Phone.
;	.db	$01,$23,$6D,$4D,$4B,$29,$4E,$6E
;	.db	$02,$6D,$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lA,lT,apost,lS,spc,lA,spc
	.db	cT,lI,lN,dash,cC,lA,lN,spc
	.db	cP,lH,lO,lN,lE
	.db	perid
	.db	$FF

msg35:	; kurodenha doudesuka?
	; This is a Rotary Phone.
;	.db	$07,$47,$6D,$4D,$4B,$29,$4E,$6E
;	.db	$02,$6D,$0C,$05,$8E
;	.db	$FF
	.db	cT,lH,lI,lS,spc,lI,lS,spc,lA,spc
	.db	cR,lO,lT,lA,lR,lY,spc
	.db	cP,lH,lO,lN,lE
	.db	perid
	.db	$FF

msg36:	; keitaidenwaha doudesuka?
	; How about a Cellphone ?
;	.db	$08,$01,$0F,$01,$6D,$4D,$4B,$29
;	.db	$4E,$6E,$02,$6D,$0C,$05,$8E
;	.db	$FF
	.db	cH,lO,lW,spc,lA,lB,lO,lU,lT,spc,lA,spc
	.db	cC,lE,lL,lL,lP,lH,lO,lN,lE
	.db	spc,qust
	.db	$FF

