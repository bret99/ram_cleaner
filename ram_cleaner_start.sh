notify() {
    notify-send "Memory message" -t 5000 "$1"
}

while true 
do
    RAM_BEFORE=$(free -m|grep Mem|awk '{print $4}')
    sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
    RAM_AFTER=$(free -m|grep Mem|awk '{print $4}')
    RAM_RESQUE=$(($RAM_AFTER - $RAM_BEFORE))
    notify "RAM resqued is $RAM_RESQUE Mbs"
    sleep 120.0
done



