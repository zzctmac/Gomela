// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/istio/istio/blob//galley/pkg/config/testing/fixtures/accumulator_test.go#L42
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestAccumulator_Clear420 = [1] of {int};
	run TestAccumulator_Clear42(child_TestAccumulator_Clear420);
	run receiver(child_TestAccumulator_Clear420)
stop_process:skip
}

proctype TestAccumulator_Clear42(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Clear692 = [1] of {int};
	chan child_Handle321 = [1] of {int};
	chan child_Handle320 = [1] of {int};
	Mutexdef a_mu;
	run mutexMonitor(a_mu);
	run Handle32(a_mu,child_Handle320);
	child_Handle320?0;
	run Handle32(a_mu,child_Handle321);
	child_Handle321?0;
	run Clear69(a_mu,child_Clear692);
	child_Clear692?0;
	stop_process: skip;
	child!0
}
proctype Handle32(Mutexdef a_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	a_mu.Lock!false;
		defer1: skip;
	a_mu.Unlock!false;
	stop_process: skip;
	child!0
}
proctype Clear69(Mutexdef a_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	a_mu.Lock!false;
		defer1: skip;
	a_mu.Unlock!false;
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

