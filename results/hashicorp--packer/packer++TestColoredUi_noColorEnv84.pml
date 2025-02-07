// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/packer/blob//packer/ui_test.go#L84
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestColoredUi_noColorEnv840 = [1] of {int};
	run TestColoredUi_noColorEnv84(child_TestColoredUi_noColorEnv840);
	run receiver(child_TestColoredUi_noColorEnv840)
stop_process:skip
}

proctype TestColoredUi_noColorEnv84(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_readErrorWriter272 = [1] of {int};
	chan child_readWriter141 = [1] of {int};
	chan child_readWriter140 = [1] of {int};
	Mutexdef bufferUi_l;
	run mutexMonitor(bufferUi_l);
	run readWriter14(bufferUi_l,child_readWriter140);
	child_readWriter140?0;
	run readWriter14(bufferUi_l,child_readWriter141);
	child_readWriter141?0;
	run readErrorWriter27(bufferUi_l,child_readErrorWriter272);
	child_readErrorWriter272?0;
	stop_process: skip;
	child!0
}
proctype readWriter14(Mutexdef ui_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype readErrorWriter27(Mutexdef ui_l;chan child) {
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

