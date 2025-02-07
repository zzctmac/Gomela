// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/prometheus/prometheus/blob//web/web_test.go#L51
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestGlobalURL510 = [1] of {int};
	run TestGlobalURL51(child_TestGlobalURL510);
	run receiver(child_TestGlobalURL510)
stop_process:skip
}

proctype TestGlobalURL51(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef opts_Notifier_mtx;
	Mutexdef opts_RuleManager_mtx;
	Mutexdef opts_ScrapeManager_mtxScrape;
	Mutexdef opts_QueryEngine_queryLoggerLock;
	int var_tests = -2; // opt var_tests
	run mutexMonitor(opts_QueryEngine_queryLoggerLock);
	run mutexMonitor(opts_ScrapeManager_mtxScrape);
	run mutexMonitor(opts_RuleManager_mtx);
	run mutexMonitor(opts_Notifier_mtx);
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

