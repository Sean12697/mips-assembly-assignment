.data
inputText:  .asciiz "Please enter a three digit number (900-999): "
timeElapsed: .asciiz "\nTime Elapsed (in Miliseconds): "

.text
#Get Number Text
li $v0, 4 #Load a string
la $a0, inputText #Puts string declared into index a0
syscall #Prints

#Gets Number
li $v0, 5 #Get integer type
syscall #Gets
move $t1, $v0 #Move input to stored index

#Get start time
li $v0, 30 #gets a 64-bit timestamp
syscall
move $t6, $a0 #Move time to $t7

loop:
    bgt $t3, $t1, display #if t3 reg is the user input, move to display method
    addi $t3, $t3, 1 #adds 1 to t3 reg each loop
    li $t4, 0
    
    loop2:
        bgt $t4, 10, loop 
        addi $t4, $t4, 1 
        li $t5, 0
        
        loop3:
            bgt $t5, 500, loop2 
            addi $t5, $t5, 1 
    
            #Multiply ID
            li $t2, 7
            div $t1, $t2
            mflo $t0 #Move result to t0 reg'
                   
            j loop3
    
display:

    #Get end time
    li $v0, 30 #gets a 64-bit timestamp
    syscall
    move $t7, $a0 #Move time to $t7

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
    sub $a0, $t7, $t6
    syscall #Shows