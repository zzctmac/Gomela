// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/golang/go/blob//runtime/race/testdata/waitgroup_test.go#L166
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
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}



init { 
	chan child_TestNoRaceWaitGroupMultipleWait31660 = [1] of {int};
	run TestNoRaceWaitGroupMultipleWait3166(child_TestNoRaceWaitGroupMultipleWait31660);
	run receiver(child_TestNoRaceWaitGroupMultipleWait31660)
stop_process:skip
}

proctype TestNoRaceWaitGroupMultipleWait3166(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousTestNoRaceWaitGroupMultipleWait31791692 = [1] of {int};
	chan child_AnonymousTestNoRaceWaitGroupMultipleWait31731730 = [1] of {int};
	Wgdef wg;
	Chandef done_ch;
	

	if
	:: 3 > 0 -> 
		done_ch.size = 3;
		run AsyncChan(done_ch)
	:: else -> 
		run sync_monitor(done_ch)
	fi;
	run wgMonitor(wg);
	wg.update!3;
		for(i : 0.. 3-1) {
		for10: skip;
		run AnonymousTestNoRaceWaitGroupMultipleWait3173173(done_ch,wg,child_AnonymousTestNoRaceWaitGroupMultipleWait31731730);
		run receiver(child_AnonymousTestNoRaceWaitGroupMultipleWait31731730);
		for10_end: skip
	};
	for10_exit: skip;
		for(i : 0.. 3-1) {
		for20: skip;
		run AnonymousTestNoRaceWaitGroupMultipleWait3179169(done_ch,wg,child_AnonymousTestNoRaceWaitGroupMultipleWait31791692);
		run receiver(child_AnonymousTestNoRaceWaitGroupMultipleWait31791692);
		for20_end: skip
	};
	for20_exit: skip;
	

	if
	:: 0 != -2 && 3-1 != -3 -> 
				for(i : 0.. 3-1) {
			for31: skip;
			

			if
			:: done_ch.deq?state,num_msgs;
			:: done_ch.sync?state -> 
				done_ch.rcving!false
			fi;
			for31_end: skip
		};
		for31_exit: skip
	:: else -> 
		do
		:: true -> 
			for30: skip;
			

			if
			:: done_ch.deq?state,num_msgs;
			:: done_ch.sync?state -> 
				done_ch.rcving!false
			fi;
			for30_end: skip
		:: true -> 
			break
		od;
		for30_exit: skip
	fi;
	stop_process: skip;
	child!0
}
proctype AnonymousTestNoRaceWaitGroupMultipleWait3173173(Chandef done_ch;Wgdef wg;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	wg.update!-1;
	stop_process: skip;
	child!0
}
proctype AnonymousTestNoRaceWaitGroupMultipleWait3179169(Chandef done_ch;Wgdef wg;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	wg.wait?0;
	

	if
	:: done_ch.enq!0;
	:: done_ch.sync!false -> 
		done_ch.sending!false
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

proctype wgMonitor(Wgdef wg) {
int i;
do
	:: wg.update?i ->
		wg.Counter = wg.Counter + i;
		assert(wg.Counter >= 0)
	:: wg.Counter == 0 ->
end: if
		:: wg.update?i ->
			wg.Counter = wg.Counter + i;
			assert(wg.Counter >= 0)
		:: wg.wait!0;
	fi
od
}

proctype receiver(chan c) {
c?0
}

