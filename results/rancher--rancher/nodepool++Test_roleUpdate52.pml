// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/rancher/rancher/blob//pkg/controllers/management/nodepool/nodepool_test.go#L52
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_Test_roleUpdate520 = [1] of {int};
	run Test_roleUpdate52(child_Test_roleUpdate520);
	run receiver(child_Test_roleUpdate520)
stop_process:skip
}

proctype Test_roleUpdate52(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_updateNodeRoles4920 = [1] of {int};
	chan child_updateNodeRoles4921 = [1] of {int};
	Mutexdef c_mutex;
	int var_tests = -2; // opt var_tests
	run mutexMonitor(c_mutex);
	

	if
	:: var_tests-1 != -3 -> 
				for(i : 0.. var_tests-1) {
			for10: skip;
			

			if
			:: true -> 
				run updateNodeRoles492(c_mutex,child_updateNodeRoles4920);
				child_updateNodeRoles4920?0
			:: true;
			fi;
			for10_end: skip
		};
		for10_exit: skip
	:: else -> 
		do
		:: true -> 
			for11: skip;
			

			if
			:: true -> 
				run updateNodeRoles492(c_mutex,child_updateNodeRoles4921);
				child_updateNodeRoles4921?0
			:: true;
			fi;
			for11_end: skip
		:: true -> 
			break
		od;
		for11_exit: skip
	fi;
	stop_process: skip;
	child!0
}
proctype updateNodeRoles492(Mutexdef c_mutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

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

