// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/pingcap/tidb/blob//sessionctx/binloginfo/binloginfo.go#L100
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
	chan child_GetPrewriteValue1000 = [1] of {int};
	run GetPrewriteValue100(child_GetPrewriteValue1000);
	run receiver(child_GetPrewriteValue1000)
stop_process:skip
}

proctype GetPrewriteValue100(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef vars_SequenceState_mu;
	Mutexdef vars_StmtCtx_digestMemo_m;
	Mutexdef vars_StmtCtx_RuntimeStatsColl_mu;
	Mutexdef vars_StmtCtx_DiskTracker_parMu;
	Mutexdef vars_StmtCtx_DiskTracker_actionMu;
	Mutexdef vars_StmtCtx_DiskTracker_mu;
	Mutexdef vars_StmtCtx_MemTracker_parMu;
	Mutexdef vars_StmtCtx_MemTracker_actionMu;
	Mutexdef vars_StmtCtx_MemTracker_mu;
	Mutexdef vars_StmtCtx_mu;
	Mutexdef vars_BinlogClient_Security_mutex;
	Wgdef vars_BinlogClient_wg;
	Mutexdef vars_TxnCtx_tdmLock;
	Mutexdef vars_UsersLock;
	run mutexMonitor(vars_UsersLock);
	run mutexMonitor(vars_TxnCtx_tdmLock);
	run wgMonitor(vars_BinlogClient_wg);
	run mutexMonitor(vars_BinlogClient_Security_mutex);
	run mutexMonitor(vars_StmtCtx_mu);
	run mutexMonitor(vars_StmtCtx_MemTracker_mu);
	run mutexMonitor(vars_StmtCtx_MemTracker_actionMu);
	run mutexMonitor(vars_StmtCtx_MemTracker_parMu);
	run mutexMonitor(vars_StmtCtx_DiskTracker_mu);
	run mutexMonitor(vars_StmtCtx_DiskTracker_actionMu);
	run mutexMonitor(vars_StmtCtx_DiskTracker_parMu);
	run mutexMonitor(vars_StmtCtx_RuntimeStatsColl_mu);
	run mutexMonitor(vars_StmtCtx_digestMemo_m);
	run mutexMonitor(vars_SequenceState_mu);
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

