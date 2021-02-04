#define download_d_cfg_Concurrency  1
#define ub_for321_2  -2

// https://github.com/aws/aws-sdk-go/blob/be10aadefc0a3b97e8cdbc09d9693f633cfed290/service/s3/s3manager/download.go#L299
typedef Chandef {
	chan sync = [0] of {bool,int};
	chan async_send = [0] of {int};
	chan async_rcv = [0] of {bool,int};
	chan sending = [0] of {int};
	chan closing = [0] of {bool};
	int size = 0;
	int num_msgs = 0;
	bool closed = false;
}



init { 
	Chandef ch;
	int num_msgs = 0;
	bool state = false;
	int i;
	int d_cfg_Concurrency = download_d_cfg_Concurrency;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		

		if
		:: d_cfg_Concurrency > 0 -> 
			ch.size = d_cfg_Concurrency;
			run AsyncChan(ch)
		:: else -> 
			run sync_monitor(ch)
		fi;
				for(i : 0.. d_cfg_Concurrency-1) {
			for10: skip;
			run go_downloadPart(ch);
			for10_end: skip
		};
		for10_exit: skip;
		

		if
		:: 0 != -2 && ub_for321_2 != -2 -> 
						for(i : 0.. ub_for321_2) {
				for20919: skip;
				

				if
				:: true -> 
					break
				:: true;
				fi;
				

				if
				:: ch.async_send!0;
				:: ch.sync!false,0 -> 
					ch.sending?state
				fi;
				for20_end919: skip
			};
			for20_exit919: skip
		:: else -> 
			do
			:: true -> 
				for20: skip;
				

				if
				:: true -> 
					break
				:: true;
				fi;
				

				if
				:: ch.async_send!0;
				:: ch.sync!false,0 -> 
					ch.sending?state
				fi;
				for20_end: skip
			:: true -> 
				break
			od;
			for20_exit: skip
		fi;
		ch.closing!true
	fi;
	goto stop_process
stop_process:skip
}

proctype go_downloadPart(Chandef ch) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	do
	:: true -> 
		for11: skip;
		

		if
		:: ch.async_rcv?state,num_msgs;
		:: ch.sync?state,num_msgs;
		fi;
		

		if
		:: true -> 
			break
		:: true;
		fi;
		

		if
		:: true -> 
			goto for11_end
		:: true;
		fi;
		for11_end: skip
	od;
	for11_exit: skip;
	stop_process: skip
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
  :: ch.async_send?0-> // cannot send on closed channel
    assert(false)
  :: ch.closing?true -> // cannot close twice a channel
    assert(false)
  :: ch.sending!true -> // sending state of channel (closed)
    assert(false)
  :: ch.sync!true,ch.num_msgs -> // can always receive on a closed chan
		 ch.num_msgs = ch.num_msgs - 1
  fi;
:: else ->
	if
	:: ch.num_msgs == ch.size ->
		end1: if
		  :: ch.async_rcv!false,ch.num_msgs ->
		    ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		      ch.closed = true
		  :: ch.sending!false;
		fi;
	:: ch.num_msgs == 0 -> 
end2:		if
		:: ch.async_send?0 -> // a message has been received
			ch.num_msgs = ch.num_msgs + 1
		:: ch.closing?true -> // closing the channel
			ch.closed = true
		:: ch.sending!false;
		fi;
		:: else -> 
		end3: if
		  :: ch.async_send?0->
		     ch.num_msgs = ch.num_msgs + 1
		  :: ch.async_rcv!false,ch.num_msgs
		     ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		      ch.closed = true
		  :: ch.sending!false;  // sending channel is open
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
  :: ch.async_send?0-> // cannot send on closed channel
    assert(false)
  :: ch.closing?true -> // cannot close twice a channel
    assert(false)
  :: ch.sending!true -> // sending state of channel (closed)
    assert(false)
  :: ch.sync!true,0; // can always receive on a closed chan
  fi;
:: else -> 
end1: if
    :: ch.sending!false;
    :: ch.closing?true ->
      ch.closed = true
    fi;
fi;
od
stop_process:
}

