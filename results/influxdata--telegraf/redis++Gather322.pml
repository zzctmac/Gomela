// num_comm_params=1
// num_mand_comm_params=1
// num_opt_comm_params=0

// git_link=https://github.com/influxdata/telegraf/blob//plugins/inputs/redis/redis.go#L322
#define def_var_r_clients332  ?? // mand r.clients line 332
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}



init { 
	chan child_Gather3220 = [1] of {int};
	run Gather322(child_Gather3220);
	run receiver(child_Gather3220)
stop_process:skip
}

proctype Gather322(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousGather3343340 = [1] of {int};
	Wgdef wg;
	int var_r_clients = def_var_r_clients332; // mand var_r_clients
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi
	:: true;
	fi;
	run wgMonitor(wg);
		for(i : 0.. var_r_clients-1) {
		for10: skip;
		wg.update!1;
		run AnonymousGather334334(wg,child_AnonymousGather3343340);
		run receiver(child_AnonymousGather3343340);
		for10_end: skip
	};
	for10_exit: skip;
	wg.wait?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype AnonymousGather334334(Wgdef wg;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
		defer1: skip;
	wg.update!-1;
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

proctype receiver(chan c) {
c?0
}

