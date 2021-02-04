#define parallelExec_servers  3

// https://github.com/future-architect/vuls/blob/d6435d2885b5c0da1bc0f4eecc8f2f601e817b66/scan/executil.go#L75
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



init { 
	Chandef resChan;
	int num_msgs = 0;
	bool state = false;
	int i;
	int servers = parallelExec_servers;
	

	if
	:: servers > 0 -> 
		resChan.size = servers;
		run AsyncChan(resChan)
	:: else -> 
		run sync_monitor(resChan)
	fi;
		for(i : 0.. servers-1) {
		for10: skip;
		run go_Anonymous0(resChan);
		for10_end: skip
	};
	for10_exit: skip;
	

	if
	:: 0 != -2 && servers-1 != -3 -> 
				for(i : 0.. servers-1) {
			for20770: skip;
			do
			:: resChan.async_rcv?state,num_msgs -> 
				break
			:: resChan.sync?state,num_msgs -> 
				break
			:: true -> 
				break
			od;
			for20_end770: skip
		};
		for20_exit770: skip
	:: else -> 
		do
		:: true -> 
			for20: skip;
			do
			:: resChan.async_rcv?state,num_msgs -> 
				break
			:: resChan.sync?state,num_msgs -> 
				break
			:: true -> 
				break
			od;
			for20_end: skip
		:: true -> 
			break
		od;
		for20_exit: skip
	fi;
	goto stop_process;
	resChan.closing!true
stop_process:skip
}

proctype go_Anonymous0(Chandef resChan) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		

		if
		:: resChan.async_send!0;
		:: resChan.sync!false,0 -> 
			resChan.sending?state
		fi
	:: true -> 
		

		if
		:: resChan.async_send!0;
		:: resChan.sync!false,0 -> 
			resChan.sending?state
		fi
	fi;
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

