// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/grpc/grpc-go/blob//xds/internal/client/watchers_cluster_test.go#L281
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestClusterWatchExpiryTimer2810 = [1] of {int};
	run TestClusterWatchExpiryTimer281(child_TestClusterWatchExpiryTimer2810);
	run receiver(child_TestClusterWatchExpiryTimer2810)
stop_process:skip
}

proctype TestClusterWatchExpiryTimer281(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Close6210 = [1] of {int};
	chan child_WatchCluster2651 = [1] of {int};
	Mutexdef apiClient_done_o_m;
	Mutexdef client_lrsMu;
	Mutexdef client_mu;
	Mutexdef client_updateCh_mu;
	Mutexdef client_cc_lceMu;
	Mutexdef client_cc_firstResolveEvent_o_m;
	Mutexdef client_cc_balancerWrapper_mu;
	Mutexdef client_cc_balancerWrapper_scBuffer_mu;
	Mutexdef client_cc_balancerWrapper_balancerMu;
	Mutexdef client_cc_resolverWrapper_pollingMu;
	Mutexdef client_cc_resolverWrapper_resolverMu;
	Mutexdef client_cc_mu;
	Mutexdef client_cc_safeConfigSelector_mu;
	Mutexdef client_cc_blockingpicker_mu;
	Mutexdef client_cc_csMgr_mu;
	Mutexdef client_done_o_m;
	run mutexMonitor(client_done_o_m);
	run mutexMonitor(client_cc_csMgr_mu);
	run mutexMonitor(client_cc_blockingpicker_mu);
	run mutexMonitor(client_cc_safeConfigSelector_mu);
	run mutexMonitor(client_cc_mu);
	run mutexMonitor(client_cc_resolverWrapper_resolverMu);
	run mutexMonitor(client_cc_resolverWrapper_pollingMu);
	run mutexMonitor(client_cc_balancerWrapper_balancerMu);
	run mutexMonitor(client_cc_balancerWrapper_scBuffer_mu);
	run mutexMonitor(client_cc_balancerWrapper_mu);
	run mutexMonitor(client_cc_firstResolveEvent_o_m);
	run mutexMonitor(client_cc_lceMu);
	run mutexMonitor(client_updateCh_mu);
	run mutexMonitor(client_mu);
	run mutexMonitor(client_lrsMu);
	run mutexMonitor(apiClient_done_o_m);
	run WatchCluster265(client_cc_balancerWrapper_balancerMu,client_cc_balancerWrapper_mu,client_cc_balancerWrapper_scBuffer_mu,client_cc_blockingpicker_mu,client_cc_csMgr_mu,client_cc_firstResolveEvent_o_m,client_cc_lceMu,client_cc_mu,client_cc_resolverWrapper_pollingMu,client_cc_resolverWrapper_resolverMu,client_cc_safeConfigSelector_mu,client_done_o_m,client_lrsMu,client_mu,client_updateCh_mu,child_WatchCluster2651);
	child_WatchCluster2651?0;
		defer1: skip;
	run Close621(client_cc_balancerWrapper_balancerMu,client_cc_balancerWrapper_mu,client_cc_balancerWrapper_scBuffer_mu,client_cc_blockingpicker_mu,client_cc_csMgr_mu,client_cc_firstResolveEvent_o_m,client_cc_lceMu,client_cc_mu,client_cc_resolverWrapper_pollingMu,client_cc_resolverWrapper_resolverMu,client_cc_safeConfigSelector_mu,client_done_o_m,client_lrsMu,client_mu,client_updateCh_mu,child_Close6210);
	child_Close6210?0;
	stop_process: skip;
	child!0
}
proctype Close621(Mutexdef c_cc_balancerWrapper_balancerMu;Mutexdef c_cc_balancerWrapper_mu;Mutexdef c_cc_balancerWrapper_scBuffer_mu;Mutexdef c_cc_blockingpicker_mu;Mutexdef c_cc_csMgr_mu;Mutexdef c_cc_firstResolveEvent_o_m;Mutexdef c_cc_lceMu;Mutexdef c_cc_mu;Mutexdef c_cc_resolverWrapper_pollingMu;Mutexdef c_cc_resolverWrapper_resolverMu;Mutexdef c_cc_safeConfigSelector_mu;Mutexdef c_done_o_m;Mutexdef c_lrsMu;Mutexdef c_mu;Mutexdef c_updateCh_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	stop_process: skip;
	child!0
}
proctype WatchCluster265(Mutexdef c_cc_balancerWrapper_balancerMu;Mutexdef c_cc_balancerWrapper_mu;Mutexdef c_cc_balancerWrapper_scBuffer_mu;Mutexdef c_cc_blockingpicker_mu;Mutexdef c_cc_csMgr_mu;Mutexdef c_cc_firstResolveEvent_o_m;Mutexdef c_cc_lceMu;Mutexdef c_cc_mu;Mutexdef c_cc_resolverWrapper_pollingMu;Mutexdef c_cc_resolverWrapper_resolverMu;Mutexdef c_cc_safeConfigSelector_mu;Mutexdef c_done_o_m;Mutexdef c_lrsMu;Mutexdef c_mu;Mutexdef c_updateCh_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_watch1161 = [1] of {int};
	Mutexdef wi_mu;
	Mutexdef wi_c_lrsMu;
	Mutexdef wi_c_mu;
	Mutexdef wi_c_updateCh_mu;
	Mutexdef wi_c_cc_lceMu;
	Mutexdef wi_c_cc_balancerWrapper_mu;
	Mutexdef wi_c_cc_balancerWrapper_balancerMu;
	Mutexdef wi_c_cc_resolverWrapper_pollingMu;
	Mutexdef wi_c_cc_resolverWrapper_resolverMu;
	Mutexdef wi_c_cc_mu;
	Mutexdef wi_c_cc_safeConfigSelector_mu;
	Mutexdef wi_c_cc_blockingpicker_mu;
	Mutexdef wi_c_cc_csMgr_mu;
	Mutexdef wi_c_done_o_m;
	run mutexMonitor(wi_c_done_o_m);
	run mutexMonitor(wi_c_cc_csMgr_mu);
	run mutexMonitor(wi_c_cc_blockingpicker_mu);
	run mutexMonitor(wi_c_cc_safeConfigSelector_mu);
	run mutexMonitor(wi_c_cc_mu);
	run mutexMonitor(wi_c_cc_resolverWrapper_resolverMu);
	run mutexMonitor(wi_c_cc_resolverWrapper_pollingMu);
	run mutexMonitor(wi_c_cc_balancerWrapper_balancerMu);
	run mutexMonitor(wi_c_cc_balancerWrapper_mu);
	run mutexMonitor(wi_c_cc_lceMu);
	run mutexMonitor(wi_c_updateCh_mu);
	run mutexMonitor(wi_c_mu);
	run mutexMonitor(wi_c_lrsMu);
	run mutexMonitor(wi_mu);
	run watch116(c_cc_balancerWrapper_balancerMu,c_cc_balancerWrapper_mu,c_cc_balancerWrapper_scBuffer_mu,c_cc_blockingpicker_mu,c_cc_csMgr_mu,c_cc_firstResolveEvent_o_m,c_cc_lceMu,c_cc_mu,c_cc_resolverWrapper_pollingMu,c_cc_resolverWrapper_resolverMu,c_cc_safeConfigSelector_mu,c_done_o_m,c_lrsMu,c_mu,c_updateCh_mu,wi_c_cc_balancerWrapper_balancerMu,wi_c_cc_balancerWrapper_mu,wi_c_cc_blockingpicker_mu,wi_c_cc_csMgr_mu,wi_c_cc_lceMu,wi_c_cc_mu,wi_c_cc_resolverWrapper_pollingMu,wi_c_cc_resolverWrapper_resolverMu,wi_c_cc_safeConfigSelector_mu,wi_c_done_o_m,wi_c_lrsMu,wi_c_mu,wi_c_updateCh_mu,wi_mu,child_watch1161);
	child_watch1161?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype watch116(Mutexdef c_cc_balancerWrapper_balancerMu;Mutexdef c_cc_balancerWrapper_mu;Mutexdef c_cc_balancerWrapper_scBuffer_mu;Mutexdef c_cc_blockingpicker_mu;Mutexdef c_cc_csMgr_mu;Mutexdef c_cc_firstResolveEvent_o_m;Mutexdef c_cc_lceMu;Mutexdef c_cc_mu;Mutexdef c_cc_resolverWrapper_pollingMu;Mutexdef c_cc_resolverWrapper_resolverMu;Mutexdef c_cc_safeConfigSelector_mu;Mutexdef c_done_o_m;Mutexdef c_lrsMu;Mutexdef c_mu;Mutexdef c_updateCh_mu;Mutexdef wi_c_cc_balancerWrapper_balancerMu;Mutexdef wi_c_cc_balancerWrapper_mu;Mutexdef wi_c_cc_blockingpicker_mu;Mutexdef wi_c_cc_csMgr_mu;Mutexdef wi_c_cc_lceMu;Mutexdef wi_c_cc_mu;Mutexdef wi_c_cc_resolverWrapper_pollingMu;Mutexdef wi_c_cc_resolverWrapper_resolverMu;Mutexdef wi_c_cc_safeConfigSelector_mu;Mutexdef wi_c_done_o_m;Mutexdef wi_c_lrsMu;Mutexdef wi_c_mu;Mutexdef wi_c_updateCh_mu;Mutexdef wi_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_newUpdate561 = [1] of {int};
	Mutexdef v_Raw_state_atomicMessageInfo_initMu;
	chan child_newUpdate562 = [1] of {int};
	chan child_newUpdate563 = [1] of {int};
	chan child_newUpdate564 = [1] of {int};
	c_mu.Lock!false;
	

	if
	:: true;
	:: true;
	:: true;
	:: true;
	:: true -> 
		goto defer1
	fi;
	

	if
	:: true -> 
		run mutexMonitor(v_Raw_state_atomicMessageInfo_initMu);
		

		if
		:: true -> 
			run newUpdate56(wi_c_cc_balancerWrapper_balancerMu,wi_c_cc_balancerWrapper_mu,wi_c_cc_blockingpicker_mu,wi_c_cc_csMgr_mu,wi_c_cc_lceMu,wi_c_cc_mu,wi_c_cc_resolverWrapper_pollingMu,wi_c_cc_resolverWrapper_resolverMu,wi_c_cc_safeConfigSelector_mu,wi_c_done_o_m,wi_c_lrsMu,wi_c_mu,wi_c_updateCh_mu,wi_mu,v_Raw_state_atomicMessageInfo_initMu,child_newUpdate561);
			child_newUpdate561?0
		:: true;
		fi
	:: true -> 
		

		if
		:: true -> 
			run newUpdate56(wi_c_cc_balancerWrapper_balancerMu,wi_c_cc_balancerWrapper_mu,wi_c_cc_blockingpicker_mu,wi_c_cc_csMgr_mu,wi_c_cc_lceMu,wi_c_cc_mu,wi_c_cc_resolverWrapper_pollingMu,wi_c_cc_resolverWrapper_resolverMu,wi_c_cc_safeConfigSelector_mu,wi_c_done_o_m,wi_c_lrsMu,wi_c_mu,wi_c_updateCh_mu,wi_mu,v_Raw_state_atomicMessageInfo_initMu,child_newUpdate562);
			child_newUpdate562?0
		:: true;
		fi
	:: true -> 
		

		if
		:: true -> 
			run newUpdate56(wi_c_cc_balancerWrapper_balancerMu,wi_c_cc_balancerWrapper_mu,wi_c_cc_blockingpicker_mu,wi_c_cc_csMgr_mu,wi_c_cc_lceMu,wi_c_cc_mu,wi_c_cc_resolverWrapper_pollingMu,wi_c_cc_resolverWrapper_resolverMu,wi_c_cc_safeConfigSelector_mu,wi_c_done_o_m,wi_c_lrsMu,wi_c_mu,wi_c_updateCh_mu,wi_mu,v_Raw_state_atomicMessageInfo_initMu,child_newUpdate563);
			child_newUpdate563?0
		:: true;
		fi
	:: true -> 
		

		if
		:: true -> 
			run newUpdate56(wi_c_cc_balancerWrapper_balancerMu,wi_c_cc_balancerWrapper_mu,wi_c_cc_blockingpicker_mu,wi_c_cc_csMgr_mu,wi_c_cc_lceMu,wi_c_cc_mu,wi_c_cc_resolverWrapper_pollingMu,wi_c_cc_resolverWrapper_resolverMu,wi_c_cc_safeConfigSelector_mu,wi_c_done_o_m,wi_c_lrsMu,wi_c_mu,wi_c_updateCh_mu,wi_mu,v_Raw_state_atomicMessageInfo_initMu,child_newUpdate564);
			child_newUpdate564?0
		:: true;
		fi
	fi;
	goto defer1;
		defer1: skip;
	c_mu.Unlock!false;
	stop_process: skip;
	child!0
}
proctype newUpdate56(Mutexdef wi_c_cc_balancerWrapper_balancerMu;Mutexdef wi_c_cc_balancerWrapper_mu;Mutexdef wi_c_cc_blockingpicker_mu;Mutexdef wi_c_cc_csMgr_mu;Mutexdef wi_c_cc_lceMu;Mutexdef wi_c_cc_mu;Mutexdef wi_c_cc_resolverWrapper_pollingMu;Mutexdef wi_c_cc_resolverWrapper_resolverMu;Mutexdef wi_c_cc_safeConfigSelector_mu;Mutexdef wi_c_done_o_m;Mutexdef wi_c_lrsMu;Mutexdef wi_c_mu;Mutexdef wi_c_updateCh_mu;Mutexdef wi_mu;Mutexdef update_Raw_state_atomicMessageInfo_initMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_scheduleCallback291 = [1] of {int};
	wi_mu.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run scheduleCallback29(wi_c_cc_balancerWrapper_balancerMu,wi_c_cc_balancerWrapper_mu,wi_c_cc_blockingpicker_mu,wi_c_cc_csMgr_mu,wi_c_cc_lceMu,wi_c_cc_mu,wi_c_cc_resolverWrapper_pollingMu,wi_c_cc_resolverWrapper_resolverMu,wi_c_cc_safeConfigSelector_mu,wi_c_done_o_m,wi_c_lrsMu,wi_c_mu,wi_c_updateCh_mu,wi_c_cc_balancerWrapper_balancerMu,wi_c_cc_balancerWrapper_mu,wi_c_cc_blockingpicker_mu,wi_c_cc_csMgr_mu,wi_c_cc_lceMu,wi_c_cc_mu,wi_c_cc_resolverWrapper_pollingMu,wi_c_cc_resolverWrapper_resolverMu,wi_c_cc_safeConfigSelector_mu,wi_c_done_o_m,wi_c_lrsMu,wi_c_mu,wi_c_updateCh_mu,wi_mu,update_Raw_state_atomicMessageInfo_initMu,child_scheduleCallback291);
	child_scheduleCallback291?0;
		defer1: skip;
	wi_mu.Unlock!false;
	stop_process: skip;
	child!0
}
proctype scheduleCallback29(Mutexdef c_cc_balancerWrapper_balancerMu;Mutexdef c_cc_balancerWrapper_mu;Mutexdef c_cc_blockingpicker_mu;Mutexdef c_cc_csMgr_mu;Mutexdef c_cc_lceMu;Mutexdef c_cc_mu;Mutexdef c_cc_resolverWrapper_pollingMu;Mutexdef c_cc_resolverWrapper_resolverMu;Mutexdef c_cc_safeConfigSelector_mu;Mutexdef c_done_o_m;Mutexdef c_lrsMu;Mutexdef c_mu;Mutexdef c_updateCh_mu;Mutexdef wi_c_cc_balancerWrapper_balancerMu;Mutexdef wi_c_cc_balancerWrapper_mu;Mutexdef wi_c_cc_blockingpicker_mu;Mutexdef wi_c_cc_csMgr_mu;Mutexdef wi_c_cc_lceMu;Mutexdef wi_c_cc_mu;Mutexdef wi_c_cc_resolverWrapper_pollingMu;Mutexdef wi_c_cc_resolverWrapper_resolverMu;Mutexdef wi_c_cc_safeConfigSelector_mu;Mutexdef wi_c_done_o_m;Mutexdef wi_c_lrsMu;Mutexdef wi_c_mu;Mutexdef wi_c_updateCh_mu;Mutexdef wi_mu;Mutexdef update_Raw_state_atomicMessageInfo_initMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
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

