// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/minikube/blob//pkg/minikube/registry/registry_test.go#L67
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestDriverAlias670 = [1] of {int};
	run TestDriverAlias67(child_TestDriverAlias670);
	run receiver(child_TestDriverAlias670)
stop_process:skip
}

proctype TestDriverAlias67(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Driver1694 = [1] of {int};
	chan child_List1553 = [1] of {int};
	chan child_Driver1692 = [1] of {int};
	chan child_Driver1691 = [1] of {int};
	chan child_Register1350 = [1] of {int};
	Mutexdef r_lock;
	run mutexMonitor(r_lock);
	run Register135(r_lock,child_Register1350);
	child_Register1350?0;
	run Driver169(r_lock,child_Driver1691);
	child_Driver1691?0;
	run Driver169(r_lock,child_Driver1692);
	child_Driver1692?0;
	run List155(r_lock,child_List1553);
	child_List1553?0;
	run Driver169(r_lock,child_Driver1694);
	child_Driver1694?0;
	stop_process: skip;
	child!0
}
proctype Register135(Mutexdef r_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_def_Alias = -2; // opt var_def_Alias
	r_lock.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	goto defer1;
		defer1: skip;
	r_lock.Unlock!false;
	stop_process: skip;
	child!0
}
proctype Driver169(Mutexdef r_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	r_lock.RLock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	goto defer1;
		defer1: skip;
	r_lock.RUnlock!false;
	stop_process: skip;
	child!0
}
proctype List155(Mutexdef r_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_r_drivers = -2; // opt var_r_drivers
	r_lock.RLock!false;
	goto defer1;
		defer1: skip;
	r_lock.RUnlock!false;
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

