.text
loop:
    bgt $t3, 999, display #if t3 reg is 999, move to display method
    addi $t3, $t3, 1 #adds 1 to t3 reg each loop
    j loop2
    loop2:
        bgt $t4, 999, loop 
        addi $t4, $t4, 1 
        j loop3
        loop3:
            bgt $t5, 999, loop2 
            addi $t5, $t5, 1 
            j loop4
            loop4:
                bgt $t6, 999, loop3 
                addi $t6, $t6, 1 
                loop5:
                    bgt $t7, 999, loop4 
                    addi $t7, $t7, 1 
    
                    #Multiply ID
                    li $t1, 777
                    li $t2, 7
                    div $t1, $t2
                    mflo $t0 #Move result to t0 reg'
                    
                    j loop5
                j loop4
            j loop3
        j loop2 #jump back to loop method
    j loop
    
display:
    #Display ID
    li $v0, 1 #Load number
    move $a0, $t0 #Moves input into display index
    syscall #Shows
