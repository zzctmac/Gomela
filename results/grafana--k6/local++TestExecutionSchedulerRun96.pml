// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/grafana/k6/blob//core/local/local_test.go#L96
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
	chan child_TestExecutionSchedulerRun960 = [1] of {int};
	run TestExecutionSchedulerRun96(child_TestExecutionSchedulerRun960);
	run receiver(child_TestExecutionSchedulerRun960)
stop_process:skip
}

proctype TestExecutionSchedulerRun96(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousTestExecutionSchedulerRun1041011 = [1] of {int};
	chan child_RegisterBuiltinMetrics1020 = [1] of {int};
	Mutexdef registry_l;
	Chandef err_ch;
	Mutexdef execScheduler_state_pauseStateLock;
	Mutexdef execScheduler_state_vuIDSegIndexMx;
	Mutexdef execScheduler_initProgress_mutex;
	Mutexdef execScheduler_logger_mu_lock;
	run mutexMonitor(execScheduler_logger_mu_lock);
	run mutexMonitor(execScheduler_initProgress_mutex);
	run mutexMonitor(execScheduler_state_vuIDSegIndexMx);
	run mutexMonitor(execScheduler_state_pauseStateLock);
	

	if
	:: 1 > 0 -> 
		err_ch.size = 1;
		run AsyncChan(err_ch)
	:: else -> 
		run sync_monitor(err_ch)
	fi;
	run mutexMonitor(registry_l);
	run RegisterBuiltinMetrics102(registry_l,child_RegisterBuiltinMetrics1020);
	child_RegisterBuiltinMetrics1020?0;
	run AnonymousTestExecutionSchedulerRun104101(err_ch,execScheduler_logger_mu_lock,execScheduler_initProgress_mutex,execScheduler_state_vuIDSegIndexMx,execScheduler_state_pauseStateLock,registry_l,child_AnonymousTestExecutionSchedulerRun1041011);
	run receiver(child_AnonymousTestExecutionSchedulerRun1041011);
	

	if
	:: err_ch.deq?state,num_msgs;
	:: err_ch.sync?state -> 
		err_ch.rcving!false
	fi;
	stop_process: skip;
	child!0
}
proctype RegisterBuiltinMetrics102(Mutexdef registry_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype AnonymousTestExecutionSchedulerRun104101(Chandef err_ch;Mutexdef execScheduler_logger_mu_lock;Mutexdef execScheduler_initProgress_mutex;Mutexdef execScheduler_state_vuIDSegIndexMx;Mutexdef execScheduler_state_pauseStateLock;Mutexdef registry_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: err_ch.enq!0;
	:: err_ch.sync!false -> 
		err_ch.sending!false
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

