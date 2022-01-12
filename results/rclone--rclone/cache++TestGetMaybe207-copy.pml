// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/rclone/rclone/blob//lib/cache/cache_test.go#L207
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestGetMaybe2070 = [1] of {int};
	run TestGetMaybe207(child_TestGetMaybe2070);
	run receiver(child_TestGetMaybe2070)
stop_process:skip
}

proctype TestGetMaybe207(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_GetMaybe1114 = [1] of {int};
	chan child_Clear1633 = [1] of {int};
	chan child_GetMaybe1112 = [1] of {int};
	chan child_Get561 = [1] of {int};
	chan child_GetMaybe1110 = [1] of {int};
	Mutexdef c_mu;
	run mutexMonitor(c_mu);
	run GetMaybe111(c_mu,child_GetMaybe1110);
	child_GetMaybe1110?0;
	run Get56(c_mu,child_Get561);
	child_Get561?0;
	run GetMaybe111(c_mu,child_GetMaybe1112);
	child_GetMaybe1112?0;
	run Clear163(c_mu,child_Clear1633);
	child_Clear1633?0;
	run GetMaybe111(c_mu,child_GetMaybe1114);
	child_GetMaybe1114?0;
	stop_process: skip;
	child!0
}
proctype GetMaybe111(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_used460 = [1] of {int};
	c_mu.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run used46(c_mu,child_used460);
	child_used460?0;
	goto defer1;
		defer1: skip;
	c_mu.Unlock!false;
	stop_process: skip;
	child!0
}
proctype used46(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	stop_process: skip;
	child!0
}
proctype Get56(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_used461 = [1] of {int};
	c_mu.Lock!false;
	

	if
	:: true -> 
		c_mu.Unlock!false;
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
		c_mu.Lock!false
	:: true;
	fi;
	run used46(c_mu,child_used461);
	child_used461?0;
	goto defer1;
		defer1: skip;
	c_mu.Unlock!false;
	stop_process: skip;
	child!0
}
proctype Clear163(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_c_cache = -2; // opt var_c_cache
	c_mu.Lock!false;
	c_mu.Unlock!false;
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

