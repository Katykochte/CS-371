;This function will print the movements for each muscle
;Takes two inputs

global movements ;rdi has movement ;esi has random int
movements: 
	mov r9, rdi ;transfer movement
	movsxd r10, esi ;transfer rand int and turn into a long
	mov rcx, 1 ;set movement count, final will be 4 
	cmp r9,1
	je hamstring 
	cmp r9,2
	je quad
	cmp r9,3
	je back
	cmp r9,4
	je chest 
	;check against all possible movements
	;error check already in the C++
movesend:
	ret
	
error: ;exits and sends out error message
	extern printf
	mov rdi, errorstring
	call printf
	ret
	
errorstring:
	db `Something went wrong!\n`,0
	
random: 
	shr r10,cl 	;bitshift rand long by movement #
	movsx rax,r10b ;move lowest 8bits of rand long into rax to be returned
	ret

reploop:
	extern printf
	mov rsi, 12 ;set rep # (will count down by 3)
	mov r8, 1 ;set sets # (will count up to 3)
	call reploopin ;using call because need to get back
	ret
reploopin:
	push rcx ;save movement #
	push rdi ;save movement string
	push rsi ;save reps
	push r8 ;save set
	push r10 ;save rand int
	call printf
	pop r10 ;restore saved values
	pop r8
	pop rsi
	pop rdi 
	pop rcx
	add r8, 1 ;iterate sets
	sub rsi, 3 ;iterate reps
	cmp r8, 3 ;check if more sets
	jle reploopin
	ret

hamstring:
	cmp rcx, 1 ;check which movement #
	je hmoves1 ;call hmoves1
	cmp rcx, 2
	je hmoves2 ;call hmoves2
	cmp rcx, 3
	je hmoves3 ;call hmoves4
	cmp rcx, 4
	je hmoves4 ;call hmoves4
hmoveloop:
	add rcx, 1 ;next movement
	cmp rcx, 4
	jle hamstring ;repeat for next movement
	cmp rcx, 5
	jg error ;check for errors
	jmp movesend ;get back to original function to return if done w/ all 4 movements
	
	
hmoves1: ;hamstring movement #1 (same for other 3)
	call random ;get random long will be positive or negative
	cmp rax, 0
	jle hmoves11
	cmp rax, 0
	jg hmoves12
hmoves1end:
	jmp hmoveloop
	
hmoves11: ;hamstring movement #1, first option and string
	mov rdi, hmoves1str1
	call reploop
	jmp hmoves1end
hmoves1str1:
	db `Do %lu repetitions of curtsy lunges \n`,0
	
hmoves12: ;hamstring movement #1, second option and string
	mov rdi, hmoves1str2
	call reploop
	jmp hmoves1end
hmoves1str2:
	db `Do %lu repetitions of deadlifts \n`,0
	
hmoves2: ;same labeling as hmoves1 just with 2
	call random ;grab rand int
	cmp rax, 0
	jle hmoves21
	cmp rax, 0
	jg hmoves22
hmoves2end:
	jmp hmoveloop
	
hmoves21: 
	mov rdi, hmoves2str1
	call reploop
	jmp hmoves2end
hmoves2str1:
	db `Do %lu repetitions of hip thrusts \n`,0
	
hmoves22: 
	mov rdi, hmoves2str2
	call reploop
	jmp hmoves2end
hmoves2str2:
	db `Do %lu repetitions of hamstring curls \n`,0
	
hmoves3: ;same labeling as hmoves1 just with 3
	call random ;grab rand int
	cmp rax, 0
	jle hmoves31
	cmp rax, 0
	jg hmoves32
hmoves3end:
	jmp hmoveloop
	
hmoves31: 
	mov rdi, hmoves3str1
	call reploop
	jmp hmoves3end
hmoves3str1:
	db `Do %lu repetitions of kettlebell swings \n`,0
	
hmoves32: 
	mov rdi, hmoves3str2
	call reploop
	jmp hmoves3end
hmoves3str2:
	db `Do %lu repetitions of good mornings \n`,0

hmoves4: ;same labeling as hmoves1 just with 4
	call random ;grab rand int
	cmp rax, 0
	jle hmoves41
	cmp rax, 0
	jg hmoves42
hmoves4end:
	jmp hmoveloop
	
hmoves41: 
	mov rdi, hmoves4str1
	call reploop
	jmp hmoves4end
hmoves4str1:
	db `Do %lu repetitions of glute bridges \n`,0
	
hmoves42: 
	mov rdi, hmoves4str2
	call reploop
	jmp hmoves4end
hmoves4str2:
	db `Do %lu repetitions of sumo squats \n`,0

quad:
	cmp rcx, 1 ;check which movement #
	je qmoves1 ;call qmoves1
	cmp rcx, 2
	je qmoves2 ;call qmoves2
	cmp rcx, 3
	je qmoves3 ;call qmoves4
	cmp rcx, 4
	je qmoves4 ;call qmoves4
qmoveloop:
	add rcx, 1 ;next movement
	cmp rcx, 4
	jle quad ;repeat for next movement
	cmp rcx, 5
	jg error ;check for errors
	jmp movesend ;get back to original function to return if done w/ all 4 movements
	
qmoves1: ;same labeling concept as hamstrings just with q now
	call random ;get random long will be positive or negative
	cmp rax, 0
	jle qmoves11
	cmp rax, 0
	jg qmoves12
qmoves1end:
	jmp qmoveloop
	
qmoves11: 
	mov rdi, qmoves1str1
	call reploop
	jmp qmoves1end
qmoves1str1:
	db `Do %lu repetitions of goblet squats \n`,0
	
qmoves12: 
	mov rdi, qmoves1str2
	call reploop
	jmp qmoves1end
qmoves1str2:
	db `Do %lu repetitions of side lunges \n`,0
	
qmoves2: 
	call random ;grab rand int
	cmp rax, 0
	jle qmoves21
	cmp rax, 0
	jg qmoves22
qmoves2end:
	jmp qmoveloop
	
qmoves21: 
	mov rdi, qmoves2str1
	call reploop
	jmp qmoves2end
qmoves2str1:
	db `Do %lu repetitions of leg extensions \n`,0
	
qmoves22: 
	mov rdi, qmoves2str2
	call reploop
	jmp qmoves2end
qmoves2str2:
	db `Do %lu repetitions of leg presses \n`,0
	
qmoves3: 
	call random ;grab rand int
	cmp rax, 0
	jle qmoves31
	cmp rax, 0
	jg qmoves32
qmoves3end:
	jmp qmoveloop
	
qmoves31: 
	mov rdi, qmoves3str1
	call reploop
	jmp qmoves3end
qmoves3str1:
	db `Do %lu repetitions of back squats \n`,0
	
qmoves32: 
	mov rdi, qmoves3str2
	call reploop
	jmp qmoves3end
qmoves3str2:
	db `Do %lu repetitions of step ups \n`,0

qmoves4: 
	call random ;grab rand int
	cmp rax, 0
	jle qmoves41
	cmp rax, 0
	jg qmoves42
qmoves4end:
	jmp qmoveloop
	
qmoves41: 
	mov rdi, qmoves4str1
	call reploop
	jmp qmoves4end
qmoves4str1:
	db `Do %lu repetitions of single leg lifts \n`,0
	
qmoves42: 
	mov rdi, qmoves4str2
	call reploop
	jmp qmoves4end
qmoves4str2:
	db `Do %lu repetitions of box jumps \n`,0
	
back: 
	cmp rcx, 1 ;check which movement #
	je bmoves1 ;call bmoves1
	cmp rcx, 2
	je bmoves2 ;call bmoves2
	cmp rcx, 3
	je bmoves3 ;call bmoves4
	cmp rcx, 4
	je bmoves4 ;call bmoves4
bmoveloop:
	add rcx, 1 ;next movement
	cmp rcx, 4
	jle back ;repeat for next movement
	cmp rcx, 5
	jg error ;check for errors
	jmp movesend ;get back to original function to return if done w/ all 4 movements
	
	
bmoves1: ;same labeling concept as hamstrings just with b now
	call random ;get random long will be positive or negative
	cmp rax, 0
	jle bmoves11
	cmp rax, 0
	jg bmoves12
bmoves1end:
	jmp bmoveloop
	
bmoves11: 
	mov rdi, bmoves1str1
	call reploop
	jmp bmoves1end
bmoves1str1:
	db `Do %lu repetitions of T bar rows \n`,0
	
bmoves12: 
	mov rdi, bmoves1str2
	call reploop
	jmp bmoves1end
bmoves1str2:
	db `Do %lu repetitions of pullovers \n`,0
	
bmoves2: 
	call random ;grab rand int
	cmp rax, 0
	jle bmoves21
	cmp rax, 0
	jg bmoves22
bmoves2end:
	jmp bmoveloop
	
bmoves21: 
	mov rdi, bmoves2str1
	call reploop
	jmp bmoves2end
bmoves2str1:
	db `Do %lu repetitions of back extensions \n`,0
	
bmoves22: 
	mov rdi, bmoves2str2
	call reploop
	jmp bmoves2end
bmoves2str2:
	db `Do %lu repetitions of front raises \n`,0
	
bmoves3: 
	call random ;grab rand int
	cmp rax, 0
	jle bmoves31
	cmp rax, 0
	jg bmoves32
bmoves3end:
	jmp bmoveloop
	
bmoves31: 
	mov rdi, bmoves3str1
	call reploop
	jmp bmoves3end
bmoves3str1:
	db `Do %lu repetitions of pull ups \n`,0
	
bmoves32: 
	mov rdi, bmoves3str2
	call reploop
	jmp bmoves3end
bmoves3str2:
	db `Do %lu repetitions of lateral pulldowns \n`,0

bmoves4: 
	call random ;grab rand int
	cmp rax, 0
	jle bmoves41
	cmp rax, 0
	jg bmoves42
bmoves4end:
	jmp bmoveloop
	
bmoves41: 
	mov rdi, bmoves4str1
	call reploop
	jmp bmoves4end
bmoves4str1:
	db `Do %lu repetitions of bent over rows \n`,0
	
bmoves42: 
	mov rdi, bmoves4str2
	call reploop
	jmp bmoves4end
bmoves4str2:
	db `Do %lu repetitions of reverse flys \n`,0
	
chest:
	cmp rcx, 1 ;check which movement #
	je cmoves1 
	cmp rcx, 2
	je cmoves2 
	cmp rcx, 3
	je cmoves3 
	cmp rcx, 4
	je cmoves4 
cmoveloop:
	add rcx, 1 ;next movement
	cmp rcx, 4
	jle chest ;repeat for next movement
	cmp rcx, 5
	jg error ;check for errors
	jmp movesend ;get back to original function to return if done w/ all 4 movements
	
cmoves1: ;same labeling concept as hamstrings just with c now
	call random ;get random long will be positive or negative
	cmp rax, 0
	jle cmoves11
	cmp rax, 0
	jg cmoves12
cmoves1end:
	jmp cmoveloop
	
cmoves11: 
	mov rdi, cmoves1str1
	call reploop
	jmp cmoves1end
cmoves1str1:
	db `Do %lu repetitions of pushdowns \n`,0
	
cmoves12: 
	mov rdi, cmoves1str2
	call reploop
	jmp cmoves1end
cmoves1str2:
	db `Do %lu repetitions of svend presses \n`,0
	
cmoves2: 
	call random ;grab rand int
	cmp rax, 0
	jle cmoves21
	cmp rax, 0
	jg cmoves22
cmoves2end:
	jmp cmoveloop
	
cmoves21: 
	mov rdi, cmoves2str1
	call reploop
	jmp cmoves2end
cmoves2str1:
	db `Do %lu repetitions of cable crossovers \n`,0
	
cmoves22: 
	mov rdi, cmoves2str2
	call reploop
	jmp cmoves2end
cmoves2str2:
	db `Do %lu repetitions of inclined presses \n`,0
	
cmoves3: 
	call random ;grab rand int
	cmp rax, 0
	jle cmoves31
	cmp rax, 0
	jg cmoves32
cmoves3end:
	jmp cmoveloop
	
cmoves31: 
	mov rdi, cmoves3str1
	call reploop
	jmp cmoves3end
cmoves3str1:
	db `Do %lu repetitions of cable flys \n`,0
	
cmoves32: 
	mov rdi, cmoves3str2
	call reploop
	jmp cmoves3end
cmoves3str2:
	db `Do %lu repetitions of tricep dips \n`,0

cmoves4: 
	call random ;grab rand int
	cmp rax, 0
	jle cmoves41
	cmp rax, 0
	jg cmoves42
cmoves4end:
	jmp cmoveloop
	
cmoves41: 
	mov rdi, cmoves4str1
	call reploop
	jmp cmoves4end
cmoves4str1:
	db `Do %lu repetitions of bench press \n`,0
	
cmoves42: 
	mov rdi, cmoves4str2
	call reploop
	jmp cmoves4end
cmoves4str2:
	db `Do %lu repetitions of pushups \n`,0


; This function will calculate some values with given inputs
; BMI = weight in lbs/(height in inches, squared) * 703

global calbmi
calbmi: ;xmm0 has weight, xmm1 has feet, xmm2 has inches (all doubles)
	movsd xmm3, [const1]
	movsd xmm4, [const2]
	mulsd xmm1, xmm3
	addsd xmm1, xmm2 ;xmm1 now has total height in inches
	mulsd xmm1, xmm1 ;squaring height
	divsd xmm0, xmm1 ;dividing by weight by height^2
	mulsd xmm0, xmm4 ;multiplying answer by 703
	cvtsd2si eax, xmm0 ;rounding to nearest whole number
	ret

const1:
	dq 12.0
const2:
	dq 703.0
	
global calorie
calorie: 
;xmm0 has weight, xmm1 has feet, xmm2 has inches, xmm3 has age (all doubles), edi has gender
	cmp edi, 1
	je woman
	cmp edi, 2
	je man
	jmp error
calend:
	ret

woman: ;BMR = 655 + (4.35 x weight in pounds) + (4.7 x height in inches) - (4.7 x age in years)
	movsd xmm4, [wvals] ;load all my constants
	movsd xmm5, [wvals+8]
	movsd xmm6, [wvals+16]
	movsd xmm7, [wvals+24]
	mulsd xmm0, xmm5 ;(4.35 x weight in pounds)
	mulsd xmm1, xmm7 ;cvt ft->in
	addsd xmm2, xmm1 ;total height
	mulsd xmm2, xmm6 ;(4.7 x height in inches)
	mulsd xmm3, xmm6 ;(4.7 x age in years)
	addsd xmm0, xmm4 ;655 + (4.35 x weight in pounds) 
	addsd xmm0, xmm2 ;+ (4.7 x height in inches)
	subsd xmm0, xmm3 ;- (4.7 x age in years)
	jmp calend
	
wvals: ;women constants
	dq 655.0
	dq 4.35
	dq 4.7
	dq 12.0 ;not women specfic just for ft->in

man: ;BMR = 66 + (6.23 x weight in pounds) + (12.7 x height in inches) - (6.8 x age in years)
	movsd xmm4, [mvals] ;load all my constants
	movsd xmm5, [mvals+8]
	movsd xmm6, [mvals+16]
	movsd xmm7, [mvals+24]
	movsd xmm8, [wvals+24]
	mulsd xmm0, xmm5 ;(6.23 x weight in pounds)
	mulsd xmm1, xmm8 ;cvt ft->in
	addsd xmm2, xmm1 ;total height
	mulsd xmm2, xmm6 ;(12.7 x height in inches)
	mulsd xmm3, xmm7 ;(6.8 x age in years)
	addsd xmm0, xmm4 ;66 + (6.23 x weight in pounds)
	addsd xmm0, xmm2 ;+ (12.7 x height in inches)
	subsd xmm0, xmm3 ; - (6.8 x age in years)
	jmp calend

mvals:
	dq 66.0
	dq 6.23
	dq 12.7
	dq 6.8
