// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/mattermost/mattermost-server/blob//model/post_test.go#L104
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestPostIsSystemMessage1040 = [1] of {int};
	run TestPostIsSystemMessage104(child_TestPostIsSystemMessage1040);
	run receiver(child_TestPostIsSystemMessage1040)
stop_process:skip
}

proctype TestPostIsSystemMessage104(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_IsSystemMessage4653 = [1] of {int};
	chan child_PreSave3852 = [1] of {int};
	Mutexdef post2_propsMu;
	chan child_IsSystemMessage4651 = [1] of {int};
	chan child_PreSave3850 = [1] of {int};
	Mutexdef post1_propsMu;
	run mutexMonitor(post1_propsMu);
	run PreSave385(post1_propsMu,child_PreSave3850);
	child_PreSave3850?0;
	run IsSystemMessage465(post1_propsMu,child_IsSystemMessage4651);
	child_IsSystemMessage4651?0;
	run mutexMonitor(post2_propsMu);
	run PreSave385(post2_propsMu,child_PreSave3852);
	child_PreSave3852?0;
	run IsSystemMessage465(post2_propsMu,child_IsSystemMessage4653);
	child_IsSystemMessage4653?0;
	stop_process: skip;
	child!0
}
proctype PreSave385(Mutexdef o_propsMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_PreCommit4000 = [1] of {int};
	run PreCommit400(o_propsMu,child_PreCommit4000);
	child_PreCommit4000?0;
	stop_process: skip;
	child!0
}
proctype PreCommit400(Mutexdef o_propsMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_GenerateActionIds4052 = [1] of {int};
	chan child_SetProps4531 = [1] of {int};
	chan child_GetProps4470 = [1] of {int};
	run GetProps447(o_propsMu,child_GetProps4470);
	child_GetProps4470?0;
	

	if
	:: true -> 
		run SetProps453(o_propsMu,child_SetProps4531);
		child_SetProps4531?0
	:: true;
	fi;
	run GenerateActionIds405(o_propsMu,child_GenerateActionIds4052);
	child_GenerateActionIds4052?0;
	stop_process: skip;
	child!0
}
proctype GetProps447(Mutexdef o_propsMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	o_propsMu.RLock!false;
	goto defer1;
		defer1: skip;
	o_propsMu.RUnlock!false;
	stop_process: skip;
	child!0
}
proctype SetProps453(Mutexdef o_propsMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	o_propsMu.Lock!false;
		defer1: skip;
	o_propsMu.Unlock!false;
	stop_process: skip;
	child!0
}
proctype GenerateActionIds405(Mutexdef o_propsMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_GetProp4594 = [1] of {int};
	chan child_AddProp4363 = [1] of {int};
	chan child_GetProp4592 = [1] of {int};
	int var_attachment_Actions = -2; // opt var_attachment_Actions
	int var_attachments = -2; // opt var_attachments
	run GetProp459(o_propsMu,child_GetProp4592);
	child_GetProp4592?0;
	

	if
	:: true -> 
		run AddProp436(o_propsMu,child_AddProp4363);
		child_AddProp4363?0
	:: true;
	fi;
	run GetProp459(o_propsMu,child_GetProp4594);
	child_GetProp4594?0;
	stop_process: skip;
	child!0
}
proctype GetProp459(Mutexdef o_propsMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	o_propsMu.RLock!false;
	goto defer1;
		defer1: skip;
	o_propsMu.RUnlock!false;
	stop_process: skip;
	child!0
}
proctype AddProp436(Mutexdef o_propsMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_o_Props = -2; // opt var_o_Props
	o_propsMu.Lock!false;
		defer1: skip;
	o_propsMu.Unlock!false;
	stop_process: skip;
	child!0
}
proctype IsSystemMessage465(Mutexdef o_propsMu;chan child) {
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

