// num_comm_params=1
// num_mand_comm_params=0
// num_opt_comm_params=1

// git_link=https://github.com/golang/go/blob/138d2c9b88d9e3d5adcebf9cb7c356b43d6a9782/runtime/proc_test.go#L541
typedef Chandef {
	chan sync = [0] of {bool};
	chan enq = [0] of {int};
	chan deq = [0] of {bool,int};
	chan sending = [0] of {bool};
	chan rcving = [0] of {bool};
	chan closing = [0] of {bool};
	int size = 0;
	int num_msgs = 0;
	bool closed = false;
}



init { 
	chan child_TestPreemptSplitBig5410 = [1] of {int};
	run TestPreemptSplitBig541(child_TestPreemptSplitBig5410);
	run receiver(child_TestPreemptSplitBig5410)
stop_process:skip
}

proctype TestPreemptSplitBig541(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_big5550 = [1] of {int};
	Chandef stop;
	run sync_monitor(stop);
	run big555(stop,child_big5550);
	run receiver(child_big5550);
	stop.closing!true;
	stop_process: skip;
	child!0
}
proctype big555(Chandef stop;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_bigframe5740 = [1] of {int};
	do
	:: true -> 
		for10: skip;
		run bigframe574(stop,child_bigframe5740);
		child_bigframe5740?0;
		do
		:: stop.deq?state,num_msgs -> 
			goto stop_process
		:: stop.sync?state -> 
			stop.rcving!false;
			goto stop_process
		od;
		for18_exit: skip;
		for10_end: skip
	od;
	for10_exit: skip;
	stop_process: skip;
	child!0
}
proctype bigframe574(Chandef stop;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_small5820 = [1] of {int};
	int x = -2; // opt x
	run small582(stop,x,child_small5820);
	child_small5820?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype small582(Chandef stop;int x;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_nonleaf5980 = [1] of {int};
	run nonleaf598(stop,child_nonleaf5980);
	child_nonleaf5980?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype nonleaf598(Chandef stop;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	do
	:: stop.deq?state,num_msgs -> 
		goto stop_process
	:: stop.sync?state -> 
		stop.rcving!false;
		goto stop_process
	:: true -> 
		goto stop_process
	od;
	for17_exit: skip;
	stop_process: skip;
	child!0
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
  :: ch.num_msgs > 0 -> // cannot send on closed channel
    end4: if
    :: ch.enq?0-> // cannot send on closed channel
      assert(1 == 0)
    :: ch.closing?true -> // cannot close twice a channel
      assert(2 == 0)
    :: ch.rcving?false;
    :: ch.sending?false -> // sending state of channel (closed)
      assert(1 == 0)
    :: ch.deq!true,ch.num_msgs -> 
  		 ch.num_msgs = ch.num_msgs - 1
    fi;
  :: else ->    end5: if
    :: ch.enq?0-> // cannot send on closed channel
      assert(1 == 0)
    :: ch.closing?true -> // cannot close twice a channel
      assert(2 == 0)
    :: ch.rcving?false;
    :: ch.sending?false -> // sending state of channel (closed)
      assert(1 == 0)
    :: ch.sync!true; 
    fi;
  fi;
:: else ->
	if
	:: ch.num_msgs == ch.size ->
		end1: if
		  :: ch.deq!false,ch.num_msgs ->
		    ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		    ch.closed = true
		   :: ch.rcving?false ->
 		    ch.sending?false;
		fi;
	:: ch.num_msgs == 0 -> 
end2:		if
		:: ch.enq?0 -> // a message has been received
			ch.num_msgs = ch.num_msgs + 1
		:: ch.closing?true -> // closing the channel
			ch.closed = true
		:: ch.rcving?false ->
 		    ch.sending?false;
		fi;
		:: else -> 
		end3: if
		  :: ch.enq?0->
		     ch.num_msgs = ch.num_msgs + 1
		  :: ch.deq!false,ch.num_msgs
		     ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		     ch.closed = true
		  :: ch.rcving?false ->
 		    ch.sending?false;
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
  :: ch.enq?0-> // cannot send on closed channel
    assert(1 == 0)
  :: ch.closing?true -> // cannot close twice a channel
    assert(2 == 0)
  :: ch.sending?false -> // sending state of channel (closed)
    assert(1 == 0)
  :: ch.rcving?false;
  :: ch.sync!true; // can always receive on a closed chan
  fi;
:: else -> 
end1: if
    :: ch.rcving?false ->
       ch.sending?false;
    :: ch.closing?true ->
      ch.closed = true
    fi;
fi;
od
stop_process:
}

proctype receiver(chan c) {
c?0
}

