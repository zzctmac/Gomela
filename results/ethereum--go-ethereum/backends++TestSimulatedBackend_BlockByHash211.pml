// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/ethereum/go-ethereum/blob//accounts/abi/bind/backends/simulated_test.go#L211
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestSimulatedBackend_BlockByHash2110 = [1] of {int};
	run TestSimulatedBackend_BlockByHash211(child_TestSimulatedBackend_BlockByHash2110);
	run receiver(child_TestSimulatedBackend_BlockByHash2110)
stop_process:skip
}

proctype TestSimulatedBackend_BlockByHash211(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Close1010 = [1] of {int};
	chan child_BlockByHash2272 = [1] of {int};
	chan child_BlockByNumber2451 = [1] of {int};
	Mutexdef sim_pendingState_snaps_lock;
	Mutexdef sim_pendingState_snaps_triedb_lock;
	Mutexdef sim_mu;
	Wgdef sim_blockchain_wg;
	Mutexdef sim_blockchain_futureBlocks_lock;
	Mutexdef sim_blockchain_txLookupCache_lock;
	Mutexdef sim_blockchain_blockCache_lock;
	Mutexdef sim_blockchain_receiptsCache_lock;
	Mutexdef sim_blockchain_bodyRLPCache_lock;
	Mutexdef sim_blockchain_bodyCache_lock;
	Mutexdef sim_blockchain_chainmu;
	Mutexdef sim_blockchain_scope_mu;
	Mutexdef sim_blockchain_blockProcFeed_mu;
	Mutexdef sim_blockchain_blockProcFeed_once_m;
	Mutexdef sim_blockchain_logsFeed_mu;
	Mutexdef sim_blockchain_logsFeed_once_m;
	Mutexdef sim_blockchain_chainHeadFeed_mu;
	Mutexdef sim_blockchain_chainHeadFeed_once_m;
	Mutexdef sim_blockchain_chainSideFeed_mu;
	Mutexdef sim_blockchain_chainSideFeed_once_m;
	Mutexdef sim_blockchain_chainFeed_mu;
	Mutexdef sim_blockchain_chainFeed_once_m;
	Mutexdef sim_blockchain_rmLogsFeed_mu;
	Mutexdef sim_blockchain_rmLogsFeed_once_m;
	Mutexdef sim_blockchain_hc_numberCache_lock;
	Mutexdef sim_blockchain_hc_tdCache_lock;
	Mutexdef sim_blockchain_hc_headerCache_lock;
	Mutexdef sim_blockchain_snaps_lock;
	Mutexdef sim_blockchain_snaps_triedb_lock;
	run mutexMonitor(sim_blockchain_snaps_triedb_lock);
	run mutexMonitor(sim_blockchain_snaps_lock);
	run mutexMonitor(sim_blockchain_hc_headerCache_lock);
	run mutexMonitor(sim_blockchain_hc_tdCache_lock);
	run mutexMonitor(sim_blockchain_hc_numberCache_lock);
	run mutexMonitor(sim_blockchain_rmLogsFeed_once_m);
	run mutexMonitor(sim_blockchain_rmLogsFeed_mu);
	run mutexMonitor(sim_blockchain_chainFeed_once_m);
	run mutexMonitor(sim_blockchain_chainFeed_mu);
	run mutexMonitor(sim_blockchain_chainSideFeed_once_m);
	run mutexMonitor(sim_blockchain_chainSideFeed_mu);
	run mutexMonitor(sim_blockchain_chainHeadFeed_once_m);
	run mutexMonitor(sim_blockchain_chainHeadFeed_mu);
	run mutexMonitor(sim_blockchain_logsFeed_once_m);
	run mutexMonitor(sim_blockchain_logsFeed_mu);
	run mutexMonitor(sim_blockchain_blockProcFeed_once_m);
	run mutexMonitor(sim_blockchain_blockProcFeed_mu);
	run mutexMonitor(sim_blockchain_scope_mu);
	run mutexMonitor(sim_blockchain_chainmu);
	run mutexMonitor(sim_blockchain_bodyCache_lock);
	run mutexMonitor(sim_blockchain_bodyRLPCache_lock);
	run mutexMonitor(sim_blockchain_receiptsCache_lock);
	run mutexMonitor(sim_blockchain_blockCache_lock);
	run mutexMonitor(sim_blockchain_txLookupCache_lock);
	run mutexMonitor(sim_blockchain_futureBlocks_lock);
	run wgMonitor(sim_blockchain_wg);
	run mutexMonitor(sim_mu);
	run mutexMonitor(sim_pendingState_snaps_triedb_lock);
	run mutexMonitor(sim_pendingState_snaps_lock);
	run BlockByNumber245(sim_blockchain_wg,sim_blockchain_blockCache_lock,sim_blockchain_blockProcFeed_mu,sim_blockchain_blockProcFeed_once_m,sim_blockchain_bodyCache_lock,sim_blockchain_bodyRLPCache_lock,sim_blockchain_chainFeed_mu,sim_blockchain_chainFeed_once_m,sim_blockchain_chainHeadFeed_mu,sim_blockchain_chainHeadFeed_once_m,sim_blockchain_chainmu,sim_blockchain_chainSideFeed_mu,sim_blockchain_chainSideFeed_once_m,sim_blockchain_futureBlocks_lock,sim_blockchain_hc_headerCache_lock,sim_blockchain_hc_numberCache_lock,sim_blockchain_hc_tdCache_lock,sim_blockchain_logsFeed_mu,sim_blockchain_logsFeed_once_m,sim_blockchain_receiptsCache_lock,sim_blockchain_rmLogsFeed_mu,sim_blockchain_rmLogsFeed_once_m,sim_blockchain_scope_mu,sim_blockchain_snaps_lock,sim_blockchain_snaps_triedb_lock,sim_blockchain_txLookupCache_lock,sim_mu,sim_pendingState_snaps_lock,sim_pendingState_snaps_triedb_lock,child_BlockByNumber2451);
	child_BlockByNumber2451?0;
	run BlockByHash227(sim_blockchain_wg,sim_blockchain_blockCache_lock,sim_blockchain_blockProcFeed_mu,sim_blockchain_blockProcFeed_once_m,sim_blockchain_bodyCache_lock,sim_blockchain_bodyRLPCache_lock,sim_blockchain_chainFeed_mu,sim_blockchain_chainFeed_once_m,sim_blockchain_chainHeadFeed_mu,sim_blockchain_chainHeadFeed_once_m,sim_blockchain_chainmu,sim_blockchain_chainSideFeed_mu,sim_blockchain_chainSideFeed_once_m,sim_blockchain_futureBlocks_lock,sim_blockchain_hc_headerCache_lock,sim_blockchain_hc_numberCache_lock,sim_blockchain_hc_tdCache_lock,sim_blockchain_logsFeed_mu,sim_blockchain_logsFeed_once_m,sim_blockchain_receiptsCache_lock,sim_blockchain_rmLogsFeed_mu,sim_blockchain_rmLogsFeed_once_m,sim_blockchain_scope_mu,sim_blockchain_snaps_lock,sim_blockchain_snaps_triedb_lock,sim_blockchain_txLookupCache_lock,sim_mu,sim_pendingState_snaps_lock,sim_pendingState_snaps_triedb_lock,child_BlockByHash2272);
	child_BlockByHash2272?0;
		defer1: skip;
	run Close101(sim_blockchain_wg,sim_blockchain_blockCache_lock,sim_blockchain_blockProcFeed_mu,sim_blockchain_blockProcFeed_once_m,sim_blockchain_bodyCache_lock,sim_blockchain_bodyRLPCache_lock,sim_blockchain_chainFeed_mu,sim_blockchain_chainFeed_once_m,sim_blockchain_chainHeadFeed_mu,sim_blockchain_chainHeadFeed_once_m,sim_blockchain_chainmu,sim_blockchain_chainSideFeed_mu,sim_blockchain_chainSideFeed_once_m,sim_blockchain_futureBlocks_lock,sim_blockchain_hc_headerCache_lock,sim_blockchain_hc_numberCache_lock,sim_blockchain_hc_tdCache_lock,sim_blockchain_logsFeed_mu,sim_blockchain_logsFeed_once_m,sim_blockchain_receiptsCache_lock,sim_blockchain_rmLogsFeed_mu,sim_blockchain_rmLogsFeed_once_m,sim_blockchain_scope_mu,sim_blockchain_snaps_lock,sim_blockchain_snaps_triedb_lock,sim_blockchain_txLookupCache_lock,sim_mu,sim_pendingState_snaps_lock,sim_pendingState_snaps_triedb_lock,child_Close1010);
	child_Close1010?0;
	stop_process: skip;
	child!0
}
proctype Close101(Wgdef b_blockchain_wg;Mutexdef b_blockchain_blockCache_lock;Mutexdef b_blockchain_blockProcFeed_mu;Mutexdef b_blockchain_blockProcFeed_once_m;Mutexdef b_blockchain_bodyCache_lock;Mutexdef b_blockchain_bodyRLPCache_lock;Mutexdef b_blockchain_chainFeed_mu;Mutexdef b_blockchain_chainFeed_once_m;Mutexdef b_blockchain_chainHeadFeed_mu;Mutexdef b_blockchain_chainHeadFeed_once_m;Mutexdef b_blockchain_chainmu;Mutexdef b_blockchain_chainSideFeed_mu;Mutexdef b_blockchain_chainSideFeed_once_m;Mutexdef b_blockchain_futureBlocks_lock;Mutexdef b_blockchain_hc_headerCache_lock;Mutexdef b_blockchain_hc_numberCache_lock;Mutexdef b_blockchain_hc_tdCache_lock;Mutexdef b_blockchain_logsFeed_mu;Mutexdef b_blockchain_logsFeed_once_m;Mutexdef b_blockchain_receiptsCache_lock;Mutexdef b_blockchain_rmLogsFeed_mu;Mutexdef b_blockchain_rmLogsFeed_once_m;Mutexdef b_blockchain_scope_mu;Mutexdef b_blockchain_snaps_lock;Mutexdef b_blockchain_snaps_triedb_lock;Mutexdef b_blockchain_txLookupCache_lock;Mutexdef b_mu;Mutexdef b_pendingState_snaps_lock;Mutexdef b_pendingState_snaps_triedb_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype BlockByNumber245(Wgdef b_blockchain_wg;Mutexdef b_blockchain_blockCache_lock;Mutexdef b_blockchain_blockProcFeed_mu;Mutexdef b_blockchain_blockProcFeed_once_m;Mutexdef b_blockchain_bodyCache_lock;Mutexdef b_blockchain_bodyRLPCache_lock;Mutexdef b_blockchain_chainFeed_mu;Mutexdef b_blockchain_chainFeed_once_m;Mutexdef b_blockchain_chainHeadFeed_mu;Mutexdef b_blockchain_chainHeadFeed_once_m;Mutexdef b_blockchain_chainmu;Mutexdef b_blockchain_chainSideFeed_mu;Mutexdef b_blockchain_chainSideFeed_once_m;Mutexdef b_blockchain_futureBlocks_lock;Mutexdef b_blockchain_hc_headerCache_lock;Mutexdef b_blockchain_hc_numberCache_lock;Mutexdef b_blockchain_hc_tdCache_lock;Mutexdef b_blockchain_logsFeed_mu;Mutexdef b_blockchain_logsFeed_once_m;Mutexdef b_blockchain_receiptsCache_lock;Mutexdef b_blockchain_rmLogsFeed_mu;Mutexdef b_blockchain_rmLogsFeed_once_m;Mutexdef b_blockchain_scope_mu;Mutexdef b_blockchain_snaps_lock;Mutexdef b_blockchain_snaps_triedb_lock;Mutexdef b_blockchain_txLookupCache_lock;Mutexdef b_mu;Mutexdef b_pendingState_snaps_lock;Mutexdef b_pendingState_snaps_triedb_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_blockByNumberNoLock2541 = [1] of {int};
	b_mu.Lock!false;
	run blockByNumberNoLock254(b_blockchain_wg,b_blockchain_blockCache_lock,b_blockchain_blockProcFeed_mu,b_blockchain_blockProcFeed_once_m,b_blockchain_bodyCache_lock,b_blockchain_bodyRLPCache_lock,b_blockchain_chainFeed_mu,b_blockchain_chainFeed_once_m,b_blockchain_chainHeadFeed_mu,b_blockchain_chainHeadFeed_once_m,b_blockchain_chainmu,b_blockchain_chainSideFeed_mu,b_blockchain_chainSideFeed_once_m,b_blockchain_futureBlocks_lock,b_blockchain_hc_headerCache_lock,b_blockchain_hc_numberCache_lock,b_blockchain_hc_tdCache_lock,b_blockchain_logsFeed_mu,b_blockchain_logsFeed_once_m,b_blockchain_receiptsCache_lock,b_blockchain_rmLogsFeed_mu,b_blockchain_rmLogsFeed_once_m,b_blockchain_scope_mu,b_blockchain_snaps_lock,b_blockchain_snaps_triedb_lock,b_blockchain_txLookupCache_lock,b_mu,b_pendingState_snaps_lock,b_pendingState_snaps_triedb_lock,child_blockByNumberNoLock2541);
	child_blockByNumberNoLock2541?0;
	goto defer1;
		defer1: skip;
	b_mu.Unlock!false;
	stop_process: skip;
	child!0
}
proctype blockByNumberNoLock254(Wgdef b_blockchain_wg;Mutexdef b_blockchain_blockCache_lock;Mutexdef b_blockchain_blockProcFeed_mu;Mutexdef b_blockchain_blockProcFeed_once_m;Mutexdef b_blockchain_bodyCache_lock;Mutexdef b_blockchain_bodyRLPCache_lock;Mutexdef b_blockchain_chainFeed_mu;Mutexdef b_blockchain_chainFeed_once_m;Mutexdef b_blockchain_chainHeadFeed_mu;Mutexdef b_blockchain_chainHeadFeed_once_m;Mutexdef b_blockchain_chainmu;Mutexdef b_blockchain_chainSideFeed_mu;Mutexdef b_blockchain_chainSideFeed_once_m;Mutexdef b_blockchain_futureBlocks_lock;Mutexdef b_blockchain_hc_headerCache_lock;Mutexdef b_blockchain_hc_numberCache_lock;Mutexdef b_blockchain_hc_tdCache_lock;Mutexdef b_blockchain_logsFeed_mu;Mutexdef b_blockchain_logsFeed_once_m;Mutexdef b_blockchain_receiptsCache_lock;Mutexdef b_blockchain_rmLogsFeed_mu;Mutexdef b_blockchain_rmLogsFeed_once_m;Mutexdef b_blockchain_scope_mu;Mutexdef b_blockchain_snaps_lock;Mutexdef b_blockchain_snaps_triedb_lock;Mutexdef b_blockchain_txLookupCache_lock;Mutexdef b_mu;Mutexdef b_pendingState_snaps_lock;Mutexdef b_pendingState_snaps_triedb_lock;chan child) {
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
proctype BlockByHash227(Wgdef b_blockchain_wg;Mutexdef b_blockchain_blockCache_lock;Mutexdef b_blockchain_blockProcFeed_mu;Mutexdef b_blockchain_blockProcFeed_once_m;Mutexdef b_blockchain_bodyCache_lock;Mutexdef b_blockchain_bodyRLPCache_lock;Mutexdef b_blockchain_chainFeed_mu;Mutexdef b_blockchain_chainFeed_once_m;Mutexdef b_blockchain_chainHeadFeed_mu;Mutexdef b_blockchain_chainHeadFeed_once_m;Mutexdef b_blockchain_chainmu;Mutexdef b_blockchain_chainSideFeed_mu;Mutexdef b_blockchain_chainSideFeed_once_m;Mutexdef b_blockchain_futureBlocks_lock;Mutexdef b_blockchain_hc_headerCache_lock;Mutexdef b_blockchain_hc_numberCache_lock;Mutexdef b_blockchain_hc_tdCache_lock;Mutexdef b_blockchain_logsFeed_mu;Mutexdef b_blockchain_logsFeed_once_m;Mutexdef b_blockchain_receiptsCache_lock;Mutexdef b_blockchain_rmLogsFeed_mu;Mutexdef b_blockchain_rmLogsFeed_once_m;Mutexdef b_blockchain_scope_mu;Mutexdef b_blockchain_snaps_lock;Mutexdef b_blockchain_snaps_triedb_lock;Mutexdef b_blockchain_txLookupCache_lock;Mutexdef b_mu;Mutexdef b_pendingState_snaps_lock;Mutexdef b_pendingState_snaps_triedb_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	b_mu.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	goto defer1;
		defer1: skip;
	b_mu.Unlock!false;
	stop_process: skip;
	child!0
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
proctype wgMonitor(Wgdef wg) {
int i;
do
	:: wg.update?i ->
		wg.Counter = wg.Counter + i;
		assert(wg.Counter >= 0)
	:: wg.Counter == 0 ->
end: if
		:: wg.update?i ->
			wg.Counter = wg.Counter + i;
			assert(wg.Counter >= 0)
		:: wg.wait!0;
	fi
od
}

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

