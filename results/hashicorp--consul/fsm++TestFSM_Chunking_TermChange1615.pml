// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/consul/blob//agent/consul/fsm/commands_oss_test.go#L1615
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestFSM_Chunking_TermChange16150 = [1] of {int};
	run TestFSM_Chunking_TermChange1615(child_TestFSM_Chunking_TermChange16150);
	run receiver(child_TestFSM_Chunking_TermChange16150)
stop_process:skip
}

proctype TestFSM_Chunking_TermChange1615(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef fsm_state_lockDelay_lock;
	Mutexdef fsm_state_db_db_writer;
	Mutexdef fsm_stateLock;
	int var_logs = -2; // opt var_logs
	int var_chunks = -2; // opt var_chunks
	run mutexMonitor(fsm_stateLock);
	run mutexMonitor(fsm_state_db_db_writer);
	run mutexMonitor(fsm_state_lockDelay_lock);
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

