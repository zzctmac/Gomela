// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/vault/blob//vault/seal_test.go#L14
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
	chan child_TestDefaultSeal_Config140 = [1] of {int};
	run TestDefaultSeal_Config14(child_TestDefaultSeal_Config140);
	run receiver(child_TestDefaultSeal_Config140)
stop_process:skip
}

proctype TestDefaultSeal_Config14(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef core_quotaManager_lock;
	Mutexdef core_quotaManager_rateLimitPathManager_l;
	Mutexdef core_quotaManager_db_writer;
	Mutexdef core_pendingRaftPeers_mu;
	Mutexdef core_raftFollowerStates_l;
	Mutexdef core_metricsHelper_LoopMetrics_Metrics_mu;
	Mutexdef core_metricsHelper_inMemSink_intervalLock;
	Mutexdef core_allLoggersLock;
	Mutexdef core_unsealWithStoredKeysLock;
	Mutexdef core_pluginCatalog_lock;
	Mutexdef core_pluginCatalog_catalogView_readOnlyErrLock;
	Mutexdef core_uiConfig_l;
	Mutexdef core_rpcClientConn_firstResolveEvent_o_m;
	Mutexdef core_rpcClientConn_balancerWrapper_mu;
	Mutexdef core_rpcClientConn_balancerWrapper_scBuffer_mu;
	Mutexdef core_rpcClientConn_balancerWrapper_balancerMu;
	Mutexdef core_rpcClientConn_resolverWrapper_pollingMu;
	Mutexdef core_rpcClientConn_resolverWrapper_resolverMu;
	Mutexdef core_rpcClientConn_mu;
	Mutexdef core_rpcClientConn_blockingpicker_mu;
	Mutexdef core_rpcClientConn_csMgr_mu;
	Mutexdef core_leaderParamsLock;
	Mutexdef core_requestForwardingConnectionLock;
	Mutexdef core_clusterParamsLock;
	Mutexdef core_reloadFuncsLock;
	Mutexdef core_metricsMutex;
	Mutexdef core_activityLog_view_readOnlyErrLock;
	Mutexdef core_activityLog_fragmentLock;
	Mutexdef core_activityLog_l;
	Mutexdef core_identityStore_groupLock;
	Mutexdef core_identityStore_oidcLock;
	Mutexdef core_identityStore_lock;
	Mutexdef core_identityStore_db_writer;
	Mutexdef core_tokenStore_saltLock;
	Mutexdef core_tokenStore_tokensPendingDeletion_mu;
	Mutexdef core_tokenStore_activityLog_view_readOnlyErrLock;
	Mutexdef core_tokenStore_activityLog_fragmentLock;
	Mutexdef core_tokenStore_activityLog_l;
	Mutexdef core_tokenStore_expiration_jobManager_l;
	Wgdef core_tokenStore_expiration_jobManager_wg;
	Mutexdef core_tokenStore_expiration_restoreLoaded_mu;
	Mutexdef core_tokenStore_expiration_restoreRequestLock;
	Mutexdef core_tokenStore_expiration_restoreModeLock;
	Mutexdef core_tokenStore_expiration_pendingLock;
	Mutexdef core_tokenStore_expiration_nonexpiring_mu;
	Mutexdef core_tokenStore_expiration_pending_mu;
	Mutexdef core_tokenStore_expiration_tokenView_readOnlyErrLock;
	Mutexdef core_tokenStore_expiration_idView_readOnlyErrLock;
	Mutexdef core_tokenStore_expiration_router_l;
	Mutexdef core_tokenStore_rolesBarrierView_readOnlyErrLock;
	Mutexdef core_tokenStore_parentBarrierView_readOnlyErrLock;
	Mutexdef core_tokenStore_accessorBarrierView_readOnlyErrLock;
	Mutexdef core_tokenStore_idBarrierView_readOnlyErrLock;
	Mutexdef core_tokenStore_baseBarrierView_readOnlyErrLock;
	Mutexdef core_policyStore_policyTypeMap_mu;
	Mutexdef core_policyStore_modifyLock;
	Mutexdef core_policyStore_egpLRU_lock;
	Mutexdef core_policyStore_tokenPoliciesLRU_lock;
	Mutexdef core_policyStore_egpView_readOnlyErrLock;
	Mutexdef core_policyStore_rgpView_readOnlyErrLock;
	Mutexdef core_policyStore_aclView_readOnlyErrLock;
	Mutexdef core_rollback_shutdownLock;
	Mutexdef core_rollback_inflightLock;
	Wgdef core_rollback_inflightAll;
	Mutexdef core_rollback_router_l;
	Mutexdef core_expiration_jobManager_l;
	Wgdef core_expiration_jobManager_wg;
	Mutexdef core_expiration_jobManager_onceStop_m;
	Mutexdef core_expiration_jobManager_onceStart_m;
	Wgdef core_expiration_jobManager_workerPool_wg;
	Mutexdef core_expiration_restoreLoaded_mu;
	Mutexdef core_expiration_restoreRequestLock;
	Mutexdef core_expiration_restoreModeLock;
	Mutexdef core_expiration_pendingLock;
	Mutexdef core_expiration_nonexpiring_mu;
	Mutexdef core_expiration_pending_mu;
	Mutexdef core_expiration_tokenStore_saltLock;
	Mutexdef core_expiration_tokenStore_tokensPendingDeletion_mu;
	Mutexdef core_expiration_tokenStore_activityLog_fragmentLock;
	Mutexdef core_expiration_tokenStore_activityLog_l;
	Mutexdef core_expiration_tokenStore_rolesBarrierView_readOnlyErrLock;
	Mutexdef core_expiration_tokenStore_parentBarrierView_readOnlyErrLock;
	Mutexdef core_expiration_tokenStore_accessorBarrierView_readOnlyErrLock;
	Mutexdef core_expiration_tokenStore_idBarrierView_readOnlyErrLock;
	Mutexdef core_expiration_tokenStore_baseBarrierView_readOnlyErrLock;
	Mutexdef core_expiration_tokenView_readOnlyErrLock;
	Mutexdef core_expiration_idView_readOnlyErrLock;
	Mutexdef core_expiration_router_l;
	Mutexdef core_systemBarrierView_readOnlyErrLock;
	Mutexdef core_systemBackend_mfaLock;
	Mutexdef core_systemBackend_db_writer;
	Mutexdef core_auditedHeaders_view_readOnlyErrLock;
	Mutexdef core_auditLock;
	Mutexdef core_authLock;
	Mutexdef core_mountsLock;
	Mutexdef core_rekeyLock;
	Mutexdef core_generateRootLock;
	Mutexdef core_router_l;
	Mutexdef core_raftInfo_leaderClient_config_modifyLock;
	Mutexdef core_raftInfo_leaderClient_modifyLock;
	run mutexMonitor(core_raftInfo_leaderClient_modifyLock);
	run mutexMonitor(core_raftInfo_leaderClient_config_modifyLock);
	run mutexMonitor(core_router_l);
	run mutexMonitor(core_generateRootLock);
	run mutexMonitor(core_rekeyLock);
	run mutexMonitor(core_mountsLock);
	run mutexMonitor(core_authLock);
	run mutexMonitor(core_auditLock);
	run mutexMonitor(core_auditedHeaders_view_readOnlyErrLock);
	run mutexMonitor(core_systemBackend_db_writer);
	run mutexMonitor(core_systemBackend_mfaLock);
	run mutexMonitor(core_systemBarrierView_readOnlyErrLock);
	run mutexMonitor(core_expiration_router_l);
	run mutexMonitor(core_expiration_idView_readOnlyErrLock);
	run mutexMonitor(core_expiration_tokenView_readOnlyErrLock);
	run mutexMonitor(core_expiration_tokenStore_baseBarrierView_readOnlyErrLock);
	run mutexMonitor(core_expiration_tokenStore_idBarrierView_readOnlyErrLock);
	run mutexMonitor(core_expiration_tokenStore_accessorBarrierView_readOnlyErrLock);
	run mutexMonitor(core_expiration_tokenStore_parentBarrierView_readOnlyErrLock);
	run mutexMonitor(core_expiration_tokenStore_rolesBarrierView_readOnlyErrLock);
	run mutexMonitor(core_expiration_tokenStore_activityLog_l);
	run mutexMonitor(core_expiration_tokenStore_activityLog_fragmentLock);
	run mutexMonitor(core_expiration_tokenStore_tokensPendingDeletion_mu);
	run mutexMonitor(core_expiration_tokenStore_saltLock);
	run mutexMonitor(core_expiration_pending_mu);
	run mutexMonitor(core_expiration_nonexpiring_mu);
	run mutexMonitor(core_expiration_pendingLock);
	run mutexMonitor(core_expiration_restoreModeLock);
	run mutexMonitor(core_expiration_restoreRequestLock);
	run mutexMonitor(core_expiration_restoreLoaded_mu);
	run wgMonitor(core_expiration_jobManager_workerPool_wg);
	run mutexMonitor(core_expiration_jobManager_onceStart_m);
	run mutexMonitor(core_expiration_jobManager_onceStop_m);
	run wgMonitor(core_expiration_jobManager_wg);
	run mutexMonitor(core_expiration_jobManager_l);
	run mutexMonitor(core_rollback_router_l);
	run wgMonitor(core_rollback_inflightAll);
	run mutexMonitor(core_rollback_inflightLock);
	run mutexMonitor(core_rollback_shutdownLock);
	run mutexMonitor(core_policyStore_aclView_readOnlyErrLock);
	run mutexMonitor(core_policyStore_rgpView_readOnlyErrLock);
	run mutexMonitor(core_policyStore_egpView_readOnlyErrLock);
	run mutexMonitor(core_policyStore_tokenPoliciesLRU_lock);
	run mutexMonitor(core_policyStore_egpLRU_lock);
	run mutexMonitor(core_policyStore_modifyLock);
	run mutexMonitor(core_policyStore_policyTypeMap_mu);
	run mutexMonitor(core_tokenStore_baseBarrierView_readOnlyErrLock);
	run mutexMonitor(core_tokenStore_idBarrierView_readOnlyErrLock);
	run mutexMonitor(core_tokenStore_accessorBarrierView_readOnlyErrLock);
	run mutexMonitor(core_tokenStore_parentBarrierView_readOnlyErrLock);
	run mutexMonitor(core_tokenStore_rolesBarrierView_readOnlyErrLock);
	run mutexMonitor(core_tokenStore_expiration_router_l);
	run mutexMonitor(core_tokenStore_expiration_idView_readOnlyErrLock);
	run mutexMonitor(core_tokenStore_expiration_tokenView_readOnlyErrLock);
	run mutexMonitor(core_tokenStore_expiration_pending_mu);
	run mutexMonitor(core_tokenStore_expiration_nonexpiring_mu);
	run mutexMonitor(core_tokenStore_expiration_pendingLock);
	run mutexMonitor(core_tokenStore_expiration_restoreModeLock);
	run mutexMonitor(core_tokenStore_expiration_restoreRequestLock);
	run mutexMonitor(core_tokenStore_expiration_restoreLoaded_mu);
	run wgMonitor(core_tokenStore_expiration_jobManager_wg);
	run mutexMonitor(core_tokenStore_expiration_jobManager_l);
	run mutexMonitor(core_tokenStore_activityLog_l);
	run mutexMonitor(core_tokenStore_activityLog_fragmentLock);
	run mutexMonitor(core_tokenStore_activityLog_view_readOnlyErrLock);
	run mutexMonitor(core_tokenStore_tokensPendingDeletion_mu);
	run mutexMonitor(core_tokenStore_saltLock);
	run mutexMonitor(core_identityStore_db_writer);
	run mutexMonitor(core_identityStore_lock);
	run mutexMonitor(core_identityStore_oidcLock);
	run mutexMonitor(core_identityStore_groupLock);
	run mutexMonitor(core_activityLog_l);
	run mutexMonitor(core_activityLog_fragmentLock);
	run mutexMonitor(core_activityLog_view_readOnlyErrLock);
	run mutexMonitor(core_metricsMutex);
	run mutexMonitor(core_reloadFuncsLock);
	run mutexMonitor(core_clusterParamsLock);
	run mutexMonitor(core_requestForwardingConnectionLock);
	run mutexMonitor(core_leaderParamsLock);
	run mutexMonitor(core_rpcClientConn_csMgr_mu);
	run mutexMonitor(core_rpcClientConn_blockingpicker_mu);
	run mutexMonitor(core_rpcClientConn_mu);
	run mutexMonitor(core_rpcClientConn_resolverWrapper_resolverMu);
	run mutexMonitor(core_rpcClientConn_resolverWrapper_pollingMu);
	run mutexMonitor(core_rpcClientConn_balancerWrapper_balancerMu);
	run mutexMonitor(core_rpcClientConn_balancerWrapper_scBuffer_mu);
	run mutexMonitor(core_rpcClientConn_balancerWrapper_mu);
	run mutexMonitor(core_rpcClientConn_firstResolveEvent_o_m);
	run mutexMonitor(core_uiConfig_l);
	run mutexMonitor(core_pluginCatalog_catalogView_readOnlyErrLock);
	run mutexMonitor(core_pluginCatalog_lock);
	run mutexMonitor(core_unsealWithStoredKeysLock);
	run mutexMonitor(core_allLoggersLock);
	run mutexMonitor(core_metricsHelper_inMemSink_intervalLock);
	run mutexMonitor(core_metricsHelper_LoopMetrics_Metrics_mu);
	run mutexMonitor(core_raftFollowerStates_l);
	run mutexMonitor(core_pendingRaftPeers_mu);
	run mutexMonitor(core_quotaManager_db_writer);
	run mutexMonitor(core_quotaManager_rateLimitPathManager_l);
	run mutexMonitor(core_quotaManager_lock);
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

