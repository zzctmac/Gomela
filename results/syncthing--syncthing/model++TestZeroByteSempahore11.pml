// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/syncthing/syncthing/blob//lib/model/bytesemaphore_test.go#L11
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestZeroByteSempahore110 = [1] of {int};
	run TestZeroByteSempahore11(child_TestZeroByteSempahore110);
	run receiver(child_TestZeroByteSempahore110)
stop_process:skip
}

proctype TestZeroByteSempahore11(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_give802 = [1] of {int};
	chan child_take491 = [1] of {int};
	chan child_take490 = [1] of {int};
	Mutexdef s_mut;
	run mutexMonitor(s_mut);
	run take49(s_mut,child_take490);
	child_take490?0;
	run take49(s_mut,child_take491);
	child_take491?0;
	run give80(s_mut,child_give802);
	child_give802?0;
	stop_process: skip;
	child!0
}
proctype take49(Mutexdef s_mut;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_takeInner530 = [1] of {int};
	run takeInner53(s_mut,child_takeInner530);
	child_takeInner530?0;
	stop_process: skip;
	child!0
}
proctype takeInner53(Mutexdef s_mut;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	do
	:: true -> 
		goto stop_process
	:: true -> 
		break
	od;
	for10_exit: skip;
	for10_end: skip;
	s_mut.Lock!false;
	goto defer1;
		defer1: skip;
	s_mut.Unlock!false;
	stop_process: skip;
	child!0
}
proctype give80(Mutexdef s_mut;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	s_mut.Lock!false;
	s_mut.Unlock!false;
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

