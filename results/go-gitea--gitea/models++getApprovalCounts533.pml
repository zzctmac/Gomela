// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/go-gitea/gitea/blob//models/issue_list.go#L533
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_getApprovalCounts5330 = [1] of {int};
	run getApprovalCounts533(child_getApprovalCounts5330);
	run receiver(child_getApprovalCounts5330)
stop_process:skip
}

proctype getApprovalCounts533(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef sess_statement_tagParser_tableCache_mu;
	Mutexdef sess_statement_tagParser_cacherMgr_cacherLock;
	Mutexdef sess_tx_db_reflectCacheMutex;
	Mutexdef sess_engine_db_reflectCacheMutex;
	Mutexdef sess_engine_tagParser_tableCache_mu;
	Mutexdef sess_engine_tagParser_cacherMgr_cacherLock;
	Mutexdef sess_engine_cacherMgr_cacherLock;
	int var_rCounts = -2; // opt var_rCounts
	int var_issues = -2; // opt var_issues
	run mutexMonitor(sess_engine_cacherMgr_cacherLock);
	run mutexMonitor(sess_engine_tagParser_cacherMgr_cacherLock);
	run mutexMonitor(sess_engine_tagParser_tableCache_mu);
	run mutexMonitor(sess_engine_db_reflectCacheMutex);
	run mutexMonitor(sess_tx_db_reflectCacheMutex);
	run mutexMonitor(sess_statement_tagParser_cacherMgr_cacherLock);
	run mutexMonitor(sess_statement_tagParser_tableCache_mu);
	

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

