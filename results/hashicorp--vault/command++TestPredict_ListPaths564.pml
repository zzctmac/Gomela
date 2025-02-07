// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/vault/blob//command/base_predict_test.go#L564
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestPredict_ListPaths5640 = [1] of {int};
	run TestPredict_ListPaths564(child_TestPredict_ListPaths5640);
	run receiver(child_TestPredict_ListPaths5640)
stop_process:skip
}

proctype TestPredict_ListPaths564(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef badClient_config_Limiter_mu;
	Mutexdef badClient_config_modifyLock;
	Mutexdef badClient_modifyLock;
	Mutexdef client_config_Limiter_mu;
	Mutexdef client_config_modifyLock;
	Mutexdef client_modifyLock;
	int var_cases = -2; // opt var_cases
	run mutexMonitor(client_modifyLock);
	run mutexMonitor(client_config_modifyLock);
	run mutexMonitor(client_config_Limiter_mu);
	run mutexMonitor(badClient_modifyLock);
	run mutexMonitor(badClient_config_modifyLock);
	run mutexMonitor(badClient_config_Limiter_mu);
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

