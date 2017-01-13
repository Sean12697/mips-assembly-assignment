.data
name: .space 15

enterName: .asciiz "What is your name?: "
enterNumber: .asciiz "What are the last four digits of your Student ID?: "

resultName: .asciiz "Your name is: "
resultNumber: .asciiz "Your last four digits are: "

.text

#Name
li $v0, 4 #Load a string
la $a0, enterName #Puts string declared into index a0
syscall #Prints

li $v0, 8 #Load String
la $a0, name
li $a1, 15 #Max size of 15
syscall

#ID
li $v0, 4 #Load a string
la $a0, enterNumber #Puts string declared into index a0
syscall #Prints

li $v0, 5 #Get integer type
syscall #Gets

move $t0, $v0 #Move input to stored index

#Display

#Name
li $v0, 4 #Loads a string
la $a0, resultName
syscall

li $v0, 4 #Load string type
la $a0, name #Moves name into display index
syscall #Shows

#ID
li $v0, 4 #Loads a string type
la $a0, resultNumber
syscall

li $v0, 1 #Load number
move $a0, $t0 #Moves input into display index
syscall #Shows
