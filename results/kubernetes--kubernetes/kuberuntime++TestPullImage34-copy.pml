// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//pkg/kubelet/kuberuntime/kuberuntime_image_test.go#L34
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestPullImage340 = [1] of {int};
	run TestPullImage34(child_TestPullImage340);
	run receiver(child_TestPullImage340)
stop_process:skip
}

proctype TestPullImage34(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ListImages961 = [1] of {int};
	chan child_PullImage310 = [1] of {int};
	Mutexdef fakeManager_logReduction_errorMapLock;
	run mutexMonitor(fakeManager_logReduction_errorMapLock);
	run PullImage31(fakeManager_logReduction_errorMapLock,child_PullImage310);
	child_PullImage310?0;
	run ListImages96(fakeManager_logReduction_errorMapLock,child_ListImages961);
	child_ListImages961?0;
	stop_process: skip;
	child!0
}
proctype PullImage31(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_creds = -2; // opt var_creds
	

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
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype ListImages96(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_allImages = -2; // opt var_allImages
	

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

