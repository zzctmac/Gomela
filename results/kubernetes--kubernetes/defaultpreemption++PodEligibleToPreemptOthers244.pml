// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//pkg/scheduler/framework/plugins/defaultpreemption/default_preemption.go#L244
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_PodEligibleToPreemptOthers2440 = [1] of {int};
	run PodEligibleToPreemptOthers244(child_PodEligibleToPreemptOthers2440);
	run receiver(child_PodEligibleToPreemptOthers2440)
stop_process:skip
}

proctype PodEligibleToPreemptOthers244(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef nodeInfo_TransientInfo_TransientLock;
	int var_nodeInfo_Pods = -2; // opt var_nodeInfo_Pods
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
		run mutexMonitor(nodeInfo_TransientInfo_TransientLock)
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

