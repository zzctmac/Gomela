// num_comm_params=2
// num_mand_comm_params=2
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kops/blob//pkg/instancegroups/instancegroups.go#L76
#define def_var_update129  ?? // mand update line 129
#define def_var_maxConcurrency184  ?? // mand maxConcurrency line 184
#define ub_for279_2  -2
#define ub_for228_3  -2
#define ub_for242_3  -2
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
	chan child_rollingUpdateInstanceGroup760 = [1] of {int};
	run rollingUpdateInstanceGroup76(child_rollingUpdateInstanceGroup760);
	run receiver(child_rollingUpdateInstanceGroup760)
stop_process:skip
}

proctype rollingUpdateInstanceGroup76(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_waitForPendingBeforeReturningError27815 = [1] of {int};
	chan child_waitForPendingBeforeReturningError27814 = [1] of {int};
	chan child_waitForPendingBeforeReturningError2785 = [1] of {int};
	chan child_waitForPendingBeforeReturningError2786 = [1] of {int};
	chan child_waitForPendingBeforeReturningError2783 = [1] of {int};
	chan child_waitForPendingBeforeReturningError2784 = [1] of {int};
	chan child_waitForPendingBeforeReturningError2782 = [1] of {int};
	chan child_waitForPendingBeforeReturningError2781 = [1] of {int};
	chan child_AnonymousrollingUpdateInstanceGroup1871870 = [1] of {int};
	Chandef terminateChan_ch;
	int var_maxConcurrency = def_var_maxConcurrency184; // mand var_maxConcurrency
	int var_maxSurge = -2; // opt var_maxSurge
	int var_update = def_var_update129; // mand var_update
	

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
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi
	fi;
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi
	:: true;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: var_maxConcurrency > 0 -> 
		terminateChan_ch.size = var_maxConcurrency;
		run AsyncChan(terminateChan_ch)
	:: else -> 
		run sync_monitor(terminateChan_ch)
	fi;
		for(i : 0.. var_update-1) {
		for30: skip;
		run AnonymousrollingUpdateInstanceGroup187187(terminateChan_ch,child_AnonymousrollingUpdateInstanceGroup1871870);
		run receiver(child_AnonymousrollingUpdateInstanceGroup1871870);
		

		if
		:: true -> 
			goto for30_end
		:: true;
		fi;
		

		if
		:: terminateChan_ch.deq?state,num_msgs;
		:: terminateChan_ch.sync?state -> 
			terminateChan_ch.rcving!false
		fi;
		

		if
		:: true -> 
			run waitForPendingBeforeReturningError278(terminateChan_ch,child_waitForPendingBeforeReturningError2781);
			child_waitForPendingBeforeReturningError2781?0;
			goto stop_process
		:: true;
		fi;
		

		if
		:: true -> 
			run waitForPendingBeforeReturningError278(terminateChan_ch,child_waitForPendingBeforeReturningError2782);
			child_waitForPendingBeforeReturningError2782?0;
			goto stop_process
		:: true;
		fi;
		

		if
		:: true -> 
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi
		:: true;
		fi;
		

		if
		:: 0 != -2 && ub_for228_3 != -2 -> 
						for(i : 0.. ub_for228_3) {
				for35: skip;
				do
				:: terminateChan_ch.deq?state,num_msgs -> 
					

					if
					:: true -> 
						run waitForPendingBeforeReturningError278(terminateChan_ch,child_waitForPendingBeforeReturningError2785);
						child_waitForPendingBeforeReturningError2785?0;
						goto stop_process
					:: true;
					fi;
					break
				:: terminateChan_ch.sync?state -> 
					terminateChan_ch.rcving!false;
					

					if
					:: true -> 
						run waitForPendingBeforeReturningError278(terminateChan_ch,child_waitForPendingBeforeReturningError2786);
						child_waitForPendingBeforeReturningError2786?0;
						goto stop_process
					:: true;
					fi;
					break
				:: true -> 
					goto sweep;
					break
				od;
				for36_exit: skip;
				for36_end: skip;
				for35_end: skip
			};
			for35_exit: skip
		:: else -> 
			do
			:: true -> 
				for33: skip;
				do
				:: terminateChan_ch.deq?state,num_msgs -> 
					

					if
					:: true -> 
						run waitForPendingBeforeReturningError278(terminateChan_ch,child_waitForPendingBeforeReturningError2783);
						child_waitForPendingBeforeReturningError2783?0;
						goto stop_process
					:: true;
					fi;
					break
				:: terminateChan_ch.sync?state -> 
					terminateChan_ch.rcving!false;
					

					if
					:: true -> 
						run waitForPendingBeforeReturningError278(terminateChan_ch,child_waitForPendingBeforeReturningError2784);
						child_waitForPendingBeforeReturningError2784?0;
						goto stop_process
					:: true;
					fi;
					break
				:: true -> 
					goto sweep;
					break
				od;
				for34_exit: skip;
				for34_end: skip;
				for33_end: skip
			:: true -> 
				break
			od;
			for33_exit: skip
		fi;
		sweep: skip;
		for30_end: skip
	};
	for30_exit: skip;
	

	if
	:: true -> 
		

		if
		:: 0 != -2 && ub_for242_3 != -2 -> 
						for(i : 0.. ub_for242_3) {
				for41: skip;
				

				if
				:: terminateChan_ch.deq?state,num_msgs;
				:: terminateChan_ch.sync?state -> 
					terminateChan_ch.rcving!false
				fi;
				

				if
				:: true -> 
					run waitForPendingBeforeReturningError278(terminateChan_ch,child_waitForPendingBeforeReturningError27815);
					child_waitForPendingBeforeReturningError27815?0;
					goto stop_process
				:: true;
				fi;
				for41_end: skip
			};
			for41_exit: skip
		:: else -> 
			do
			:: true -> 
				for40: skip;
				

				if
				:: terminateChan_ch.deq?state,num_msgs;
				:: terminateChan_ch.sync?state -> 
					terminateChan_ch.rcving!false
				fi;
				

				if
				:: true -> 
					run waitForPendingBeforeReturningError278(terminateChan_ch,child_waitForPendingBeforeReturningError27814);
					child_waitForPendingBeforeReturningError27814?0;
					goto stop_process
				:: true;
				fi;
				for40_end: skip
			:: true -> 
				break
			od;
			for40_exit: skip
		fi;
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype AnonymousrollingUpdateInstanceGroup187187(Chandef terminateChan_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: terminateChan_ch.enq!0;
	:: terminateChan_ch.sync!false -> 
		terminateChan_ch.sending!false
	fi;
	stop_process: skip;
	child!0
}
proctype waitForPendingBeforeReturningError278(Chandef terminateChan_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: 0 != -2 && ub_for279_2 != -2 -> 
				for(i : 0.. ub_for279_2) {
			for32: skip;
			

			if
			:: terminateChan_ch.deq?state,num_msgs;
			:: terminateChan_ch.sync?state -> 
				terminateChan_ch.rcving!false
			fi;
			for32_end: skip
		};
		for32_exit: skip
	:: else -> 
		do
		:: true -> 
			for31: skip;
			

			if
			:: terminateChan_ch.deq?state,num_msgs;
			:: terminateChan_ch.sync?state -> 
				terminateChan_ch.rcving!false
			fi;
			for31_end: skip
		:: true -> 
			break
		od;
		for31_exit: skip
	fi;
	goto stop_process;
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

