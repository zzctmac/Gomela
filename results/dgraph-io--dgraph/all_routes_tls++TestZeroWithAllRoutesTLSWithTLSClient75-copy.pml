// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/dgraph-io/dgraph/blob//tlstest/zero_https/all_routes_tls/all_routes_tls_test.go#L75
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestZeroWithAllRoutesTLSWithTLSClient750 = [1] of {int};
	run TestZeroWithAllRoutesTLSWithTLSClient75(child_TestZeroWithAllRoutesTLSWithTLSClient750);
	run receiver(child_TestZeroWithAllRoutesTLSWithTLSClient750)
stop_process:skip
}

proctype TestZeroWithAllRoutesTLSWithTLSClient75(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef tr_nextProtoOnce_m;
	Mutexdef tr_TLSClientConfig_mutex;
	Mutexdef tr_connsPerHostMu;
	Mutexdef tr_altMu;
	Mutexdef tr_reqMu;
	Mutexdef tr_idleMu;
	Mutexdef tlsCfg_mutex;
	int var_testCasesHttps = -2; // opt var_testCasesHttps
	run mutexMonitor(tlsCfg_mutex);
	run mutexMonitor(tr_idleMu);
	run mutexMonitor(tr_reqMu);
	run mutexMonitor(tr_altMu);
	run mutexMonitor(tr_connsPerHostMu);
	run mutexMonitor(tr_TLSClientConfig_mutex);
	run mutexMonitor(tr_nextProtoOnce_m);
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

