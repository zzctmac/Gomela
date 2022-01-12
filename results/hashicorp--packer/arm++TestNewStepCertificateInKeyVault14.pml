// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/packer/blob//builder/azure/arm/step_certificate_in_keyvault_test.go#L14
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestNewStepCertificateInKeyVault140 = [1] of {int};
	run TestNewStepCertificateInKeyVault14(child_TestNewStepCertificateInKeyVault140);
	run receiver(child_TestNewStepCertificateInKeyVault140)
stop_process:skip
}

proctype TestNewStepCertificateInKeyVault14(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Run311 = [1] of {int};
	chan child_NewStepCertificateInKeyVault200 = [1] of {int};
	Mutexdef state_once_m;
	Mutexdef state_l;
	Mutexdef ui_l;
	run mutexMonitor(ui_l);
	run mutexMonitor(state_l);
	run mutexMonitor(state_once_m);
	run NewStepCertificateInKeyVault20(ui_l,child_NewStepCertificateInKeyVault200);
	child_NewStepCertificateInKeyVault200?0;
	run Run31(state_l,state_once_m,child_Run311);
	child_Run311?0;
	stop_process: skip;
	child!0
}
proctype NewStepCertificateInKeyVault20(Mutexdef ui_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Run31(Mutexdef state_l;Mutexdef state_once_m;chan child) {
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

