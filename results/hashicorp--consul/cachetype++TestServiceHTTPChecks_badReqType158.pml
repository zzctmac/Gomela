// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/consul/blob//agent/cache-types/service_checks_test.go#L158
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestServiceHTTPChecks_badReqType1580 = [1] of {int};
	run TestServiceHTTPChecks_badReqType158(child_TestServiceHTTPChecks_badReqType1580);
	run receiver(child_TestServiceHTTPChecks_badReqType1580)
stop_process:skip
}

proctype TestServiceHTTPChecks_badReqType158(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef a_state_tokens_persistenceLock;
	Mutexdef a_state_tokens_l;
	run mutexMonitor(a_state_tokens_l);
	run mutexMonitor(a_state_tokens_persistenceLock);
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

