// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/consul/blob//command/acl/role/read/role_read.go#L54
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_Run540 = [1] of {int};
	run Run54(child_Run540);
	run receiver(child_Run540)
stop_process:skip
}

proctype Run54(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef client_config_Transport_nextProtoOnce_m;
	Mutexdef client_config_Transport_TLSClientConfig_mutex;
	Mutexdef client_config_Transport_connsPerHostMu;
	Mutexdef client_config_Transport_altMu;
	Mutexdef client_config_Transport_reqMu;
	Mutexdef client_config_Transport_idleMu;
	Mutexdef client_modifyLock;
	

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
	run mutexMonitor(client_modifyLock);
	run mutexMonitor(client_config_Transport_idleMu);
	run mutexMonitor(client_config_Transport_reqMu);
	run mutexMonitor(client_config_Transport_altMu);
	run mutexMonitor(client_config_Transport_connsPerHostMu);
	run mutexMonitor(client_config_Transport_TLSClientConfig_mutex);
	run mutexMonitor(client_config_Transport_nextProtoOnce_m);
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
		

		if
		:: true -> 
			goto stop_process
		:: true -> 
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi
		fi
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true -> 
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi
		fi
	fi;
	

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

