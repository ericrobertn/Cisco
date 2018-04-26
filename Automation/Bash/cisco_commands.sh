#!/usr/bin/expect -f
        set timeout 20
        set IPaddress [lindex $argv 0]
        set Username "%USERNAME%"  ##USERNAME HERE
        set Password "%PASSWORD%"  ##PASSWORD HERE
        set Directory /home/Desktop/logs
        log_file -a $Directory/session_$IPaddress.log
        send_log "### /START-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
        spawn ssh -o "StrictHostKeyChecking no" $Username@$IPaddress
        expect "*assword: "
        send "$Password\r"
        expect ">"
        send "en\r"
        expect "*assword: "
        send "$Password\r"
        expect "#"
        send "conf t\r"
        expect "(config)#"
        send "%COMMAND TO RUN%\r"  ##COMMAND TO RUN HERE
        send "exit"
        expect "#"
        send "wr mem\r"
        expect "#"
        send "exit\r"
        sleep 1
        send_log "\r### /END-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
exit
