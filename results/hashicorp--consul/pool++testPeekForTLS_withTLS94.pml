// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/consul/blob//agent/pool/peek_test.go#L94
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
	chan child_testPeekForTLS_withTLS940 = [1] of {int};
	run testPeekForTLS_withTLS94(child_testPeekForTLS_withTLS940);
	run receiver(child_testPeekForTLS_withTLS940)
stop_process:skip
}

proctype testPeekForTLS_withTLS94(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymoustestPeekForTLS_withTLS1321321 = [1] of {int};
	chan child_AnonymoustestPeekForTLS_withTLS1121120 = [1] of {int};
	Chandef serverErrCh_ch;
	Chandef clientErrCh_ch;
	

	if
	:: 1 > 0 -> 
		clientErrCh_ch.size = 1;
		run AsyncChan(clientErrCh_ch)
	:: else -> 
		run sync_monitor(clientErrCh_ch)
	fi;
	

	if
	:: 1 > 0 -> 
		serverErrCh_ch.size = 1;
		run AsyncChan(serverErrCh_ch)
	:: else -> 
		run sync_monitor(serverErrCh_ch)
	fi;
	run AnonymoustestPeekForTLS_withTLS112112(clientErrCh_ch,serverErrCh_ch,child_AnonymoustestPeekForTLS_withTLS1121120);
	run receiver(child_AnonymoustestPeekForTLS_withTLS1121120);
	run AnonymoustestPeekForTLS_withTLS132132(clientErrCh_ch,serverErrCh_ch,child_AnonymoustestPeekForTLS_withTLS1321321);
	run receiver(child_AnonymoustestPeekForTLS_withTLS1321321);
	

	if
	:: clientErrCh_ch.deq?state,num_msgs;
	:: clientErrCh_ch.sync?state -> 
		clientErrCh_ch.rcving!false
	fi;
	

	if
	:: serverErrCh_ch.deq?state,num_msgs;
	:: serverErrCh_ch.sync?state -> 
		serverErrCh_ch.rcving!false
	fi;
	stop_process: skip;
	child!0
}
proctype AnonymoustestPeekForTLS_withTLS112112(Chandef clientErrCh_ch;Chandef serverErrCh_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef tlsConn_config_mutex;
	Mutexdef tlsConn_handshakeMutex;
	Mutexdef config_mutex;
	run mutexMonitor(config_mutex);
	run mutexMonitor(tlsConn_handshakeMutex);
	run mutexMonitor(tlsConn_config_mutex);
	

	if
	:: true -> 
		

		if
		:: clientErrCh_ch.enq!0;
		:: clientErrCh_ch.sync!false -> 
			clientErrCh_ch.sending!false
		fi;
		goto stop_process
	:: true;
	fi;
	

	if
	:: clientErrCh_ch.enq!0;
	:: clientErrCh_ch.sync!false -> 
		clientErrCh_ch.sending!false
	fi;
	stop_process: skip;
	child!0
}
proctype AnonymoustestPeekForTLS_withTLS132132(Chandef clientErrCh_ch;Chandef serverErrCh_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef tlsConn_config_mutex;
	Mutexdef tlsConn_handshakeMutex;
	Mutexdef config_mutex;
	

	if
	:: true -> 
		

		if
		:: serverErrCh_ch.enq!0;
		:: serverErrCh_ch.sync!false -> 
			serverErrCh_ch.sending!false
		fi;
		goto stop_process
	:: true -> 
		

		if
		:: true -> 
			

			if
			:: serverErrCh_ch.enq!0;
			:: serverErrCh_ch.sync!false -> 
				serverErrCh_ch.sending!false
			fi;
			goto stop_process
		:: true;
		fi
	fi;
	run mutexMonitor(config_mutex);
	run mutexMonitor(tlsConn_handshakeMutex);
	run mutexMonitor(tlsConn_config_mutex);
	

	if
	:: true -> 
		

		if
		:: serverErrCh_ch.enq!0;
		:: serverErrCh_ch.sync!false -> 
			serverErrCh_ch.sending!false
		fi;
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		

		if
		:: serverErrCh_ch.enq!0;
		:: serverErrCh_ch.sync!false -> 
			serverErrCh_ch.sending!false
		fi;
		goto stop_process
	:: true;
	fi;
	

	if
	:: serverErrCh_ch.enq!0;
	:: serverErrCh_ch.sync!false -> 
		serverErrCh_ch.sending!false
	fi;
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

