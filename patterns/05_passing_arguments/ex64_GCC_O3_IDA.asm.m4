include(`commons.m4')f               proc near
                imul    rsi, rdi
                lea     rax, [rdx+rsi]
                retn
f               endp

main            proc near
                sub     rsp, 8
                mov     rdx, 3333333344444444h ; _arg3
                mov     rsi, 1111111122222222h ; _arg2
                mov     rdi, 1122334455667788h ; _arg1
                call    f
                mov     edi, offset format ; "%lld\n"
                mov     rsi, rax
                xor     eax, eax ; _numvecreg
                call    _printf
                xor     eax, eax
                add     rsp, 8
                retn
main            endp
