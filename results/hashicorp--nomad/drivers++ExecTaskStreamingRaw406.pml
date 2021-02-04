
// https://github.com/hashicorp/nomad/blob/bcd4752fc902a785aad603b2819b9630a83ba913/plugins/drivers/client.go#L406
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
	Chandef errCh;
	int num_msgs = 0;
	bool state = false;
	int i;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: 1 > 0 -> 
		errCh.size = 1;
		run AsyncChan(errCh)
	:: else -> 
		run sync_monitor(errCh)
	fi;
	run go_Anonymous0(errCh);
	do
	:: true -> 
		for20: skip;
		do
		:: errCh.async_rcv?state,num_msgs -> 
			goto stop_process
		:: errCh.sync?state,num_msgs -> 
			goto stop_process
		:: true;
		od;
		

		if
		:: true -> 
			goto stop_process
		:: true -> 
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi
		fi;
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
		for20_end: skip
	od;
	for20_exit: skip
stop_process:skip
}

proctype go_Anonymous0(Chandef errCh) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	do
	:: true -> 
		for10: skip;
		

		if
		:: true -> 
			goto stop_process
		:: true -> 
			

			if
			:: true -> 
				

				if
				:: errCh.async_send!0;
				:: errCh.sync!false,0 -> 
					errCh.sending?state
				fi;
				goto stop_process
			:: true;
			fi
		fi;
		

		if
		:: true -> 
			

			if
			:: errCh.async_send!0;
			:: errCh.sync!false,0 -> 
				errCh.sending?state
			fi;
			goto stop_process
		:: true;
		fi;
		for10_end: skip
	od;
	for10_exit: skip;
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

