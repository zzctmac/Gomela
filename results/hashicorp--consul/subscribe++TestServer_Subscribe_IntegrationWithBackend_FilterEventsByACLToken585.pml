// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/consul/blob//agent/rpc/subscribe/subscribe_test.go#L585
typedef Chandef {
	chan sync = [0] of {bool};
	chan enq = [0] of {int};
	chan deq = [0] of {bool,int};
	chan sending = [0] of {bool};
	chan rcving = [0] of {bool};
	chan closing = [0] of {bool};
	int size = 0;
	int num_msgs = 0;
	bool closed = false;
}
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestServer_Subscribe_IntegrationWithBackend_FilterEventsByACLToken5850 = [1] of {int};
	run TestServer_Subscribe_IntegrationWithBackend_FilterEventsByACLToken585(child_TestServer_Subscribe_IntegrationWithBackend_FilterEventsByACLToken5850);
	run receiver(child_TestServer_Subscribe_IntegrationWithBackend_FilterEventsByACLToken5850)
stop_process:skip
}

proctype TestServer_Subscribe_IntegrationWithBackend_FilterEventsByACLToken585(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Chandef chEvents_ch;
	chan child_NewStateChangeSubscriptionClient6181 = [1] of {int};
	Mutexdef conn_firstResolveEvent_o_m;
	Mutexdef conn_balancerWrapper_mu;
	Mutexdef conn_balancerWrapper_done_o_m;
	Mutexdef conn_balancerWrapper_scBuffer_mu;
	Mutexdef conn_balancerWrapper_balancerMu;
	Mutexdef conn_resolverWrapper_pollingMu;
	Mutexdef conn_resolverWrapper_done_o_m;
	Mutexdef conn_resolverWrapper_resolverMu;
	Mutexdef conn_mu;
	Mutexdef conn_blockingpicker_connErrMu;
	Mutexdef conn_blockingpicker_mu;
	Mutexdef conn_csMgr_mu;
	chan child_NewServer270 = [1] of {int};
	Mutexdef backend_forwardConn_firstResolveEvent_o_m;
	Mutexdef backend_forwardConn_balancerWrapper_mu;
	Mutexdef backend_forwardConn_balancerWrapper_scBuffer_mu;
	Mutexdef backend_forwardConn_balancerWrapper_balancerMu;
	Mutexdef backend_forwardConn_resolverWrapper_pollingMu;
	Mutexdef backend_forwardConn_resolverWrapper_resolverMu;
	Mutexdef backend_forwardConn_mu;
	Mutexdef backend_forwardConn_blockingpicker_connErrMu;
	Mutexdef backend_forwardConn_blockingpicker_mu;
	Mutexdef backend_forwardConn_csMgr_mu;
	Mutexdef backend_store_lockDelay_lock;
	Mutexdef backend_store_db_db_writer;
	run mutexMonitor(backend_store_db_db_writer);
	run mutexMonitor(backend_store_lockDelay_lock);
	run mutexMonitor(backend_forwardConn_csMgr_mu);
	run mutexMonitor(backend_forwardConn_blockingpicker_mu);
	run mutexMonitor(backend_forwardConn_blockingpicker_connErrMu);
	run mutexMonitor(backend_forwardConn_mu);
	run mutexMonitor(backend_forwardConn_resolverWrapper_resolverMu);
	run mutexMonitor(backend_forwardConn_resolverWrapper_pollingMu);
	run mutexMonitor(backend_forwardConn_balancerWrapper_balancerMu);
	run mutexMonitor(backend_forwardConn_balancerWrapper_scBuffer_mu);
	run mutexMonitor(backend_forwardConn_balancerWrapper_mu);
	run mutexMonitor(backend_forwardConn_firstResolveEvent_o_m);
	run NewServer27(backend_forwardConn_balancerWrapper_balancerMu,backend_forwardConn_balancerWrapper_mu,backend_forwardConn_balancerWrapper_scBuffer_mu,backend_forwardConn_blockingpicker_connErrMu,backend_forwardConn_blockingpicker_mu,backend_forwardConn_csMgr_mu,backend_forwardConn_firstResolveEvent_o_m,backend_forwardConn_mu,backend_forwardConn_resolverWrapper_pollingMu,backend_forwardConn_resolverWrapper_resolverMu,backend_store_db_db_writer,backend_store_lockDelay_lock,child_NewServer270);
	child_NewServer270?0;
	run mutexMonitor(conn_csMgr_mu);
	run mutexMonitor(conn_blockingpicker_mu);
	run mutexMonitor(conn_blockingpicker_connErrMu);
	run mutexMonitor(conn_mu);
	run mutexMonitor(conn_resolverWrapper_resolverMu);
	run mutexMonitor(conn_resolverWrapper_done_o_m);
	run mutexMonitor(conn_resolverWrapper_pollingMu);
	run mutexMonitor(conn_balancerWrapper_balancerMu);
	run mutexMonitor(conn_balancerWrapper_scBuffer_mu);
	run mutexMonitor(conn_balancerWrapper_done_o_m);
	run mutexMonitor(conn_balancerWrapper_mu);
	run mutexMonitor(conn_firstResolveEvent_o_m);
	run NewStateChangeSubscriptionClient618(conn_balancerWrapper_balancerMu,conn_balancerWrapper_done_o_m,conn_balancerWrapper_mu,conn_balancerWrapper_scBuffer_mu,conn_blockingpicker_connErrMu,conn_blockingpicker_mu,conn_csMgr_mu,conn_firstResolveEvent_o_m,conn_mu,conn_resolverWrapper_done_o_m,conn_resolverWrapper_pollingMu,conn_resolverWrapper_resolverMu,child_NewStateChangeSubscriptionClient6181);
	child_NewStateChangeSubscriptionClient6181?0;
	

	if
	:: 0 > 0 -> 
		chEvents_ch.size = 0;
		run AsyncChan(chEvents_ch)
	:: else -> 
		run sync_monitor(chEvents_ch)
	fi;
	stop_process: skip;
	child!0
}
proctype NewServer27(Mutexdef backend_forwardConn_balancerWrapper_balancerMu;Mutexdef backend_forwardConn_balancerWrapper_mu;Mutexdef backend_forwardConn_balancerWrapper_scBuffer_mu;Mutexdef backend_forwardConn_blockingpicker_connErrMu;Mutexdef backend_forwardConn_blockingpicker_mu;Mutexdef backend_forwardConn_csMgr_mu;Mutexdef backend_forwardConn_firstResolveEvent_o_m;Mutexdef backend_forwardConn_mu;Mutexdef backend_forwardConn_resolverWrapper_pollingMu;Mutexdef backend_forwardConn_resolverWrapper_resolverMu;Mutexdef backend_store_db_db_writer;Mutexdef backend_store_lockDelay_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype NewStateChangeSubscriptionClient618(Mutexdef cc_balancerWrapper_balancerMu;Mutexdef cc_balancerWrapper_done_o_m;Mutexdef cc_balancerWrapper_mu;Mutexdef cc_balancerWrapper_scBuffer_mu;Mutexdef cc_blockingpicker_connErrMu;Mutexdef cc_blockingpicker_mu;Mutexdef cc_csMgr_mu;Mutexdef cc_firstResolveEvent_o_m;Mutexdef cc_mu;Mutexdef cc_resolverWrapper_done_o_m;Mutexdef cc_resolverWrapper_pollingMu;Mutexdef cc_resolverWrapper_resolverMu;chan child) {
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
proctype AsyncChan(Chandef ch) {
do
:: true ->
if
:: ch.closed -> 
end: if
  :: ch.num_msgs > 0 -> // cannot send on closed channel
    end4: if
    :: ch.enq?0-> // cannot send on closed channel
      assert(1 == 0)
    :: ch.closing?true -> // cannot close twice a channel
      assert(2 == 0)
    :: ch.rcving?false;
    :: ch.sending?false -> // sending state of channel (closed)
      assert(1 == 0)
    :: ch.deq!true,ch.num_msgs -> 
  		 ch.num_msgs = ch.num_msgs - 1
    fi;
  :: else ->    end5: if
    :: ch.enq?0-> // cannot send on closed channel
      assert(1 == 0)
    :: ch.closing?true -> // cannot close twice a channel
      assert(2 == 0)
    :: ch.rcving?false;
    :: ch.sending?false -> // sending state of channel (closed)
      assert(1 == 0)
    :: ch.sync!true; 
    fi;
  fi;
:: else ->
	if
	:: ch.num_msgs == ch.size ->
		end1: if
		  :: ch.deq!false,ch.num_msgs ->
		    ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		    ch.closed = true
		   :: ch.rcving?false ->
 		    ch.sending?false;
		fi;
	:: ch.num_msgs == 0 -> 
end2:		if
		:: ch.enq?0 -> // a message has been received
			ch.num_msgs = ch.num_msgs + 1
		:: ch.closing?true -> // closing the channel
			ch.closed = true
		:: ch.rcving?false ->
 		    ch.sending?false;
		fi;
		:: else -> 
		end3: if
		  :: ch.enq?0->
		     ch.num_msgs = ch.num_msgs + 1
		  :: ch.deq!false,ch.num_msgs
		     ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		     ch.closed = true
		  :: ch.rcving?false ->
 		    ch.sending?false;
		fi;
	fi;
fi;
od;
}

proctype sync_monitor(Chandef ch) {
do
:: true
if
:: ch.closed ->
end: if
  :: ch.enq?0-> // cannot send on closed channel
    assert(1 == 0)
  :: ch.closing?true -> // cannot close twice a channel
    assert(2 == 0)
  :: ch.sending?false -> // sending state of channel (closed)
    assert(1 == 0)
  :: ch.rcving?false;
  :: ch.sync!true; // can always receive on a closed chan
  fi;
:: else -> 
end1: if
    :: ch.rcving?false ->
       ch.sending?false;
    :: ch.closing?true ->
      ch.closed = true
    fi;
fi;
od
stop_process:
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

