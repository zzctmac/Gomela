// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/pingcap/tidb/blob//planner/core/find_best_task.go#L1426
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
	chan child_crossEstimateIndexRowCount14260 = [1] of {int};
	run crossEstimateIndexRowCount1426(child_crossEstimateIndexRowCount14260);
	run receiver(child_crossEstimateIndexRowCount14260)
stop_process:skip
}

proctype crossEstimateIndexRowCount1426(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef sessVars_SequenceState_mu;
	Mutexdef sessVars_StmtCtx_digestMemo_m;
	Mutexdef sessVars_StmtCtx_RuntimeStatsColl_mu;
	Mutexdef sessVars_StmtCtx_DiskTracker_parMu;
	Mutexdef sessVars_StmtCtx_DiskTracker_actionMu;
	Mutexdef sessVars_StmtCtx_DiskTracker_mu;
	Mutexdef sessVars_StmtCtx_MemTracker_parMu;
	Mutexdef sessVars_StmtCtx_MemTracker_actionMu;
	Mutexdef sessVars_StmtCtx_MemTracker_mu;
	Mutexdef sessVars_StmtCtx_mu;
	Mutexdef sessVars_BinlogClient_Security_mutex;
	Wgdef sessVars_BinlogClient_wg;
	Mutexdef sessVars_TxnCtx_tdmLock;
	Mutexdef sessVars_UsersLock;
	run mutexMonitor(sessVars_UsersLock);
	run mutexMonitor(sessVars_TxnCtx_tdmLock);
	run wgMonitor(sessVars_BinlogClient_wg);
	run mutexMonitor(sessVars_BinlogClient_Security_mutex);
	run mutexMonitor(sessVars_StmtCtx_mu);
	run mutexMonitor(sessVars_StmtCtx_MemTracker_mu);
	run mutexMonitor(sessVars_StmtCtx_MemTracker_actionMu);
	run mutexMonitor(sessVars_StmtCtx_MemTracker_parMu);
	run mutexMonitor(sessVars_StmtCtx_DiskTracker_mu);
	run mutexMonitor(sessVars_StmtCtx_DiskTracker_actionMu);
	run mutexMonitor(sessVars_StmtCtx_DiskTracker_parMu);
	run mutexMonitor(sessVars_StmtCtx_RuntimeStatsColl_mu);
	run mutexMonitor(sessVars_StmtCtx_digestMemo_m);
	run mutexMonitor(sessVars_SequenceState_mu);
	

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

