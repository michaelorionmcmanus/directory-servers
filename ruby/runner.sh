#!/bin/bash

##
# start|stop|restart WEBRick Server
#
# TODO:
#	  use shell Function for DRY
# USAGE:
#   ./runner.sh start|stop|restart
#
# VIEW:
#   http://localhost:8989

case $1 in
	"start" )
		#echo "start webrick"
		./runner.sh > /dev/null 2>&1 &
		;;
	"stop" )
		#echo "stop webrick"
		kill -s 9 $(ps aux | grep '[r]uby ./runner.sh' | awk '{print $2}')
		;;
	"restart" )
		#echo "restart webrick"
  	        kill -s 9 $(ps aux | grep '[r]uby ./runner.sh' | awk '{print $2}')
		./runner.sh > /dev/null 2>&1 &
		;;
	*)
		echo "need start|stop|restart"
		exit 1
esac