// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/vault/blob//vault/activity_log_test.go#L384
#define not_found_38627  -2
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
	chan child_TestActivityLog_availableLogsEmptyDirectory3840 = [1] of {int};
	run TestActivityLog_availableLogsEmptyDirectory384(child_TestActivityLog_availableLogsEmptyDirectory3840);
	run receiver(child_TestActivityLog_availableLogsEmptyDirectory3840)
stop_process:skip
}

proctype TestActivityLog_availableLogsEmptyDirectory384(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_availableLogs3840 = [1] of {int};
	Mutexdef a_fragment_state_atomicMessageInfo_initMu;
	Mutexdef a_view_readOnlyErrLock;
	Mutexdef a_fragmentLock;
	Mutexdef a_l;
	Mutexdef a_core_quotaManager_lock;
	Mutexdef a_core_quotaManager_rateLimitPathManager_l;
	Mutexdef a_core_quotaManager_db_writer;
	Mutexdef a_core_pendingRaftPeers_mu;
	Mutexdef a_core_raftFollowerStates_l;
	Mutexdef a_core_metricsHelper_inMemSink_intervalLock;
	Mutexdef a_core_allLoggersLock;
	Mutexdef a_core_unsealWithStoredKeysLock;
	Mutexdef a_core_pluginCatalog_lock;
	Mutexdef a_core_pluginCatalog_catalogView_readOnlyErrLock;
	Mutexdef a_core_uiConfig_l;
	Mutexdef a_core_rpcClientConn_balancerWrapper_mu;
	Mutexdef a_core_rpcClientConn_balancerWrapper_balancerMu;
	Mutexdef a_core_rpcClientConn_resolverWrapper_pollingMu;
	Mutexdef a_core_rpcClientConn_resolverWrapper_resolverMu;
	Mutexdef a_core_rpcClientConn_mu;
	Mutexdef a_core_rpcClientConn_blockingpicker_mu;
	Mutexdef a_core_rpcClientConn_csMgr_mu;
	Mutexdef a_core_leaderParamsLock;
	Mutexdef a_core_requestForwardingConnectionLock;
	Mutexdef a_core_clusterParamsLock;
	Mutexdef a_core_reloadFuncsLock;
	Mutexdef a_core_metricsMutex;
	Mutexdef a_core_identityStore_groupLock;
	Mutexdef a_core_identityStore_oidcLock;
	Mutexdef a_core_identityStore_lock;
	Mutexdef a_core_identityStore_db_writer;
	Mutexdef a_core_tokenStore_saltLock;
	Mutexdef a_core_tokenStore_tokensPendingDeletion_mu;
	Mutexdef a_core_tokenStore_expiration_restoreRequestLock;
	Mutexdef a_core_tokenStore_expiration_restoreModeLock;
	Mutexdef a_core_tokenStore_expiration_pendingLock;
	Mutexdef a_core_tokenStore_rolesBarrierView_readOnlyErrLock;
	Mutexdef a_core_tokenStore_parentBarrierView_readOnlyErrLock;
	Mutexdef a_core_tokenStore_accessorBarrierView_readOnlyErrLock;
	Mutexdef a_core_tokenStore_idBarrierView_readOnlyErrLock;
	Mutexdef a_core_tokenStore_baseBarrierView_readOnlyErrLock;
	Mutexdef a_core_policyStore_policyTypeMap_mu;
	Mutexdef a_core_policyStore_modifyLock;
	Mutexdef a_core_policyStore_egpLRU_lock;
	Mutexdef a_core_policyStore_tokenPoliciesLRU_lock;
	Mutexdef a_core_policyStore_egpView_readOnlyErrLock;
	Mutexdef a_core_policyStore_rgpView_readOnlyErrLock;
	Mutexdef a_core_policyStore_aclView_readOnlyErrLock;
	Mutexdef a_core_rollback_shutdownLock;
	Mutexdef a_core_rollback_inflightLock;
	Wgdef a_core_rollback_inflightAll;
	Mutexdef a_core_rollback_router_l;
	Mutexdef a_core_expiration_jobManager_l;
	Wgdef a_core_expiration_jobManager_wg;
	Mutexdef a_core_expiration_restoreLoaded_mu;
	Mutexdef a_core_expiration_restoreRequestLock;
	Mutexdef a_core_expiration_restoreModeLock;
	Mutexdef a_core_expiration_pendingLock;
	Mutexdef a_core_expiration_nonexpiring_mu;
	Mutexdef a_core_expiration_pending_mu;
	Mutexdef a_core_expiration_tokenStore_saltLock;
	Mutexdef a_core_expiration_tokenView_readOnlyErrLock;
	Mutexdef a_core_expiration_idView_readOnlyErrLock;
	Mutexdef a_core_expiration_router_l;
	Mutexdef a_core_systemBarrierView_readOnlyErrLock;
	Mutexdef a_core_systemBackend_mfaLock;
	Mutexdef a_core_systemBackend_db_writer;
	Mutexdef a_core_auditedHeaders_view_readOnlyErrLock;
	Mutexdef a_core_auditLock;
	Mutexdef a_core_authLock;
	Mutexdef a_core_mountsLock;
	Mutexdef a_core_rekeyLock;
	Mutexdef a_core_generateRootLock;
	Mutexdef a_core_router_l;
	Mutexdef a_core_raftInfo_leaderClient_modifyLock;
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
	run mutexMonitor(a_core_raftInfo_leaderClient_modifyLock);
	run mutexMonitor(a_core_router_l);
	run mutexMonitor(a_core_generateRootLock);
	run mutexMonitor(a_core_rekeyLock);
	run mutexMonitor(a_core_mountsLock);
	run mutexMonitor(a_core_authLock);
	run mutexMonitor(a_core_auditLock);
	run mutexMonitor(a_core_auditedHeaders_view_readOnlyErrLock);
	run mutexMonitor(a_core_systemBackend_db_writer);
	run mutexMonitor(a_core_systemBackend_mfaLock);
	run mutexMonitor(a_core_systemBarrierView_readOnlyErrLock);
	run mutexMonitor(a_core_expiration_router_l);
	run mutexMonitor(a_core_expiration_idView_readOnlyErrLock);
	run mutexMonitor(a_core_expiration_tokenView_readOnlyErrLock);
	run mutexMonitor(a_core_expiration_tokenStore_saltLock);
	run mutexMonitor(a_core_expiration_pending_mu);
	run mutexMonitor(a_core_expiration_nonexpiring_mu);
	run mutexMonitor(a_core_expiration_pendingLock);
	run mutexMonitor(a_core_expiration_restoreModeLock);
	run mutexMonitor(a_core_expiration_restoreRequestLock);
	run mutexMonitor(a_core_expiration_restoreLoaded_mu);
	run wgMonitor(a_core_expiration_jobManager_wg);
	run mutexMonitor(a_core_expiration_jobManager_l);
	run mutexMonitor(a_core_rollback_router_l);
	run wgMonitor(a_core_rollback_inflightAll);
	run mutexMonitor(a_core_rollback_inflightLock);
	run mutexMonitor(a_core_rollback_shutdownLock);
	run mutexMonitor(a_core_policyStore_aclView_readOnlyErrLock);
	run mutexMonitor(a_core_policyStore_rgpView_readOnlyErrLock);
	run mutexMonitor(a_core_policyStore_egpView_readOnlyErrLock);
	run mutexMonitor(a_core_policyStore_tokenPoliciesLRU_lock);
	run mutexMonitor(a_core_policyStore_egpLRU_lock);
	run mutexMonitor(a_core_policyStore_modifyLock);
	run mutexMonitor(a_core_policyStore_policyTypeMap_mu);
	run mutexMonitor(a_core_tokenStore_baseBarrierView_readOnlyErrLock);
	run mutexMonitor(a_core_tokenStore_idBarrierView_readOnlyErrLock);
	run mutexMonitor(a_core_tokenStore_accessorBarrierView_readOnlyErrLock);
	run mutexMonitor(a_core_tokenStore_parentBarrierView_readOnlyErrLock);
	run mutexMonitor(a_core_tokenStore_rolesBarrierView_readOnlyErrLock);
	run mutexMonitor(a_core_tokenStore_expiration_pendingLock);
	run mutexMonitor(a_core_tokenStore_expiration_restoreModeLock);
	run mutexMonitor(a_core_tokenStore_expiration_restoreRequestLock);
	run mutexMonitor(a_core_tokenStore_tokensPendingDeletion_mu);
	run mutexMonitor(a_core_tokenStore_saltLock);
	run mutexMonitor(a_core_identityStore_db_writer);
	run mutexMonitor(a_core_identityStore_lock);
	run mutexMonitor(a_core_identityStore_oidcLock);
	run mutexMonitor(a_core_identityStore_groupLock);
	run mutexMonitor(a_core_metricsMutex);
	run mutexMonitor(a_core_reloadFuncsLock);
	run mutexMonitor(a_core_clusterParamsLock);
	run mutexMonitor(a_core_requestForwardingConnectionLock);
	run mutexMonitor(a_core_leaderParamsLock);
	run mutexMonitor(a_core_rpcClientConn_csMgr_mu);
	run mutexMonitor(a_core_rpcClientConn_blockingpicker_mu);
	run mutexMonitor(a_core_rpcClientConn_mu);
	run mutexMonitor(a_core_rpcClientConn_resolverWrapper_resolverMu);
	run mutexMonitor(a_core_rpcClientConn_resolverWrapper_pollingMu);
	run mutexMonitor(a_core_rpcClientConn_balancerWrapper_balancerMu);
	run mutexMonitor(a_core_rpcClientConn_balancerWrapper_mu);
	run mutexMonitor(a_core_uiConfig_l);
	run mutexMonitor(a_core_pluginCatalog_catalogView_readOnlyErrLock);
	run mutexMonitor(a_core_pluginCatalog_lock);
	run mutexMonitor(a_core_unsealWithStoredKeysLock);
	run mutexMonitor(a_core_allLoggersLock);
	run mutexMonitor(a_core_metricsHelper_inMemSink_intervalLock);
	run mutexMonitor(a_core_raftFollowerStates_l);
	run mutexMonitor(a_core_pendingRaftPeers_mu);
	run mutexMonitor(a_core_quotaManager_db_writer);
	run mutexMonitor(a_core_quotaManager_rateLimitPathManager_l);
	run mutexMonitor(a_core_quotaManager_lock);
	run mutexMonitor(a_l);
	run mutexMonitor(a_fragmentLock);
	run mutexMonitor(a_view_readOnlyErrLock);
	run mutexMonitor(a_fragment_state_atomicMessageInfo_initMu);
	run availableLogs384(a_core_expiration_jobManager_wg,a_core_rollback_inflightAll,a_core_allLoggersLock,a_core_auditedHeaders_view_readOnlyErrLock,a_core_auditLock,a_core_authLock,a_core_clusterParamsLock,a_core_expiration_idView_readOnlyErrLock,a_core_expiration_jobManager_l,a_core_expiration_nonexpiring_mu,a_core_expiration_pending_mu,a_core_expiration_pendingLock,a_core_expiration_restoreLoaded_mu,a_core_expiration_restoreModeLock,a_core_expiration_restoreRequestLock,a_core_expiration_router_l,a_core_expiration_tokenStore_saltLock,a_core_expiration_tokenView_readOnlyErrLock,a_core_generateRootLock,a_core_identityStore_db_writer,a_core_identityStore_groupLock,a_core_identityStore_lock,a_core_identityStore_oidcLock,a_core_leaderParamsLock,a_core_metricsHelper_inMemSink_intervalLock,a_core_metricsMutex,a_core_mountsLock,a_core_pendingRaftPeers_mu,a_core_pluginCatalog_catalogView_readOnlyErrLock,a_core_pluginCatalog_lock,a_core_policyStore_aclView_readOnlyErrLock,a_core_policyStore_egpLRU_lock,a_core_policyStore_egpView_readOnlyErrLock,a_core_policyStore_modifyLock,a_core_policyStore_policyTypeMap_mu,a_core_policyStore_rgpView_readOnlyErrLock,a_core_policyStore_tokenPoliciesLRU_lock,a_core_quotaManager_db_writer,a_core_quotaManager_lock,a_core_quotaManager_rateLimitPathManager_l,a_core_raftFollowerStates_l,a_core_raftInfo_leaderClient_modifyLock,a_core_rekeyLock,a_core_reloadFuncsLock,a_core_requestForwardingConnectionLock,a_core_rollback_inflightLock,a_core_rollback_router_l,a_core_rollback_shutdownLock,a_core_router_l,a_core_rpcClientConn_balancerWrapper_balancerMu,a_core_rpcClientConn_balancerWrapper_mu,a_core_rpcClientConn_blockingpicker_mu,a_core_rpcClientConn_csMgr_mu,a_core_rpcClientConn_mu,a_core_rpcClientConn_resolverWrapper_pollingMu,a_core_rpcClientConn_resolverWrapper_resolverMu,a_core_systemBackend_db_writer,a_core_systemBackend_mfaLock,a_core_systemBarrierView_readOnlyErrLock,a_core_tokenStore_accessorBarrierView_readOnlyErrLock,a_core_tokenStore_baseBarrierView_readOnlyErrLock,a_core_tokenStore_expiration_pendingLock,a_core_tokenStore_expiration_restoreModeLock,a_core_tokenStore_expiration_restoreRequestLock,a_core_tokenStore_idBarrierView_readOnlyErrLock,a_core_tokenStore_parentBarrierView_readOnlyErrLock,a_core_tokenStore_rolesBarrierView_readOnlyErrLock,a_core_tokenStore_saltLock,a_core_tokenStore_tokensPendingDeletion_mu,a_core_uiConfig_l,a_core_unsealWithStoredKeysLock,a_fragment_state_atomicMessageInfo_initMu,a_fragmentLock,a_l,a_view_readOnlyErrLock,child_availableLogs3840);
	child_availableLogs3840?0;
	stop_process: skip;
	child!0
}
proctype availableLogs384(Wgdef a_core_expiration_jobManager_wg;Wgdef a_core_rollback_inflightAll;Mutexdef a_core_allLoggersLock;Mutexdef a_core_auditedHeaders_view_readOnlyErrLock;Mutexdef a_core_auditLock;Mutexdef a_core_authLock;Mutexdef a_core_clusterParamsLock;Mutexdef a_core_expiration_idView_readOnlyErrLock;Mutexdef a_core_expiration_jobManager_l;Mutexdef a_core_expiration_nonexpiring_mu;Mutexdef a_core_expiration_pending_mu;Mutexdef a_core_expiration_pendingLock;Mutexdef a_core_expiration_restoreLoaded_mu;Mutexdef a_core_expiration_restoreModeLock;Mutexdef a_core_expiration_restoreRequestLock;Mutexdef a_core_expiration_router_l;Mutexdef a_core_expiration_tokenStore_saltLock;Mutexdef a_core_expiration_tokenView_readOnlyErrLock;Mutexdef a_core_generateRootLock;Mutexdef a_core_identityStore_db_writer;Mutexdef a_core_identityStore_groupLock;Mutexdef a_core_identityStore_lock;Mutexdef a_core_identityStore_oidcLock;Mutexdef a_core_leaderParamsLock;Mutexdef a_core_metricsHelper_inMemSink_intervalLock;Mutexdef a_core_metricsMutex;Mutexdef a_core_mountsLock;Mutexdef a_core_pendingRaftPeers_mu;Mutexdef a_core_pluginCatalog_catalogView_readOnlyErrLock;Mutexdef a_core_pluginCatalog_lock;Mutexdef a_core_policyStore_aclView_readOnlyErrLock;Mutexdef a_core_policyStore_egpLRU_lock;Mutexdef a_core_policyStore_egpView_readOnlyErrLock;Mutexdef a_core_policyStore_modifyLock;Mutexdef a_core_policyStore_policyTypeMap_mu;Mutexdef a_core_policyStore_rgpView_readOnlyErrLock;Mutexdef a_core_policyStore_tokenPoliciesLRU_lock;Mutexdef a_core_quotaManager_db_writer;Mutexdef a_core_quotaManager_lock;Mutexdef a_core_quotaManager_rateLimitPathManager_l;Mutexdef a_core_raftFollowerStates_l;Mutexdef a_core_raftInfo_leaderClient_modifyLock;Mutexdef a_core_rekeyLock;Mutexdef a_core_reloadFuncsLock;Mutexdef a_core_requestForwardingConnectionLock;Mutexdef a_core_rollback_inflightLock;Mutexdef a_core_rollback_router_l;Mutexdef a_core_rollback_shutdownLock;Mutexdef a_core_router_l;Mutexdef a_core_rpcClientConn_balancerWrapper_balancerMu;Mutexdef a_core_rpcClientConn_balancerWrapper_mu;Mutexdef a_core_rpcClientConn_blockingpicker_mu;Mutexdef a_core_rpcClientConn_csMgr_mu;Mutexdef a_core_rpcClientConn_mu;Mutexdef a_core_rpcClientConn_resolverWrapper_pollingMu;Mutexdef a_core_rpcClientConn_resolverWrapper_resolverMu;Mutexdef a_core_systemBackend_db_writer;Mutexdef a_core_systemBackend_mfaLock;Mutexdef a_core_systemBarrierView_readOnlyErrLock;Mutexdef a_core_tokenStore_accessorBarrierView_readOnlyErrLock;Mutexdef a_core_tokenStore_baseBarrierView_readOnlyErrLock;Mutexdef a_core_tokenStore_expiration_pendingLock;Mutexdef a_core_tokenStore_expiration_restoreModeLock;Mutexdef a_core_tokenStore_expiration_restoreRequestLock;Mutexdef a_core_tokenStore_idBarrierView_readOnlyErrLock;Mutexdef a_core_tokenStore_parentBarrierView_readOnlyErrLock;Mutexdef a_core_tokenStore_rolesBarrierView_readOnlyErrLock;Mutexdef a_core_tokenStore_saltLock;Mutexdef a_core_tokenStore_tokensPendingDeletion_mu;Mutexdef a_core_uiConfig_l;Mutexdef a_core_unsealWithStoredKeysLock;Mutexdef a_fragment_state_atomicMessageInfo_initMu;Mutexdef a_fragmentLock;Mutexdef a_l;Mutexdef a_view_readOnlyErrLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_List530 = [1] of {int};
	chan child_List531 = [1] of {int};
	int var_paths = -2; // opt var_paths
	

	if
	:: not_found_38627-1 != -3 -> 
				for(i : 0.. not_found_38627-1) {
			for10: skip;
			run List53(a_view_readOnlyErrLock,child_List530);
			child_List530?0;
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			for10_end: skip
		};
		for10_exit: skip
	:: else -> 
		do
		:: true -> 
			for11: skip;
			run List53(a_view_readOnlyErrLock,child_List531);
			child_List531?0;
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			for11_end: skip
		:: true -> 
			break
		od;
		for11_exit: skip
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype List53(Mutexdef v_readOnlyErrLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
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

