// num_comm_params=2
// num_mand_comm_params=1
// num_opt_comm_params=1

// git_link=https://github.com/evanw/esbuild/blob//internal/renamer/renamer.go#L418
#define def_var_nestedScopes  3 // mand nestedScopes line 418
#define def_var_scopes  -2 // opt scopes line 424
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}



init { 
	chan child_AssignNamesByScope4180 = [1] of {int};
	run AssignNamesByScope418(def_var_nestedScopes,child_AssignNamesByScope4180);
	run receiver(child_AssignNamesByScope4180)
stop_process:skip
}

proctype AssignNamesByScope418(int var_nestedScopes;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousAssignNamesByScope4244240 = [1] of {int};
	int var_scopes = def_var_scopes;
	Wgdef waitGroup;
	run wgMonitor(waitGroup);
	waitGroup.update!var_nestedScopes;
		for(i : 0.. var_nestedScopes-1) {
		for10: skip;
		run AnonymousAssignNamesByScope424424(waitGroup,var_scopes,child_AnonymousAssignNamesByScope4244240);
		run receiver(child_AnonymousAssignNamesByScope4244240);
		for10_end: skip
	};
	for10_exit: skip;
	waitGroup.wait?0;
	stop_process: skip;
	child!0
}
proctype AnonymousAssignNamesByScope424424(Wgdef waitGroup;int var_scopes;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	waitGroup.update!-1;
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

