// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/helm/helm/blob//pkg/getter/plugingetter_test.go#L26
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestCollectPlugins260 = [1] of {int};
	run TestCollectPlugins26(child_TestCollectPlugins260);
	run receiver(child_TestCollectPlugins260)
stop_process:skip
}

proctype TestCollectPlugins26(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_collectPlugins330 = [1] of {int};
	Mutexdef env_config_lock;
	run mutexMonitor(env_config_lock);
	run collectPlugins33(env_config_lock,child_collectPlugins330);
	child_collectPlugins330?0;
	stop_process: skip;
	child!0
}
proctype collectPlugins33(Mutexdef settings_config_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_plugin_Metadata_Downloaders = -2; // opt var_plugin_Metadata_Downloaders
	int var_plugins = -2; // opt var_plugins
	

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

