// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/golang/go/blob//internal/poll/fd_mutex_test.go#L61
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
	chan child_TestMutexCloseUnblock610 = [1] of {int};
	run TestMutexCloseUnblock61(child_TestMutexCloseUnblock610);
	run receiver(child_TestMutexCloseUnblock610)
stop_process:skip
}

proctype TestMutexCloseUnblock61(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousTestMutexCloseUnblock66620 = [1] of {int};
	Chandef c_ch;
	

	if
	:: 4 > 0 -> 
		c_ch.size = 4;
		run AsyncChan(c_ch)
	:: else -> 
		run sync_monitor(c_ch)
	fi;
		for(i : 0.. 4-1) {
		for10: skip;
		run AnonymousTestMutexCloseUnblock6662(c_ch,child_AnonymousTestMutexCloseUnblock66620);
		run receiver(child_AnonymousTestMutexCloseUnblock66620);
		for10_end: skip
	};
	for10_exit: skip;
	do
	:: c_ch.deq?state,num_msgs -> 
		break
	:: c_ch.sync?state -> 
		c_ch.rcving!false;
		break
	:: true -> 
		break
	od;
	for20_exit: skip;
	for20_end: skip;
	

	if
	:: 0 != -2 && 4-1 != -3 -> 
				for(i : 0.. 4-1) {
			for32: skip;
			do
			:: c_ch.deq?state,num_msgs -> 
				break
			:: c_ch.sync?state -> 
				c_ch.rcving!false;
				break
			:: true -> 
				break
			od;
			for33_exit: skip;
			for33_end: skip;
			for32_end: skip
		};
		for32_exit: skip
	:: else -> 
		do
		:: true -> 
			for30: skip;
			do
			:: c_ch.deq?state,num_msgs -> 
				break
			:: c_ch.sync?state -> 
				c_ch.rcving!false;
				break
			:: true -> 
				break
			od;
			for31_exit: skip;
			for31_end: skip;
			for30_end: skip
		:: true -> 
			break
		od;
		for30_exit: skip
	fi;
	stop_process: skip;
	child!0
}
proctype AnonymousTestMutexCloseUnblock6662(Chandef c_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: c_ch.enq!0;
	:: c_ch.sync!false -> 
		c_ch.sending!false
	fi;
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

