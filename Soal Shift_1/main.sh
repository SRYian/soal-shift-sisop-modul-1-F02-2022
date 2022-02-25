#!/bin/bash
fileuser=users/user.txt
filelog=log.txt
dt=$(date '+%d/%m/%Y %H:%M:%S');

# Prompt a login
echo "Please enter your username";
read username;
echo "Please enter your password";
# -s to ensure password isnt visible
read -s pass;

runprog(){
    #Pass username, password to local var   
    local username=$1
    local password=$2
    #get the current date and store in a variable, same goes for the folder name     
    local dt=$(date '+%Y-%m-%d');
    local foldername=$dt\_$username
    # read how many times the command is going to be run
    local n=$3
    if [ -f "$foldername.zip" ]; then
        # Flow: Unzip->add more files to the folder->zip again
        echo "$foldername exists."
        unzip -P $password $foldername.zip
        # resume the loop to add
        start=$(ls $foldername| wc -l)
        # continue file numbering, ex: if we left off at 05, next will be 06         
        for ((num=$start; num<=($n+$start); num++))
        do
            #download the file using curl and name it according to the format
            #-L to handle web redirect and -o to save as
            curl https://loremflickr.com/320/240 -L -o $foldername/PIC_"0$num".jpeg 
        done
        #rezip with the password accordingly
        # -P to add password, -r to recursively go into the child folders         
        zip -P $password -r $foldername.zip $dt\_$username
    else 
        echo "$foldername does not exist."
        # Create a new folder with mkdir
        mkdir $foldername
        #start file numbering from 0 to n using a for loop
        for ((num=1; num<=$n; num++))
        do
            #download the file using curl
            curl https://loremflickr.com/320/240 -L -o $foldername/PIC_"0$num".jpeg 
        done
        # zip with the password accordingly
        zip -P $password -r $foldername.zip $dt\_$username
    fi
}
# First, check if username-password string exist
# if it does, login is successful
if grep -q "$username-$pass" "$fileuser"; 
then
    # write this to log file
    echo "$dt LOGIN: INFO User $username logged in">>"$filelog"
    # Select loop for  
    select command in att dl
    do
    case $command in
        att)   
        one=1
        #using grep to find and pipe the output to wc to count lines        
        total=$( grep -o "$username" "$filelog" | wc -l )
        # Decrement 1 from thr total login attempt log, because 1 is the register message     
        let total2=$total-$one
        echo "Total $total2"
        ;;
        dl)
        # read and run the complex zipping function        
        read n
        runprog $username $pass $n
        ;;
        # If the command does not exist
        *) echo "No command of that type exist"
        ;;
    esac
    done
# If the login fails
else
    echo "$dt LOGIN: ERROR Failed login attempt on $username USERNAME">>"$filelog"
fi




