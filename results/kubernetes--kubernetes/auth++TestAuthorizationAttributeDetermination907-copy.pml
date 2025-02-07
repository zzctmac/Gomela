// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//test/integration/auth/auth_test.go#L907
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
	chan child_TestAuthorizationAttributeDetermination9070 = [1] of {int};
	run TestAuthorizationAttributeDetermination907(child_TestAuthorizationAttributeDetermination9070);
	run receiver(child_TestAuthorizationAttributeDetermination9070)
stop_process:skip
}

proctype TestAuthorizationAttributeDetermination907(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef s_mu;
	Wgdef s_wg;
	Mutexdef s_Config_mu;
	Mutexdef s_Config_nextProtoOnce_m;
	Mutexdef s_Config_ErrorLog_mu;
	Mutexdef s_Config_TLSConfig_mutex;
	Mutexdef s_TLS_mutex;
	Mutexdef __GenericAPIServer_HandlerChainWaitGroup_mu;
	Wgdef __GenericAPIServer_HandlerChainWaitGroup_wg;
	Mutexdef __GenericAPIServer_readyzLock;
	Mutexdef __GenericAPIServer_livezLock;
	Mutexdef __GenericAPIServer_healthzLock;
	Mutexdef __GenericAPIServer_preShutdownHookLock;
	Mutexdef __GenericAPIServer_postStartHookLock;
	Mutexdef __GenericAPIServer_OpenAPIVersionedService_rwMutex;
	Mutexdef __GenericAPIServer_Handler_NonGoRestfulMux_lock;
	Mutexdef __GenericAPIServer_Handler_GoRestfulContainer_webServicesLock;
	Mutexdef masterConfig_GenericConfig_HandlerChainWaitGroup_mu;
	Wgdef masterConfig_GenericConfig_HandlerChainWaitGroup_wg;
	int var_currentAuthorizationAttributesIndex = -2; // opt var_currentAuthorizationAttributesIndex
	int var_trackingAuthorizer_requestAttributes = -2; // opt var_trackingAuthorizer_requestAttributes
	int var_requests = -2; // opt var_requests
	run wgMonitor(masterConfig_GenericConfig_HandlerChainWaitGroup_wg);
	run mutexMonitor(masterConfig_GenericConfig_HandlerChainWaitGroup_mu);
	run mutexMonitor(__GenericAPIServer_Handler_GoRestfulContainer_webServicesLock);
	run mutexMonitor(__GenericAPIServer_Handler_NonGoRestfulMux_lock);
	run mutexMonitor(__GenericAPIServer_OpenAPIVersionedService_rwMutex);
	run mutexMonitor(__GenericAPIServer_postStartHookLock);
	run mutexMonitor(__GenericAPIServer_preShutdownHookLock);
	run mutexMonitor(__GenericAPIServer_healthzLock);
	run mutexMonitor(__GenericAPIServer_livezLock);
	run mutexMonitor(__GenericAPIServer_readyzLock);
	run wgMonitor(__GenericAPIServer_HandlerChainWaitGroup_wg);
	run mutexMonitor(__GenericAPIServer_HandlerChainWaitGroup_mu);
	run mutexMonitor(s_TLS_mutex);
	run mutexMonitor(s_Config_TLSConfig_mutex);
	run mutexMonitor(s_Config_ErrorLog_mu);
	run mutexMonitor(s_Config_nextProtoOnce_m);
	run mutexMonitor(s_Config_mu);
	run wgMonitor(s_wg);
	run mutexMonitor(s_mu);
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

