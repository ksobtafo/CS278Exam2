;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;author: karen SObtafo
;;;;;;; date last modified:11/05/2018
;;;;;;;I affirm that all code given below was written solely by me, Karen Sobtafo, and that any help I received adhered to the rules stated for this exam
;;;;;;; resources used: Mini chess board challenge solustion by Dr Kent Jones,
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TITLE  Kaleidoscope 
INCLUDE Irvine32.inc
;must use funtion calls to develop this progam
;comment alot 
;must generate a pattern with 4-fold or greater symmetry
;use the fewest numbr of instructions that you can 
;HINT after every program loop you will need to clear the screen in the dos window
;may want to call a delay function between each update. 
;use info in chapter 1-5
;black, white, brown, yellow, blue, green, cyan, red, magenta, gray, lightBlue, lightGreen, lightCyan, lightRed, lightMagenta, and lightGray (colors in irvine)
 
 .const ; symbolic interger constant
 .data 
 ;initializing some colors here 
color DWORD (brown+(brown*16)), (yellow+(yellow*16)), (lightBlue+(lightBlue*16)),(lightRed+(lightRed*16)), (lightMagenta+(lightMagenta*16)) ; tthis is the array of colors i will use 
 space BYTE ' ',0
 .code
 main proc 
    mov ecx, 12 ; this sets the loop counter to 12
    labelRow:
            push ecx ; this saves the loop counter 
            mov ecx, 12 ; this sets the column counter
    LabelCol:
            mov eax, 5
            call RandomRange
            mov eax, color[eax*TYPE color]
            call setTextColor

            mov eax,12
            call RandomRange
            mov dl, al ; random column from 0-11 ( 0-(n-1) )

            mov eax, 12
            call RandomRange
            mov dh, al ; random row from 0-11

            call Gotoxy ;calls the row and column 
            mov dx,bx
            mov edx, OFFSET space
            call WriteString

;bottom right quadrant 

;mov dh, bh
sub dh, 23
sub dl,23
call WriteString

    ; call WriteString

;top right quadrant 
        ;sub bh, 30
         ;call WriteString

;bottom left quadrant
        ;sub dl, 24
        ;call WriteString

            ;mov bl, dh
            ;sub bl,30
            
        loop LabelCol

        call crlf
        pop ecx

loop labelRow

    exit
    main ENDP
    END
