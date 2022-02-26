#!/bin/bash

# prepare userlog, user list data, and datetime
fileuser=users/user.txt
filelog=log.txt
dt=$(date '+%d/%m/%Y %H:%M:%S');

echo "REGISTRATION";
# Prompt to enter username
echo "Please enter your username";
read username;

# check if user exist using grep, -q to search a specific substring
if grep -q $username "$fileuser"; 
then
    # write this to file, that the user already exist
    echo "-ERROR-"
    echo "$dt REGISTER: ERROR User already exists" >> "$filelog" 
else
    #prompt the password     
    echo "Please enter your password";
    # use before pass to hide -s
    read -s pass;
    LEN=${#pass}
    # check if it is alphanumeric, has capital and not the same with the username
    if  [[ $pass =~ [0-9] ]] && [[ $pass =~ [a-z] ]] && [[ $pass =~ [A-Z] ]] && [[ "$LEN" -ge 8 ]] && [[ $pass != $username ]]; 
    then        
        # Write to file that the username and password has been registered
        echo "REGISTRATION SUCCESS!!"
        echo "$dt REGISTER:INFO User $username registered successfully" >> "$filelog"
        #UNSAFE to do in regular practice, write the username and password to a file, separated by -
        #UNENCRYPTEDBTW
        echo "$username-$pass" >> "$fileuser"
    else
        #If the password doesnt meet the requirement
        echo "Password must be alphanumeric and a minimum of 8 chacarters"
    fi 
fi
