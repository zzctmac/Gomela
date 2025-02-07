// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/moby/moby/blob//daemon/events/events_test.go#L169
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestLoadBufferedEvents1690 = [1] of {int};
	run TestLoadBufferedEvents169(child_TestLoadBufferedEvents1690);
	run receiver(child_TestLoadBufferedEvents1690)
stop_process:skip
}

proctype TestLoadBufferedEvents169(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_loadBufferedEvents1330 = [1] of {int};
	Mutexdef events_pub_m;
	Mutexdef events_mu;
	run mutexMonitor(events_mu);
	run mutexMonitor(events_pub_m);
	run loadBufferedEvents133(events_mu,events_pub_m,child_loadBufferedEvents1330);
	child_loadBufferedEvents1330?0;
	stop_process: skip;
	child!0
}
proctype loadBufferedEvents133(Mutexdef e_mu;Mutexdef e_pub_m;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_e_events = -2; // opt var_e_events
	

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

