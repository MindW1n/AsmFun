;
; Gets a string that is the
; flipped integer portion of a number in rax. Serves 
; for the function _intToString. It also
; can be used for number systems conversion if 
; you want it to. In order to flip the reseived from this
; function string use _flipString (check the 64-bit documentation).
;
; Input:
; 	- rax as an integer 
;
;	- rdi as a pointer to string
;
;	- rbx is a devider
;	(for decimal it must be 10)
;
; Output:
;	- rdx is modified
;
; 	- rdi points to the end
;	of the destination string	
;
; 	- rax equals to 0
;
;	- string being pointed to
; 	by rdi is modified
;
;	- rbx remains the same
;
_assignFlippedIntegerPortion:
        xor rdx, rdx
        div rbx

	cmp dl, 10
	ja _assignFlippedIntegerPortionElse

      ; _assignFlippedIntegerPortionIf:
		add dl, 48
		jmp _assignFlippedIntegerPortionAfter

	_assignFlippedIntegerPortionElse:
		add dl, 55	

	_assignFlippedIntegerPortionAfter:
        	mov [rdi], dl
        	inc rdi
        	cmp rax, 0
        	jne _assignFlippedIntegerPortion
        	ret
