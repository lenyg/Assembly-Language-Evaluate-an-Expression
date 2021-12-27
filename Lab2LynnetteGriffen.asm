;-------------------------------------
;Lynnette Griffen
;The code solves the expression -x^3+14x-3
;using random numbers for x and then outputs
;20 possible solutions for the expression 
;using a loop
;-------------------------------------

;Library for I/O and other purposes
;-------------------------
include     c:\asmio\asm32.inc
includelib  c:\asmio\asm32.lib
includelib  c:\asmio\user32.lib     ;Need these two files for SASM with I/O
includelib  c:\asmio\kernel32.lib   ;Need these two files for SASM with I/O
;---------------------------------
.const
    NULL equ    0
;------------------------------
.data?          ;Uninitialized data section
    x       dword ?
    a       dword ?
    b       dword ?
    answer  dword ?
    
.data
                  
    msgp1   byte "f(", NULL
    msgp3   byte ") = ", NULL
    NN1     dword -1
    n14     dword 14
    n3      dword 3
    NN8     dword -8
;------------------------------------------
.code
main    proc   ;Start the main procedure   

        ;Random generating code:
        ;-----------------------
        call Randomize          ;Sets the seed - MUST BE DONE ONCE!!
        mov     ecx, 20         ; loop counter is saved in ecx
        ;Sets range of x and print value
        ;--------------------------------- 
 Lp1:   mov     edx, OFFSET msgp1   ;String must be in edx
        call    WriteString             
        mov     eax, 12             ;  Sets eax to 12                      
        inc     eax                 ; Add 1 to eax                                             
        call    RandomRange         
        add     eax, NN8            ;Adds -8 to the random value                   
        call    WriteInt            ; writes random number to console                                                                                                                   
        mov     x, eax              ; save number 
   
    
        ;Evaluate expression
        ;--------------------                                                                                                                            
        mov     eax, x
        imul    x       ;multiply eax by x
        imul    x       
        imul    NN1     ;multiply eax by -1
        mov     a, eax  ; save result in a
        
        mov     eax, x  
        imul    n14     ; multiply eax by -14
        mov     b, eax  ;save result in b
        
        mov     eax, a
        add     eax, b
        sub     eax, n3
        mov     answer, eax
    
        ;Print Expression
        ;----------------
        mov     edx, OFFSET msgp3
        call    WriteString
        call    WriteInt
        call    Crlf
        
        loop    Lp1
        
        
     
        call    readInt                   ;Terminate WriteInt
        
        ret     0                        ; Must always ret 0
main    endp                         ; End of main Procedure
    end         main                 ; End of program