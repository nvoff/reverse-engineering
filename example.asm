.368
/model flat,stdcall
option casemap :none
include C: \masm32\include\kernel32.inc
include C: \masm32\include\windows.inc
includelib C: \masm32\lib\user32.inc
includelib C: \masm32\lib\kernel32.inc
BSIZE C: equ 10
.data
buf db BSIZE dup(?)
stdout dd ?
stdin dd ?
cRead dd ?
CWritten dd ?

result dd 0,0,0,0,0,0,0,0,0,0,0,0

msg db "Login" (min 10 chars): "
msg2 db "Password"
.code
start:

invoke GetStdHandle, STD_OUTPUT_HANDLE
mov stdout, eax
invoke GetStdHandle, STD_INPUT_HANDLE
mov stdin, eax

invoke WriteConsoleA, stdout, ADDR msg, sizeof msg, ADDR CWritten, 0 ;  Login
invoke ReadConsoleA, stdin, ADDR buf, BSIZE, ADDR cRead, NULL

invoke WriteConsoleA, stdout, ADDR msg2, sizeof msg2, ADDR CWritten, 0 ; Password:
invoke ReadConsoleA, stdout, ADDR result, sizeof result, ADDR CWritten, NULL

invoke ExitProcess, 0 
end start
