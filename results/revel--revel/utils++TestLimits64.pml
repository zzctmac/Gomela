// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/revel/revel/blob//utils/simplestack_test.go#L64
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestLimits640 = [1] of {int};
	run TestLimits64(child_TestLimits640);
	run receiver(child_TestLimits640)
stop_process:skip
}

proctype TestLimits64(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Capacity955 = [1] of {int};
	chan child_Capacity954 = [1] of {int};
	chan child_Push672 = [1] of {int};
	chan child_Push673 = [1] of {int};
	chan child_Pop481 = [1] of {int};
	chan child_Pop480 = [1] of {int};
	Mutexdef stack_lock;
	int var_values = -2; // opt var_values
	run mutexMonitor(stack_lock);
	

	if
	:: 0 != -2 && 50-1 != -3 -> 
				for(i : 0.. 50-1) {
			for11: skip;
			run Pop48(stack_lock,child_Pop481);
			child_Pop481?0;
			for11_end: skip
		};
		for11_exit: skip
	:: else -> 
		do
		:: true -> 
			for10: skip;
			run Pop48(stack_lock,child_Pop480);
			child_Pop480?0;
			for10_end: skip
		:: true -> 
			break
		od;
		for10_exit: skip
	fi;
	

	if
	:: var_values-1 != -3 -> 
				for(i : 0.. var_values-1) {
			for20: skip;
			run Push67(stack_lock,child_Push672);
			child_Push672?0;
			for20_end: skip
		};
		for20_exit: skip
	:: else -> 
		do
		:: true -> 
			for21: skip;
			run Push67(stack_lock,child_Push673);
			child_Push673?0;
			for21_end: skip
		:: true -> 
			break
		od;
		for21_exit: skip
	fi;
	run Capacity95(stack_lock,child_Capacity954);
	child_Capacity954?0;
	

	if
	:: true -> 
		run Capacity95(stack_lock,child_Capacity955);
		child_Capacity955?0
	:: true;
	fi;
	stop_process: skip;
	child!0
}
proctype Pop48(Mutexdef s_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	s_lock.Lock!false;
	goto defer1;
		defer1: skip;
	s_lock.Unlock!false;
	stop_process: skip;
	child!0
}
proctype Push67(Mutexdef s_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	s_lock.Lock!false;
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto defer1
		fi
	fi;
	goto defer1;
		defer1: skip;
	s_lock.Unlock!false;
	stop_process: skip;
	child!0
}
proctype Capacity95(Mutexdef s_lock;chan child) {
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

