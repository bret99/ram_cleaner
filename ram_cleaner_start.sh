sudo sh -c 'echo "Enter the period for memory cleaning in seconds:"'
read PERIOD

main() {
    while true 
    do
        RAM_BEFORE=$(free -m|grep Mem|awk '{print $4}')
        sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
        RAM_AFTER=$(free -m|grep Mem|awk '{print $4}')
        RAM_RESQUE=$(($RAM_AFTER - $RAM_BEFORE))
        echo -e "RAM resqued is \033[1;92m$RAM_RESQUE Mbs \033[1;00mat \033[1;90m$(date)\033[1;00m"
        sleep $PERIOD
    done
}

case $PERIOD in
   (*[^0-9]*) echo "\033[1;91mInput is not a number!\033[1;00m" && sleep 3.0;;
   ("") echo "\033[1;91mEmpty input!\033[1;00m" && sleep 3.0;;
   (*) main;;
 esac
