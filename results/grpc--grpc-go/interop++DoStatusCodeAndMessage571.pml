// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/grpc/grpc-go/blob//interop/test_utils.go#L571
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_DoStatusCodeAndMessage5710 = [1] of {int};
	run DoStatusCodeAndMessage571(child_DoStatusCodeAndMessage5710);
	run receiver(child_DoStatusCodeAndMessage5710)
stop_process:skip
}

proctype DoStatusCodeAndMessage571(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef streamReq_ResponseStatus_state_atomicMessageInfo_initMu;
	Mutexdef streamReq_Payload_state_atomicMessageInfo_initMu;
	Mutexdef streamReq_state_atomicMessageInfo_initMu;
	Mutexdef __Payload_state_atomicMessageInfo_initMu;
	Mutexdef __state_atomicMessageInfo_initMu;
	Mutexdef req_ExpectCompressed_state_atomicMessageInfo_initMu;
	Mutexdef req_ResponseStatus_state_atomicMessageInfo_initMu;
	Mutexdef req_ResponseCompressed_state_atomicMessageInfo_initMu;
	Mutexdef req_Payload_state_atomicMessageInfo_initMu;
	Mutexdef req_state_atomicMessageInfo_initMu;
	Mutexdef respStatus_state_atomicMessageInfo_initMu;
	run mutexMonitor(respStatus_state_atomicMessageInfo_initMu);
	run mutexMonitor(req_state_atomicMessageInfo_initMu);
	run mutexMonitor(req_Payload_state_atomicMessageInfo_initMu);
	run mutexMonitor(req_ResponseCompressed_state_atomicMessageInfo_initMu);
	run mutexMonitor(req_ResponseStatus_state_atomicMessageInfo_initMu);
	run mutexMonitor(req_ExpectCompressed_state_atomicMessageInfo_initMu);
	run mutexMonitor(__state_atomicMessageInfo_initMu);
	run mutexMonitor(__Payload_state_atomicMessageInfo_initMu);
	run mutexMonitor(streamReq_state_atomicMessageInfo_initMu);
	run mutexMonitor(streamReq_Payload_state_atomicMessageInfo_initMu);
	run mutexMonitor(streamReq_ResponseStatus_state_atomicMessageInfo_initMu);
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

