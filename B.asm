.data
enterNumber: .asciiz "What are the last four digits of your Student ID?: "
resultNumber: .asciiz "\n Your last four digits are: "

.text
#Get ID
li $v0, 4 #Load a string
la $a0, enterNumber #Puts string declared into index a0
syscall #Prints

li $v0, 5 #Get integer type
syscall #Gets

move $t0, $v0 #Move input to stored index


#Multiply ID
li $t2, 2 #Sets 2 in t2 reg'
mult $t0, $t2 #Multiply by 2
mflo $t1 #Move result to t1 reg'

#Loops 4 times, t3 reg 0 to 3lki
loop:
    bgt $t3, 3, exit #if t4 reg is 3, move to exit method
    addi $t3, $t3, 1 #adds 1 to t4 reg each loop
    
    #Display ID
    li $v0, 4 #Loads a string type
    la $a0, resultNumber
    syscall

    li $v0, 1 #Load number
    move $a0, $t1 #Moves input into display index
    syscall #Shows
    
    j loop #jump back to loop method
     
#End of Program
exit:
