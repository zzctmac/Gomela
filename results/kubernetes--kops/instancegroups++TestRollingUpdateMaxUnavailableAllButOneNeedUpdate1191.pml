// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kops/blob//pkg/instancegroups/rollingupdate_test.go#L1191
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestRollingUpdateMaxUnavailableAllButOneNeedUpdate11910 = [1] of {int};
	run TestRollingUpdateMaxUnavailableAllButOneNeedUpdate1191(child_TestRollingUpdateMaxUnavailableAllButOneNeedUpdate11910);
	run receiver(child_TestRollingUpdateMaxUnavailableAllButOneNeedUpdate11910)
stop_process:skip
}

proctype TestRollingUpdateMaxUnavailableAllButOneNeedUpdate1191(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AssertComplete11380 = [1] of {int};
	Mutexdef concurrentTest_mutex;
	Mutexdef concurrentTest_t_context_mu;
	Mutexdef concurrentTest_t_context_match_mu;
	run mutexMonitor(concurrentTest_t_context_match_mu);
	run mutexMonitor(concurrentTest_t_context_mu);
	run mutexMonitor(concurrentTest_mutex);
	run AssertComplete1138(concurrentTest_mutex,concurrentTest_t_context_match_mu,concurrentTest_t_context_mu,child_AssertComplete11380);
	child_AssertComplete11380?0;
	stop_process: skip;
	child!0
}
proctype AssertComplete1138(Mutexdef c_mutex;Mutexdef c_t_context_match_mu;Mutexdef c_t_context_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	c_mutex.Lock!false;
		defer1: skip;
	c_mutex.Unlock!false;
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

