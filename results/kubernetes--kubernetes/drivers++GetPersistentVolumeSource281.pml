// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//test/e2e/storage/drivers/in_tree.go#L281
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
	chan child_GetPersistentVolumeSource2810 = [1] of {int};
	run GetPersistentVolumeSource281(child_GetPersistentVolumeSource2810);
	run receiver(child_GetPersistentVolumeSource2810)
stop_process:skip
}

proctype GetPersistentVolumeSource281(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef gv_f_flakeReport_lock;
	Wgdef gv_f_logsSizeVerifier_wg;
	Mutexdef gv_f_logsSizeVerifier_data_lock;
	Wgdef gv_f_logsSizeWaitGroup;
	Wgdef gv_f_gatherer_workerWg;
	run wgMonitor(gv_f_gatherer_workerWg);
	run wgMonitor(gv_f_logsSizeWaitGroup);
	run mutexMonitor(gv_f_logsSizeVerifier_data_lock);
	run wgMonitor(gv_f_logsSizeVerifier_wg);
	run mutexMonitor(gv_f_flakeReport_lock);
	goto stop_process;
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

