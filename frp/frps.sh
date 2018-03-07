#!/bin/sh
### BEGIN INIT INFO
# Provides:          frp
# Required-Start:    $network $local_fs $remote_fs
# Required-Stop::    $network $local_fs $remote_fs
# Should-Start:      $all
# Should-Stop:       $all
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: frp-server
# Description:       frp-server
# auther:	     zixijian
# websit:	     github.com/zixijian
### END INIT INFO
FRP=/usr/frp/frps
INI=/usr/frp/frps.ini
do_start()
{
	nohup $FRP -c $INI  > /tmp/frp_run.log 2>&1 &  
}

do_stop()
{
	pkill -f $FRP  
}


#
# Function that sends a SIGHUP to the daemon/service
#
do_restart() {
	do_stop
	sleep 1
	do_start
}

case "$1" in
  start)
	do_start
	;;
  stop)
	do_stop
	;;
  status)
	exit $?
	;;
  reload)
	echo "reload"
	;;
  restart)
	do_restart
	;;
  *)
	echo "Usage: {start|stop|restart|reload}" >&2
	exit 3
	;;
esac

exit 0

