// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/helm/helm/blob//pkg/repo/repotest/server.go#L80
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_NewOCIServer800 = [1] of {int};
	run NewOCIServer80(child_NewOCIServer800);
	run receiver(child_NewOCIServer800)
stop_process:skip
}

proctype NewOCIServer80(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef r_server_mu;
	Mutexdef r_server_nextProtoOnce_m;
	Mutexdef r_server_ErrorLog_mu;
	Mutexdef r_server_TLSConfig_mutex;
	Mutexdef r_app_redis_mu;
	run mutexMonitor(r_app_redis_mu);
	run mutexMonitor(r_server_TLSConfig_mutex);
	run mutexMonitor(r_server_ErrorLog_mu);
	run mutexMonitor(r_server_nextProtoOnce_m);
	run mutexMonitor(r_server_mu);
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

