// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/gin-gonic/gin/blob//context_test.go#L1653
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestContextShouldBindWithJSON16530 = [1] of {int};
	run TestContextShouldBindWithJSON1653(child_TestContextShouldBindWithJSON16530);
	run receiver(child_TestContextShouldBindWithJSON16530)
stop_process:skip
}

proctype TestContextShouldBindWithJSON1653(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ShouldBindJSON6670 = [1] of {int};
	Mutexdef c_mu;
	run mutexMonitor(c_mu);
	run ShouldBindJSON667(c_mu,child_ShouldBindJSON6670);
	child_ShouldBindJSON6670?0;
	stop_process: skip;
	child!0
}
proctype ShouldBindJSON667(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ShouldBindWith7020 = [1] of {int};
	run ShouldBindWith702(c_mu,child_ShouldBindWith7020);
	child_ShouldBindWith7020?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype ShouldBindWith702(Mutexdef c_mu;chan child) {
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

