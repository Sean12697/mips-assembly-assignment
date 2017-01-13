.data
timeElapsed: .asciiz "\nTime Elapsed (in Miliseconds): "

.text
#Get start time
li $v0, 30 #gets a 64-bit timestamp
syscall
move $t7, $a0 #Move time to $t7

loop:
    bgt $t3, 999999, display #if t3 reg is 999, move to display method
    addi $t3, $t3, 1 #adds 1 to t3 reg each loop
    j loop2
    loop2:
        bgt $t4, 999999, loop 
        addi $t4, $t4, 1 
        j loop3
        loop3:
            bgt $t5, 999999, loop2 
            addi $t5, $t5, 1 
            loop4:
                bgt $t6, 999999, loop2 
                addi $t6, $t6, 1 
    
                #Multiply ID
                li $t1, 777
                li $t2, 7
                div $t1, $t2
                mflo $t0 #Move result to t0 reg'
                
                j loop4    
            j loop3
        j loop2 #jump back to loop method
    j loop
    
display:

    #Get end time
    li $v0, 30 #gets a 64-bit timestamp
    syscall
    move $a1, $a0 #Move time to $a1

    #Display ID
    li $v0, 1 #Load number
    move $a0, $t0 #Moves input into display index
    syscall #Shows
    
    #Display Text
    li $v0, 4 #Loads a string type
    la $a0, timeElapsed
    syscall
    
    #Display Time
    li $v0, 1 #Load number
    sub $a0, $a1, $t7
    syscall #Shows
