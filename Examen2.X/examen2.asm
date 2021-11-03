#include "p16F887.inc"   ; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

MAIN_PROG CODE                      ; let linker place main program                      ; let linker place main program


i EQU 0x22
j EQU 0x23
bin EQU 0x24
x1 EQU 0x25
x2 EQU 0x26
x3 EQU 0x27
x4 EQU 0x28
x5 EQU 0x29
x6 EQU 0x30
x7 EQU 0x31
x8 EQU 0x32
aux EQU 0x33
ban EQU 0x34
carr EQU 0x35
p1 EQU 0x36
p2 EQU 0x37
p3 EQU 0x38
p4 EQU 0x39
p5 EQU 0x40
p6 EQU 0x41
p7 EQU 0x42
p8 EQU 0x43
y equ 0x44
t equ 0x45
k equ 0x46
m equ 0x47
 
START

    BANKSEL PORTA ;
    CLRF PORTA ;Init PORTA
    BANKSEL ANSEL ;
    CLRF ANSEL ;digital I/O
    CLRF ANSELH
    BANKSEL TRISA ;
    CLRF TRISA
    CLRF TRISB
    CLRF TRISC
    CLRF TRISD
    CLRF TRISE
    MOVLW b'00000000' 
    MOVWF TRISC
    MOVLW b'11111111' 
    MOVWF TRISD
    BCF STATUS,RP1
    BCF STATUS,RP0
    CLRF PORTA
    CLRF PORTB
    CLRF PORTC
    CLRF PORTD
    CLRF PORTE
    
    CLRF ban
    CLRF carr
    CLRF x1
    CLRF x2
    CLRF x3
    CLRF x4
    CLRF x5
    CLRF x6
    CLRF x7
    CLRF x8
    
    CLRF p1
    CLRF p2
    CLRF p3
    CLRF p4
    CLRF p5
    CLRF p6
    CLRF p7
    CLRF p8
    
    CLRF aux
      
    
INITLCD
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    
    CALL PANTALLA1
    CALL clear
    CALL CLAVE
    CALL PASSWORD  
     
    
INICIO
    CALL ENTRY
    CALL OCULTAR    
    GOTO FLEX

FLEX:
    CALL GUARDADO
    CALL COMP   
    GOTO INICIO
PANTALLA1:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x83		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'B'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'V'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x92		;LCD position
    MOVWF PORTB
    CALL exec

    BSF PORTA,0		;data mode
    CALL time

    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'J'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'G'
    MOVWF PORTB
    CALL exec

    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD2		;LCD position
    MOVWF PORTB
    CALL exec

    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
   
    BCF PORTC, 0
    BSF PORTC, 1  
    BTFSC PORTD, 1
    RETURN
    CALL DELAY5S
 
PASSWORD:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x90		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'P'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'W'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    RETURN
 
OCULTAR:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC8		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
CLAVE:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'L'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'V'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec
   
    RETURN 
    
POS1:    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC8		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    RETURN
    
POS2:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD8		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    RETURN
    
    
ENTRY:
    CALL POS1
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF p1
    
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF p2
   
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF p3
    
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF p4
   
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF p5
    
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF p6 
    
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF p7
    
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF p8
   
    RETURN
    
GUARDADO:
    
    CALL POS2
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF x1
   
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF x2
    
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF x3
    
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF x4
    
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF x5
   
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF x6
   
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF x7
    
    CALL SCAN
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF x8
    
    RETURN
    
SCAN:    
    BCF ban, 0
    
    BSF PORTC, 0     
    BTFSC PORTD, 0
    CALL UNO ;Se oprimió 1
    
    BCF PORTC, 0
    
    BSF PORTC, 1   
    BTFSC PORTD, 0
    CALL DOS ;Se oprimió dos
    
    BCF PORTC, 1
    
    BSF PORTC, 2   
    BTFSC PORTD, 0
    CALL TRES ;Se oprimió tres
    
    BCF PORTC, 2
    
    BSF PORTC, 0   
    BTFSC PORTD, 1
    CALL CUATRO ;Se oprimió CUATRO
    
    BCF PORTC, 0
    
    BSF PORTC, 1   
    BTFSC PORTD, 1
    CALL CINCO ;Se oprimió CINCO
    
    BCF PORTC, 1
    
    BSF PORTC, 2   
    BTFSC PORTD, 1
    CALL SEIS ;Se oprimió SEIS
    
    BCF PORTC, 2
    
    BSF PORTC, 0   
    BTFSC PORTD, 2
    CALL SIETE ;Se oprimió SIETE
    
    BCF PORTC, 0
    
    BSF PORTC, 1   
    BTFSC PORTD, 2
    CALL OCHO ;Se oprimió OCHO
    
    BCF PORTC, 1
    
    BSF PORTC, 2   
    BTFSC PORTD, 2
    CALL NUEVE ;Se oprimió NUEVE
    
    BCF PORTC, 2
    
    BSF PORTC, 0   
    BTFSC PORTD, 3
    CALL AST ;Se oprimió ASTERISCO
    
    BCF PORTC, 0
    
    BSF PORTC, 1   
    BTFSC PORTD, 3
    CALL ZERO ;Se oprimió CERO
    
    BCF PORTC, 1
    
    BSF PORTC, 2   
    BTFSC PORTD, 3
    CALL GATO ;Se oprimió GATO
    
    BCF PORTC, 2
    
    RETURN

UNO:     
    MOVLW b'00000001'
    MOVWF aux
    
    MOVLW '1'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 0
    GOTO $-1
    RETURN  
    
DOS: 
    MOVLW b'00000010'
    MOVWF aux
    
    MOVLW '2'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 0
    GOTO $-1
    RETURN
TRES:     
    MOVLW b'00000011'
    MOVWF aux
    
    MOVLW '3'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 0
    GOTO $-1
    RETURN  
    
CUATRO: 
    MOVLW b'00000100'
    MOVWF aux
    
    MOVLW '4'
    MOVWF PORTB
    CALL exec
        
    BSF ban, 0
    
    BTFSC PORTD, 1
    GOTO $-1
    RETURN
    
CINCO:     
    MOVLW b'00000101'
    MOVWF aux
    
    MOVLW '5'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 1
    GOTO $-1
    RETURN  
    
SEIS: 
    MOVLW b'00000110'
    MOVWF aux
    
    MOVLW '6'
    MOVWF PORTB
    
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 1
    GOTO $-1
    RETURN

SIETE:     
    MOVLW b'00000111'
    MOVWF aux
    
    MOVLW '7'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 2
    GOTO $-1
    RETURN  
    
OCHO: 
    MOVLW b'00001000'
    MOVWF aux
    
    MOVLW '8'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 2
    GOTO $-1
    RETURN

NUEVE: 
    MOVLW b'00001001'
    MOVWF aux
    
    MOVLW '9'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 2
    GOTO $-1
    RETURN
    
ZERO: 
    MOVLW b'00000000'
    MOVWF aux
    
    MOVLW '0'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 3
    GOTO $-1
    RETURN

GATO:
    CALL ERRONEO
    CLRF ban
    CLRF carr
    CLRF x1
    CLRF x2
    CLRF x3
    CLRF x4
    CLRF x5
    CLRF x6
    CLRF x7
    CLRF x8
    GOTO FLEX

AST:
    RETURN
    
ERRONEO:    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD8		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    RETURN
    
reset:
    CALL clear
    CALL PASSWORD
    CALL CLAVE
    CALL OCULTAR
    GOTO GUARDADO
    RETURN
   

hide:
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
   
    RETURN
OPC:
    BTFSS aux, 0
    RLF bin, 0
    RLF bin, 1
    
    RETURN
        
COMP:
    
    MOVFW p1
    MOVWF aux
    XORWF x1,W
    BTFSS STATUS,Z
    CALL DENEGADO
    
    MOVFW p2
    MOVWF aux
    XORWF x2,W
    BTFSS STATUS,Z
    CALL DENEGADO
    
    MOVFW p3
    MOVWF aux
    XORWF x3,W
    BTFSS STATUS,Z
    CALL DENEGADO
    
    MOVFW p4
    MOVWF aux
    XORWF x4,W
    BTFSS STATUS,Z
    CALL DENEGADO
    
    MOVFW p5
    MOVWF aux
    XORWF x5,W
    BTFSS STATUS,Z
    CALL DENEGADO
    
    MOVFW p6
    MOVWF aux
    XORWF x6,W
    BTFSS STATUS,Z
    CALL DENEGADO
    
    MOVFW p7
    MOVWF aux
    XORWF x7,W
    BTFSS STATUS,Z
    CALL DENEGADO
    
    MOVFW p8
    MOVWF aux
    XORWF x8,W
    BTFSS STATUS,Z
    CALL DENEGADO
    CALL PERMITIDO
    
    RETURN
  
PERMITIDO:
    
    CALL clear
    PERMITIDO2:
	MOVLW b'00000001'
	MOVWF PORTE
	
	BCF PORTA,0		;command mode
	CALL time
	
	MOVLW 0xC1		;LCD position
	MOVWF PORTB
	CALL exec
	
	BSF PORTA,0		;data mode
	CALL time
	
	MOVLW 'P'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'A'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'S'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'E'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'L'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'E'
	MOVWF PORTB
	CALL exec
	
	MOVLW ' '
	MOVWF PORTB
	CALL exec
	
	MOVLW 'U'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'S'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'T'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'E'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'D'
	MOVWF PORTB
	CALL exec

	BCF PORTA,0		;command mode
	CALL time

	MOVLW 0x91		;LCD position
	MOVWF PORTB
	CALL exec

	BSF PORTA,0		;data mode
	CALL time

	MOVLW 'B'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'E'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'N'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'V'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'E'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'N'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'U'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'T'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'E'
	MOVWF PORTB
	CALL exec
    
	BSF PORTC, 0     
        BTFSC PORTD, 3 
        GOTO reset
        GOTO PERMITIDO2
        
    
DENEGADO:
    
    CALL clear
    
    DENEGADO1: 
	MOVLW b'00000010'
	MOVWF PORTE
    
	BCF PORTA,0		;command mode
	CALL time
	
	MOVLW 0xC1		;LCD position
	MOVWF PORTB
	CALL exec
	
	BSF PORTA,0		;data mode
	CALL time
	
	MOVLW 'N'
	MOVWF PORTB
	CALL exec
	MOVLW 'E'
	MOVWF PORTB
	CALL exec
	MOVLW 'L'
	MOVWF PORTB
	CALL exec
	MOVLW ' '
	MOVWF PORTB
	CALL exec
	MOVLW 'P'
	MOVWF PORTB
	CALL exec
	MOVLW 'A'
	MOVWF PORTB
	CALL exec
	MOVLW 'S'
	MOVWF PORTB
	MOVLW 'T'
	MOVWF PORTB
	CALL exec
	MOVLW 'E'
	MOVWF PORTB
	CALL exec
	MOVLW 'L'
	MOVWF PORTB
	CALL exec

	BCF PORTA,0		;command mode
	CALL time

	MOVLW 0x91		;LCD position
	MOVWF PORTB
	CALL exec

	BSF PORTA,0		;data mode
	CALL time

	MOVLW 'S'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'A'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'Q'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'U'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'E'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'S'
	MOVWF PORTB
	CALL exec
	
	MOVLW 'E'
	MOVWF PORTB
	CALL exec

	BSF PORTC, 0     
	BTFSC PORTD, 3
	GOTO reset
	GOTO DENEGADO1  
    
LCDPOS:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x88		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    RETURN
   
exec

    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    RETURN
    
time
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo    
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN
    
clear
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    RETURN
    
DELAY5S:
    movlw d'37' ;establecer valor de la variable k
    movwf m
mloop:
    decfsz m,f
    goto mloop
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    movlw d'239' ;establecer valor de la variable i
    movwf y
iloop:
    nop ;NOPs de relleno (ajuste de tiempo)
    movlw d'235' ;establecer valor de la variable j
    movwf t
jloop:
    nop ;NOPs de relleno (ajuste de tiempo)
    movlw d'28' ;establecer valor de la variable k
    movwf k
kloop:
    decfsz k,f
    goto kloop
    decfsz t,f
    goto jloop
    decfsz y,f
    goto iloop
    
    RETURN
    
    END