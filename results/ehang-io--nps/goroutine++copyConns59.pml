// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/ehang-io/nps/blob//lib/goroutine/pool.go#L59
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}



init { 
	chan child_copyConns590 = [1] of {int};
	run copyConns59(child_copyConns590);
	run receiver(child_copyConns590)
stop_process:skip
}

proctype copyConns59(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_newConnGroup191 = [1] of {int};
	chan child_newConnGroup190 = [1] of {int};
	Wgdef wg;
	Wgdef conns_wg;
	run wgMonitor(conns_wg);
	run wgMonitor(wg);
	wg.update!2;
	run newConnGroup19(wg,child_newConnGroup190);
	child_newConnGroup190?0;
	run newConnGroup19(wg,child_newConnGroup191);
	child_newConnGroup191?0;
	wg.wait?0;
	conns_wg.update!-1;
	stop_process: skip;
	child!0
}
proctype newConnGroup19(Wgdef wg;chan child) {
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

