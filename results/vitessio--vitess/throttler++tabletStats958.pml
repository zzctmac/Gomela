// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/vitessio/vitess/blob//go/vt/throttler/max_replication_lag_module_test.go#L958
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_tabletStats9580 = [1] of {int};
	run tabletStats958(child_tabletStats9580);
	run receiver(child_tabletStats9580)
stop_process:skip
}

proctype tabletStats958(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef tablet_PrimaryTermStartTime_state_atomicMessageInfo_initMu;
	Mutexdef tablet_KeyRange_state_atomicMessageInfo_initMu;
	Mutexdef tablet_Alias_state_atomicMessageInfo_initMu;
	Mutexdef tablet_state_atomicMessageInfo_initMu;
	run mutexMonitor(tablet_state_atomicMessageInfo_initMu);
	run mutexMonitor(tablet_Alias_state_atomicMessageInfo_initMu);
	run mutexMonitor(tablet_KeyRange_state_atomicMessageInfo_initMu);
	run mutexMonitor(tablet_PrimaryTermStartTime_state_atomicMessageInfo_initMu);
	goto stop_process;
	stop_process: skip;
	child!0
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
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

