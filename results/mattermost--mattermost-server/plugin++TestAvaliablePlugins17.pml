// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/mattermost/mattermost-server/blob//plugin/environment_test.go#L17
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestAvaliablePlugins170 = [1] of {int};
	run TestAvaliablePlugins17(child_TestAvaliablePlugins170);
	run receiver(child_TestAvaliablePlugins170)
stop_process:skip
}

proctype TestAvaliablePlugins17(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef env_prepackagedPluginsLock;
	Mutexdef env_logger_mutex;
	Mutexdef env_logger_logrLogger_logr_mux;
	Mutexdef env_logger_logrLogger_logr_tmux;
	Mutexdef env_pluginHealthCheckJob_failureTimestamps_mu;
	Mutexdef env_pluginHealthCheckJob_cancelOnce_m;
	Mutexdef env_registeredPlugins_mu;
	run mutexMonitor(env_registeredPlugins_mu);
	run mutexMonitor(env_pluginHealthCheckJob_cancelOnce_m);
	run mutexMonitor(env_pluginHealthCheckJob_failureTimestamps_mu);
	run mutexMonitor(env_logger_logrLogger_logr_tmux);
	run mutexMonitor(env_logger_logrLogger_logr_mux);
	run mutexMonitor(env_logger_mutex);
	run mutexMonitor(env_prepackagedPluginsLock);
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

