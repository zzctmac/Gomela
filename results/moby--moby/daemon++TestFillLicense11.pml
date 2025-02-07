// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/moby/moby/blob//daemon/licensing_test.go#L11
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestFillLicense110 = [1] of {int};
	run TestFillLicense11(child_TestFillLicense110);
	run receiver(child_TestFillLicense110)
stop_process:skip
}

proctype TestFillLicense11(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_fillLicense80 = [1] of {int};
	Mutexdef d_mdDB_statlock;
	Mutexdef d_mdDB_mmaplock;
	Mutexdef d_mdDB_metalock;
	Mutexdef d_mdDB_rwlock;
	Mutexdef d_mdDB_batch_start_m;
	Mutexdef d_mdDB_batchMu;
	Mutexdef d_mdDB_freelistLoad_m;
	Mutexdef d_attachableNetworkLock_mu;
	Mutexdef d_containerdCli_conn_balancerWrapper_mu;
	Mutexdef d_containerdCli_conn_balancerWrapper_balancerMu;
	Mutexdef d_containerdCli_conn_resolverWrapper_pollingMu;
	Mutexdef d_containerdCli_conn_resolverWrapper_resolverMu;
	Mutexdef d_containerdCli_conn_mu;
	Mutexdef d_containerdCli_conn_blockingpicker_mu;
	Mutexdef d_containerdCli_conn_csMgr_mu;
	Mutexdef d_containerdCli_connMu;
	Mutexdef d_linkIndex_mu;
	Mutexdef d_pluginManager_publisher_m;
	Mutexdef d_pluginManager_muGC;
	Mutexdef d_pluginManager_mu;
	Mutexdef d_pluginManager_config_AuthzMiddleware_mu;
	Mutexdef d_volumes_vs_db_statlock;
	Mutexdef d_volumes_vs_db_mmaplock;
	Mutexdef d_volumes_vs_db_metalock;
	Mutexdef d_volumes_vs_db_rwlock;
	Mutexdef d_volumes_vs_db_batchMu;
	Mutexdef d_volumes_vs_globalLock;
	Mutexdef d_volumes_vs_drivers_mu;
	Mutexdef d_volumes_vs_locks_mu;
	Mutexdef d_EventsService_pub_m;
	Mutexdef d_EventsService_mu;
	Mutexdef d_statsCollector_m;
	Mutexdef d_imageService_eventsService_pub_m;
	Mutexdef d_imageService_eventsService_mu;
	run mutexMonitor(d_imageService_eventsService_mu);
	run mutexMonitor(d_imageService_eventsService_pub_m);
	run mutexMonitor(d_statsCollector_m);
	run mutexMonitor(d_EventsService_mu);
	run mutexMonitor(d_EventsService_pub_m);
	run mutexMonitor(d_volumes_vs_locks_mu);
	run mutexMonitor(d_volumes_vs_drivers_mu);
	run mutexMonitor(d_volumes_vs_globalLock);
	run mutexMonitor(d_volumes_vs_db_batchMu);
	run mutexMonitor(d_volumes_vs_db_rwlock);
	run mutexMonitor(d_volumes_vs_db_metalock);
	run mutexMonitor(d_volumes_vs_db_mmaplock);
	run mutexMonitor(d_volumes_vs_db_statlock);
	run mutexMonitor(d_pluginManager_config_AuthzMiddleware_mu);
	run mutexMonitor(d_pluginManager_mu);
	run mutexMonitor(d_pluginManager_muGC);
	run mutexMonitor(d_pluginManager_publisher_m);
	run mutexMonitor(d_linkIndex_mu);
	run mutexMonitor(d_containerdCli_connMu);
	run mutexMonitor(d_containerdCli_conn_csMgr_mu);
	run mutexMonitor(d_containerdCli_conn_blockingpicker_mu);
	run mutexMonitor(d_containerdCli_conn_mu);
	run mutexMonitor(d_containerdCli_conn_resolverWrapper_resolverMu);
	run mutexMonitor(d_containerdCli_conn_resolverWrapper_pollingMu);
	run mutexMonitor(d_containerdCli_conn_balancerWrapper_balancerMu);
	run mutexMonitor(d_containerdCli_conn_balancerWrapper_mu);
	run mutexMonitor(d_attachableNetworkLock_mu);
	run mutexMonitor(d_mdDB_freelistLoad_m);
	run mutexMonitor(d_mdDB_batchMu);
	run mutexMonitor(d_mdDB_batch_start_m);
	run mutexMonitor(d_mdDB_rwlock);
	run mutexMonitor(d_mdDB_metalock);
	run mutexMonitor(d_mdDB_mmaplock);
	run mutexMonitor(d_mdDB_statlock);
	run fillLicense8(d_attachableNetworkLock_mu,d_containerdCli_conn_balancerWrapper_balancerMu,d_containerdCli_conn_balancerWrapper_mu,d_containerdCli_conn_blockingpicker_mu,d_containerdCli_conn_csMgr_mu,d_containerdCli_conn_mu,d_containerdCli_conn_resolverWrapper_pollingMu,d_containerdCli_conn_resolverWrapper_resolverMu,d_containerdCli_connMu,d_EventsService_mu,d_EventsService_pub_m,d_imageService_eventsService_mu,d_imageService_eventsService_pub_m,d_linkIndex_mu,d_mdDB_batch_start_m,d_mdDB_batchMu,d_mdDB_freelistLoad_m,d_mdDB_metalock,d_mdDB_mmaplock,d_mdDB_rwlock,d_mdDB_statlock,d_pluginManager_config_AuthzMiddleware_mu,d_pluginManager_mu,d_pluginManager_muGC,d_pluginManager_publisher_m,d_statsCollector_m,d_volumes_vs_db_batchMu,d_volumes_vs_db_metalock,d_volumes_vs_db_mmaplock,d_volumes_vs_db_rwlock,d_volumes_vs_db_statlock,d_volumes_vs_drivers_mu,d_volumes_vs_globalLock,d_volumes_vs_locks_mu,child_fillLicense80);
	child_fillLicense80?0;
	stop_process: skip;
	child!0
}
proctype fillLicense8(Mutexdef daemon_attachableNetworkLock_mu;Mutexdef daemon_containerdCli_conn_balancerWrapper_balancerMu;Mutexdef daemon_containerdCli_conn_balancerWrapper_mu;Mutexdef daemon_containerdCli_conn_blockingpicker_mu;Mutexdef daemon_containerdCli_conn_csMgr_mu;Mutexdef daemon_containerdCli_conn_mu;Mutexdef daemon_containerdCli_conn_resolverWrapper_pollingMu;Mutexdef daemon_containerdCli_conn_resolverWrapper_resolverMu;Mutexdef daemon_containerdCli_connMu;Mutexdef daemon_EventsService_mu;Mutexdef daemon_EventsService_pub_m;Mutexdef daemon_imageService_eventsService_mu;Mutexdef daemon_imageService_eventsService_pub_m;Mutexdef daemon_linkIndex_mu;Mutexdef daemon_mdDB_batch_start_m;Mutexdef daemon_mdDB_batchMu;Mutexdef daemon_mdDB_freelistLoad_m;Mutexdef daemon_mdDB_metalock;Mutexdef daemon_mdDB_mmaplock;Mutexdef daemon_mdDB_rwlock;Mutexdef daemon_mdDB_statlock;Mutexdef daemon_pluginManager_config_AuthzMiddleware_mu;Mutexdef daemon_pluginManager_mu;Mutexdef daemon_pluginManager_muGC;Mutexdef daemon_pluginManager_publisher_m;Mutexdef daemon_statsCollector_m;Mutexdef daemon_volumes_vs_db_batchMu;Mutexdef daemon_volumes_vs_db_metalock;Mutexdef daemon_volumes_vs_db_mmaplock;Mutexdef daemon_volumes_vs_db_rwlock;Mutexdef daemon_volumes_vs_db_statlock;Mutexdef daemon_volumes_vs_drivers_mu;Mutexdef daemon_volumes_vs_globalLock;Mutexdef daemon_volumes_vs_locks_mu;chan child) {
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

