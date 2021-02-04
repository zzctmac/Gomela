
// https://github.com/perkeep/perkeep/blob/40f12e532cba9a2b236a413d486c7ab0a6768672/pkg/blobserver/encrypt/meta.go#L242
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
	Chandef enumErrc;
	Chandef stopEnumerate;
	Chandef gate;
	Chandef metac;
	int num_msgs = 0;
	bool state = false;
	int i;
	

	if
	:: 16 > 0 -> 
		metac.size = 16;
		run AsyncChan(metac)
	:: else -> 
		run sync_monitor(metac)
	fi;
	

	if
	:: 5 > 0 -> 
		gate.size = 5;
		run AsyncChan(gate)
	:: else -> 
		run sync_monitor(gate)
	fi;
	run sync_monitor(stopEnumerate);
	

	if
	:: 1 > 0 -> 
		enumErrc.size = 1;
		run AsyncChan(enumErrc)
	:: else -> 
		run sync_monitor(enumErrc)
	fi;
	run go_Anonymous0(metac,gate,stopEnumerate,enumErrc);
	do
	:: true -> 
		

		if
		:: metac.async_rcv?state,num_msgs;
		:: metac.sync?state,num_msgs;
		fi;
		

		if
		:: state && num_msgs <= 0 -> 
			break
		:: else -> 
			for10: skip;
			

			if
			:: true -> 
				stopEnumerate.closing!true;
				goto stop_process
			:: true;
			fi;
			for10_end: skip
		fi
	od;
	for10_exit: skip;
	

	if
	:: enumErrc.async_rcv?state,num_msgs;
	:: enumErrc.sync?state,num_msgs;
	fi;
	goto stop_process
stop_process:skip
}

proctype go_Anonymous0(Chandef metac;Chandef gate;Chandef stopEnumerate;Chandef enumErrc) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Wgdef wg;
	run wgMonitor(wg);
	

	if
	:: enumErrc.async_send!0;
	:: enumErrc.sync!false,0 -> 
		enumErrc.sending?state
	fi;
	wg.Wait?0;
	metac.closing!true;
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

