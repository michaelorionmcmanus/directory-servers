#!/bin/bash

##
# start|stop|restart python SimpleHTTPServer
#
# TODO:
#	  use shell Function for DRY
# USAGE:
#   ./manage_simplehttpserver.sh start|stop|restart
#
# VIEW:
#   http://localhost:8864

case $1 in
	"start" )
		#echo "start python SimpleHTTPServer"
		nohup python -m SimpleHTTPServer 8864 > /tmp/nohup.out &
		;;
	"stop" )
		#echo "stop python SimpleHTTPServer"
		kill $(ps aux | grep '[p]ython -m SimpleHTTPServer' | awk '{print $2}')
		;;
	"restart" )
		#echo "restart python SimpleHTTPServer"
  	        kill $(ps aux | grep '[p]ython -m SimpleHTTPServer' | awk '{print $2}')
		nohup python -m SimpleHTTPServer 8864 > /tmp/nohup.out &
		;;
	*)
		echo "need start|stop|restart"
		exit 1
esac