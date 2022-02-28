echo "Enter the period for memory cleaning in seconds:"
read PERIOD

notify() {
    notify-send "Memory message" -t 5000 "$1"
}

main() {
    while true 
    do
        RAM_BEFORE=$(free -m|grep Mem|awk '{print $4}')
        sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
        RAM_AFTER=$(free -m|grep Mem|awk '{print $4}')
        RAM_RESQUE=$(($RAM_AFTER - $RAM_BEFORE))
        notify "RAM resqued is $RAM_RESQUE Mbs"
        sleep $PERIOD
    done
}

case $PERIOD in
   (*[^0-9]*) echo "\033[1;91mInput is not a number!\033[1;00m" && sleep 3.0;;
   ("") echo "\033[1;91mEmpty input!\033[1;00m" && sleep 3.0;;
   (*) main;;
 esac
