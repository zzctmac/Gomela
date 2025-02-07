// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/jesseduffield/lazydocker/blob//pkg/commands/os_test.go#L194
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestOSCommandUnquote1940 = [1] of {int};
	run TestOSCommandUnquote194(child_TestOSCommandUnquote1940);
	run receiver(child_TestOSCommandUnquote1940)
stop_process:skip
}

proctype TestOSCommandUnquote194(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Unquote1870 = [1] of {int};
	Mutexdef osCommand_Log_Logger_mu_lock;
	run mutexMonitor(osCommand_Log_Logger_mu_lock);
	run Unquote187(osCommand_Log_Logger_mu_lock,child_Unquote1870);
	child_Unquote1870?0;
	stop_process: skip;
	child!0
}
proctype Unquote187(Mutexdef c_Log_Logger_mu_lock;chan child) {
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

