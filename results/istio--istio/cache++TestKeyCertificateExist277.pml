// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/istio/istio/blob//security/pkg/nodeagent/cache/secretcache_test.go#L277
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestKeyCertificateExist2770 = [1] of {int};
	run TestKeyCertificateExist277(child_TestKeyCertificateExist2770);
	run receiver(child_TestKeyCertificateExist2770)
stop_process:skip
}

proctype TestKeyCertificateExist277(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_keyCertificateExist3760 = [1] of {int};
	chan child_keyCertificateExist3761 = [1] of {int};
	Mutexdef sc_configTrustBundleMutex;
	Mutexdef sc_outputMutex;
	Mutexdef sc_certMutex;
	Mutexdef sc_certWatcher_mu;
	Mutexdef sc_generateMutex;
	Mutexdef sc_cache_mu;
	int var_testCases = -2; // opt var_testCases
	run mutexMonitor(sc_cache_mu);
	run mutexMonitor(sc_generateMutex);
	run mutexMonitor(sc_certWatcher_mu);
	run mutexMonitor(sc_certMutex);
	run mutexMonitor(sc_outputMutex);
	run mutexMonitor(sc_configTrustBundleMutex);
	

	if
	:: var_testCases-1 != -3 -> 
				for(i : 0.. var_testCases-1) {
			for10: skip;
			run keyCertificateExist376(sc_cache_mu,sc_certMutex,sc_certWatcher_mu,sc_configTrustBundleMutex,sc_generateMutex,sc_outputMutex,child_keyCertificateExist3760);
			child_keyCertificateExist3760?0;
			for10_end: skip
		};
		for10_exit: skip
	:: else -> 
		do
		:: true -> 
			for11: skip;
			run keyCertificateExist376(sc_cache_mu,sc_certMutex,sc_certWatcher_mu,sc_configTrustBundleMutex,sc_generateMutex,sc_outputMutex,child_keyCertificateExist3761);
			child_keyCertificateExist3761?0;
			for11_end: skip
		:: true -> 
			break
		od;
		for11_exit: skip
	fi;
	stop_process: skip;
	child!0
}
proctype keyCertificateExist376(Mutexdef sc_cache_mu;Mutexdef sc_certMutex;Mutexdef sc_certWatcher_mu;Mutexdef sc_configTrustBundleMutex;Mutexdef sc_generateMutex;Mutexdef sc_outputMutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

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

