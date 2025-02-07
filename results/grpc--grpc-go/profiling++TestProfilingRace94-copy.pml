// num_comm_params=1
// num_mand_comm_params=1
// num_opt_comm_params=0

// git_link=https://github.com/grpc/grpc-go/blob//internal/profiling/profiling_test.go#L94
#define def_var_numTimers99  3 // mand numTimers line 99
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestProfilingRace940 = [1] of {int};
	run TestProfilingRace94(child_TestProfilingRace940);
	run receiver(child_TestProfilingRace940)
stop_process:skip
}

proctype TestProfilingRace94(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousTestProfilingRace1011010 = [1] of {int};
	Wgdef wg;
	Mutexdef stat_mu;
	int var_stat_Timers = -2; // opt var_stat_Timers
	int var_numTimers = def_var_numTimers99; // mand var_numTimers
	run mutexMonitor(stat_mu);
	run wgMonitor(wg);
	wg.update!var_numTimers;
		for(i : 0.. var_numTimers-1) {
		for10: skip;
		run AnonymousTestProfilingRace101101(wg,stat_mu,child_AnonymousTestProfilingRace1011010);
		run receiver(child_AnonymousTestProfilingRace1011010);
		for10_end: skip
	};
	for10_exit: skip;
	wg.wait?0;
	stop_process: skip;
	child!0
}
proctype AnonymousTestProfilingRace101101(Wgdef wg;Mutexdef stat_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AppendTimer1770 = [1] of {int};
	

	if
	:: true -> 
		run AppendTimer177(stat_mu,child_AppendTimer1770);
		child_AppendTimer1770?0
	fi;
		defer1: skip;
	wg.update!-1;
	stop_process: skip;
	child!0
}
proctype AppendTimer177(Mutexdef stat_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	stat_mu.Lock!false;
	stat_mu.Unlock!false;
	stop_process: skip;
	child!0
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
proctype wgMonitor(Wgdef wg) {
int i;
do
	:: wg.update?i ->
		wg.Counter = wg.Counter + i;
		assert(wg.Counter >= 0)
	:: wg.Counter == 0 ->
end: if
		:: wg.update?i ->
			wg.Counter = wg.Counter + i;
			assert(wg.Counter >= 0)
		:: wg.wait!0;
	fi
od
}

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

