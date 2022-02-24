#!/bin/bash
fileuser=users/user.txt
filelog=log.txt
dt=$(date '+%d/%m/%Y %H:%M:%S');

echo "Please enter your username";
read username;

# check if user exist
if grep -q $username "$fileuser"; 
then
    # write this to file
    echo "-ERROR-"
    echo "$dt REGISTER: ERROR User already exists" >> "$filelog" 
else
    echo "Please enter your password";
    # use before pass to hide -s
    read -s pass;
    LEN=${#pass}
    # echo $LEN
    if  [[ $pass =~ [0-9] ]] && [[ $pass =~ [a-z] ]] && [[ $pass =~ [A-Z] ]] && [[ "$LEN" -ge 8 ]] && [[ $pass != $username ]]; 
    then        
        # write this to file
        echo "REGISTRATION SUCCESS!!"
        echo "$dt REGISTER:INFO User $username registered successfully" >> "$filelog" 
        echo "$username-$pass" >> "$fileuser"
    else
        echo "Password must be alphanumeric and a minimum of 8 chacarters"
    fi 
fi






# function validatePassword ()
# {           
#     local stat=1    #assigns 1 to (stat)
#     local pass=$1
#     LEN=${#pass}    #counts each character in the password length
#     echo $LEN       #Prints string length
#                         #checks for nums        chesks for lowercase    checks for uppercase            checks if pass is greater than 8
#     if  [[ $pass =~ [0-9] ]] && [[ $pass =~ [a-z] ]] && [[ $pass =~ [A-Z] ]]  && [[ "$LEN" -ge 8 ]]; then 
#                     stat=$?         #return 1 for false
#     fi  
#     return $stat
# } 