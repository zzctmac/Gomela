// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/fyne-io/fyne/blob//cmd/fyne/internal/mobile/build.go#L181
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
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_extractPkgs1810 = [1] of {int};
	run extractPkgs181(child_extractPkgs1810);
	run receiver(child_extractPkgs1810)
stop_process:skip
}

proctype extractPkgs181(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousextractPkgs1921910 = [1] of {int};
	Chandef errc_ch;
	Mutexdef cmd_Process_sigMu;
	Mutexdef w_p_once_m;
	Mutexdef w_p_wrMu;
	Mutexdef r_p_once_m;
	Mutexdef r_p_wrMu;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run mutexMonitor(r_p_wrMu);
	run mutexMonitor(r_p_once_m);
	run mutexMonitor(w_p_wrMu);
	run mutexMonitor(w_p_once_m);
	run mutexMonitor(cmd_Process_sigMu);
	

	if
	:: 1 > 0 -> 
		errc_ch.size = 1;
		run AsyncChan(errc_ch)
	:: else -> 
		run sync_monitor(errc_ch)
	fi;
	run AnonymousextractPkgs192191(errc_ch,r_p_wrMu,r_p_once_m,w_p_wrMu,w_p_once_m,cmd_Process_sigMu,child_AnonymousextractPkgs1921910);
	run receiver(child_AnonymousextractPkgs1921910);
	

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
	:: errc_ch.deq?state,num_msgs;
	:: errc_ch.sync?state -> 
		errc_ch.rcving!false
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype AnonymousextractPkgs192191(Chandef errc_ch;Mutexdef r_p_wrMu;Mutexdef r_p_once_m;Mutexdef w_p_wrMu;Mutexdef w_p_once_m;Mutexdef cmd_Process_sigMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: errc_ch.enq!0;
	:: errc_ch.sync!false -> 
		errc_ch.sending!false
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

proctype mutexMonitor(Mutexdef m) {
bool locked = false;
do
:: true ->
	if
	:: m.Counter > 0 ->
		if 
		:: m.RUnlock?false -> 
			m.Counter = m.Counter - 1;
		:: m.RLock?false -> 
			m.Counter = m.Counter + 1;
		fi;
	:: locked ->
		m.Unlock?false;
		locked = false;
	:: else ->	 end:	if
		:: m.Unlock?false ->
			assert(0==32);		:: m.Lock?false ->
			locked =true;
		:: m.RUnlock?false ->
			assert(0==32);		:: m.RLock?false ->
			m.Counter = m.Counter + 1;
		fi;
	fi;
od
}

proctype receiver(chan c) {
c?0
}

