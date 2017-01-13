.text
loop:
    addi $sp, $sp, -4 #Allows one store of an entity
    sw $ra, 0($sp) #Stores function address in stack
    
    bgt $t4, 999, display #if t4 reg is 999, move to display method
    addi $t4, $t4, 1 #adds 1 to t4 reg each loop
    
    jal loop2
    
    loop2:
        bgt $t3, 999, $ra #if t3 reg is 999, move to caller
        addi $t3, $t3, 1 #adds 1 to t3 reg each loop
    
        #Multiply ID
        li $t1, 777
        li $t2, 7
        div $t1, $t2
        mflo $t0 #Move result to t0 reg'
    
        jr loop2 #jump back to loop method
    
    lw $ra, 0($sp) #Loads function address in stack
    addi $sp, $sp, 4 #Restores Stack
    
    jr loop
    
display:
    #Display ID
    li $v0, 1 #Load number
    move $a0, $t0 #Moves input into display index
    syscall #Shows
