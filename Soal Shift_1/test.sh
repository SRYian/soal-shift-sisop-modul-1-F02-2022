# # sudo install zip dulu


# username="dummy"
# password="dummy"
# dt=$(date '+%Y-%m-%d');
# foldername=$dt\_$username
# read n
# if [ -f "$foldername.zip" ]; then
#     echo "$foldername exists."
#     unzip -P $password $foldername.zip
#     # resume the loop to add
# start=$(ls $foldername| wc -l)
#     for ((num=$start; num<=($n+$start); num++))
#     do
#         curl https://loremflickr.com/320/240 -L -o $foldername/PIC_"0$num".jpeg 
#     done
#     zip -P $password -r $foldername.zip $dt\_$username
# else 
#     echo "$foldername does not exist."
#     mkdir $foldername
#     for ((num=1; num<=$n; num++))
#     do
#         curl https://loremflickr.com/320/240 -L -o $foldername/PIC_"0$num".jpeg 
#     done
# fi



filelog=log.txt

# # echo $password

select command in att dl
do
  case $command in
    att)
      echo "Maaf, habis"
      grep -o "Bapaklo" "$filelog" | wc -l
    ;;
    dl)
      read n
      echo $n
    ;;
    *) echo "Tidak ada di daftar menu"
    ;;
  esac
done
