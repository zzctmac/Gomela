// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//test/integration/master/synthetic_master_test.go#L96
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
	chan child_TestKubernetesService960 = [1] of {int};
	run TestKubernetesService96(child_TestKubernetesService960);
	run receiver(child_TestKubernetesService960)
stop_process:skip
}

proctype TestKubernetesService96(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef __mu;
	Wgdef __wg;
	Mutexdef __Config_mu;
	Mutexdef __Config_nextProtoOnce_m;
	Mutexdef __Config_ErrorLog_mu;
	Mutexdef __Config_TLSConfig_mutex;
	Mutexdef __TLS_mutex;
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
	Mutexdef config_GenericConfig_HandlerChainWaitGroup_mu;
	Wgdef config_GenericConfig_HandlerChainWaitGroup_wg;
	run wgMonitor(config_GenericConfig_HandlerChainWaitGroup_wg);
	run mutexMonitor(config_GenericConfig_HandlerChainWaitGroup_mu);
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
	run mutexMonitor(__TLS_mutex);
	run mutexMonitor(__Config_TLSConfig_mutex);
	run mutexMonitor(__Config_ErrorLog_mu);
	run mutexMonitor(__Config_nextProtoOnce_m);
	run mutexMonitor(__Config_mu);
	run wgMonitor(__wg);
	run mutexMonitor(__mu);
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

