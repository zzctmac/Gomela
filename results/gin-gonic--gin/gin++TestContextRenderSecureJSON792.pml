// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/gin-gonic/gin/blob//context_test.go#L792
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestContextRenderSecureJSON7920 = [1] of {int};
	run TestContextRenderSecureJSON792(child_TestContextRenderSecureJSON7920);
	run receiver(child_TestContextRenderSecureJSON7920)
stop_process:skip
}

proctype TestContextRenderSecureJSON792(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_SecureJSON9370 = [1] of {int};
	Mutexdef c_mu;
	run mutexMonitor(c_mu);
	run SecureJSON937(c_mu,child_SecureJSON9370);
	child_SecureJSON9370?0;
	stop_process: skip;
	child!0
}
proctype SecureJSON937(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Render9040 = [1] of {int};
	run Render904(c_mu,child_Render9040);
	child_Render9040?0;
	stop_process: skip;
	child!0
}
proctype Render904(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Status8410 = [1] of {int};
	run Status841(c_mu,child_Status8410);
	child_Status8410?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	stop_process: skip;
	child!0
}
proctype Status841(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
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

