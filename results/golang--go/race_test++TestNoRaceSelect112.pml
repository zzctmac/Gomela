// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/golang/go/blob//runtime/race/testdata/select_test.go#L12
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
	chan child_TestNoRaceSelect1120 = [1] of {int};
	run TestNoRaceSelect112(child_TestNoRaceSelect1120);
	run receiver(child_TestNoRaceSelect1120)
stop_process:skip
}

proctype TestNoRaceSelect112(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousTestNoRaceSelect119150 = [1] of {int};
	Chandef c1_ch;
	Chandef c_ch;
	Chandef compl_ch;
	run sync_monitor(compl_ch);
	run sync_monitor(c_ch);
	run sync_monitor(c1_ch);
	run AnonymousTestNoRaceSelect11915(compl_ch,c_ch,c1_ch,child_AnonymousTestNoRaceSelect119150);
	run receiver(child_AnonymousTestNoRaceSelect119150);
	do
	:: c_ch.deq?state,num_msgs -> 
		break
	:: c_ch.sync?state -> 
		c_ch.rcving!false;
		break
	:: c1_ch.enq!0 -> 
		break
	:: c1_ch.sync!false -> 
		c1_ch.sending!false;
		break
	od;
	for20_exit: skip;
	for20_end: skip;
	

	if
	:: compl_ch.deq?state,num_msgs;
	:: compl_ch.sync?state -> 
		compl_ch.rcving!false
	fi;
	stop_process: skip;
	child!0
}
proctype AnonymousTestNoRaceSelect11915(Chandef compl_ch;Chandef c_ch;Chandef c1_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	do
	:: c_ch.enq!0 -> 
		break
	:: c_ch.sync!false -> 
		c_ch.sending!false;
		break
	:: c1_ch.enq!0 -> 
		break
	:: c1_ch.sync!false -> 
		c1_ch.sending!false;
		break
	od;
	for10_exit: skip;
	for10_end: skip;
	

	if
	:: compl_ch.enq!0;
	:: compl_ch.sync!false -> 
		compl_ch.sending!false
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

