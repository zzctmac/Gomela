// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/terraform/blob//terraform/node_output.go#L44
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_DynamicExpand440 = [1] of {int};
	run DynamicExpand44(child_DynamicExpand440);
	run receiver(child_DynamicExpand440)
stop_process:skip
}

proctype DynamicExpand44(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef expander_mu;
	int var_n_Changes = -2; // opt var_n_Changes
	int var_expander_ExpandModule = -2; // opt var_expander_ExpandModule
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run mutexMonitor(expander_mu);
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

