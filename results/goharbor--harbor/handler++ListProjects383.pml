// num_comm_params=1
// num_mand_comm_params=1
// num_opt_comm_params=0

// git_link=https://github.com/goharbor/harbor/blob//src/server/v2.0/handler/project.go#L383
#define def_var_projects448  ?? // mand projects line 448
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}



init { 
	chan child_ListProjects3830 = [1] of {int};
	run ListProjects383(child_ListProjects3830);
	run receiver(child_ListProjects3830)
stop_process:skip
}

proctype ListProjects383(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousListProjects4504500 = [1] of {int};
	Wgdef wg;
	int var_projects = def_var_projects448; // mand var_projects
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi
	fi;
	

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
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run wgMonitor(wg);
		for(i : 0.. var_projects-1) {
		for10: skip;
		wg.update!1;
		run AnonymousListProjects450450(wg,child_AnonymousListProjects4504500);
		run receiver(child_AnonymousListProjects4504500);
		for10_end: skip
	};
	for10_exit: skip;
	wg.wait?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype AnonymousListProjects450450(Wgdef wg;chan child) {
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

