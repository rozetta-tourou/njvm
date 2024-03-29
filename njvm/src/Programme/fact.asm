//
// version
//
	.vers	8

//
// execution framework
//
__start:
	call	_main
	call	_exit
__stop:
	jmp	__stop

//
// Integer readInteger()
//
_readInteger:
	asf	0
	rdint
	popr
	rsf
	ret

//
// void writeInteger(Integer)
//
_writeInteger:
	asf	0
	pushl	-3
	wrint
	rsf
	ret

//
// Character readCharacter()
//
_readCharacter:
	asf	0
	rdchr
	popr
	rsf
	ret

//
// void writeCharacter(Character)
//
_writeCharacter:
	asf	0
	pushl	-3
	wrchr
	rsf
	ret

//
// Integer char2int(Character)
//
_char2int:
	asf	0
	pushl	-3
	popr
	rsf
	ret

//
// Character int2char(Integer)
//
_int2char:
	asf	0
	pushl	-3
	popr
	rsf
	ret

//
// void exit()
//
_exit:
	asf	0
	halt
	rsf
	ret

//
// void writeString(String)
//
_writeString:
	asf	1
	pushc	0
	popl	0
	jmp	_writeString_L2
_writeString_L1:
	pushl	-3
	pushl	0
	getfa
	call	_writeCharacter
	drop	1
	pushl	0
	pushc	1
	add
	popl	0
_writeString_L2:
	pushl	0
	pushl	-3
	getsz
	lt
	brt	_writeString_L1
	rsf
	ret

//
// void main()
//
_main:
	asf	3
	pushc	100
	popl	0
	pushc	1
	popl	1
	pushc	1
	popl	2
	jmp	__2
__1:
	pushl	1
	pushl	2
	mul
	popl	1
	pushl	2
	pushc	1
	add
	popl	2
__2:
	pushl	2
	pushl	0
	le
	brt	__1
__3:
	pushl	0
	call	_writeInteger
	drop	1
	pushc	33
	call	_writeCharacter
	drop	1
	pushc	32
	call	_writeCharacter
	drop	1
	pushc	61
	call	_writeCharacter
	drop	1
	pushc	32
	call	_writeCharacter
	drop	1
	pushl	1
	call	_writeInteger
	drop	1
	pushc	10
	call	_writeCharacter
	drop	1
__0:
	rsf
	ret

//
// Integer factorial(Integer)
//
_factorial:
	asf	0
	pushl	-3
	pushc	0
	eq
	brf	__5
	pushc	1
	popr
	jmp	__4
	jmp	__6
__5:
	pushl	-3
	pushl	-3
	pushc	1
	sub
	call	_factorial
	drop	1
	pushr
	mul
	popr
	jmp	__4
__6:
__4:
	rsf
	ret
