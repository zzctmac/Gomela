
// https://github.com/kubernetes/contrib/blob/89f6948e24578fed2a90a87871b2263729f90ac3/scale-demo/Godeps/_workspace/src/k8s.io/kubernetes/pkg/client/unversioned/portforward/portforward.go#L244
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
	Chandef remoteDone;
	Chandef localError;
	Chandef errorChan;
	int num_msgs = 0;
	bool state = false;
	int i;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run sync_monitor(errorChan);
	run go_Anonymous0(errorChan);
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run sync_monitor(localError);
	run sync_monitor(remoteDone);
	run go_Anonymous1(errorChan,localError,remoteDone);
	run go_Anonymous2(errorChan,localError,remoteDone);
	do
	:: remoteDone.async_rcv?state,num_msgs -> 
		break
	:: remoteDone.sync?state,num_msgs -> 
		break
	:: localError.async_rcv?state,num_msgs -> 
		break
	:: localError.sync?state,num_msgs -> 
		break
	od;
	

	if
	:: errorChan.async_rcv?state,num_msgs;
	:: errorChan.sync?state,num_msgs;
	fi
stop_process:skip
}

proctype go_Anonymous0(Chandef errorChan) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		

		if
		:: errorChan.async_send!0;
		:: errorChan.sync!false,0 -> 
			errorChan.sending?state
		fi
	:: true -> 
		

		if
		:: errorChan.async_send!0;
		:: errorChan.sync!false,0 -> 
			errorChan.sending?state
		fi
	fi;
	errorChan.closing!true;
	stop_process: skip
}
proctype go_Anonymous1(Chandef errorChan;Chandef localError;Chandef remoteDone) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	remoteDone.closing!true;
	stop_process: skip
}
proctype go_Anonymous2(Chandef errorChan;Chandef localError;Chandef remoteDone) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		localError.closing!true
	:: true;
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

