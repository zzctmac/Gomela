// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/moby/moby/blob//pkg/archive/changes_other.go#L15
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
	chan child_collectFileInfoForChanges150 = [1] of {int};
	run collectFileInfoForChanges15(child_collectFileInfoForChanges150);
	run receiver(child_collectFileInfoForChanges150)
stop_process:skip
}

proctype collectFileInfoForChanges15(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymouscollectFileInfoForChanges25191 = [1] of {int};
	chan child_AnonymouscollectFileInfoForChanges21190 = [1] of {int};
	Chandef errs_ch;
	

	if
	:: 2 > 0 -> 
		errs_ch.size = 2;
		run AsyncChan(errs_ch)
	:: else -> 
		run sync_monitor(errs_ch)
	fi;
	run AnonymouscollectFileInfoForChanges2119(errs_ch,child_AnonymouscollectFileInfoForChanges21190);
	run receiver(child_AnonymouscollectFileInfoForChanges21190);
	run AnonymouscollectFileInfoForChanges2519(errs_ch,child_AnonymouscollectFileInfoForChanges25191);
	run receiver(child_AnonymouscollectFileInfoForChanges25191);
	

	if
	:: 0 != -2 && 2-1 != -3 -> 
				for(i : 0.. 2-1) {
			for11: skip;
			

			if
			:: errs_ch.deq?state,num_msgs;
			:: errs_ch.sync?state -> 
				errs_ch.rcving!false
			fi;
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			for11_end: skip
		};
		for11_exit: skip
	:: else -> 
		do
		:: true -> 
			for10: skip;
			

			if
			:: errs_ch.deq?state,num_msgs;
			:: errs_ch.sync?state -> 
				errs_ch.rcving!false
			fi;
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			for10_end: skip
		:: true -> 
			break
		od;
		for10_exit: skip
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype AnonymouscollectFileInfoForChanges2119(Chandef errs_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: errs_ch.enq!0;
	:: errs_ch.sync!false -> 
		errs_ch.sending!false
	fi;
	stop_process: skip;
	child!0
}
proctype AnonymouscollectFileInfoForChanges2519(Chandef errs_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: errs_ch.enq!0;
	:: errs_ch.sync!false -> 
		errs_ch.sending!false
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

