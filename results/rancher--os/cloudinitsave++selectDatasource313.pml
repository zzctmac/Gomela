#define selectDatasource_sources  3

// https://github.com/rancher/os/blob/628e6ab052fca923b73d02ccf173887a2b3bf964/cmd/cloudinitsave/cloudinitsave.go#L313
typedef Chandef {
	chan sync = [0] of {bool,int};
	chan async_send = [0] of {int};
	chan async_rcv = [0] of {bool,int};
	chan sending = [0] of {int};
	chan closing = [0] of {bool};
	int size = 0;
	int num_msgs = 0;
	bool closed = false;
}
typedef Wgdef {
	chan Add = [0] of {int};
	chan Wait = [0] of {int};
	int Counter = 0;}



init { 
	Chandef done;
	Wgdef wg;
	Chandef stop;
	Chandef ds;
	int num_msgs = 0;
	bool state = false;
	int i;
	int sources = selectDatasource_sources;
	run sync_monitor(ds);
	run sync_monitor(stop);
	run wgMonitor(wg);
		for(i : 0.. sources-1) {
		for10: skip;
		wg.Add!1;
		run go_Anonymous0(ds,stop,wg);
		for10_end: skip
	};
	for10_exit: skip;
	run sync_monitor(done);
	run go_Anonymous1(ds,stop,done,wg);
	do
	:: ds.async_rcv?state,num_msgs -> 
		break
	:: ds.sync?state,num_msgs -> 
		break
	:: done.async_rcv?state,num_msgs -> 
		break
	:: done.sync?state,num_msgs -> 
		break
	:: true -> 
		break
	od;
	stop.closing!true;
	goto stop_process
stop_process:skip
}

proctype go_Anonymous0(Chandef ds;Chandef stop;Wgdef wg) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	do
	:: true -> 
		for11: skip;
		

		if
		:: true -> 
			

			if
			:: ds.async_send!0;
			:: ds.sync!false,0 -> 
				ds.sending?state
			fi;
			goto stop_process
		:: true;
		fi;
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
		do
		:: stop.async_rcv?state,num_msgs -> 
			goto stop_process
		:: stop.sync?state,num_msgs -> 
			goto stop_process
		:: true -> 
			break
		od;
		for11_end: skip
	od;
	for11_exit: skip;
	stop_process: skip;
	wg.Add!-1
}
proctype go_Anonymous1(Chandef ds;Chandef stop;Chandef done;Wgdef wg) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	wg.Wait?0;
	done.closing!true;
	stop_process: skip
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
proctype AsyncChan(Chandef ch) {
do
:: true ->
if
:: ch.closed -> 
end: if
  :: ch.async_send?0-> // cannot send on closed channel
    assert(false)
  :: ch.closing?true -> // cannot close twice a channel
    assert(false)
  :: ch.sending!true -> // sending state of channel (closed)
    assert(false)
  :: ch.sync!true,ch.num_msgs -> // can always receive on a closed chan
		 ch.num_msgs = ch.num_msgs - 1
  fi;
:: else ->
	if
	:: ch.num_msgs == ch.size ->
		end1: if
		  :: ch.async_rcv!false,ch.num_msgs ->
		    ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		      ch.closed = true
		  :: ch.sending!false;
		fi;
	:: ch.num_msgs == 0 -> 
end2:		if
		:: ch.async_send?0 -> // a message has been received
			ch.num_msgs = ch.num_msgs + 1
		:: ch.closing?true -> // closing the channel
			ch.closed = true
		:: ch.sending!false;
		fi;
		:: else -> 
		end3: if
		  :: ch.async_send?0->
		     ch.num_msgs = ch.num_msgs + 1
		  :: ch.async_rcv!false,ch.num_msgs
		     ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		      ch.closed = true
		  :: ch.sending!false;  // sending channel is open
		fi;
	fi;
fi;
od;
}

proctype sync_monitor(Chandef ch) {
do
:: true
if
:: ch.closed ->
end: if
  :: ch.async_send?0-> // cannot send on closed channel
    assert(false)
  :: ch.closing?true -> // cannot close twice a channel
    assert(false)
  :: ch.sending!true -> // sending state of channel (closed)
    assert(false)
  :: ch.sync!true,0; // can always receive on a closed chan
  fi;
:: else -> 
end1: if
    :: ch.sending!false;
    :: ch.closing?true ->
      ch.closed = true
    fi;
fi;
od
stop_process:
}

proctype wgMonitor(Wgdef wg) {
bool closed;
int i;
bool state;
do
	:: wg.Add?i ->
		wg.Counter = wg.Counter + i;
		assert(wg.Counter >= 0)
	:: wg.Counter == 0 ->
end: if
		:: wg.Add?i ->
			wg.Counter = wg.Counter + i;
			assert(wg.Counter >= 0)
		:: wg.Wait!0;
	fi
od
}

