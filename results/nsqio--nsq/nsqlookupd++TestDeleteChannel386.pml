// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/nsqio/nsq/blob//nsqlookupd/http_test.go#L386
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestDeleteChannel3860 = [1] of {int};
	run TestDeleteChannel386(child_TestDeleteChannel3860);
	run receiver(child_TestDeleteChannel3860)
stop_process:skip
}

proctype TestDeleteChannel386(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Exit860 = [1] of {int};
	chan child_makeChannel836 = [1] of {int};
	chan child_RealHTTPAddr825 = [1] of {int};
	chan child_RealHTTPAddr824 = [1] of {int};
	chan child_RealHTTPAddr823 = [1] of {int};
	chan child_RealHTTPAddr822 = [1] of {int};
	chan child_RealHTTPAddr821 = [1] of {int};
	Mutexdef nsqlookupd1_tcpServer_conns_mu;
	run mutexMonitor(nsqlookupd1_tcpServer_conns_mu);
	run RealHTTPAddr82(nsqlookupd1_tcpServer_conns_mu,child_RealHTTPAddr821);
	child_RealHTTPAddr821?0;
	run RealHTTPAddr82(nsqlookupd1_tcpServer_conns_mu,child_RealHTTPAddr822);
	child_RealHTTPAddr822?0;
	run RealHTTPAddr82(nsqlookupd1_tcpServer_conns_mu,child_RealHTTPAddr823);
	child_RealHTTPAddr823?0;
	run RealHTTPAddr82(nsqlookupd1_tcpServer_conns_mu,child_RealHTTPAddr824);
	child_RealHTTPAddr824?0;
	run RealHTTPAddr82(nsqlookupd1_tcpServer_conns_mu,child_RealHTTPAddr825);
	child_RealHTTPAddr825?0;
	run makeChannel83(nsqlookupd1_tcpServer_conns_mu,child_makeChannel836);
	child_makeChannel836?0;
		defer1: skip;
	run Exit86(nsqlookupd1_tcpServer_conns_mu,child_Exit860);
	child_Exit860?0;
	stop_process: skip;
	child!0
}
proctype Exit86(Mutexdef l_tcpServer_conns_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Close580 = [1] of {int};
	

	if
	:: true -> 
		run Close58(l_tcpServer_conns_mu,child_Close580);
		child_Close580?0
	:: true;
	fi;
	stop_process: skip;
	child!0
}
proctype Close58(Mutexdef p_conns_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	stop_process: skip;
	child!0
}
proctype RealHTTPAddr82(Mutexdef l_tcpServer_conns_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype makeChannel83(Mutexdef nsqlookupd_tcpServer_conns_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_makeTopic786 = [1] of {int};
	run makeTopic78(nsqlookupd_tcpServer_conns_mu,child_makeTopic786);
	child_makeTopic786?0;
	stop_process: skip;
	child!0
}
proctype makeTopic78(Mutexdef nsqlookupd_tcpServer_conns_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
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

