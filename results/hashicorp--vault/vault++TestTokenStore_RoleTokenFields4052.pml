// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/vault/blob//vault/token_store_test.go#L4052
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
	chan child_TestTokenStore_RoleTokenFields40520 = [1] of {int};
	run TestTokenStore_RoleTokenFields4052(child_TestTokenStore_RoleTokenFields40520);
	run receiver(child_TestTokenStore_RoleTokenFields40520)
stop_process:skip
}

proctype TestTokenStore_RoleTokenFields4052(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef ts_saltLock;
	Mutexdef ts_tokensPendingDeletion_mu;
	Mutexdef ts_activityLog_view_readOnlyErrLock;
	Mutexdef ts_activityLog_fragmentLock;
	Mutexdef ts_activityLog_l;
	Mutexdef ts_activityLog_core_quotaManager_lock;
	Mutexdef ts_activityLog_core_pendingRaftPeers_mu;
	Mutexdef ts_activityLog_core_raftFollowerStates_l;
	Mutexdef ts_activityLog_core_allLoggersLock;
	Mutexdef ts_activityLog_core_unsealWithStoredKeysLock;
	Mutexdef ts_activityLog_core_pluginCatalog_lock;
	Mutexdef ts_activityLog_core_uiConfig_l;
	Mutexdef ts_activityLog_core_rpcClientConn_mu;
	Mutexdef ts_activityLog_core_leaderParamsLock;
	Mutexdef ts_activityLog_core_requestForwardingConnectionLock;
	Mutexdef ts_activityLog_core_clusterParamsLock;
	Mutexdef ts_activityLog_core_reloadFuncsLock;
	Mutexdef ts_activityLog_core_metricsMutex;
	Mutexdef ts_activityLog_core_identityStore_groupLock;
	Mutexdef ts_activityLog_core_identityStore_oidcLock;
	Mutexdef ts_activityLog_core_identityStore_lock;
	Mutexdef ts_activityLog_core_policyStore_modifyLock;
	Mutexdef ts_activityLog_core_rollback_shutdownLock;
	Mutexdef ts_activityLog_core_rollback_inflightLock;
	Wgdef ts_activityLog_core_rollback_inflightAll;
	Mutexdef ts_activityLog_core_expiration_restoreRequestLock;
	Mutexdef ts_activityLog_core_expiration_restoreModeLock;
	Mutexdef ts_activityLog_core_expiration_pendingLock;
	Mutexdef ts_activityLog_core_systemBarrierView_readOnlyErrLock;
	Mutexdef ts_activityLog_core_systemBackend_mfaLock;
	Mutexdef ts_activityLog_core_auditLock;
	Mutexdef ts_activityLog_core_authLock;
	Mutexdef ts_activityLog_core_mountsLock;
	Mutexdef ts_activityLog_core_rekeyLock;
	Mutexdef ts_activityLog_core_generateRootLock;
	Mutexdef ts_activityLog_core_router_l;
	Mutexdef ts_expiration_jobManager_l;
	Wgdef ts_expiration_jobManager_wg;
	Mutexdef ts_expiration_jobManager_onceStop_m;
	Mutexdef ts_expiration_jobManager_onceStart_m;
	Wgdef ts_expiration_jobManager_workerPool_wg;
	Mutexdef ts_expiration_restoreLoaded_mu;
	Mutexdef ts_expiration_restoreRequestLock;
	Mutexdef ts_expiration_restoreModeLock;
	Mutexdef ts_expiration_pendingLock;
	Mutexdef ts_expiration_nonexpiring_mu;
	Mutexdef ts_expiration_pending_mu;
	Mutexdef ts_expiration_tokenView_readOnlyErrLock;
	Mutexdef ts_expiration_idView_readOnlyErrLock;
	Mutexdef ts_expiration_router_l;
	Mutexdef ts_expiration_core_quotaManager_lock;
	Mutexdef ts_expiration_core_pendingRaftPeers_mu;
	Mutexdef ts_expiration_core_raftFollowerStates_l;
	Mutexdef ts_expiration_core_allLoggersLock;
	Mutexdef ts_expiration_core_unsealWithStoredKeysLock;
	Mutexdef ts_expiration_core_pluginCatalog_lock;
	Mutexdef ts_expiration_core_uiConfig_l;
	Mutexdef ts_expiration_core_rpcClientConn_mu;
	Mutexdef ts_expiration_core_leaderParamsLock;
	Mutexdef ts_expiration_core_requestForwardingConnectionLock;
	Mutexdef ts_expiration_core_clusterParamsLock;
	Mutexdef ts_expiration_core_reloadFuncsLock;
	Mutexdef ts_expiration_core_metricsMutex;
	Mutexdef ts_expiration_core_activityLog_fragmentLock;
	Mutexdef ts_expiration_core_activityLog_l;
	Mutexdef ts_expiration_core_identityStore_groupLock;
	Mutexdef ts_expiration_core_identityStore_oidcLock;
	Mutexdef ts_expiration_core_identityStore_lock;
	Mutexdef ts_expiration_core_policyStore_modifyLock;
	Mutexdef ts_expiration_core_rollback_shutdownLock;
	Mutexdef ts_expiration_core_rollback_inflightLock;
	Wgdef ts_expiration_core_rollback_inflightAll;
	Mutexdef ts_expiration_core_systemBarrierView_readOnlyErrLock;
	Mutexdef ts_expiration_core_systemBackend_mfaLock;
	Mutexdef ts_expiration_core_auditLock;
	Mutexdef ts_expiration_core_authLock;
	Mutexdef ts_expiration_core_mountsLock;
	Mutexdef ts_expiration_core_rekeyLock;
	Mutexdef ts_expiration_core_generateRootLock;
	Mutexdef ts_expiration_core_router_l;
	Mutexdef ts_rolesBarrierView_readOnlyErrLock;
	Mutexdef ts_parentBarrierView_readOnlyErrLock;
	Mutexdef ts_accessorBarrierView_readOnlyErrLock;
	Mutexdef ts_idBarrierView_readOnlyErrLock;
	Mutexdef ts_baseBarrierView_readOnlyErrLock;
	Mutexdef ts_core_quotaManager_lock;
	Mutexdef ts_core_quotaManager_rateLimitPathManager_l;
	Mutexdef ts_core_quotaManager_db_writer;
	Mutexdef ts_core_pendingRaftPeers_mu;
	Mutexdef ts_core_raftFollowerStates_l;
	Mutexdef ts_core_metricsHelper_inMemSink_intervalLock;
	Mutexdef ts_core_allLoggersLock;
	Mutexdef ts_core_unsealWithStoredKeysLock;
	Mutexdef ts_core_pluginCatalog_lock;
	Mutexdef ts_core_pluginCatalog_catalogView_readOnlyErrLock;
	Mutexdef ts_core_uiConfig_l;
	Mutexdef ts_core_rpcClientConn_balancerWrapper_mu;
	Mutexdef ts_core_rpcClientConn_balancerWrapper_balancerMu;
	Mutexdef ts_core_rpcClientConn_resolverWrapper_pollingMu;
	Mutexdef ts_core_rpcClientConn_resolverWrapper_resolverMu;
	Mutexdef ts_core_rpcClientConn_mu;
	Mutexdef ts_core_rpcClientConn_blockingpicker_mu;
	Mutexdef ts_core_rpcClientConn_csMgr_mu;
	Mutexdef ts_core_leaderParamsLock;
	Mutexdef ts_core_requestForwardingConnectionLock;
	Mutexdef ts_core_clusterParamsLock;
	Mutexdef ts_core_reloadFuncsLock;
	Mutexdef ts_core_metricsMutex;
	Mutexdef ts_core_activityLog_view_readOnlyErrLock;
	Mutexdef ts_core_activityLog_fragmentLock;
	Mutexdef ts_core_activityLog_l;
	Mutexdef ts_core_identityStore_groupLock;
	Mutexdef ts_core_identityStore_oidcLock;
	Mutexdef ts_core_identityStore_lock;
	Mutexdef ts_core_identityStore_db_writer;
	Mutexdef ts_core_policyStore_policyTypeMap_mu;
	Mutexdef ts_core_policyStore_modifyLock;
	Mutexdef ts_core_policyStore_egpLRU_lock;
	Mutexdef ts_core_policyStore_tokenPoliciesLRU_lock;
	Mutexdef ts_core_policyStore_egpView_readOnlyErrLock;
	Mutexdef ts_core_policyStore_rgpView_readOnlyErrLock;
	Mutexdef ts_core_policyStore_aclView_readOnlyErrLock;
	Mutexdef ts_core_rollback_shutdownLock;
	Mutexdef ts_core_rollback_inflightLock;
	Wgdef ts_core_rollback_inflightAll;
	Mutexdef ts_core_rollback_router_l;
	Mutexdef ts_core_expiration_jobManager_l;
	Wgdef ts_core_expiration_jobManager_wg;
	Mutexdef ts_core_expiration_restoreLoaded_mu;
	Mutexdef ts_core_expiration_restoreRequestLock;
	Mutexdef ts_core_expiration_restoreModeLock;
	Mutexdef ts_core_expiration_pendingLock;
	Mutexdef ts_core_expiration_nonexpiring_mu;
	Mutexdef ts_core_expiration_pending_mu;
	Mutexdef ts_core_expiration_tokenView_readOnlyErrLock;
	Mutexdef ts_core_expiration_idView_readOnlyErrLock;
	Mutexdef ts_core_expiration_router_l;
	Mutexdef ts_core_systemBarrierView_readOnlyErrLock;
	Mutexdef ts_core_systemBackend_mfaLock;
	Mutexdef ts_core_systemBackend_db_writer;
	Mutexdef ts_core_auditedHeaders_view_readOnlyErrLock;
	Mutexdef ts_core_auditLock;
	Mutexdef ts_core_authLock;
	Mutexdef ts_core_mountsLock;
	Mutexdef ts_core_rekeyLock;
	Mutexdef ts_core_generateRootLock;
	Mutexdef ts_core_router_l;
	Mutexdef ts_core_raftInfo_leaderClient_modifyLock;
	Mutexdef c_quotaManager_lock;
	Mutexdef c_quotaManager_rateLimitPathManager_l;
	Mutexdef c_quotaManager_db_writer;
	Mutexdef c_pendingRaftPeers_mu;
	Mutexdef c_raftFollowerStates_l;
	Mutexdef c_metricsHelper_LoopMetrics_Metrics_mu;
	Mutexdef c_metricsHelper_inMemSink_intervalLock;
	Mutexdef c_allLoggersLock;
	Mutexdef c_unsealWithStoredKeysLock;
	Mutexdef c_pluginCatalog_lock;
	Mutexdef c_pluginCatalog_catalogView_readOnlyErrLock;
	Mutexdef c_uiConfig_l;
	Mutexdef c_rpcClientConn_firstResolveEvent_o_m;
	Mutexdef c_rpcClientConn_balancerWrapper_mu;
	Mutexdef c_rpcClientConn_balancerWrapper_scBuffer_mu;
	Mutexdef c_rpcClientConn_balancerWrapper_balancerMu;
	Mutexdef c_rpcClientConn_resolverWrapper_pollingMu;
	Mutexdef c_rpcClientConn_resolverWrapper_resolverMu;
	Mutexdef c_rpcClientConn_mu;
	Mutexdef c_rpcClientConn_blockingpicker_mu;
	Mutexdef c_rpcClientConn_csMgr_mu;
	Mutexdef c_leaderParamsLock;
	Mutexdef c_requestForwardingConnectionLock;
	Mutexdef c_clusterParamsLock;
	Mutexdef c_reloadFuncsLock;
	Mutexdef c_metricsMutex;
	Mutexdef c_activityLog_view_readOnlyErrLock;
	Mutexdef c_activityLog_fragmentLock;
	Mutexdef c_activityLog_l;
	Mutexdef c_identityStore_groupLock;
	Mutexdef c_identityStore_oidcLock;
	Mutexdef c_identityStore_lock;
	Mutexdef c_identityStore_db_writer;
	Mutexdef c_tokenStore_saltLock;
	Mutexdef c_tokenStore_tokensPendingDeletion_mu;
	Mutexdef c_tokenStore_activityLog_view_readOnlyErrLock;
	Mutexdef c_tokenStore_activityLog_fragmentLock;
	Mutexdef c_tokenStore_activityLog_l;
	Mutexdef c_tokenStore_expiration_jobManager_l;
	Wgdef c_tokenStore_expiration_jobManager_wg;
	Mutexdef c_tokenStore_expiration_restoreLoaded_mu;
	Mutexdef c_tokenStore_expiration_restoreRequestLock;
	Mutexdef c_tokenStore_expiration_restoreModeLock;
	Mutexdef c_tokenStore_expiration_pendingLock;
	Mutexdef c_tokenStore_expiration_nonexpiring_mu;
	Mutexdef c_tokenStore_expiration_pending_mu;
	Mutexdef c_tokenStore_expiration_tokenView_readOnlyErrLock;
	Mutexdef c_tokenStore_expiration_idView_readOnlyErrLock;
	Mutexdef c_tokenStore_expiration_router_l;
	Mutexdef c_tokenStore_rolesBarrierView_readOnlyErrLock;
	Mutexdef c_tokenStore_parentBarrierView_readOnlyErrLock;
	Mutexdef c_tokenStore_accessorBarrierView_readOnlyErrLock;
	Mutexdef c_tokenStore_idBarrierView_readOnlyErrLock;
	Mutexdef c_tokenStore_baseBarrierView_readOnlyErrLock;
	Mutexdef c_policyStore_policyTypeMap_mu;
	Mutexdef c_policyStore_modifyLock;
	Mutexdef c_policyStore_egpLRU_lock;
	Mutexdef c_policyStore_tokenPoliciesLRU_lock;
	Mutexdef c_policyStore_egpView_readOnlyErrLock;
	Mutexdef c_policyStore_rgpView_readOnlyErrLock;
	Mutexdef c_policyStore_aclView_readOnlyErrLock;
	Mutexdef c_rollback_shutdownLock;
	Mutexdef c_rollback_inflightLock;
	Wgdef c_rollback_inflightAll;
	Mutexdef c_rollback_router_l;
	Mutexdef c_expiration_jobManager_l;
	Wgdef c_expiration_jobManager_wg;
	Mutexdef c_expiration_jobManager_onceStop_m;
	Mutexdef c_expiration_jobManager_onceStart_m;
	Wgdef c_expiration_jobManager_workerPool_wg;
	Mutexdef c_expiration_restoreLoaded_mu;
	Mutexdef c_expiration_restoreRequestLock;
	Mutexdef c_expiration_restoreModeLock;
	Mutexdef c_expiration_pendingLock;
	Mutexdef c_expiration_nonexpiring_mu;
	Mutexdef c_expiration_pending_mu;
	Mutexdef c_expiration_tokenStore_saltLock;
	Mutexdef c_expiration_tokenStore_tokensPendingDeletion_mu;
	Mutexdef c_expiration_tokenStore_activityLog_fragmentLock;
	Mutexdef c_expiration_tokenStore_activityLog_l;
	Mutexdef c_expiration_tokenStore_rolesBarrierView_readOnlyErrLock;
	Mutexdef c_expiration_tokenStore_parentBarrierView_readOnlyErrLock;
	Mutexdef c_expiration_tokenStore_accessorBarrierView_readOnlyErrLock;
	Mutexdef c_expiration_tokenStore_idBarrierView_readOnlyErrLock;
	Mutexdef c_expiration_tokenStore_baseBarrierView_readOnlyErrLock;
	Mutexdef c_expiration_tokenView_readOnlyErrLock;
	Mutexdef c_expiration_idView_readOnlyErrLock;
	Mutexdef c_expiration_router_l;
	Mutexdef c_systemBarrierView_readOnlyErrLock;
	Mutexdef c_systemBackend_mfaLock;
	Mutexdef c_systemBackend_db_writer;
	Mutexdef c_auditedHeaders_view_readOnlyErrLock;
	Mutexdef c_auditLock;
	Mutexdef c_authLock;
	Mutexdef c_mountsLock;
	Mutexdef c_rekeyLock;
	Mutexdef c_generateRootLock;
	Mutexdef c_router_l;
	Mutexdef c_raftInfo_leaderClient_config_modifyLock;
	Mutexdef c_raftInfo_leaderClient_modifyLock;
	run mutexMonitor(c_raftInfo_leaderClient_modifyLock);
	run mutexMonitor(c_raftInfo_leaderClient_config_modifyLock);
	run mutexMonitor(c_router_l);
	run mutexMonitor(c_generateRootLock);
	run mutexMonitor(c_rekeyLock);
	run mutexMonitor(c_mountsLock);
	run mutexMonitor(c_authLock);
	run mutexMonitor(c_auditLock);
	run mutexMonitor(c_auditedHeaders_view_readOnlyErrLock);
	run mutexMonitor(c_systemBackend_db_writer);
	run mutexMonitor(c_systemBackend_mfaLock);
	run mutexMonitor(c_systemBarrierView_readOnlyErrLock);
	run mutexMonitor(c_expiration_router_l);
	run mutexMonitor(c_expiration_idView_readOnlyErrLock);
	run mutexMonitor(c_expiration_tokenView_readOnlyErrLock);
	run mutexMonitor(c_expiration_tokenStore_baseBarrierView_readOnlyErrLock);
	run mutexMonitor(c_expiration_tokenStore_idBarrierView_readOnlyErrLock);
	run mutexMonitor(c_expiration_tokenStore_accessorBarrierView_readOnlyErrLock);
	run mutexMonitor(c_expiration_tokenStore_parentBarrierView_readOnlyErrLock);
	run mutexMonitor(c_expiration_tokenStore_rolesBarrierView_readOnlyErrLock);
	run mutexMonitor(c_expiration_tokenStore_activityLog_l);
	run mutexMonitor(c_expiration_tokenStore_activityLog_fragmentLock);
	run mutexMonitor(c_expiration_tokenStore_tokensPendingDeletion_mu);
	run mutexMonitor(c_expiration_tokenStore_saltLock);
	run mutexMonitor(c_expiration_pending_mu);
	run mutexMonitor(c_expiration_nonexpiring_mu);
	run mutexMonitor(c_expiration_pendingLock);
	run mutexMonitor(c_expiration_restoreModeLock);
	run mutexMonitor(c_expiration_restoreRequestLock);
	run mutexMonitor(c_expiration_restoreLoaded_mu);
	run wgMonitor(c_expiration_jobManager_workerPool_wg);
	run mutexMonitor(c_expiration_jobManager_onceStart_m);
	run mutexMonitor(c_expiration_jobManager_onceStop_m);
	run wgMonitor(c_expiration_jobManager_wg);
	run mutexMonitor(c_expiration_jobManager_l);
	run mutexMonitor(c_rollback_router_l);
	run wgMonitor(c_rollback_inflightAll);
	run mutexMonitor(c_rollback_inflightLock);
	run mutexMonitor(c_rollback_shutdownLock);
	run mutexMonitor(c_policyStore_aclView_readOnlyErrLock);
	run mutexMonitor(c_policyStore_rgpView_readOnlyErrLock);
	run mutexMonitor(c_policyStore_egpView_readOnlyErrLock);
	run mutexMonitor(c_policyStore_tokenPoliciesLRU_lock);
	run mutexMonitor(c_policyStore_egpLRU_lock);
	run mutexMonitor(c_policyStore_modifyLock);
	run mutexMonitor(c_policyStore_policyTypeMap_mu);
	run mutexMonitor(c_tokenStore_baseBarrierView_readOnlyErrLock);
	run mutexMonitor(c_tokenStore_idBarrierView_readOnlyErrLock);
	run mutexMonitor(c_tokenStore_accessorBarrierView_readOnlyErrLock);
	run mutexMonitor(c_tokenStore_parentBarrierView_readOnlyErrLock);
	run mutexMonitor(c_tokenStore_rolesBarrierView_readOnlyErrLock);
	run mutexMonitor(c_tokenStore_expiration_router_l);
	run mutexMonitor(c_tokenStore_expiration_idView_readOnlyErrLock);
	run mutexMonitor(c_tokenStore_expiration_tokenView_readOnlyErrLock);
	run mutexMonitor(c_tokenStore_expiration_pending_mu);
	run mutexMonitor(c_tokenStore_expiration_nonexpiring_mu);
	run mutexMonitor(c_tokenStore_expiration_pendingLock);
	run mutexMonitor(c_tokenStore_expiration_restoreModeLock);
	run mutexMonitor(c_tokenStore_expiration_restoreRequestLock);
	run mutexMonitor(c_tokenStore_expiration_restoreLoaded_mu);
	run wgMonitor(c_tokenStore_expiration_jobManager_wg);
	run mutexMonitor(c_tokenStore_expiration_jobManager_l);
	run mutexMonitor(c_tokenStore_activityLog_l);
	run mutexMonitor(c_tokenStore_activityLog_fragmentLock);
	run mutexMonitor(c_tokenStore_activityLog_view_readOnlyErrLock);
	run mutexMonitor(c_tokenStore_tokensPendingDeletion_mu);
	run mutexMonitor(c_tokenStore_saltLock);
	run mutexMonitor(c_identityStore_db_writer);
	run mutexMonitor(c_identityStore_lock);
	run mutexMonitor(c_identityStore_oidcLock);
	run mutexMonitor(c_identityStore_groupLock);
	run mutexMonitor(c_activityLog_l);
	run mutexMonitor(c_activityLog_fragmentLock);
	run mutexMonitor(c_activityLog_view_readOnlyErrLock);
	run mutexMonitor(c_metricsMutex);
	run mutexMonitor(c_reloadFuncsLock);
	run mutexMonitor(c_clusterParamsLock);
	run mutexMonitor(c_requestForwardingConnectionLock);
	run mutexMonitor(c_leaderParamsLock);
	run mutexMonitor(c_rpcClientConn_csMgr_mu);
	run mutexMonitor(c_rpcClientConn_blockingpicker_mu);
	run mutexMonitor(c_rpcClientConn_mu);
	run mutexMonitor(c_rpcClientConn_resolverWrapper_resolverMu);
	run mutexMonitor(c_rpcClientConn_resolverWrapper_pollingMu);
	run mutexMonitor(c_rpcClientConn_balancerWrapper_balancerMu);
	run mutexMonitor(c_rpcClientConn_balancerWrapper_scBuffer_mu);
	run mutexMonitor(c_rpcClientConn_balancerWrapper_mu);
	run mutexMonitor(c_rpcClientConn_firstResolveEvent_o_m);
	run mutexMonitor(c_uiConfig_l);
	run mutexMonitor(c_pluginCatalog_catalogView_readOnlyErrLock);
	run mutexMonitor(c_pluginCatalog_lock);
	run mutexMonitor(c_unsealWithStoredKeysLock);
	run mutexMonitor(c_allLoggersLock);
	run mutexMonitor(c_metricsHelper_inMemSink_intervalLock);
	run mutexMonitor(c_metricsHelper_LoopMetrics_Metrics_mu);
	run mutexMonitor(c_raftFollowerStates_l);
	run mutexMonitor(c_pendingRaftPeers_mu);
	run mutexMonitor(c_quotaManager_db_writer);
	run mutexMonitor(c_quotaManager_rateLimitPathManager_l);
	run mutexMonitor(c_quotaManager_lock);
	run mutexMonitor(ts_core_raftInfo_leaderClient_modifyLock);
	run mutexMonitor(ts_core_router_l);
	run mutexMonitor(ts_core_generateRootLock);
	run mutexMonitor(ts_core_rekeyLock);
	run mutexMonitor(ts_core_mountsLock);
	run mutexMonitor(ts_core_authLock);
	run mutexMonitor(ts_core_auditLock);
	run mutexMonitor(ts_core_auditedHeaders_view_readOnlyErrLock);
	run mutexMonitor(ts_core_systemBackend_db_writer);
	run mutexMonitor(ts_core_systemBackend_mfaLock);
	run mutexMonitor(ts_core_systemBarrierView_readOnlyErrLock);
	run mutexMonitor(ts_core_expiration_router_l);
	run mutexMonitor(ts_core_expiration_idView_readOnlyErrLock);
	run mutexMonitor(ts_core_expiration_tokenView_readOnlyErrLock);
	run mutexMonitor(ts_core_expiration_pending_mu);
	run mutexMonitor(ts_core_expiration_nonexpiring_mu);
	run mutexMonitor(ts_core_expiration_pendingLock);
	run mutexMonitor(ts_core_expiration_restoreModeLock);
	run mutexMonitor(ts_core_expiration_restoreRequestLock);
	run mutexMonitor(ts_core_expiration_restoreLoaded_mu);
	run wgMonitor(ts_core_expiration_jobManager_wg);
	run mutexMonitor(ts_core_expiration_jobManager_l);
	run mutexMonitor(ts_core_rollback_router_l);
	run wgMonitor(ts_core_rollback_inflightAll);
	run mutexMonitor(ts_core_rollback_inflightLock);
	run mutexMonitor(ts_core_rollback_shutdownLock);
	run mutexMonitor(ts_core_policyStore_aclView_readOnlyErrLock);
	run mutexMonitor(ts_core_policyStore_rgpView_readOnlyErrLock);
	run mutexMonitor(ts_core_policyStore_egpView_readOnlyErrLock);
	run mutexMonitor(ts_core_policyStore_tokenPoliciesLRU_lock);
	run mutexMonitor(ts_core_policyStore_egpLRU_lock);
	run mutexMonitor(ts_core_policyStore_modifyLock);
	run mutexMonitor(ts_core_policyStore_policyTypeMap_mu);
	run mutexMonitor(ts_core_identityStore_db_writer);
	run mutexMonitor(ts_core_identityStore_lock);
	run mutexMonitor(ts_core_identityStore_oidcLock);
	run mutexMonitor(ts_core_identityStore_groupLock);
	run mutexMonitor(ts_core_activityLog_l);
	run mutexMonitor(ts_core_activityLog_fragmentLock);
	run mutexMonitor(ts_core_activityLog_view_readOnlyErrLock);
	run mutexMonitor(ts_core_metricsMutex);
	run mutexMonitor(ts_core_reloadFuncsLock);
	run mutexMonitor(ts_core_clusterParamsLock);
	run mutexMonitor(ts_core_requestForwardingConnectionLock);
	run mutexMonitor(ts_core_leaderParamsLock);
	run mutexMonitor(ts_core_rpcClientConn_csMgr_mu);
	run mutexMonitor(ts_core_rpcClientConn_blockingpicker_mu);
	run mutexMonitor(ts_core_rpcClientConn_mu);
	run mutexMonitor(ts_core_rpcClientConn_resolverWrapper_resolverMu);
	run mutexMonitor(ts_core_rpcClientConn_resolverWrapper_pollingMu);
	run mutexMonitor(ts_core_rpcClientConn_balancerWrapper_balancerMu);
	run mutexMonitor(ts_core_rpcClientConn_balancerWrapper_mu);
	run mutexMonitor(ts_core_uiConfig_l);
	run mutexMonitor(ts_core_pluginCatalog_catalogView_readOnlyErrLock);
	run mutexMonitor(ts_core_pluginCatalog_lock);
	run mutexMonitor(ts_core_unsealWithStoredKeysLock);
	run mutexMonitor(ts_core_allLoggersLock);
	run mutexMonitor(ts_core_metricsHelper_inMemSink_intervalLock);
	run mutexMonitor(ts_core_raftFollowerStates_l);
	run mutexMonitor(ts_core_pendingRaftPeers_mu);
	run mutexMonitor(ts_core_quotaManager_db_writer);
	run mutexMonitor(ts_core_quotaManager_rateLimitPathManager_l);
	run mutexMonitor(ts_core_quotaManager_lock);
	run mutexMonitor(ts_baseBarrierView_readOnlyErrLock);
	run mutexMonitor(ts_idBarrierView_readOnlyErrLock);
	run mutexMonitor(ts_accessorBarrierView_readOnlyErrLock);
	run mutexMonitor(ts_parentBarrierView_readOnlyErrLock);
	run mutexMonitor(ts_rolesBarrierView_readOnlyErrLock);
	run mutexMonitor(ts_expiration_core_router_l);
	run mutexMonitor(ts_expiration_core_generateRootLock);
	run mutexMonitor(ts_expiration_core_rekeyLock);
	run mutexMonitor(ts_expiration_core_mountsLock);
	run mutexMonitor(ts_expiration_core_authLock);
	run mutexMonitor(ts_expiration_core_auditLock);
	run mutexMonitor(ts_expiration_core_systemBackend_mfaLock);
	run mutexMonitor(ts_expiration_core_systemBarrierView_readOnlyErrLock);
	run wgMonitor(ts_expiration_core_rollback_inflightAll);
	run mutexMonitor(ts_expiration_core_rollback_inflightLock);
	run mutexMonitor(ts_expiration_core_rollback_shutdownLock);
	run mutexMonitor(ts_expiration_core_policyStore_modifyLock);
	run mutexMonitor(ts_expiration_core_identityStore_lock);
	run mutexMonitor(ts_expiration_core_identityStore_oidcLock);
	run mutexMonitor(ts_expiration_core_identityStore_groupLock);
	run mutexMonitor(ts_expiration_core_activityLog_l);
	run mutexMonitor(ts_expiration_core_activityLog_fragmentLock);
	run mutexMonitor(ts_expiration_core_metricsMutex);
	run mutexMonitor(ts_expiration_core_reloadFuncsLock);
	run mutexMonitor(ts_expiration_core_clusterParamsLock);
	run mutexMonitor(ts_expiration_core_requestForwardingConnectionLock);
	run mutexMonitor(ts_expiration_core_leaderParamsLock);
	run mutexMonitor(ts_expiration_core_rpcClientConn_mu);
	run mutexMonitor(ts_expiration_core_uiConfig_l);
	run mutexMonitor(ts_expiration_core_pluginCatalog_lock);
	run mutexMonitor(ts_expiration_core_unsealWithStoredKeysLock);
	run mutexMonitor(ts_expiration_core_allLoggersLock);
	run mutexMonitor(ts_expiration_core_raftFollowerStates_l);
	run mutexMonitor(ts_expiration_core_pendingRaftPeers_mu);
	run mutexMonitor(ts_expiration_core_quotaManager_lock);
	run mutexMonitor(ts_expiration_router_l);
	run mutexMonitor(ts_expiration_idView_readOnlyErrLock);
	run mutexMonitor(ts_expiration_tokenView_readOnlyErrLock);
	run mutexMonitor(ts_expiration_pending_mu);
	run mutexMonitor(ts_expiration_nonexpiring_mu);
	run mutexMonitor(ts_expiration_pendingLock);
	run mutexMonitor(ts_expiration_restoreModeLock);
	run mutexMonitor(ts_expiration_restoreRequestLock);
	run mutexMonitor(ts_expiration_restoreLoaded_mu);
	run wgMonitor(ts_expiration_jobManager_workerPool_wg);
	run mutexMonitor(ts_expiration_jobManager_onceStart_m);
	run mutexMonitor(ts_expiration_jobManager_onceStop_m);
	run wgMonitor(ts_expiration_jobManager_wg);
	run mutexMonitor(ts_expiration_jobManager_l);
	run mutexMonitor(ts_activityLog_core_router_l);
	run mutexMonitor(ts_activityLog_core_generateRootLock);
	run mutexMonitor(ts_activityLog_core_rekeyLock);
	run mutexMonitor(ts_activityLog_core_mountsLock);
	run mutexMonitor(ts_activityLog_core_authLock);
	run mutexMonitor(ts_activityLog_core_auditLock);
	run mutexMonitor(ts_activityLog_core_systemBackend_mfaLock);
	run mutexMonitor(ts_activityLog_core_systemBarrierView_readOnlyErrLock);
	run mutexMonitor(ts_activityLog_core_expiration_pendingLock);
	run mutexMonitor(ts_activityLog_core_expiration_restoreModeLock);
	run mutexMonitor(ts_activityLog_core_expiration_restoreRequestLock);
	run wgMonitor(ts_activityLog_core_rollback_inflightAll);
	run mutexMonitor(ts_activityLog_core_rollback_inflightLock);
	run mutexMonitor(ts_activityLog_core_rollback_shutdownLock);
	run mutexMonitor(ts_activityLog_core_policyStore_modifyLock);
	run mutexMonitor(ts_activityLog_core_identityStore_lock);
	run mutexMonitor(ts_activityLog_core_identityStore_oidcLock);
	run mutexMonitor(ts_activityLog_core_identityStore_groupLock);
	run mutexMonitor(ts_activityLog_core_metricsMutex);
	run mutexMonitor(ts_activityLog_core_reloadFuncsLock);
	run mutexMonitor(ts_activityLog_core_clusterParamsLock);
	run mutexMonitor(ts_activityLog_core_requestForwardingConnectionLock);
	run mutexMonitor(ts_activityLog_core_leaderParamsLock);
	run mutexMonitor(ts_activityLog_core_rpcClientConn_mu);
	run mutexMonitor(ts_activityLog_core_uiConfig_l);
	run mutexMonitor(ts_activityLog_core_pluginCatalog_lock);
	run mutexMonitor(ts_activityLog_core_unsealWithStoredKeysLock);
	run mutexMonitor(ts_activityLog_core_allLoggersLock);
	run mutexMonitor(ts_activityLog_core_raftFollowerStates_l);
	run mutexMonitor(ts_activityLog_core_pendingRaftPeers_mu);
	run mutexMonitor(ts_activityLog_core_quotaManager_lock);
	run mutexMonitor(ts_activityLog_l);
	run mutexMonitor(ts_activityLog_fragmentLock);
	run mutexMonitor(ts_activityLog_view_readOnlyErrLock);
	run mutexMonitor(ts_tokensPendingDeletion_mu);
	run mutexMonitor(ts_saltLock);
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

