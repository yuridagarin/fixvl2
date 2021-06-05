--������ÿ������
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\runtime_data_stat\\runtime_game_data_stat.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

N_DIXUANGONG_DAILY_TASK_ID = 3204
N_DIXUANGONG_DAILY_TASK_ACCESS_CODE = TASK_ACCESS_CODE_DAILY_TASK
N_TASK_STATUS_NONE=0
N_TASK_STATUS_DOING=1
N_TASK_STATUS_FINISH=2
N_TASK_STATUS_AWARDED=3

t_dxg_task={
	[1] = {
		Name = "S� th�m ��a Huy�n Cung",
		TaskByte = 1,
		Desc = "Th�ng �i 1-3",
		
	},
	[2] = {
		Name = "��i ph� ��a Huy�n Cung",
		TaskByte = 2,
		Desc = "To�n b� th�ng �i",
	},
	[3] = {
		Name = "Truy hung ��a Huy�n Cung",
		TaskByte = 3,
		Desc = "Ti�u di�t Boss: %s",
	},
}

t_boss_list={
	--name, rate
	{"Thi�n �m  Th�y Mo",15},
    {"��u S� Ng�c T�t Thi�n �m",15},
    {"Cung Ch� ��a Huy�n Cung ",20},
    {"Thi�n �m S�t Th� Tinh Anh",10},
    {"Thi�n �m ��i Tinh Anh",10},
    {"Thi�n �m T�n S� Tinh Anh",10},
    {"Thi�n �m M�t Th�m Tinh Anh",10},
    {"B�ch K� Tinh Anh",10},
}

t_dixuangong_daily_task_award={
	[1] = {
		nBagLimit = 2,
    	nWeightLimit = 100,
		fix_award={
    		{1,"Hu�n ch��ng anh h�ng",{2,1,30499,1},0,1},
    		{2,3000000},--����
    		{28,100},--����
		},
		rand_award={
			{ {"Ma �ao Th�ch c�p 1", {2,1,30428,1,4}, nil,nil, {1, 100}}, 1500},
        	{ {"Thi�t Tinh c�p 1", {2,1,30533,1,4}, nil,nil, {1, 100}}, 3000},
        	{ {"B�i Nguy�n ��n", {2,1,30351,1, 4}, nil,nil,{1, 100} }, 4500},
			{ {"Thi�n L� Truy�n �m Ph� Ch�", {2,1,3508,1, 4}, nil,nil,{1, 100} }, 500},
			{ {"Thi�t Tinh c�p 2", {2,1,30534,1, 4}, nil,nil,{1, 100} }, 500},
		},
	},
	[2] = {
		nBagLimit = 2,
    	nWeightLimit = 100,
		fix_award={
			{1,"Hu�n ch��ng anh h�ng",{2,1,30499,1},0,1},
    		{2,4000000},--����
    		{28,200},--����
		},
		rand_award={
			{{MA_GiveMoney, {50000}}, 4000},
			{{MA_GiveMoney, {100000}}, 800},
			{{MA_GiveMoney, {400000}}, 100},
			{ {"Ma ��o Th�ch c�p 2", {2,1,30429,1,4}, nil,nil, {1, 100}}, 1000},
        	{ {"Thi�t Tinh c�p 2", {2,1,30534,1,4}, nil,nil, {1, 100}}, 2500},
        	{ {"Thi�n th�ch", {2,2,8,1,4}, nil,nil, {1, 100}}, 700},
        	{ {"b�nh �t B�c B�o", {2,1,1125,1, 4}, nil,nil,{1, 100} }, 300},
			{ {"C�y B�t Nh� nh�", {2,0,504,1, 4}, nil,nil,{1, 100} }, 600},
		},
	},
	[3] = {
		nBagLimit = 2,
    	nWeightLimit = 100,
		fix_award={
			{1,"Hu�n ch��ng anh h�ng",{2,1,30499,1},0,1},
    		{2,6000000},--����
    		{28,300},--����
		},
		rand_award={
			{{MA_GivePopur, {1000}}, 2500},
			{{MA_GivePopur, {2000}}, 2500},
			{{MA_GivePopur, {4000}}, 500},
			{ {"Ma �ao Th�ch c�p 3", {2,1,30430,1,4}, nil,nil, {1, 100}}, 500},
        	{ {"Thi�t Tinh c�p 3", {2,1,30535,1,4}, nil,nil, {1, 100}}, 1500},
        	{ {"T� Linh Quy Nguy�n ��n", {2,1,30352,1, 4}, nil,nil,{1, 100} }, 1000},
			{ {"C�y B�t Nh�", {2,0,398,1, 4}, nil,nil,{1, 100} }, 500},
			{ {"B�ng Tinh Th�ch", {2,1,30554,1, 4}, nil,nil,{1, 100} }, 1000},
		},
	},
}

function dxg_daily_task_menu()
	local tbSay = {}
	local szTitle = "Nhi�m v� h�ng ng�y ��a Huy�n Cung"
	for i=1,getn(t_dxg_task) do
		local szName = task_name(i)
		local szStep = task_step(i)
		tinsert(tbSay, format("%s(%s)/#dxg_daily_task_talk(%d)",szName, szStep, i))
	end
	tinsert(tbSay, "Ra kh�i/nothing")
	Say(szTitle, getn(tbSay), tbSay)
end

function dxg_daily_task_msg_to_menu(szMsg)
	local tbSay = {}
	local szTitle = format("Nhi�m v� h�ng ng�y ��a Huy�n Cung :\n<color=yellow>%s<color>", szMsg)
	tinsert(tbSay, format("%s/%s","tr� l�i","dxg_daily_task_menu"))
	tinsert(tbSay, "Ra kh�i/nothing")
	Say(szTitle, getn(tbSay), tbSay)
end

function nothing()
end

function dxg_daily_task_talk(nTaskIndex)
	local nStep = get_task_step(nTaskIndex)
	if nStep == N_TASK_STATUS_NONE then
		_task_talk_give_task(nTaskIndex)
	elseif nStep == N_TASK_STATUS_DOING then
		dxg_daily_task_msg_to_menu(format("Nhi�m v� %s ch�a ho�n th�nh, m�c ti�u nhi�m v� :\n<color=red>%s<color>",task_name(nTaskIndex), task_desc(nTaskIndex)));
	elseif nStep == N_TASK_STATUS_FINISH then
		_task_talk_award(nTaskIndex)
	elseif nStep == N_TASK_STATUS_AWARDED then
		dxg_daily_task_msg_to_menu(format("H�m nay %s nhi�m v� �� ho�n th�nh, h�y ng�y mai quay l�i", task_name(nTaskIndex)));
	end
end

function dixuangong_daily_clear()
	local n = 0
	for i = 1,getn(t_dxg_task) do
		if get_task_step(i) == N_TASK_STATUS_AWARDED then
			set_task_status(i, 0)
			n = n + 1
		end
	end
	return n
end

function dxg_task_check_and_finish_task(nTaskIndex, nNpcIdx)
	local nStep = get_task_step(nTaskIndex)
	if nStep == N_TASK_STATUS_DOING then
		local nNewStep = N_TASK_STATUS_FINISH
		if nTaskIndex == 3 then
			local nBossName = GetNpcName(nNpcIdx)
			local nTaskType = get_task_type(nTaskIndex)
			local t = t_boss_list[nTaskType]
			if nBossName ~= t[1] then
				nNewStep = N_TASK_STATUS_DOING
			end
		end
		if nNewStep == N_TASK_STATUS_FINISH then
			local szTask = task_name(nTaskIndex)
			local nNewStatus = get_task_type(nTaskIndex) * 10 + nNewStep
			set_task_status(nTaskIndex, nNewStatus)
			Msg2Player(format("Nhi�m v� %s �� ho�n th�nh", szTask))
			return 1
		end
	end
	return 0
end

function _task_talk_give_task(nTaskIndex)
	local nStep = get_task_step(nTaskIndex)
	if nStep == N_TASK_STATUS_NONE then
    	local nRandTask = 0
    	if 3 == nTaskIndex then
    		local nRand = random(1,100)
    		local n = nRand
    		for i=1,getn(t_boss_list) do
    			n = n - t_boss_list[i][2]
    			if n <= 0 then
    				nRandTask = i
    				break
    			end
    		end
    	end
    	local nTaskStatus = nRandTask * 10 + N_TASK_STATUS_DOING
    	set_task_status(nTaskIndex, nTaskStatus)
    	local szMsg = format("Nh�n th�nh c�ng nhi�m v� %s:%s",task_name(nTaskIndex), task_desc(nTaskIndex))
    	Msg2Player(szMsg)
    	dxg_daily_task_msg_to_menu(szMsg)
    	return 1
	end
	return 0
end

function get_task_status(nTaskIndex)
	local t=t_dxg_task[nTaskIndex]
	local nTaskByte = t.TaskByte
	local nTask = GetTask(N_DIXUANGONG_DAILY_TASK_ID)
	local nRet = SafeGetByte(nTask,nTaskByte)
	return nRet
end
function get_task_step(nTaskIndex)
	local nStep = mod(get_task_status(nTaskIndex),10)
	return nStep
end
function get_task_type(nTaskIndex)
	local nType = floor(get_task_status(nTaskIndex)/10)
	return nType
end
function set_task_status(nTaskIndex, nStatus)
	local t=t_dxg_task[nTaskIndex]
	local nTaskByte = t.TaskByte
	local nTask = GetTask(N_DIXUANGONG_DAILY_TASK_ID)
	local nTaskNew = SafeSetByte(nTask, nTaskByte, nStatus)
	SetTask(N_DIXUANGONG_DAILY_TASK_ID, nTaskNew, N_DIXUANGONG_DAILY_TASK_ACCESS_CODE)
end

function get_boss_name(Idx)
	local szRet = ""
	local t = t_boss_list[Idx]
	if t then
		szRet = t[1]
	end
	return szRet
end

function task_step(nTaskIndex)
	local nStep = get_task_step(nTaskIndex)
	local szStep = ""
	if nStep == N_TASK_STATUS_NONE then
		szStep = "C� th� ch�p nh�n"
	elseif nStep == N_TASK_STATUS_DOING then
		szStep = "Ch�a ho�n th�nh"
	elseif nStep == N_TASK_STATUS_FINISH then
		szStep = "C� th� giao"
	elseif nStep == N_TASK_STATUS_AWARDED then
		szStep = "Ng�y mai quay l�i"
	end
	return szStep
end
function task_desc(nTaskIndex)
	local t=t_dxg_task[nTaskIndex]
	local szDesc = t.Desc
	if nTaskIndex == 3 then
		local nTaskType = get_task_type(nTaskIndex)
		szDesc = format(szDesc,get_boss_name(nTaskType))
	end
	return szDesc
end
function task_name(nTaskIndex)
	local t=t_dxg_task[nTaskIndex]
	local szName = t.Name
	return szName
end

function _task_talk_award(nTaskIndex)
	local nStep = get_task_step(nTaskIndex)
	if nStep == N_TASK_STATUS_FINISH then
		local tAward = t_dixuangong_daily_task_award[nTaskIndex]
		local nNeedRoom = tAward.nBagLimit;
		local nNeedWeight = tAward.nWeightLimit;
    	if gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,"") ~= 1 then --+4Ԥ����������Ŀռ�
    		return 0;
    	end
    	
		local nNewStatus = get_task_type(nTaskIndex) * 10 + N_TASK_STATUS_AWARDED
		set_task_status(nTaskIndex, nNewStatus)
		gf_EventGiveAllAward(tAward.fix_award,"��a Huy�n Cung","Nhi�m v� ng�y")--�̶�����
		_MissionAward_RandAward(tAward.rand_award, "Ph�n th��ng nhi�m v� h�ng ng�y ��a Huy�n Cung")--�������
		
		runtime_stat_event(RUNTIME_STAT_SYS_DIXUANGONG, RUNTIME_STAT_EVENT_FINISH_TASK, nTaskIndex, 1)--ͳ���¼�
		
		--Talk(1,"",format("�ɹ���ȡ%s������", task_name(nTaskIndex)))
		local szMsg = format("Nh�n th�nh c�ng %s ph�n th��ng nhi�m v�", task_name(nTaskIndex))
		Msg2Player(szMsg)
		dxg_daily_task_msg_to_menu(szMsg)
		vaf_award_api("tDXGDailyTask") --2XU�
		
		Observer:onEvent(SYSEVENT_DIXUANGONG_TASK_AWARD, nTaskIndex)
		return 1
	end
	return 0
end
