// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/moby/moby/blob//volume/local/local_test.go#L158
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestValidateName1580 = [1] of {int};
	run TestValidateName158(child_TestValidateName1580);
	run receiver(child_TestValidateName1580)
stop_process:skip
}

proctype TestValidateName158(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_validateName2660 = [1] of {int};
	chan child_validateName2661 = [1] of {int};
	Mutexdef r_m;
	int var_names = -2; // opt var_names
	run mutexMonitor(r_m);
	

	if
	:: var_names-1 != -3 -> 
				for(i : 0.. var_names-1) {
			for10: skip;
			run validateName266(r_m,child_validateName2660);
			child_validateName2660?0;
			for10_end: skip
		};
		for10_exit: skip
	:: else -> 
		do
		:: true -> 
			for11: skip;
			run validateName266(r_m,child_validateName2661);
			child_validateName2661?0;
			for11_end: skip
		:: true -> 
			break
		od;
		for11_exit: skip
	fi;
	stop_process: skip;
	child!0
}
proctype validateName266(Mutexdef r_m;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

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

