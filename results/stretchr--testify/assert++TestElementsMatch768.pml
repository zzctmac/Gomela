// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/stretchr/testify/blob//assert/assertions_test.go#L768
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestElementsMatch7680 = [1] of {int};
	run TestElementsMatch768(child_TestElementsMatch7680);
	run receiver(child_TestElementsMatch7680)
stop_process:skip
}

proctype TestElementsMatch768(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef mockT_context_mu;
	Mutexdef mockT_context_match_mu;
	int var_cases = -2; // opt var_cases
	run mutexMonitor(mockT_context_match_mu);
	run mutexMonitor(mockT_context_mu);
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

