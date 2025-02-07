// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/istio/istio/blob//pilot/pkg/networking/core/v1alpha3/cluster.go#L236
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_buildInboundLocalityLbEndpoints2360 = [1] of {int};
	run buildInboundLocalityLbEndpoints236(child_buildInboundLocalityLbEndpoints2360);
	run receiver(child_buildInboundLocalityLbEndpoints2360)
stop_process:skip
}

proctype buildInboundLocalityLbEndpoints236(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef lbEndpoint_LoadBalancingWeight_state_atomicMessageInfo_initMu;
	Mutexdef lbEndpoint_Metadata_state_atomicMessageInfo_initMu;
	Mutexdef lbEndpoint_state_atomicMessageInfo_initMu;
	Mutexdef address_state_atomicMessageInfo_initMu;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run mutexMonitor(address_state_atomicMessageInfo_initMu);
	run mutexMonitor(lbEndpoint_state_atomicMessageInfo_initMu);
	run mutexMonitor(lbEndpoint_Metadata_state_atomicMessageInfo_initMu);
	run mutexMonitor(lbEndpoint_LoadBalancingWeight_state_atomicMessageInfo_initMu);
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

