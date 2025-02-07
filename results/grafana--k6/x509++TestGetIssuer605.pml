// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/grafana/k6/blob//js/modules/k6/crypto/x509/x509_test.go#L605
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestGetIssuer6050 = [1] of {int};
	run TestGetIssuer605(child_TestGetIssuer6050);
	run receiver(child_TestGetIssuer6050)
stop_process:skip
}

proctype TestGetIssuer605(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef rt_vm_interruptLock;
	Mutexdef rt_vm_prg_src_mu;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run mutexMonitor(rt_vm_prg_src_mu);
	run mutexMonitor(rt_vm_interruptLock);
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

