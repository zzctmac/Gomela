// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/consul/blob//agent/consul/fsm/commands_oss_test.go#L218
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestFSM_DeregisterCheck2180 = [1] of {int};
	run TestFSM_DeregisterCheck218(child_TestFSM_DeregisterCheck2180);
	run receiver(child_TestFSM_DeregisterCheck2180)
stop_process:skip
}

proctype TestFSM_DeregisterCheck218(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Apply1181 = [1] of {int};
	chan child_Apply1180 = [1] of {int};
	Mutexdef fsm_state_lockDelay_lock;
	Mutexdef fsm_state_db_db_writer;
	Mutexdef fsm_stateLock;
	run mutexMonitor(fsm_stateLock);
	run mutexMonitor(fsm_state_db_db_writer);
	run mutexMonitor(fsm_state_lockDelay_lock);
	run Apply118(fsm_state_db_db_writer,fsm_state_lockDelay_lock,fsm_stateLock,child_Apply1180);
	child_Apply1180?0;
	run Apply118(fsm_state_db_db_writer,fsm_state_lockDelay_lock,fsm_stateLock,child_Apply1181);
	child_Apply1181?0;
	stop_process: skip;
	child!0
}
proctype Apply118(Mutexdef c_state_db_db_writer;Mutexdef c_state_lockDelay_lock;Mutexdef c_stateLock;chan child) {
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

