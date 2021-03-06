#!/usr/bin/python
__author__ = 'weizijun.mike'

import os
import sys

if __name__ == "__main__" :
    path = os.getcwd()
    if path == "/app/TradeCenter" :
        port = 10118
    elif path == "/app/wooolTradeCenter" :
        port = 10119
    elif path == "/app/labaTradeCenter":
        port = 10123

    port = sys.argv[1]

    command_chmod = "chmod 777 TradeCenter"
    chmod_result = os.popen(command_chmod).readlines()
    print "chmod_result:"
    print chmod_result

    command_netstat = "netstat -tlnp"
    netstat_result = os.popen(command_netstat).readlines()

    right_line = ""
    for line in netstat_result :
        if line.find("0.0.0.0:"+port) != -1 :
            right_line = line
            break

    if right_line != "" :
        split_arr = right_line.split()
        i = 0
        for split_unit in split_arr :
            if (split_unit == "LISTEN") :
                break
            else :
                i += 1

        process_str = split_arr[i+1]
        process_arr = process_str.split("/")
        process_id = process_arr[0]

        print "process_id:"
        print process_id

        command_kill = "kill -9 "+process_id
        kill_result = os.popen(command_kill).readlines()
        print "kill_result:"
        print kill_result
    else :
        print "the process is not running"

    command_run  = "./TradeCenter --nochdir --daemon";
    run_result = os.popen(command_run).readlines()
    print "run_result:"
    print run_result

    command_netstat = "netstat -tlnp"
    netstat_result = os.popen(command_netstat).readlines()

    right_line = ""
    for line in netstat_result :
        if line.find("0.0.0.0:"+port) != -1 :
            right_line = line
            break

    if right_line != "" :
        split_arr = right_line.split()
        i = 0
        for split_unit in split_arr :
            if (split_unit == "LISTEN") :
                break
            else :
                i += 1

        process_str = split_arr[i+1]
        process_arr = process_str.split("/")
        process_id = process_arr[0]

        print "new process_id:"
        print process_id
    else :
        print "the new process is not running"
