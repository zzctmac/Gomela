// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//pkg/volume/glusterfs/glusterfs_minmax_test.go#L182
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestAllocateOutOfRange1820 = [1] of {int};
	run TestAllocateOutOfRange182(child_TestAllocateOutOfRange1820);
	run receiver(child_TestAllocateOutOfRange1820)
stop_process:skip
}

proctype TestAllocateOutOfRange182(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Allocate1120 = [1] of {int};
	Mutexdef m_lock;
	run mutexMonitor(m_lock);
	run Allocate112(m_lock,child_Allocate1120);
	child_Allocate1120?0;
	stop_process: skip;
	child!0
}
proctype Allocate112(Mutexdef a_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_has1711 = [1] of {int};
	chan child_inRange1910 = [1] of {int};
	a_lock.Lock!false;
	run inRange191(a_lock,child_inRange1910);
	child_inRange1910?0;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run has171(a_lock,child_has1711);
	child_has1711?0;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	goto defer1;
		defer1: skip;
	a_lock.Unlock!false;
	stop_process: skip;
	child!0
}
proctype inRange191(Mutexdef a_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
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

