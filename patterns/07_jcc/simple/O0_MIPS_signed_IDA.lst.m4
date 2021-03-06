include(`commons.m4').text:00000000 f_signed:                                # CODE XREF: main+18
.text:00000000
.text:00000000 var_10          = -0x10
.text:00000000 var_8           = -8
.text:00000000 var_4           = -4
.text:00000000 arg_0           =  0
.text:00000000 arg_4           =  4
.text:00000000
.text:00000000                 addiu   $sp, -0x20
.text:00000004                 sw      $ra, 0x20+var_4($sp)
.text:00000008                 sw      $fp, 0x20+var_8($sp)
.text:0000000C                 move    $fp, $sp
.text:00000010                 la      $gp, __gnu_local_gp
.text:00000018                 sw      $gp, 0x20+var_10($sp)
; _EN(`store input values into local stack')_RU(`сохранить входные значения в локальном стеке'):
.text:0000001C                 sw      $a0, 0x20+arg_0($fp)
.text:00000020                 sw      $a1, 0x20+arg_4($fp)
; reload them.
.text:00000024                 lw      $v1, 0x20+arg_0($fp)
.text:00000028                 lw      $v0, 0x20+arg_4($fp)
; $v0=b
; $v1=a
.text:0000002C                 or      $at, $zero ; NOP
; _EN(``this is pseudoinstruction. in fact,'')_RU(``это псевдоинструкция. на самом деле, там'') "slt $v0,$v0,$v1" _EN(`is there').
; _EN(`so')_RU(`так что') $v0 _EN(`will be set to 1 if')_RU(``будет установлен в 1, если'') $v0<$v1 (b<a) _EN(`or to 0 if otherwise')_RU(`или в 0 в противном случае'):
.text:00000030                 slt     $v0, $v1
; _EN(``jump to loc\_5c, if condition is not true'')_RU(``перейти на loc\_5c, если условие не верно'').
; _EN(``this is pseudoinstruction. in fact,'')_RU(``это псевдоинструкция. на самом деле, там'') "beq $v0,$zero,loc_5c" _EN(`is there'):
.text:00000034                 beqz    $v0, loc_5C
; _EN(`print "a>b" and finish')_RU(`вывести "a>b" и выйти')
.text:00000038                 or      $at, $zero ; branch delay slot, NOP
.text:0000003C                 lui     $v0, (unk_230 >> 16) # "a>b"
.text:00000040                 addiu   $a0, $v0, (unk_230 & 0xFFFF) # "a>b"
.text:00000044                 lw      $v0, (puts & 0xFFFF)($gp)
.text:00000048                 or      $at, $zero ; NOP
.text:0000004C                 move    $t9, $v0
.text:00000050                 jalr    $t9
.text:00000054                 or      $at, $zero ; branch delay slot, NOP
.text:00000058                 lw      $gp, 0x20+var_10($fp)
.text:0000005C
.text:0000005C loc_5C:                                  # CODE XREF: f_signed+34
.text:0000005C                 lw      $v1, 0x20+arg_0($fp)
.text:00000060                 lw      $v0, 0x20+arg_4($fp)
.text:00000064                 or      $at, $zero ; NOP
; _EN(``check if a==b, jump to loc\_90 if it's not true'')_RU(``проверить a==b, перейти на loc\_90, если это не так''):
.text:00000068                 bne     $v1, $v0, loc_90
.text:0000006C                 or      $at, $zero ; branch delay slot, NOP
; _EN(``condition is true, so print "a==b" and finish'')_RU(``условие верно, вывести "a==b" и закончить''):
.text:00000070                 lui     $v0, (aAB >> 16)  # "a==b"
.text:00000074                 addiu   $a0, $v0, (aAB & 0xFFFF)  # "a==b"
.text:00000078                 lw      $v0, (puts & 0xFFFF)($gp)
.text:0000007C                 or      $at, $zero ; NOP
.text:00000080                 move    $t9, $v0
.text:00000084                 jalr    $t9
.text:00000088                 or      $at, $zero ; branch delay slot, NOP
.text:0000008C                 lw      $gp, 0x20+var_10($fp)
.text:00000090
.text:00000090 loc_90:                                  # CODE XREF: f_signed+68
.text:00000090                 lw      $v1, 0x20+arg_0($fp)
.text:00000094                 lw      $v0, 0x20+arg_4($fp)
.text:00000098                 or      $at, $zero ; NOP
; _EN(`check if')_RU(`проверить условие') $v1<$v0 (a<b), _EN(`set')_RU(`установить') $v0 _EN(`to 1 if condition is true')_RU(``в 1, если условие верно''):
.text:0000009C                 slt     $v0, $v1, $v0
; _EN(``if condition is not true (i.e., \$v0==0), jump to loc\_c8'')_RU(``если условие не верно (т.е. \$v0==0), перейти на loc\_c8''):
.text:000000A0                 beqz    $v0, loc_C8
.text:000000A4                 or      $at, $zero ; branch delay slot, NOP
; _EN(``condition is true, print "a<b" and finish'')_RU(``условие верно, вывести "a<b" и закончить'')
.text:000000A8                 lui     $v0, (aAB_0 >> 16)  # "a<b"
.text:000000AC                 addiu   $a0, $v0, (aAB_0 & 0xFFFF)  # "a<b"
.text:000000B0                 lw      $v0, (puts & 0xFFFF)($gp)
.text:000000B4                 or      $at, $zero ; NOP
.text:000000B8                 move    $t9, $v0
.text:000000BC                 jalr    $t9
.text:000000C0                 or      $at, $zero ; branch delay slot, NOP
.text:000000C4                 lw      $gp, 0x20+var_10($fp)
.text:000000C8
; _EN(``all 3 conditions were false, so just finish'')_RU(``все 3 условия были неверны, так что просто заканчиваем''):
.text:000000C8 loc_C8:                                  # CODE XREF: f_signed+A0
.text:000000C8                 move    $sp, $fp
.text:000000CC                 lw      $ra, 0x20+var_4($sp)
.text:000000D0                 lw      $fp, 0x20+var_8($sp)
.text:000000D4                 addiu   $sp, 0x20
.text:000000D8                 jr      $ra
.text:000000DC                 or      $at, $zero ; branch delay slot, NOP
.text:000000DC  # End of function f_signed
