ps -aux|grep ram_cl|awk '{print $2}'|xargs sudo kill 9
