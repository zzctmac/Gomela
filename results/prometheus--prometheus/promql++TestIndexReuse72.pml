// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/prometheus/prometheus/blob//promql/query_logger_test.go#L72
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
	chan child_TestIndexReuse720 = [1] of {int};
	run TestIndexReuse72(child_TestIndexReuse720);
	run receiver(child_TestIndexReuse720)
stop_process:skip
}

proctype TestIndexReuse72(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Insert1847 = [1] of {int};
	chan child_Insert1846 = [1] of {int};
	chan child_Delete1795 = [1] of {int};
	chan child_Delete1794 = [1] of {int};
	chan child_Insert1843 = [1] of {int};
	chan child_Insert1842 = [1] of {int};
	chan child_Insert1841 = [1] of {int};
	chan child_generateIndices1690 = [1] of {int};
	Chandef queryLogger_getNextIndex_ch;
	

	if
	:: 3 > 0 -> 
		queryLogger_getNextIndex_ch.size = 3;
		run AsyncChan(queryLogger_getNextIndex_ch)
	:: else -> 
		run sync_monitor(queryLogger_getNextIndex_ch)
	fi;
	run generateIndices169(queryLogger_getNextIndex_ch,3,child_generateIndices1690);
	child_generateIndices1690?0;
	run Insert184(queryLogger_getNextIndex_ch,child_Insert1841);
	child_Insert1841?0;
	run Insert184(queryLogger_getNextIndex_ch,child_Insert1842);
	child_Insert1842?0;
	run Insert184(queryLogger_getNextIndex_ch,child_Insert1843);
	child_Insert1843?0;
	run Delete179(queryLogger_getNextIndex_ch,child_Delete1794);
	child_Delete1794?0;
	run Delete179(queryLogger_getNextIndex_ch,child_Delete1795);
	child_Delete1795?0;
	run Insert184(queryLogger_getNextIndex_ch,child_Insert1846);
	child_Insert1846?0;
	run Insert184(queryLogger_getNextIndex_ch,child_Insert1847);
	child_Insert1847?0;
	stop_process: skip;
	child!0
}
proctype generateIndices169(Chandef tracker_getNextIndex_ch;int var_maxConcurrent;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: 0 != -2 && var_maxConcurrent-1 != -3 -> 
				for(i : 0.. var_maxConcurrent-1) {
			for11: skip;
			

			if
			:: tracker_getNextIndex_ch.enq!0;
			:: tracker_getNextIndex_ch.sync!false -> 
				tracker_getNextIndex_ch.sending!false
			fi;
			for11_end: skip
		};
		for11_exit: skip
	:: else -> 
		do
		:: true -> 
			for10: skip;
			

			if
			:: tracker_getNextIndex_ch.enq!0;
			:: tracker_getNextIndex_ch.sync!false -> 
				tracker_getNextIndex_ch.sending!false
			fi;
			for10_end: skip
		:: true -> 
			break
		od;
		for10_exit: skip
	fi;
	stop_process: skip;
	child!0
}
proctype Insert184(Chandef tracker_getNextIndex_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	do
	:: tracker_getNextIndex_ch.deq?state,num_msgs -> 
		goto stop_process
	:: tracker_getNextIndex_ch.sync?state -> 
		tracker_getNextIndex_ch.rcving!false;
		goto stop_process
	:: true -> 
		goto stop_process
	od;
	for20_exit: skip;
	for20_end: skip;
	stop_process: skip;
	child!0
}
proctype Delete179(Chandef tracker_getNextIndex_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: tracker_getNextIndex_ch.enq!0;
	:: tracker_getNextIndex_ch.sync!false -> 
		tracker_getNextIndex_ch.sending!false
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

