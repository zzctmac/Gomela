// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/grpc/grpc-go/blob//test/channelz_test.go#L740
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_doClientSideInitiatedFailedStream7400 = [1] of {int};
	run doClientSideInitiatedFailedStream740(child_doClientSideInitiatedFailedStream7400);
	run receiver(child_doClientSideInitiatedFailedStream7400)
stop_process:skip
}

proctype doClientSideInitiatedFailedStream740(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef __Payload_state_atomicMessageInfo_initMu;
	Mutexdef __state_atomicMessageInfo_initMu;
	Mutexdef sreq_Payload_state_atomicMessageInfo_initMu;
	Mutexdef sreq_state_atomicMessageInfo_initMu;
	Mutexdef smallPayload_state_atomicMessageInfo_initMu;
	run mutexMonitor(smallPayload_state_atomicMessageInfo_initMu);
	run mutexMonitor(sreq_state_atomicMessageInfo_initMu);
	run mutexMonitor(sreq_Payload_state_atomicMessageInfo_initMu);
	run mutexMonitor(__state_atomicMessageInfo_initMu);
	run mutexMonitor(__Payload_state_atomicMessageInfo_initMu);
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

