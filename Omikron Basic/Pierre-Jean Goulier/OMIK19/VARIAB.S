;
; Basic Omikron & Assembleur.
; Routine de r�cup�ration d'une variable cha�ne.
; � Start Micro & PJG / 1994.
;
	move.l	4(sp),a1	; Ptr : VARPTR(A$) => A1.
	move.l	(a1),a2		; LPEEK(Ptr) => A2.
	add.l	28(a0),a2	; + LPEEK(SEGPTR)+28 => A2
				; A2 = Adresse de la cha�ne.
	move	4(a1),d1	; D1 = Longueur de la cha�ne.
	clr.b	(a2,d1)		; On met un 0 en fin de cha�ne.
	move.l	a2,-(sp)	; On affiche la variable par Cconws.
	move	#9,-(sp)
	trap	#1
	addq.l	#6,sp
	move.l	a2,d0		; On renvoie l'adresse de la variable.
	rts
