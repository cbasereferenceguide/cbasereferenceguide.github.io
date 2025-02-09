/*

R     A     I      N      B      O     W
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
P    R     O     T     O     C    O    L


        RAINBOW protocol is  a
        state-of-the-art modem
        transfer  program  for
        the Commodore 64.

        All files  can be sent
        across the modem, even
        relative files.

        RAINBOW is intelligent
        and easy to add to any
        of your programs.


RAINBOW RESIDES: $c000 - $c941
                 49152 - 51521

SETTING MEMORY LOCATIONS:

DISPLAY.SWITCH..49197 - $c02d
DEVICE        ..49198 - $c02e
BLOCK.SIZE    ..49199 - $c02f
DRIVE         ..49200 - $c030
COMMUNICATION ..49196 - $c02c

OPTIONAL QUERY LOCATIONS:

FILE TYPE     ..49193 - $c029
LENGTH        ..49194 - 49195 - $c02a - $c02b


ACTIVATING LOCATIONS:

TRANSMIT      ..49152 - $c000
RECEIVE       ..49155 - $c003


DISPLAY SWITCH: 49197

Poking  a 1 in this location  will turn
on  the screen display.   This mode  is
used  in terminal  programs  where  the
progress of  the transfer  needs  to be
monitored.   If  set   to  0 only .disk
errors  will be  displayed.  This  mode
is used usually in a BBS program.

DEVICE SELECT: 49198

The  number  of the disk  drive  device
must be  poked into this location.  The
number must  be between 8 and 11 and in
decimal (not ASCII).

BLOCK.SIZE: 49199

The number  of bytes  to send per  each
iteration of the transfer is poked into
this location.  This  is only necessary
when  transmitting.   Receiving adjusts
automatically.   Block  size  should be
between 30 and 255.

DRIVE: 49200

This  location is  used  to select  the
drive  number  on  a  dual  disk  drive
system.  It should  be  poked  with  an
ASCII 0 or an ASCII 1, dec 48 or 49.


COMMUNICATION: 49196

RAINBOW is intelligent enough to report
several   different   errors  after   a
transfer.  The  number returned in this
location has the following meanings:

0)..Means no error,  transfer complete.
1)..No  response  from other  computer.
2)..There   was  a  local  disk  error.
3)..If    transmiting,    this    error
    indicates  a  FILE NOT FOUND error.
    If receiving, indicates a DISK FULL
    error.
4)..Other   computer   sent   a  CANCEL
    request.
5)..Multiple  attempts to send a  block
    failed;    transmission   problems.
6)..Operator manualy canceled.  This is
    done  by  pressing   the  Commodore
    logo  key  in  the lower  left hand
    corner of the keyboard.

ACTIVATION: 49152 and 49155

RAINBOW  is   very   automatic.   After
setting  block  size,  drive and device
put  the   file  name  to  transmit  or
receive  in  the  BASIC  variable  NM$.
To  transmit,  SYS 49152.   To  receive
SYS 49155.  RAINBOW  will  do all  file
handling.   You do not  need to specify
file  type,  length  or  even  open the
file  first,   like   some   protocols.

NOTE:  RS-232  channel   must  be  open
before activating RAINBOW.
e.x.: open 5,2,0,cH(6).

REMEMBER:  Block size need only  be set
when transmitting.  Receiver will auto-
matically  adjust  to the  proper block
size.


SPECIAL INTERNAL.ROUTINE:

A  DIRECTORY  look  up  routine  can be
called from BASIC:

1] Put file name in NM$

2] SYS 49158 - $c006

3] Filetype returned in 49193 in ASCII - $c029

4] Length returned in 49194 -49195  $c02a lo-byte
                                    $c02b hi-byte

5] Error returned in 49196 - $c02c:
   1) OKAY
   2) Disk error
   3) File not found.

Speed up facts:

RAINBOW uses two different speed up
techniques.:

1]  All  rs-232 hold-off delays are set
    set to a minimum.  Both transmiting
    and  receiving  drives will  run at
    the same time.

2]  A block is divided into three parts
    If  one  part  is  wrong, only  the
    necessary portion is re-sent.

RAINBOW PROTOCOL was written by:

David Whatley & Mike Dabbs, founders:

        DEEP PAN software co.

If  you  find  RAINBOW PROTOCOL  useful
and  wish  to  send  a  donation of  $5

The address is:



          DEEP PAN SOFTWARE
          c/o David Whatley
          #3 Fairway ct.
          Florissant MO
.                 63033

LICENSE TO SOFTWARE AUTHORS:

RAINBOW  PROTOCOL  is  public  domain.
Any  person   wishing  to  use  RAINBOW
PROTOCOL   in  their  own   program  or
programs,  for  sale or not, is granted
permission so long as credit is clearly
given   to  the   authors   of  RAINBOW
PROTOCOL in the appropriate sections of
code.

DEEP PAN SOFTWARE  is  to  be  informed
prior to  releasing  a software package
containing   RAINBOW   PROTOCOL   code.
No royalties or charge of any kind will
be incurred.

RAINBOW PROTOCOL  and it's machine code
are  copyrighted  by  Deep Pan Software
company,   all  rights  are   reserved.

//----------------------------------------------------------------------------------
This is the modified Version of Rainbow
Protocol to be useable with C*BASE BBS
and the Terminal Program c/term that
comes with Larry modded C*BASE.

Variable nm$ is no longer used. Instead
the Filename is given by the BBS in
Variable p$.


Version: 2024-02-08
KickAssembler
//----------------------------------------------------------------------------------
 Rainbow Transmission Session
SENDER
                                        RECEIVER
                                        [GOO]
                                        83
[SOH]
89
                                        [ACK]
                                        81
Block #0
<blk#> <255-blk#> <blk-size> <255-blk-size> <01> <Filesizelo> <Filesizehi> <Filetype> <REL flag?> <EOD> <chksum> <255-chksum>
00 FF 05 FA 01 35 00 50 00 91 86 79
                                        [ACK]
                                        81
[SOH]
89
                                        [ACK]
                                        81
Block #1
<blk#> <255-blk#> <blk-size> <255-blk-size> Data[blk-size] <EOD> <chksum> <255-chksum>
01 FE FF 00 .... 91 ..
                                        [ACK]
                                        81
[SOH]
89
Block #2 etc.
                                        [ACK]
                                        81
[EOT]
a1
                                        [ACK]
                                        81
*/
.cpu _6502

.var CAN    = $c1       // "abort" code
.var ACK    = $81       // good ACKnowledge code
.var NAK    = $85       // Negative AcKnowledge
.var EOT    = $a1       // End of Transmission code
.var EOD    = $91       // End of Datablock
.var SOH    = $89       // Start of Header Code
.var GOO    = $83       // "go" code
.var buffer = $0400     // old adress _c061

.var chkin  = $ffc6
.var chkout = $ffc9
.var clrchn = $ffcc
.var chrin  = $ffcf
.var chrout = $ffd2
.var getin  = $ffe4
.var plot   = $fff0
.var setlfs = $ffba
.var setnam = $ffbd
.var open   = $ffc0
.var close  = $ffc3
.var readst = $ffb7


* = $b900 "RAINBOW"
//Zeropage Adresses used:
// $f7          - Ringbuffer
// $14 - $15    - result of Diskblocks from variable bk
// $45 - $4a    - Variable name and location in RAM p$ + bk
// $a2 - $a0    - JiffyClock


// these adresses are used by c-term and c-bbs
// so keep them intact
// 49144 $bff8: 0 on XModem(1K) / 255 on Punter Blocksize
// 49145 $bff9: set by BBS Y-Modem Batch Transfer Flag
// 49146 $bffa: chop padding flag used on XY-Modem
// 49147 $bffb: Flag for Filetype 01 PRG / 02 SEQ / No USR or REL Files in BBS!
// Filename is in BBS variable p$ incl. ",p" or ",s" when sending
// Filename is in BBS variable p$ without ",p" or ",s" when receiving

//switched send and receive to match Jumptable of C*BASE Protocols 
prot2:              jmp receive2    // recv $b900
prot4:              jmp send2       // send $b903
prot1:              jsr inirecv     // init receive $b906
prot3:              lda #$00        // init send $b909
                    sta $0200
                    rts

//"COPYRIGHT 1985 DEEP PAN SOFTWARE"
//drive# prefix to Filename
_c030:  .byte $43, $4f  // drive# "0:" not used

//Filename Buffer 16 chars + suffix like ,p,w
fnbuf:  .byte $50, $59, $52, $49, $47, $48, $54, $20
        .byte $31, $39, $38, $35, $20, $44, $45, $45
        .byte $50, $20, $50, $41, $4e, $20, $53, $4f

_c029:  .byte $46       // Filetype. Info from and to _c064
_c02a:  .word $5457     // File length lo / hi byte. Info from and to _c062 - _c062+1 + _c04b - _c04b+1
_c02c:  .byte $41       // communication code storage
_c02d:  .byte $52       // display switch not used anymore
_b92e:  .byte $45       // !! poked here by BBS / Term 47406,0 /,1 PRG /SEQ only used in !! **Keep this Adress intact**
                        // old X-Modem Protocol as Translate ASCII -> PETSCII Switch
// !! called from ML2.o ACTPROT ! Must be at $b92f ! **Keep this Adress intact**
_b92f:              rts

_c02f:  .byte $ff       // max. Blocksize between 30 and 255
_c04b:  .word $ffff     // free blocks on disk ?!
_c04d:  .byte $00       // Filename length in variable p$
_c04e:  .byte $00       // received char from modem
_c04f:  .byte $00       // switch 0 / 1 Buffer empty yes / no
_c050:  .byte $00       // REL File indicator ? 0=no REL File. Info from and to _c065
_c051:  .byte $00       // ST storage
_c052:  .byte $00       // Textcolor for Screen Messages
_c053:  .byte $00       // transferblock size
_c054:  .byte $00       // signal to send to modem
_c055:  .byte $00       // char for screen output
_c056:  .byte $00       // expected signal
_c057:  .byte $00       // block#
_c058:  .byte $00       // temp Bufferpointer ?
_c059:  .byte $00       // record# lo REL File
_c05a:  .byte $00       // record# hi REL File
_c05b:  .byte $00       // current block#
_c05c:  .byte $00       // last block#
_c05d:  .byte $00       // additive checksum result
_c05e:  .byte $f1       // retry counter1
_c05f:  .byte $00       // retry counter2


//buffer
//buffer is also used for DIR look up. Each used Sector of Track 18
//will be read (until Filename from nm$ is found) and data stored
//from _c061 to _c160 = 255 Bytes = 1 Disk Sector
// now at $0400
/*
_c061:  .byte $00
_c062:  .word $0000
_c064:  .byte $00
_c065:  .byte $00, $00, $00, $00, $00, $00, $00, $00
......
*/
//Floppy Errorchannel Output Buffer
_c161:  .byte $00, $00, $00, $00, $00, $00, $00, $00
        .byte $00, $00, $00, $00, $00, $00, $00, $00
        .byte $00, $00, $00, $00, $00, $00, $00, $00
        .byte $00, $00, $00, $00, $00, $00, $00, $00
        .byte $00, $00, $00, $00, $00, $00, $00, $00

_c189:  .byte $5f       // temp char storage

//_c18a:  .byte $85       // temp display switch

//Filetypes   "d", "p", "s", "u", "l"
_c18b:  .byte $44, $50, $53, $55, $4c

//temp stack save
_tmpstk:  .byte $00

//----------------------------------------------------------------------------------
//send
// send need this to be set prior sending file:
// Block size _c02f -> $bff8
// Device# _c02e
// Drive# _c030
// Filename in variable p$
//   _c0 60 61 62         63         64                         65
//block: 01 01 filesizelo filesizehi filetype (50 = "P" -> PRG) filename max. 16 chars (a0 padding) 
send2:              tsx             // save 
                    stx _tmpstk     // stack
                    jsr _c6ed       // init stuff ?! Scan Track 18 for Fileinfo
                    lda #$3c        // init
                    sta timeout     // timeout
                    lda #$3e        // ">"
                    sta _c055
                    jsr dash        // print on Transfer Screen
                    ldy #$00        // init
                    sty goodblks
                    sty goodblks+1
                    sty badblks
                    sty badblks+1
                    sty _c05a       // record# hi
                    sty _c05b       // block#
                    sty _c051       // ST storeage
                    iny             // init 1
                    sty _c059       // record# lo
//make block#0
                    sty buffer      // _c061
                    lda #$05        // init 5 (bytes) -> _c061: {<$01> <filelenlo> <filelenhi> <filetyp> <RELfileflag>}
                    sta _c053       // transferblock size for current block
                    lda _c02a       // Filelength lo
                    sta buffer+1    //_c062
                    lda _c02a+1     // Filelength hi
                    sta buffer+2    //_c062+1
                    lda _c029       // Filetype
                    sta buffer+3    //_c064
                    lda _c050       // REL File or not ?
                    sta buffer+4    //_c065

                    lda #$dd        // 22 seconds ?!
                    sta _c05f       // timer ?
                    jsr chksum      // do checksum ! 5 chars set in _c053 (buffer, buffer+1, buffer+2, buffer+3, buffer+4). result in _c05d
                    jmp _c23a       // send Block#0

//----------------------------------------------------------------------------------
//send block
// <SOH> <blk#> <255-blk#> <blk-size> <255-blk-size> Data[blk-size] <EOD> <chksum> <255-chksum>
_c1ee:              lda #SOH        // $89
                    jsr _c621       // char to Modem
                    jsr _c638       // timeout check ?!                             :
                    beq _c208       // returned good / got ACK
                    inc _c05e       // timeout, +1 retry
                    bne _c1ee       // loop if <14 retries
                    lda #$01        // no response from other computer              :
                    jmp exit1

_c208:              lda #$f1        // init
                    sta _c05e       // retry counter
                    lda _c05b       // block#?
                    jsr _c5e8       // send to modem + eor $ff to modem             :
                    lda _c053       // transferblock size
                    jsr _c5e8       // send to modem + eor $ff to modem
                    ldy #$00
_c21b:              lda buffer,y    // send buffer _c061                            :
                    jsr _c621       // to modem
                    iny
                    cpy _c053       // transferblock size reached ?
                    bne _c21b       // continue buffer send                         :

_c227:              lda #EOD        // signal $91 Data Block done ?!
                    jsr _c621       // to modem
                    jsr chksum      // do checksum                                  :
                    lda _c05d       // additive checksum result
                    jsr _c5e8       // send to modem + eor $ff to modem
//                                                                                  *

                    lda #$f1        // init ?!
                    sta _c05e       // retry counter

_c23a:              jsr _c638       // get signal from receiver, Jiffyclock and send block?!
                    beq _c249       // no error or timeout
                    inc _c05e       // +1 retry
                    bne _c23a       // max. 14 retrys reached ?
                    lda #$01        // yes, no response from other computer
                    jmp exit1       // store in _c02c ...

_c249:              lda _c04e       // char from modem
                    cmp #ACK        // handshaking signal ?! ACK ?!
                    bne _c253       // no
                    jmp _c27f       // yes, ??

_c253:              cmp #NAK        // got signal $85 NAK?
                    bne _c25a
                    jsr incbad      // bad block
                    jmp _c227       // yes, answer with $91 EOD signal ?!

_c25a:              cmp #CAN        // abort code from other computer ?
                    beq _c275       // yes
                    cmp #GOO        // "go" signal $83 ?
                    beq _c265       // yes
                    jmp _c23a       // something else, loop

// we got a GO, receiver expects File from sender
_c265:              inc _c05f       // retry counter2
                    beq _c27a       // >255 -> 0
                    jmp _c1ee       // start send block routine

_c275:              lda #$04        // errorcode #4 other Computer send abort
                    jmp _c4ed

_c27a:              lda #$05        // failed to send Block after multiple retrys
                    jmp exit1

_c27f:              jsr incgood
                    lda _c050       // REL File flag ?
                    bne _c29a       // yes
                    lda _c051       // no, ST ok ? -> _c051 is not changed on non REL File transfers
                    bne _c2ae       // not ok or eof
_c29a:              inc _c05b       // transferblock# ?
                    jsr _c541       // read from file or record to Buffer
                    jsr chksum      // calc checksum
                    lda #$f1        // init retries
                    sta _c05e       // retry counter
                    sta _c05f       // ?
                    jmp _c1ee       // send next block

//---> send EOT
_c2ae:              lda #$f1        // init
                    sta _c05e       // retries
_c2b3:              lda #EOT        // re- send EOT?
                    jsr _c621       // to modem
                    jsr _c638       // timing, get signal from receiver
                    beq _c2c7       // good

                    inc _c05e       // bad, +1 retry counter

_c2c0:              bne _c2b3       // 14 retries already ?
                    lda #$05        // yes, failed to send Block after multiple retrys
                    jmp exit1

_c2c7:              lda _c04e       // received signal
_c2ca:              cmp #ACK        // got ACK ? $81
                    bne _c2b3       // no, resend EOT

                    lda #$00        // transfer complete
                    sta $0200       // communication TODO: replace with $0200
                    lda #$3c        // "<"
                    sta _c055
                    jsr dash        // print on Transferscreen
                    jmp exit0       // exit good



//***********************************************************************************************************
//receive
receive2:           tsx             // save stack
                    stx _tmpstk     // temp old stack

                    lda #$dd        // ??
                    sta _c05f       // ??
                    lda #$3e        // ">" Screen output start sign
                    jsr _c47e       // send "GOO", expect "SOH", receive Block#0 into buffer

                    dec buffer      // _c061, did we get the very first 5 Bytes Block ?
                    beq _c313       // yes / could also be Block#1 with a File at load adress $0801
                    lda #$01        // no response from sender
                    jmp exit1

_c313:              lda buffer+1    //_c062 Filelength lo
                    sta _c02a
                    lda buffer+2    //_c062+1 Filelength hi
                    sta _c02a+1     // not really needed on BBS
                    lda buffer+3    //_c064 Filetype from sender
                    cmp _c029       // check received Filetype against given Filetype from Userinput
                    beq _c3a8       // match !
                    lda #$01        // no match -> abort transfer
                    jmp exit1

_c3a8:              lda #ACK        // ACK Block
                    jsr _c621       // send to Modem, ready to receive next block
_c3bf:              lda #$f1        // init
                    sta _c05e       // retries
                    sta _c05f       // ??

//get sign from remote sender and parse it
_c3c7:              jsr _c638       // check User abort / Buffer / timing / get char into _c04e
                    beq _c3d6       // receive was ok

                    inc _c05e       // +1 retries
                    bne _c3c7       // 14 retries ?
                    lda #$05        // errorcode 5
                    jmp exit1       // failed to send Block after multiple retrys

_c3d6:              lda _c04e       // received char
                    cmp #CAN        // abort from other computer ?
                    bne _c3e2       // no
                    lda #$04        // errorcode #4 other Computer send abort
                    jmp _c4ed       //

_c3e2:              cmp #EOT        // EOT ? $a1 last block done ?
                    bne _c3f8       // no, 
                    lda #ACK        // yes, answer EOT with #$81 ACK and end transfer
                    jsr _c621       // send to modem
                    lda #$00        // transfer complete
                    sta _c02c       // communication
                    lda #$3c        // "<" transfer done sign
                    sta _c055
                    jsr dash        // print on transferscreen
                    jmp exit0       // restore stack and return

_c3f8:              cmp #SOH        // $89
                    bne _c3c7       // no, loop and wait for valid signal

                    jsr _c41b       // we've got SOH, answer with ACK and receive Block

//block is received
                    ldy _c05b       // current block#
                    cpy _c05c       // = last block# ?
                    beq _c3bf       // yes, retry
                    dey             // no, lastblock
                    cpy _c05c       // block# continuous ?
                    beq _c412       // yes
                    lda #$05        // failed to send Block after multiple retrys
                    jmp exit1

_c412:              inc _c05c       // last block# = current block#
                    jsr _c593       // write block / record to disk
                    jsr incgood     // inc good blocks and display on screen
                    jmp _c3a8       // ACK then recv next block

//----------------------------------------------------------------------------------
//receive block
_c41b:              lda #ACK        // ACK the SOH
                    jsr _c621       // send to modem
                    jsr _c65b       // timing ? get Block# and complement#
                    beq _c428       // good
                    jmp _c47c       // bad, retry send GOO

_c428:              lda _c04e       // received char
                    sta _c05b       // store block#
                    jsr _c65b       // timing ? get Blocksize and complement#
                    beq _c436       // good
                    jmp _c47c       // bad, retry from start send GOO

_c436:              lda _c04e       // Char from Modem
                    sta _c053       // store block size
                    ldy #$00
_c43e:              jsr _c638       // check User abort / Buffer / timing / get Byte ^
                    beq _c446       // OK                                            :
                    jmp _c47c       // User abort                                    :

_c446:              lda _c04e       // Data                                          :
                    sta buffer,y    // $0400,y                                       :
                    iny             //                                               :
                    cpy _c053       // full Block ?                                  :
                    bne _c43e       // no, loop until all Block Data received      ---

_c452:              jsr _c638       // check User abort / Buffer / timing / get Byte
                    beq _c45a       // OK
                    jmp _c47c       // Error, send GOO

_c45a:              lda _c04e       // read received signal
                    cmp #EOD        // Data Block done?
                    beq _c464       // yes,
                    jmp _c47c       // no, send GOO

_c464:              jsr _c65b       // get checksum# and complement checksum# from sender
                    beq _c46c       // good receive ?
                    jmp _c488       // error or block# mismatch, send $85 signal

_c46c:              jsr chksum      // calc additive checksum from data in buffer
                    lda _c05d       // compare checksum with received checksum
                    cmp _c04e       // match ?
                    bne _c47c       // no, checksum error, send GOO
                    rts             // yes, go back and check block# continuity

//----------------------------------------------------------------------------------
_c47c:              jsr incbad      // update bad blocks counter
                    lda #$5f        // Arrow left (symbol for resend) for screen output
_c47e:              ldx #GOO        // "goo" $83 signal to sender, means we are ready to receive
                    ldy #SOH        // $89 expected reply from sender ?!
                    jsr _c494       // handshake 
                    jmp _c41b       // we got SOH, send ACK and receive Block

//----------------------------------------------------------------------------------
_c488:              jsr incbad      // update bad blocks counter
                    ldx #NAK        // NAK Signal $85 ?
//                    lda #$00        // nul (no screen output at _c4b7)
                    ldy #EOD        // expected reply from sender. Data Block signal ?!
                    jsr _c494       // handshake
                    jmp _c452

//----------------------------------------------------------------------------------
_c494:              stx _c054       // char to send
                    sta _c055       // char for screen
                    sty _c056       // char to expect
                    jsr dash        // print _c055 char to screen

_c49d:              jsr _c638       // get sign / check User abort / Buffer / timing
                    beq _c49d       // loop (nothing received)
                    inc _c05f
                    bne _c4ac       // <#256 ?
                    lda #$05        // failed to send Block after multiple retrys
                    jmp exit1

_c4ac:              lda #$f1        // init 15
                    sta _c05e       // retries

_c4b1:              lda _c054       // char to send GOO / NAK
                    jsr _c621       // send to modem
                    jsr _c638       // get sign / check User abort / Buffer / timing
                    beq _c4d1       // signal received
                    
                    inc _c05e       // +1 retry
                    lda _c05e       // just to be sure. maybe remove later
                    bne _c4b1       // max. 14 retries reached ? No, then resend GOO or NAK

                    lda #$05        // yes, failed to send Block after multiple retrys
                    jmp exit1

_c4d1:              lda _c04e       // last signal from modem
                    cmp _c056       // got expected signal ?
                    bne _c4b1       // no, loop
                    rts             // yes. return

//----------------------------------------------------------------------------------
exit1:              sta _c02c       // communication to $0200
                    
                    lda #$91        // set timeout / waitloop
//old code:
//                    sta $a2         // 1 Jiffy = 0.1667 seconds
//_c4e1:              lda $a2         // #$6f Jiffys = 18 seconds
//                    bne _c4e1

                    sta timeout
                    lda $a2         // store current Jiffy Clock in timer2
                    sta timer2      // LSB
                    lda $a1         //
                    sta timer2 + 1  // MSB
                    lda $a0         //
                    sta timer2 + 2  // HSB

_waitlp:            sec             // prepare sbc
                    lda $a1         // current Jiffy MSB
                    sbc timer2+1    // stored Jiffy MSB
                    sta timer3+1    // temporary store
                    bcc !+          //
                    dec timer3+1    // take care of carry flag

!:                  sec             // prepare sbc
                    lda $a2         // LSB / 1 Jiffy = 0.1667 seconds
                    sbc timer2      // old LSB
                    sta timer3
                    lda timer3+1
                    cmp timeout+1   // MSB
                    bne _waitlp     // loop
                    
                    lda timer3      // LSB
                    cmp timeout     // = 18 seconds timeout
                    bcc _waitlp
 
                    
                    lda #CAN        // abort code
                    jsr _c621       // send to modem
                    lda _c02c       // communication $0200
_c4ed:              sta _c02c       //

                    lda #$d8        // "X"
                    sta _c055
                    jsr dash        // update Screen

exit0:              pla
                    tsx
                    cpx _tmpstk     // compare with saved stack
                    bne exit0       // loop if unequal
                    jmp clrchn      // exit protocol


_c50a:              jsr clrchn      // $ffcc
                    lda #$02        // channel #2 and #15
                    jsr close       // $ffc3
                    lda #$0f        //
                    jmp close       // $ffc3 and return

//read from disk
_c541:              lda _c050       // REL File ?
                    beq _c56f       // no
                    jsr _c8e2       // send "p" Command
                    jsr _c7ec       // read error channel message from floppy to _c161 Buffer
                    lda _c161       // Errorchannel Buffer, 1st digit of Floppy Error
                    cmp #$30        // "0" -> OK ?
                    beq _c564       // yes
                    cmp #$35        // "5x" 50 "record not present" / 51 "overflow in record" / 52 "file too large" ?
                    bne _c561       // no
                    lda _c161+1     // 2nd digit
                    cmp #$30        // "0" -> record not present = end of REL File?
                    bne _c561       // no
                    jmp _c2ae       // to modem, timing etc.

_c561:              jmp _c819       // display floppy error message

_c564:              jsr _c8e2       // send p... to channel #15
                    inc _c059       // next record# lo
                    bne _c56f
                    inc _c05a       // record# hi
_c56f:              ldx #$02        // channel #2
                    jsr chkin       // $ffc6
                    ldy #$00
_c576:              jsr chrin       // $ffcf loop read record from disk
                    sta buffer,y    // _c061,y store in Buffer
                    iny
                    cpy _c02f       // max. Block size reached ?
                    beq _c58a       // yes
                    jsr readst      // no, $ffb7
                    beq _c576       // continue reading
                    sta _c051       // store ST
_c58a:              sty _c053       // store block size
//                    jsr _c80e		// read errorchannel
                    rts



//write to disk
_c593:              lda _c050       // REL File ?
                    beq _c5b0       // no

                    jsr _c8e2       // send p... to channel #15
                    jsr _c7ec       // read error channel message from floppy to _c161 Buffer
                    lda _c161
                    cmp #$30        // "0x" OK
                    beq _c5b0
                    cmp #$35        // "5x" record not present / overflow in record / file too large
                    bne _c5ad
                    cmp #$30        // "0x" OK ?! double or dummy for something?!
                    beq _c5b0
_c5ad:              jmp _c819       // display floppy error message

//write buffer to file or record on disk
_c5b0:              inc _c059       // record# lo
                    bne _c5b8
                    inc _c05a       // record# hi
_c5b8:              ldx #$02        // channel #2
                    jsr chkout      // $ffc9
                    ldy #$00
_c5bf:              lda buffer,y    // _c061,y buffer
                    jsr chrout      // $ffd2 write record to disk
                    iny             // next char from buffer
                    cpy _c053       // block size
                    bne _c5bf       // loop
                    jsr _c80e       // read errorchannel
                    jmp clrchn      // clear channel and return (output now to screen again)
//                    rts

//----------------------------------------------------------------------------------
//send # and complement#
_c5e8:              sta _c057       // block# / blocksize / checksum
                    jsr _c621       // send to modem
                    lda _c057       // 
                    eor #$ff        // complement #
                    jmp _c621       // send to modem

//----------------------------------------------------------------------------------
_c5f6:              jsr _c6c8       // check User abort
                    sty _c058       // temp Bufferpointer ?
                    
                    ldy $029c       // RS-232: Pointer to Start of Inputbuffer (receive)
                    cpy $029b       // RS-232: Pointer to End of Inputbuffer (receive)
                    beq _c615       // Buffer empty
                    lda ($f7),y     // Pointer to Inputbuffer RS-232 Ringbuffer
                    sta _c04e
                    inc $029c       // update pointer to next char

                    lda #$01        // switch 
                    sta _c04f       // data in buffer
                    ldy _c058       // get buffer pointer
                    rts             // return

_c615:              ldy _c058       // Bufferpointer?
                    lda #$00
                    sta _c04e       // last received char
                    sta _c04f       // switch nothing in buffer?!
                    rts

//----------------------------------------------------------------------------------
//send char to modem
_c621:              sta _c189       // store char
                    jsr clrchn      // $ffcc
                    jsr _c6c8       // check User abort
                    ldx #$05        // channel #5
                    jsr chkout      // $ffc9 to modem
                    lda _c189       // load char
                    jsr chrout      // $ffd2 to modem
                    jmp clrchn      // $ffcc


//----------------------------------------------------------------------------------
timeout:    .byte $3c, $00, $00         // timeout timer 
timer2:     .byte $00, $00, $00         // timer2 Jiffy Clock storage LSB / MSB / HSB
timer3:     .byte $00, $00, $00         // timer3 Jiffy Clock temp storage LSB / MSB / HSB

_c638:              lda $a2         // store current Jiffy Clock in timer2
                    sta timer2      // LSB
                    lda $a1         //
                    sta timer2 + 1  // MSB
                    lda $a0         //
                    sta timer2 + 2  // HSB

_c63e:              jsr _c5f6       // Buffer + check User abort
                    lda _c04f       // Buffer was empty 0 or not 1 ?
                    bne _c658       // =1 received something in Buffer

                    sec             // prepare sbc
                    lda $a1         // current Jiffy MSB
                    sbc timer2+1    // stored Jiffy MSB
                    sta timer3+1    // temporary store
                    bcc !+          //
                    dec timer3+1    // take care of carry flag

!:                  sec             // prepare sbc
                    lda $a2         // LSB / 1 Jiffy = 0.1667 seconds
                    sbc timer2      // old LSB
                    sta timer3
                    lda timer3+1
                    cmp timeout+1   // MSB
                    bne _c63e       // try again while within timelimit
                    
                    lda timer3      // LSB
                    cmp timeout     // = 10 seconds timeout
                    bcc _c63e
                    lda #$01        // timeout ?! bad
                    rts

_c658:              lda #$00        // good
                    rts

//----------------------------------------------------------------------------------
//get number and complement
_c65b:              jsr _c638       // get char, timing etc.
                    bne _c67e       // had a timeout ?
                    lda _c04e       // received char
                    sta _c057       // block# / blocksize / checksum Byte1
                    jsr _c638       // get next char, timing etc.
                    bne _c67e
                    lda _c04e       // received char
                    eor #$ff        // complement #
                    cmp _c057       // match ?!
                    bne _c681       // error
                    lda _c057       // set char
                    sta _c04e       // back in _c04e
                    lda #$00        // error status 0 (good)
                    rts
_c67e:              lda #$01        // error status 1 (timeout)
                    rts
_c681:              lda #$02        // error status 2 (block error?!)
                    rts

//----------------------------------------------------------------------------------
// calc additive checksum
chksum:             ldy #$00        // init counter
                    lda #$00        // init checksum
_chksadd:           clc
                    adc buffer,y    //_c061,y
                    iny
                    cpy _c053       // do add y times
                    bne _chksadd
                    sta _c05d       // additive Checksum result
                    rts

//----------------------------------------------------------------------------------
incgood:            inc goodblks    // inc good blocks
                    bne _prntstats
                    inc goodblks+1  // inc good blocks hi byte
_prntstats:         jsr printstats  // update screen
                    lda #$2d        // "-"
                    sta _c055
                    jmp dash        // update screen


incbad:             inc badblks     // inc bad blocks
                    bne !+
                    inc badblks+1
!:                  jmp printstats  // update screen


_c6c8:              lda $028d       // shift / c= / ctrl pressed ?
                    cmp #$02        // c= key ?
                    bne _c6d4       // no
                    lda #$06        // yes, User abort Transfer
                    jmp exit1       // 
_c6d4:              rts             // return

//index table
_c6d5:  .byte $02, $22, $42, $62, $82, $a2, $c2, $e2

//position for index table
_c6dd:  .byte $ff

_c6de:	.byte $00		// temp ST

//temp storeage for $0358
_c6df:  .byte $00


//"u1:2,0,18,01"
//Block read to Drive Buffer: channel, drive#, track, sector
//1541 always drive#0
_c6e0: .byte $55, $31, $3a, $32, $2c, $30, $2c, $31, $38, $2c, $30, $31, $0d 

_c6ed:              
                    ldy #$18        // Fill _c032 - _c04a
                    lda #$a0        // with Shift - Space
_c6f4:              sta fnbuf,y     //
                    dey             //
                    bpl _c6f4       // loop
                    
                    jsr _c90d       // Variable p$ (filename,ext), save filename to fnbuf
                    
                    ldy _c04d
                    dey
                    lda fnbuf,y     // right$(p$,1)
                    sta _c029       // save Filetype
                    
                    lda #$42
                    ldx #$4b        // variable bk
                    jsr $b660       // ML1.o code to get Adress of bk content into $c3 + $c4
                    jsr $9e32       // KL2OUTB blocks now in $cf00+ as petscii numbers, destroys $0358
                    lda #$00        // $cf00 is always $20 (space)
                    sta $22
                    lda #$cf
                    sta $23
                    jsr _copycode   // copy code outside of BASIC ROM Area (to Outputbuffer) and start it there
                    lda $14         // result is in $14 / $15
                    sta _c02a       // Diskblocks lo
                    lda $15
                    sta _c02a+1     // Diskblocks hi
                    lda _c029       // Filetype
                    cmp #$4c        // "L"
                    beq _c7a2
                    lda #$00        // set
                    sta _c050       // REL File flag to no REL File
_c7a2:              rts

//----------------------------------------------------------------------------------
_copycode:          ldy #$20        // this code needs to be 
!:                  lda _cfcode,y   // copied outside of BASIC ROM
                    sta $cf90,y     // so that both BASIC ROM Routines
                    dey             // can be called from the Transferprotocol
                    bpl !-          // code underneath the ROM
                    jmp $cf90

_cfcode:
.byte $e6, $01, $a9, $00, $8d, $58, $03, $a8
.byte $b9, $00, $cf, $f0, $07, $ee, $58, $03
.byte $c8, $4c, $98, $cf, $ad, $58, $03, $20
.byte $b5, $b7, $20, $f7, $b7, $c6, $01, $60

//----------------------------------------------------------------------------------
//--> read errorchannel
_c7ec:              jsr clrchn      // $ffcc
                    ldx #$0f        // #15
                    jsr chkin       // $ffc6
                    bcc _c7f9
                    jmp _c819       // display floppy error message

_c7f9:              ldy #$00
_c7fb:              jsr chrin       // $ffcf
                    sta _c161,y     // Floppy Errormessage Buffer
                    iny
                    jsr readst      // $ffb7
                    beq _c7fb       // continue reading error message from Floppy
                    dey
                    sty _c6de       // store pointer
                    jmp clrchn      // $ffcc and done


_c80e:              jsr _c7ec       // checkin #15, read error channel
                    lda _c161       // error#
                    and #$0f        // <15 ?
                    bne _c819       // display floppy error message
                    rts             // OK

//Display Floppy Errormessage on Screen
//like:" [21,read error,18,00] "
_c819:              lda #$0d        // <CR>
                    jsr chrout      // $ffd2
                    lda #$20        // SPACE
                    jsr chrout
                    lda #$5b        // "["
                    jsr chrout
                    ldy #$00
_c82a:              lda _c161,y
                    jsr chrout      // $ffd2
                    iny
                    cpy _c6de
                    bne _c82a
                    lda #$5d        // "]"
                    jsr chrout
                    lda #$20        // SPACE
                    jsr chrout
                    lda #$0d        // <CR>
                    jsr chrout
                    jsr _c50a       // close channel #2 and #15
                    lda #$02        // error #2 disk error
                    jmp exit1       // store in $c02c

//----------------------------------------------------------------------------------
//send U1 Command to Drive
_c84d:              jsr clrchn      // $ffcc
                    ldx #$0f        // channel #15
                    jsr chkout      // $ffc9 
                    ldy #$00
_c857:              lda _c6e0,y     // "u1:2,0,18,01"
                    jsr chrout      // $ffd2 send Block read command to Floppy
                    iny
                    cpy #$0d
                    bne _c857
//                    jsr _c80e       // read errorchannel
                    ldx #$02        // channel #2
                    jsr chkin       // $ffc6
                    ldy #$00
_c86c:              jsr getin       // $ffe4 from Floppy Buffer to C64 Buffer
                    sta buffer,y    // _c061,y read 256 chars (Sector) into _c061 - _c160
                    iny
                    bne _c86c
//                    jsr _c80e       // read errorchannel
                    jmp clrchn      // $ffcc

//----------------------------------------------------------------------------------
// called with value in .A
_c87b:              ldy #$ff        // #255
                    sec
_c87e:              iny             // #0 counter for something ?!
                    sbc #$0a        // -10 -> #246
                    bcs _c87e       // 
                    adc #$0a        // +10
                    tax             // save in .X
                    tya             // .Y to .A
                    ora #$30        // +30 (ASCII code / digit) of counter
                    tay             // back to .Y
                    txa             // same for .X value
                    ora #$30        // +30 (ASCII code / digit)
                    rts             // done 


//----------------------------------------------------------------------------------
// send "p" Command to drive
_c8e2:              jsr clrchn      // $ffcc
                    ldx #$0f        // #15
                    jsr chkout      // $ffc9
                    lda #$50        // "p"
                    jsr chrout      // $ffd2
                    lda #$02        // chr$(2) (channel#)
                    jsr chrout 
                    lda _c059       // chr$(record# lo) 
                    jsr chrout
                    lda _c05a       // chr$(record# hi) 
                    jsr chrout
                    lda #$01        // chr$(1) (position in record)
                    jsr chrout
                    lda #$0d        // <CR>
                    jsr chrout
                    jmp clrchn      // $ffcc

//----------------------------------------------------------------------------------
// search for Variable p$ and get content of p$ to fnbuf buffer
// p$ - Filename +",p" f.e.
// c$ - Filetype like "PRG"
// d$ - just the Filename
// bk - Diskblocks

_c90d:              lda #$50        // "p"
                    sta $45
                    ldx #$80        // String Variable -> BBS p$
                    stx $46
                    jsr $c948       // BBS SETVAR
                    ldy #$00
                    lda ($47),y
                    sta _c04d
                    iny
                    lda ($47),y     // get memory position of variable p$
                    sta $49         // Variable Pointer for FOR-NEXT-Loop
                    iny             //
                    lda ($47),y     //
                    sta $4a         //
                    ldy _c04d       // Filename length
                    dey             // 
_c92f:              lda ($49),y     // read memory where content of p$ is and
                    sta fnbuf,y     // save data in fnbuf to _c032
                    dey             //
_c935:              bpl _c92f       // 
                    rts                  

//----------------------------------------------------------------------------------
//Init receive
inirecv:            lda #$3c        // init
                    sta timeout     //
                    lda #$ff        // 
                    sta _c02f       // max. Blocksize
                    lda #$00        // 
                    sta goodblks
                    sta goodblks+1
                    sta badblks
                    sta badblks+1
                    sta _c05b       // current block#
                    sta _c05c       // last block#
                    sta _c05a       // record# hi
                    lda #$01        // "1"
                    sta _c059       // record# lo
                    jsr _c90d       // Filename from p$ (filename without ,ext) into fnbuf $b911
                    ldy _c04d       // Filenamelength +1
                    lda #$2c        // "," set comma and filetype extension
                    sta fnbuf,y     // "filename,"
                    ldx $bffb       // get filetype flag set by BBS code
                    lda _c18b,x     // set Filetype in $bffb 
                    sta _c029       // save Filetype "P" / "S" (/ "U" / "L" /"D" invalid in BBS mode)
                    iny
                    sta fnbuf,y     // "filename,p" 
                    rts

//----------------------------------------------------------------------------------
// Print Good Blocks / Bad Blocks on Screen
printstats:         ldy #$06		// Column #6
                    jsr plot15		// set Cursor on Line #21
                    ldx goodblks    // Load hex 16Bit of good transmit blx
                    lda goodblks + 1 
                    jsr $c760       // Print # of Good Blocks
                    ldy #$14		// Column #20
                    jsr plot15		// Set Cursor
                    ldx badblks		// Load hex 16Bit of bad transmit blx
                    lda badblks + 1
                    jsr $c760       // and Print # of Bad Blocks ML2.o
plot16:             ldy #$00
                    ldx #$16		// Line #22
                    .byte $2c       // bit$xxxx skip
//setcrsr PLOT
plot15:             ldx #$15		// Line #21
                    clc             // set
                    jmp plot        // CRSR and back

goodblks:   .word $0000     // Counter good blocks
badblks:    .word $0000     // Counter bad blocks

dash:               ldy #$0c        // Column #16
                    jsr plot15      // set Cursor
                    lda #$12        // rvs on
                    jsr chrout
                    lda #$05        // {wht}
                    jsr chrout
                    lda _c055       // get sign
                    jsr chrout      // print sign
                    lda #$92        // rvs off
                    jsr chrout
                    lda #$9a        // {lblu}
                    jsr chrout
                    jmp plot16      // set Cursor and back
//EOF