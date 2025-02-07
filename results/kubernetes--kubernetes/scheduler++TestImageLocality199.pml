// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//test/integration/scheduler/priorities_test.go#L199
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
	chan child_TestImageLocality1990 = [1] of {int};
	run TestImageLocality199(child_TestImageLocality1990);
	run receiver(child_TestImageLocality1990)
stop_process:skip
}

proctype TestImageLocality199(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_createAndWaitForNodesInCache1650 = [1] of {int};
	Mutexdef testCtx_HTTPServer_mu;
	Wgdef testCtx_HTTPServer_wg;
	Mutexdef testCtx_HTTPServer_Config_mu;
	Mutexdef testCtx_HTTPServer_Config_nextProtoOnce_m;
	Mutexdef testCtx_HTTPServer_Config_ErrorLog_mu;
	Mutexdef testCtx_HTTPServer_Config_TLSConfig_mutex;
	Mutexdef testCtx_HTTPServer_TLS_mutex;
	run mutexMonitor(testCtx_HTTPServer_TLS_mutex);
	run mutexMonitor(testCtx_HTTPServer_Config_TLSConfig_mutex);
	run mutexMonitor(testCtx_HTTPServer_Config_ErrorLog_mu);
	run mutexMonitor(testCtx_HTTPServer_Config_nextProtoOnce_m);
	run mutexMonitor(testCtx_HTTPServer_Config_mu);
	run wgMonitor(testCtx_HTTPServer_wg);
	run mutexMonitor(testCtx_HTTPServer_mu);
	run createAndWaitForNodesInCache165(testCtx_HTTPServer_wg,testCtx_HTTPServer_Config_ErrorLog_mu,testCtx_HTTPServer_Config_mu,testCtx_HTTPServer_Config_nextProtoOnce_m,testCtx_HTTPServer_Config_TLSConfig_mutex,testCtx_HTTPServer_mu,testCtx_HTTPServer_TLS_mutex,child_createAndWaitForNodesInCache1650);
	child_createAndWaitForNodesInCache1650?0;
	stop_process: skip;
	child!0
}
proctype createAndWaitForNodesInCache165(Wgdef testCtx_HTTPServer_wg;Mutexdef testCtx_HTTPServer_Config_ErrorLog_mu;Mutexdef testCtx_HTTPServer_Config_mu;Mutexdef testCtx_HTTPServer_Config_nextProtoOnce_m;Mutexdef testCtx_HTTPServer_Config_TLSConfig_mutex;Mutexdef testCtx_HTTPServer_mu;Mutexdef testCtx_HTTPServer_TLS_mutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

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

