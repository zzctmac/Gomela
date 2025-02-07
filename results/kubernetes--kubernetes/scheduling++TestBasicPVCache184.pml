// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//pkg/controller/volume/scheduling/scheduler_assume_cache_test.go#L184
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestBasicPVCache1840 = [1] of {int};
	run TestBasicPVCache184(child_TestBasicPVCache1840);
	run receiver(child_TestBasicPVCache1840)
stop_process:skip
}

proctype TestBasicPVCache184(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_delete2043 = [1] of {int};
	chan child_update2002 = [1] of {int};
	chan child_add1571 = [1] of {int};
	chan child_add1570 = [1] of {int};
	Mutexdef internalCache_rwMutex;
	run mutexMonitor(internalCache_rwMutex);
	

	if
	:: 0 != -2 && 10-1 != -3 -> 
				for(i : 0.. 10-1) {
			for11: skip;
			run add157(internalCache_rwMutex,child_add1571);
			child_add1571?0;
			for11_end: skip
		};
		for11_exit: skip
	:: else -> 
		do
		:: true -> 
			for10: skip;
			run add157(internalCache_rwMutex,child_add1570);
			child_add1570?0;
			for10_end: skip
		:: true -> 
			break
		od;
		for10_exit: skip
	fi;
	run update200(internalCache_rwMutex,child_update2002);
	child_update2002?0;
	run delete204(internalCache_rwMutex,child_delete2043);
	child_delete2043?0;
	stop_process: skip;
	child!0
}
proctype add157(Mutexdef c_rwMutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_getObjVersion2252 = [1] of {int};
	chan child_getObjVersion2251 = [1] of {int};
	chan child_getObjInfo2380 = [1] of {int};
	

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
	c_rwMutex.Lock!false;
	run getObjInfo238(c_rwMutex,child_getObjInfo2380);
	child_getObjInfo2380?0;
	

	if
	:: true -> 
		run getObjVersion225(c_rwMutex,child_getObjVersion2251);
		child_getObjVersion2251?0;
		

		if
		:: true -> 
			goto defer1
		:: true;
		fi;
		run getObjVersion225(c_rwMutex,child_getObjVersion2252);
		child_getObjVersion2252?0;
		

		if
		:: true -> 
			goto defer1
		:: true;
		fi;
		

		if
		:: true -> 
			goto defer1
		:: true;
		fi
	:: true;
	fi;
		defer1: skip;
	c_rwMutex.Unlock!false;
	stop_process: skip;
	child!0
}
proctype getObjInfo238(Mutexdef c_rwMutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

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
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype getObjVersion225(Mutexdef c_rwMutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

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
proctype update200(Mutexdef c_rwMutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_add1572 = [1] of {int};
	run add157(c_rwMutex,child_add1572);
	child_add1572?0;
	stop_process: skip;
	child!0
}
proctype delete204(Mutexdef c_rwMutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

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
	c_rwMutex.Lock!false;
		defer1: skip;
	c_rwMutex.Unlock!false;
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

