// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//pkg/proxy/winuserspace/proxysocket.go#L192
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}



init { 
	chan child_proxyTCP1920 = [1] of {int};
	run proxyTCP192(child_proxyTCP1920);
	run receiver(child_proxyTCP1920)
stop_process:skip
}

proctype proxyTCP192(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_copyBytes2021 = [1] of {int};
	chan child_copyBytes2020 = [1] of {int};
	Wgdef wg;
	run wgMonitor(wg);
	wg.update!2;
	run copyBytes202(wg,child_copyBytes2020);
	run receiver(child_copyBytes2020);
	run copyBytes202(wg,child_copyBytes2021);
	run receiver(child_copyBytes2021);
	wg.wait?0;
	stop_process: skip;
	child!0
}
proctype copyBytes202(Wgdef wg;chan child) {
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

