// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/golang/go/blob//runtime/race/testdata/waitgroup_test.go#L209
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}



init { 
	chan child_TestNoRaceWaitGroupPanicRecover2090 = [1] of {int};
	run TestNoRaceWaitGroupPanicRecover209(child_TestNoRaceWaitGroupPanicRecover2090);
	run receiver(child_TestNoRaceWaitGroupPanicRecover2090)
stop_process:skip
}

proctype TestNoRaceWaitGroupPanicRecover209(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Wgdef wg;
	run wgMonitor(wg);
	wg.update!1;
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

