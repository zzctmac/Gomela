// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/mattermost/mattermost-server/blob//store/searchtest/file_info_layer.go#L630
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_testFileInfoSearchOrExcludeFileInfosInChannel6300 = [1] of {int};
	run testFileInfoSearchOrExcludeFileInfosInChannel630(child_testFileInfoSearchOrExcludeFileInfosInChannel6300);
	run receiver(child_testFileInfoSearchOrExcludeFileInfosInChannel6300)
stop_process:skip
}

proctype testFileInfoSearchOrExcludeFileInfosInChannel630(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef post2_propsMu;
	Mutexdef post_propsMu;
	run mutexMonitor(post_propsMu);
	run mutexMonitor(post2_propsMu);
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

