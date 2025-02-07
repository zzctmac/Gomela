// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//test/e2e/storage/drivers/in_tree.go#L717
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
	chan child_GetPersistentVolumeSource7170 = [1] of {int};
	run GetPersistentVolumeSource717(child_GetPersistentVolumeSource7170);
	run receiver(child_GetPersistentVolumeSource7170)
stop_process:skip
}

proctype GetPersistentVolumeSource717(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef cv_f_flakeReport_lock;
	Wgdef cv_f_logsSizeVerifier_wg;
	Mutexdef cv_f_logsSizeVerifier_data_lock;
	Wgdef cv_f_logsSizeWaitGroup;
	Wgdef cv_f_gatherer_workerWg;
	run wgMonitor(cv_f_gatherer_workerWg);
	run wgMonitor(cv_f_logsSizeWaitGroup);
	run mutexMonitor(cv_f_logsSizeVerifier_data_lock);
	run wgMonitor(cv_f_logsSizeVerifier_wg);
	run mutexMonitor(cv_f_flakeReport_lock);
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

