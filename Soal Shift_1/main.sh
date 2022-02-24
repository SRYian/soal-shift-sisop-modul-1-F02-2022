fileuser=users/user.txt
filelog=log.txt
dt=$(date '+%d/%m/%Y %H:%M:%S');

echo "Please enter your username";
read username;
echo "Please enter your password";
# -s to ensure password isnt visible
read -s pass;

runprog(){
    local username=$1
    local password=$2
    local dt=$(date '+%Y-%m-%d');
    local foldername=$dt\_$username
    # read how many times the command is going to be run
    local n=$3
    if [ -f "$foldername.zip" ]; then
        echo "$foldername exists."
        unzip -P $password $foldername.zip
        # resume the loop to add
        start=$(ls $foldername| wc -l)
        for ((num=$start; num<=($n+$start); num++))
        do
            curl https://loremflickr.com/320/240 -L -o $foldername/PIC_"0$num".jpeg 
        done
        zip -P $password -r $foldername.zip $dt\_$username
    else 
        echo "$foldername does not exist."
        mkdir $foldername
        for ((num=1; num<=$n; num++))
        do
            curl https://loremflickr.com/320/240 -L -o $foldername/PIC_"0$num".jpeg 
        done
        zip -P $password -r $foldername.zip $dt\_$username
    fi
}

if grep -q "$username-$pass" "$fileuser"; 
then
    # write this to file
    echo "$dt LOGIN: INFO User $username logged in">>"$filelog"
    select command in att dl
    do
    case $command in
        att)
        one=1
        total=$( grep -o "$username" "$filelog" | wc -l )
        let total2=$total-$one
        echo "Total $total2"
        ;;
        dl)
        read n
        runprog $username $pass $n
        ;;
        *) echo "No command of that type exist"
        ;;
    esac
    done
    
else
    echo "$dt LOGIN: ERROR Failed login attempt on $username USERNAME">>"$filelog"
fi




