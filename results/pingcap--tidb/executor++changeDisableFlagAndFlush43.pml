// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/pingcap/tidb/blob//executor/admin_plugins.go#L43
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
	chan child_changeDisableFlagAndFlush430 = [1] of {int};
	run changeDisableFlagAndFlush43(child_changeDisableFlagAndFlush430);
	run receiver(child_changeDisableFlagAndFlush430)
stop_process:skip
}

proctype changeDisableFlagAndFlush43(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ChangeDisableFlagAndFlush4650 = [1] of {int};
	chan child_ChangeDisableFlagAndFlush4651 = [1] of {int};
	Mutexdef dom_serverIDSession_client_mu;
	Mutexdef dom_serverIDSession_client_resolverGroup_mu;
	Mutexdef dom_serverIDSession_client_conn_mu;
	Wgdef dom_wg;
	Mutexdef dom_slowQuery_mu;
	Mutexdef dom_gvc_SingleFight_mu;
	Mutexdef dom_etcdClient_mu;
	Mutexdef dom_etcdClient_resolverGroup_mu;
	Mutexdef dom_etcdClient_cfg_TLS_mutex;
	Mutexdef dom_etcdClient_conn_balancerWrapper_mu;
	Mutexdef dom_etcdClient_conn_balancerWrapper_balancerMu;
	Mutexdef dom_etcdClient_conn_resolverWrapper_pollingMu;
	Mutexdef dom_etcdClient_conn_resolverWrapper_resolverMu;
	Mutexdef dom_etcdClient_conn_mu;
	Mutexdef dom_etcdClient_conn_blockingpicker_mu;
	Mutexdef dom_etcdClient_conn_csMgr_mu;
	Mutexdef dom_sysSessionPool_mu;
	Mutexdef dom_m;
	Mutexdef dom_info_topologySession_client_mu;
	Mutexdef dom_info_session_client_mu;
	Mutexdef dom_info_etcdCli_mu;
	Mutexdef dom_info_etcdCli_resolverGroup_mu;
	Mutexdef dom_info_etcdCli_conn_mu;
	Mutexdef dom_bindHandle_bindInfo;
	Mutexdef dom_bindHandle_sctx;
	int var_e_Plugins = -2; // opt var_e_Plugins
	run mutexMonitor(dom_bindHandle_sctx);
	run mutexMonitor(dom_bindHandle_bindInfo);
	run mutexMonitor(dom_info_etcdCli_conn_mu);
	run mutexMonitor(dom_info_etcdCli_resolverGroup_mu);
	run mutexMonitor(dom_info_etcdCli_mu);
	run mutexMonitor(dom_info_session_client_mu);
	run mutexMonitor(dom_info_topologySession_client_mu);
	run mutexMonitor(dom_m);
	run mutexMonitor(dom_sysSessionPool_mu);
	run mutexMonitor(dom_etcdClient_conn_csMgr_mu);
	run mutexMonitor(dom_etcdClient_conn_blockingpicker_mu);
	run mutexMonitor(dom_etcdClient_conn_mu);
	run mutexMonitor(dom_etcdClient_conn_resolverWrapper_resolverMu);
	run mutexMonitor(dom_etcdClient_conn_resolverWrapper_pollingMu);
	run mutexMonitor(dom_etcdClient_conn_balancerWrapper_balancerMu);
	run mutexMonitor(dom_etcdClient_conn_balancerWrapper_mu);
	run mutexMonitor(dom_etcdClient_cfg_TLS_mutex);
	run mutexMonitor(dom_etcdClient_resolverGroup_mu);
	run mutexMonitor(dom_etcdClient_mu);
	run mutexMonitor(dom_gvc_SingleFight_mu);
	run mutexMonitor(dom_slowQuery_mu);
	run wgMonitor(dom_wg);
	run mutexMonitor(dom_serverIDSession_client_conn_mu);
	run mutexMonitor(dom_serverIDSession_client_resolverGroup_mu);
	run mutexMonitor(dom_serverIDSession_client_mu);
	

	if
	:: var_e_Plugins-1 != -3 -> 
				for(i : 0.. var_e_Plugins-1) {
			for10: skip;
			run ChangeDisableFlagAndFlush465(dom_wg,dom_bindHandle_bindInfo,dom_bindHandle_sctx,dom_etcdClient_cfg_TLS_mutex,dom_etcdClient_conn_balancerWrapper_balancerMu,dom_etcdClient_conn_balancerWrapper_mu,dom_etcdClient_conn_blockingpicker_mu,dom_etcdClient_conn_csMgr_mu,dom_etcdClient_conn_mu,dom_etcdClient_conn_resolverWrapper_pollingMu,dom_etcdClient_conn_resolverWrapper_resolverMu,dom_etcdClient_mu,dom_etcdClient_resolverGroup_mu,dom_gvc_SingleFight_mu,dom_info_etcdCli_conn_mu,dom_info_etcdCli_mu,dom_info_etcdCli_resolverGroup_mu,dom_info_session_client_mu,dom_info_topologySession_client_mu,dom_m,dom_serverIDSession_client_conn_mu,dom_serverIDSession_client_mu,dom_serverIDSession_client_resolverGroup_mu,dom_slowQuery_mu,dom_sysSessionPool_mu,child_ChangeDisableFlagAndFlush4650);
			child_ChangeDisableFlagAndFlush4650?0;
			

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
			run ChangeDisableFlagAndFlush465(dom_wg,dom_bindHandle_bindInfo,dom_bindHandle_sctx,dom_etcdClient_cfg_TLS_mutex,dom_etcdClient_conn_balancerWrapper_balancerMu,dom_etcdClient_conn_balancerWrapper_mu,dom_etcdClient_conn_blockingpicker_mu,dom_etcdClient_conn_csMgr_mu,dom_etcdClient_conn_mu,dom_etcdClient_conn_resolverWrapper_pollingMu,dom_etcdClient_conn_resolverWrapper_resolverMu,dom_etcdClient_mu,dom_etcdClient_resolverGroup_mu,dom_gvc_SingleFight_mu,dom_info_etcdCli_conn_mu,dom_info_etcdCli_mu,dom_info_etcdCli_resolverGroup_mu,dom_info_session_client_mu,dom_info_topologySession_client_mu,dom_m,dom_serverIDSession_client_conn_mu,dom_serverIDSession_client_mu,dom_serverIDSession_client_resolverGroup_mu,dom_slowQuery_mu,dom_sysSessionPool_mu,child_ChangeDisableFlagAndFlush4651);
			child_ChangeDisableFlagAndFlush4651?0;
			

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
proctype ChangeDisableFlagAndFlush465(Wgdef dom_wg;Mutexdef dom_bindHandle_bindInfo;Mutexdef dom_bindHandle_sctx;Mutexdef dom_etcdClient_cfg_TLS_mutex;Mutexdef dom_etcdClient_conn_balancerWrapper_balancerMu;Mutexdef dom_etcdClient_conn_balancerWrapper_mu;Mutexdef dom_etcdClient_conn_blockingpicker_mu;Mutexdef dom_etcdClient_conn_csMgr_mu;Mutexdef dom_etcdClient_conn_mu;Mutexdef dom_etcdClient_conn_resolverWrapper_pollingMu;Mutexdef dom_etcdClient_conn_resolverWrapper_resolverMu;Mutexdef dom_etcdClient_mu;Mutexdef dom_etcdClient_resolverGroup_mu;Mutexdef dom_gvc_SingleFight_mu;Mutexdef dom_info_etcdCli_conn_mu;Mutexdef dom_info_etcdCli_mu;Mutexdef dom_info_etcdCli_resolverGroup_mu;Mutexdef dom_info_session_client_mu;Mutexdef dom_info_topologySession_client_mu;Mutexdef dom_m;Mutexdef dom_serverIDSession_client_conn_mu;Mutexdef dom_serverIDSession_client_mu;Mutexdef dom_serverIDSession_client_resolverGroup_mu;Mutexdef dom_slowQuery_mu;Mutexdef dom_sysSessionPool_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

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

