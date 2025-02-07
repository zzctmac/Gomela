// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/traefik/traefik/blob//pkg/middlewares/circuitbreaker/circuit_breaker.go#L25
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_New250 = [1] of {int};
	run New25(child_New250);
	run receiver(child_New250)
stop_process:skip
}

proctype New25(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef oxyCircuitBreaker_log_mu_lock;
	Mutexdef oxyCircuitBreaker_rc_log_mu_lock;
	Mutexdef oxyCircuitBreaker_metrics_histogramLock;
	Mutexdef oxyCircuitBreaker_metrics_statusCodesLock;
	Mutexdef oxyCircuitBreaker_m;
	run mutexMonitor(oxyCircuitBreaker_m);
	run mutexMonitor(oxyCircuitBreaker_metrics_statusCodesLock);
	run mutexMonitor(oxyCircuitBreaker_metrics_histogramLock);
	run mutexMonitor(oxyCircuitBreaker_rc_log_mu_lock);
	run mutexMonitor(oxyCircuitBreaker_log_mu_lock);
	

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

