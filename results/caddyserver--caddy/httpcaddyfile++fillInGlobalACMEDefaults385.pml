// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/caddyserver/caddy/blob//caddyconfig/httpcaddyfile/tlsapp.go#L385
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_fillInGlobalACMEDefaults3850 = [1] of {int};
	run fillInGlobalACMEDefaults385(child_fillInGlobalACMEDefaults3850);
	run receiver(child_fillInGlobalACMEDefaults3850)
stop_process:skip
}

proctype fillInGlobalACMEDefaults385(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef acmeIssuer_magic_certCache_mu;
	Mutexdef acmeIssuer_template_config_certCache_mu;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run mutexMonitor(acmeIssuer_template_config_certCache_mu);
	run mutexMonitor(acmeIssuer_magic_certCache_mu);
	

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

