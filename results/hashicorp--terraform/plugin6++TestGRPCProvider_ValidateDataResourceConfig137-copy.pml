// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/terraform/blob//plugin6/grpc_provider_test.go#L137
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
	chan child_TestGRPCProvider_ValidateDataResourceConfig1370 = [1] of {int};
	run TestGRPCProvider_ValidateDataResourceConfig137(child_TestGRPCProvider_ValidateDataResourceConfig1370);
	run receiver(child_TestGRPCProvider_ValidateDataResourceConfig1370)
stop_process:skip
}

proctype TestGRPCProvider_ValidateDataResourceConfig137(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ValidateDataResourceConfig2270 = [1] of {int};
	Mutexdef p_mu;
	Wgdef p_TestServer_serveWG;
	Mutexdef p_TestServer_channelzRemoveOnce_m;
	Mutexdef p_TestServer_done_o_m;
	Mutexdef p_TestServer_quit_o_m;
	Mutexdef p_TestServer_mu;
	Wgdef p_PluginClient_stderrWaitGroup;
	Wgdef p_PluginClient_clientWaitGroup;
	Mutexdef p_PluginClient_process_sigMu;
	Mutexdef p_PluginClient_l;
	Mutexdef p_PluginClient_config_TLSConfig_mutex;
	Mutexdef client_ctrl_mu;
	run mutexMonitor(client_ctrl_mu);
	run mutexMonitor(p_PluginClient_config_TLSConfig_mutex);
	run mutexMonitor(p_PluginClient_l);
	run mutexMonitor(p_PluginClient_process_sigMu);
	run wgMonitor(p_PluginClient_clientWaitGroup);
	run wgMonitor(p_PluginClient_stderrWaitGroup);
	run mutexMonitor(p_TestServer_mu);
	run mutexMonitor(p_TestServer_quit_o_m);
	run mutexMonitor(p_TestServer_done_o_m);
	run mutexMonitor(p_TestServer_channelzRemoveOnce_m);
	run wgMonitor(p_TestServer_serveWG);
	run mutexMonitor(p_mu);
	run ValidateDataResourceConfig227(p_PluginClient_clientWaitGroup,p_PluginClient_stderrWaitGroup,p_TestServer_serveWG,p_mu,p_PluginClient_config_TLSConfig_mutex,p_PluginClient_l,p_PluginClient_process_sigMu,p_TestServer_channelzRemoveOnce_m,p_TestServer_done_o_m,p_TestServer_mu,p_TestServer_quit_o_m,child_ValidateDataResourceConfig2270);
	child_ValidateDataResourceConfig2270?0;
	stop_process: skip;
	child!0
}
proctype ValidateDataResourceConfig227(Wgdef p_PluginClient_clientWaitGroup;Wgdef p_PluginClient_stderrWaitGroup;Wgdef p_TestServer_serveWG;Mutexdef p_mu;Mutexdef p_PluginClient_config_TLSConfig_mutex;Mutexdef p_PluginClient_l;Mutexdef p_PluginClient_process_sigMu;Mutexdef p_TestServer_channelzRemoveOnce_m;Mutexdef p_TestServer_done_o_m;Mutexdef p_TestServer_mu;Mutexdef p_TestServer_quit_o_m;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef protoResp_state_atomicMessageInfo_initMu;
	Mutexdef protoReq_Config_state_atomicMessageInfo_initMu;
	Mutexdef protoReq_state_atomicMessageInfo_initMu;
	chan child_getDatasourceSchema1090 = [1] of {int};
	run getDatasourceSchema109(p_PluginClient_clientWaitGroup,p_PluginClient_stderrWaitGroup,p_TestServer_serveWG,p_mu,p_PluginClient_config_TLSConfig_mutex,p_PluginClient_l,p_PluginClient_process_sigMu,p_TestServer_channelzRemoveOnce_m,p_TestServer_done_o_m,p_TestServer_mu,p_TestServer_quit_o_m,child_getDatasourceSchema1090);
	child_getDatasourceSchema1090?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run mutexMonitor(protoReq_state_atomicMessageInfo_initMu);
	run mutexMonitor(protoReq_Config_state_atomicMessageInfo_initMu);
	run mutexMonitor(protoResp_state_atomicMessageInfo_initMu);
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype getDatasourceSchema109(Wgdef p_PluginClient_clientWaitGroup;Wgdef p_PluginClient_stderrWaitGroup;Wgdef p_TestServer_serveWG;Mutexdef p_mu;Mutexdef p_PluginClient_config_TLSConfig_mutex;Mutexdef p_PluginClient_l;Mutexdef p_PluginClient_process_sigMu;Mutexdef p_TestServer_channelzRemoveOnce_m;Mutexdef p_TestServer_done_o_m;Mutexdef p_TestServer_mu;Mutexdef p_TestServer_quit_o_m;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_getSchema760 = [1] of {int};
	run getSchema76(p_PluginClient_clientWaitGroup,p_PluginClient_stderrWaitGroup,p_TestServer_serveWG,p_mu,p_PluginClient_config_TLSConfig_mutex,p_PluginClient_l,p_PluginClient_process_sigMu,p_TestServer_channelzRemoveOnce_m,p_TestServer_done_o_m,p_TestServer_mu,p_TestServer_quit_o_m,child_getSchema760);
	child_getSchema760?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype getSchema76(Wgdef p_PluginClient_clientWaitGroup;Wgdef p_PluginClient_stderrWaitGroup;Wgdef p_TestServer_serveWG;Mutexdef p_mu;Mutexdef p_PluginClient_config_TLSConfig_mutex;Mutexdef p_PluginClient_l;Mutexdef p_PluginClient_process_sigMu;Mutexdef p_TestServer_channelzRemoveOnce_m;Mutexdef p_TestServer_done_o_m;Mutexdef p_TestServer_mu;Mutexdef p_TestServer_quit_o_m;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_GetProviderSchema1250 = [1] of {int};
	p_mu.Lock!false;
	

	if
	:: true -> 
		p_mu.Unlock!false;
		goto stop_process
	:: true;
	fi;
	p_mu.Unlock!false;
	run GetProviderSchema125(p_PluginClient_clientWaitGroup,p_PluginClient_stderrWaitGroup,p_TestServer_serveWG,p_mu,p_PluginClient_config_TLSConfig_mutex,p_PluginClient_l,p_PluginClient_process_sigMu,p_TestServer_channelzRemoveOnce_m,p_TestServer_done_o_m,p_TestServer_mu,p_TestServer_quit_o_m,child_GetProviderSchema1250);
	child_GetProviderSchema1250?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype GetProviderSchema125(Wgdef p_PluginClient_clientWaitGroup;Wgdef p_PluginClient_stderrWaitGroup;Wgdef p_TestServer_serveWG;Mutexdef p_mu;Mutexdef p_PluginClient_config_TLSConfig_mutex;Mutexdef p_PluginClient_l;Mutexdef p_PluginClient_process_sigMu;Mutexdef p_TestServer_channelzRemoveOnce_m;Mutexdef p_TestServer_done_o_m;Mutexdef p_TestServer_mu;Mutexdef p_TestServer_quit_o_m;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ProtoToProviderSchema951 = [1] of {int};
	chan child_ProtoToProviderSchema950 = [1] of {int};
	Mutexdef protoResp_ProviderMeta_state_atomicMessageInfo_initMu;
	Mutexdef protoResp_Provider_state_atomicMessageInfo_initMu;
	Mutexdef protoResp_state_atomicMessageInfo_initMu;
	int var_protoResp_DataSourceSchemas = -2; // opt var_protoResp_DataSourceSchemas
	int var_protoResp_ResourceSchemas = -2; // opt var_protoResp_ResourceSchemas
	p_mu.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run mutexMonitor(protoResp_state_atomicMessageInfo_initMu);
	run mutexMonitor(protoResp_Provider_state_atomicMessageInfo_initMu);
	run mutexMonitor(protoResp_ProviderMeta_state_atomicMessageInfo_initMu);
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run ProtoToProviderSchema95(protoResp_Provider_state_atomicMessageInfo_initMu,child_ProtoToProviderSchema950);
	child_ProtoToProviderSchema950?0;
	

	if
	:: true -> 
		run ProtoToProviderSchema95(protoResp_ProviderMeta_state_atomicMessageInfo_initMu,child_ProtoToProviderSchema951);
		child_ProtoToProviderSchema951?0
	fi;
	goto defer1;
		defer1: skip;
	p_mu.Unlock!false;
	stop_process: skip;
	child!0
}
proctype ProtoToProviderSchema95(Mutexdef s_state_atomicMessageInfo_initMu;chan child) {
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

