// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//pkg/volume/glusterfs/glusterfs_minmax_test.go#L112
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestAllocateMax1120 = [1] of {int};
	run TestAllocateMax112(child_TestAllocateMax1120);
	run receiver(child_TestAllocateMax1120)
stop_process:skip
}

proctype TestAllocateMax112(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Free1853 = [1] of {int};
	chan child_AllocateNext1312 = [1] of {int};
	chan child_AllocateNext1311 = [1] of {int};
	chan child_AllocateNext1310 = [1] of {int};
	Mutexdef m_lock;
	int var_max = -2; // opt var_max
	run mutexMonitor(m_lock);
	

	if
	:: 0 != -2 && var_max != -2 -> 
				for(i : 0.. var_max) {
			for13: skip;
			run AllocateNext131(m_lock,child_AllocateNext1311);
			child_AllocateNext1311?0;
			for13_end: skip
		};
		for13_exit: skip
	:: else -> 
		do
		:: true -> 
			for10: skip;
			run AllocateNext131(m_lock,child_AllocateNext1310);
			child_AllocateNext1310?0;
			for10_end: skip
		:: true -> 
			break
		od;
		for10_exit: skip
	fi;
	run AllocateNext131(m_lock,child_AllocateNext1312);
	child_AllocateNext1312?0;
	run Free185(m_lock,child_Free1853);
	child_Free1853?0;
	stop_process: skip;
	child!0
}
proctype AllocateNext131(Mutexdef a_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_has1711 = [1] of {int};
	chan child_has1710 = [1] of {int};
	int var_a_min = -2; // opt var_a_min
	int var_a_max = -2; // opt var_a_max
	a_lock.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: 0 != -2 && var_a_max != -2 -> 
				for(i : 0.. var_a_max) {
			for12: skip;
			run has171(a_lock,child_has1711);
			child_has1711?0;
			

			if
			:: true -> 
				goto defer1
			:: true;
			fi;
			for12_end: skip
		};
		for12_exit: skip
	:: else -> 
		do
		:: true -> 
			for11: skip;
			run has171(a_lock,child_has1710);
			child_has1710?0;
			

			if
			:: true -> 
				goto defer1
			:: true;
			fi;
			for11_end: skip
		:: true -> 
			break
		od;
		for11_exit: skip
	fi;
	goto defer1;
		defer1: skip;
	a_lock.Unlock!false;
	stop_process: skip;
	child!0
}
proctype has171(Mutexdef a_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Free185(Mutexdef a_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	a_lock.Lock!false;
	goto defer1;
		defer1: skip;
	a_lock.Unlock!false;
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

