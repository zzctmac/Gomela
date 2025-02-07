// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/rclone/rclone/blob//backend/googlephotos/pattern_test.go#L390
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestPatternYears3900 = [1] of {int};
	run TestPatternYears390(child_TestPatternYears3900);
	run receiver(child_TestPatternYears3900)
stop_process:skip
}

proctype TestPatternYears390(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_years2500 = [1] of {int};
	Mutexdef f_albums_mu;
	Mutexdef f_t_context_mu;
	Mutexdef f_t_context_match_mu;
	int var_entries = -2; // opt var_entries
	run mutexMonitor(f_t_context_match_mu);
	run mutexMonitor(f_t_context_mu);
	run mutexMonitor(f_albums_mu);
	run years250(f_albums_mu,f_t_context_match_mu,f_t_context_mu,child_years2500);
	child_years2500?0;
	stop_process: skip;
	child!0
}
proctype years250(Mutexdef f_albums_mu;Mutexdef f_t_context_match_mu;Mutexdef f_t_context_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_f_startYear = -2; // opt var_f_startYear
	int var_currentYear = -2; // opt var_currentYear
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

