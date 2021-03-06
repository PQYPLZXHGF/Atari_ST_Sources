;******************************************************************************
;*       ADD8FADE - Byte wise fading between two screens                      *
;*       with Constants-Addition                 by Andreas Hollmann          *
;*    (c) 1992 MAXON Computer GmbH                                            *
;******************************************************************************
GLOBL  add8fade;

add8fade:   movea.l   4(sp),a1        ;fetch src_adr
            movea.l   8(sp),a0        ;fetch dst_adr 
            move.l    12(sp),d1       ;fetch Add-value
;------------------------------------------------------------------------------
            move.w    #10,d7          ;Delaying-value
            move.l    #31999,d0       ;Loop counter
            moveq     #0,d2           ;Counter is 0 at the start
;------------------------------------------------------------------------------
copy_loop:  move.b    0(a1,d2.w),0(a0,d2.w) ;Copy 1 Byte 
            move.w    #20,d7          ;Restore delaying value
delay:      dbra      d7,delay        ;Brake-loop

            add.l     d1,d2           ;Add the Add-value to the counter
            cmpi.l    #31999,d2
            bgt.s     sub_count       ;if counter > 31999, ->
            bra.s     loop_end        ;to the end of the loop

sub_count:  sub.l     #32000,d2       ;Reduce counter by 32000
loop_end:   dbra      d0,copy_loop
;------------------------------------------------------------------------------
            rts
            END

