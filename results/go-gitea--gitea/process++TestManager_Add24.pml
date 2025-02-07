// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/go-gitea/gitea/blob//modules/process/manager_test.go#L24
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestManager_Add240 = [1] of {int};
	run TestManager_Add24(child_TestManager_Add240);
	run receiver(child_TestManager_Add240)
stop_process:skip
}

proctype TestManager_Add24(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Add581 = [1] of {int};
	chan child_Add580 = [1] of {int};
	Mutexdef pm_mutex;
	run mutexMonitor(pm_mutex);
	run Add58(pm_mutex,child_Add580);
	child_Add580?0;
	run Add58(pm_mutex,child_Add581);
	child_Add581?0;
	stop_process: skip;
	child!0
}
proctype Add58(Mutexdef pm_mutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	pm_mutex.Lock!false;
	pm_mutex.Unlock!false;
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

