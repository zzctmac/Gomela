// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/mattermost/mattermost-server/blob//store/searchtest/post_layer.go#L1273
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_testSearchHashtagCaseInsensitive12730 = [1] of {int};
	run testSearchHashtagCaseInsensitive1273(child_testSearchHashtagCaseInsensitive12730);
	run receiver(child_testSearchHashtagCaseInsensitive12730)
stop_process:skip
}

proctype testSearchHashtagCaseInsensitive1273(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef p3_propsMu;
	Mutexdef p2_propsMu;
	Mutexdef p1_propsMu;
	run mutexMonitor(p1_propsMu);
	run mutexMonitor(p2_propsMu);
	run mutexMonitor(p3_propsMu);
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

