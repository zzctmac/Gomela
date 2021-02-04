#define eachMapP_keys  3

// https://github.com/tobyhede/go-underscore/blob/ea55fc9569918f099b1dfa785088434e5c53544d/each.go#L113
typedef Wgdef {
	chan Add = [0] of {int};
	chan Wait = [0] of {int};
	int Counter = 0;}



init { 
	Wgdef done;
	int num_msgs = 0;
	bool state = false;
	int i;
	int keys = eachMapP_keys;
	run wgMonitor(done);
	done.Add!keys;
		for(i : 0.. keys-1) {
		for10: skip;
		run go_Anonymous0(done);
		for10_end: skip
	};
	for10_exit: skip;
	done.Wait?0
stop_process:skip
}

proctype go_Anonymous0(Wgdef done) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	done.Add!-1;
	stop_process: skip
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
proctype wgMonitor(Wgdef wg) {
bool closed;
int i;
bool state;
do
	:: wg.Add?i ->
		wg.Counter = wg.Counter + i;
		assert(wg.Counter >= 0)
	:: wg.Counter == 0 ->
end: if
		:: wg.Add?i ->
			wg.Counter = wg.Counter + i;
			assert(wg.Counter >= 0)
		:: wg.Wait!0;
	fi
od
}

