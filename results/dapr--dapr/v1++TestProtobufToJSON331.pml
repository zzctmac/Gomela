// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/dapr/dapr/blob//pkg/messaging/v1/util_test.go#L331
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestProtobufToJSON3310 = [1] of {int};
	run TestProtobufToJSON331(child_TestProtobufToJSON3310);
	run receiver(child_TestProtobufToJSON3310)
stop_process:skip
}

proctype TestProtobufToJSON331(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ProtobufToJSON4360 = [1] of {int};
	Mutexdef tpb_state_atomicMessageInfo_initMu;
	run mutexMonitor(tpb_state_atomicMessageInfo_initMu);
	run ProtobufToJSON436(tpb_state_atomicMessageInfo_initMu,child_ProtobufToJSON4360);
	child_ProtobufToJSON4360?0;
	stop_process: skip;
	child!0
}
proctype ProtobufToJSON436(Mutexdef message_state_atomicMessageInfo_initMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
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

