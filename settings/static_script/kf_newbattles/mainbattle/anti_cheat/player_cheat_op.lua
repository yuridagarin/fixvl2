
Include("\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\palyer_cheat_detect.lua")
Include("\\settings\\static_script\\kf_newbattles\\mainbattle\\mainbattle_head.lua");--BT_GetCamp()

N_DIAPPLEAR_TIME = 2--����������ʱ��

t_rand_pos = {
	[1] = {
		--posx,posy,caijiidx,monsteridx
		{1857, 3199, 0, 0},
		{1839, 3200, 0, 0},
		{1841, 3227, 0, 0},
		{1854, 3236, 0, 0},
		{1865, 3236, 0, 0},
		{1874, 3223, 0, 0},
		{1870, 3207, 0, 0},
		{1877, 3193, 0, 0},
		{1862, 3218, 0, 0},
		{1885, 3186, 0, 0},--add
		{1820, 3197, 0, 0},--add
	},
	[2] = {
		{1652, 3188, 0, 0},
		{1634, 3189, 0, 0},
		{1630, 3209, 0, 0},
		{1630, 3228, 0, 0},
		{1644, 3221, 0, 0},
		{1648, 3206, 0, 0},
		{1644, 3201, 0, 0},
		{1661, 3221, 0, 0},
		{1674, 3209, 0, 0},
		{1625, 3239, 0, 0},--add
		{1677, 3234, 0, 0},--add
	},
}
t_caiji_npcinfo={
	--name template,dialog_npc,script,camp1pos,camp2pos
	{"Long Linh Th�o","ZZC_longlingcao",1,"\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\npc_caiji.lua",0 , 0, "Long Linh Th�o", 1},
	{"Th�t tinh hoa","ZZC_qixinhua",1,"\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\npc_caiji.lua",0 , 0, "Th�t tinh hoa",2},
	{"B�ch �� S�m","ZZC_baituoshen",1,"\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\npc_caiji.lua",0 , 0, "B�ch �� S�m",3},
}
t_randpos_npc_info = {
	
}
t_npc_to_index ={
	["Long Linh Th�o"] = 1,
	["Th�t tinh hoa"] = 2,
	["B�ch �� S�m"] = 3,
--	["ľ����"] = 4,
--	["ʯ����"] = 5,
--	["ͭ����"] = 6,
}
N_MONSTER_COUNT=9
t_monster_npcinfo={
	{"Con r�i","ZZC_mukuilei",0,"\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\npc_monster.lua",0 , 0,"Con r�i",4},
	{"Th�ch Kh�i L�i","ZZC_shikuilei",0,"\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\npc_monster.lua",0 , 0, "Th�ch Kh�i L�i",5},
	{"��ng Kh�i L�i","ZZC_tongkuilei",0,"\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\npc_monster.lua",0 , 0, "��ng Kh�i L�i",6},
}

t_jiaoguan_npc_info={
	{"T�ng Qu�n Gi�o Quan","Thi�n V��ng Bang ��", 1, "\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\npc_jiaoguan.lua",1865, 3218},
	{"Li�u Qu�n Gi�o Quan","Thi�n V��ng Bang ��", 1, "\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\npc_jiaoguan.lua",1656, 3204},
}

t_exit_pos = {
	[1] =  {1593,3668},
	[2] =  {1893,3687},
}

--����С���ݵ�����
t_heiwu_pos = {
	[1] =  {1865, 3219},
	[2] =  {1656, 3205},
}

--��¼����С���ݵ���ҵ��������
t_player_rand_task = {
	--[playername]=index
}
function _pco_initialize()
	for i=1, N_MONSTER_COUNT do--monster pos
		local ntype = mod(i-1, getn(t_monster_npcinfo))+1
		local nnum = floor((i + getn(t_monster_npcinfo) - 1) / getn(t_monster_npcinfo))
		local t=gf_CopyTable(t_monster_npcinfo[ntype]);
		for i=1,nnum do--rename every monster
			t[1] = format("%s ", t[1])
		end
		local n=getn(t_randpos_npc_info)+1
		t_randpos_npc_info[n] = t
		t_npc_to_index[t[1]] = n
	end
end
function pco_initialize()
	_pco_clear()
	_pco_initialize()
	
	for i=1,getn(t_randpos_npc_info) do
		pco_create_rand_npc(i, 1)
		pco_create_rand_npc(i, 2)
	end
	for i=1,getn(t_jiaoguan_npc_info) do
		local t = t_jiaoguan_npc_info[i]
		pco_create_npc_by_table(t, MAPID, t[5], t[6])
	end
end
function pco_uninitialize()
	_pco_clear()
end

function _pco_clear()
	t_randpos_npc_info = gf_CopyTable(t_caiji_npcinfo);
	t_player_rand_task = {}
	pcd_clear_cheat_data()
	for i=1,getn(t_randpos_npc_info) do
		local t = t_randpos_npc_info[i]
		t[5] = 0
		t[6] = 0
	end
	for i=1,getn(t_rand_pos) do
		local t = t_rand_pos[i]
		for j = 1,getn(t) do
			local t2 = t[j]
			t2[3] = 0
			t2[4] = 0
		end
	end
end


--�������ս��
function pco_on_enter_battle_field(nPosX, nPosY)
	local nLevel = pco_get_cheat_level()
	if nLevel > 0 then
		local nTaskType = t_task_type[nLevel] or 0
		if nTaskType > 0 then
			local nCamp= pco_get_camp()
			SetPos(t_heiwu_pos[nCamp][1], t_heiwu_pos[nCamp][2])
			BT_RestoreAll();
			SetFightState(1);
			BT_SetTempData(PTT_IN_TASK_AREA,1);
			local nTask,szTask = pco_give_rand_task(nTaskType)
			Talk(1, "", format("Nh�n ���c nhi�m v� hu�n luy�n: %s", szTask));
			return
		end
	end
	if nPosX > 0 then
		pco_enter_battle_field(nPosX, nPosY, nLevel)
	end
end

function pco_enter_battle_field(nPosX, nPosY, nLevel)
	SetPos(nPosX, nPosY);
	BT_RestoreAll();
	BT_SetTempData(PTT_DIE_LOOP,0);
	SetFightState(1);
	ClearColdDown();	--���ҩCD
	CastState("state_dispear",0,N_DIAPPLEAR_TIME*18);
	pco_add_xuhen_buff(nLevel)
	BT_SetTempData(PTT_IN_TASK_AREA,0);
end

function pco_return_battle_field()
	local nLevel = pco_get_cheat_level()
	local nCamp= pco_get_camp()
	pco_clear_rand_task()
	pco_enter_battle_field(t_exit_pos[nCamp][1], t_exit_pos[nCamp][2], nLevel)
end

tXueHen = {--����� ���������ֵ �������������ֵ ���߸������
	{1 ,15 ,30 , 1,},  --"ѩ��1��","�������15%�������������30%�����߸���״̬1�Ρ�"},
	{3 ,30 ,60 , 3,},  --"ѩ��2��","�������30%�������������60%�����߸���״̬3�Ρ�"},
	{5 ,45 ,90 , 5,},  --"ѩ��3��","�������45%�������������90%�����߸���״̬5�Ρ�"},
	{7 ,60 ,120,10,},  --"ѩ��4��","�������60%�������������120%�����߸���״̬10�Ρ�"},
	{9 ,75 ,150,12,},  --"ѩ��5��","�������75%�������������150%�����߸���״̬12�Ρ�"},
	{11,90 ,180,12,},  --"ѩ��6��","�������90%�������������180%�����߸���״̬12�Ρ�"},
	{13,105,210,13,},  --"ѩ��7��","�������105%�������������210%�����߸���״̬13�Ρ�"},
	{15,120,240,13,},  --"ѩ��8��","�������120%�������������240%�����߸���״̬13�Ρ�"},
	{17,135,270,14,},  --"ѩ��9��","�������135%�������������270%�����߸���״̬14�Ρ�"},
	{19,150,300,14,},  --"ѩ��10��","�������150%�������������300%�����߸���״̬14�Ρ�"},
	{21,150,300,15,},  --"ѩ��11��","�������150%�������������300%�����߸���״̬15�Ρ�"},
};
N_XUHEN_BUFF_TIME = 2 * 60
function pco_add_xuhen_buff(nLevel)
	--����ѩ��״̬�ټ�
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	--CastState("state_dispear",0,N_DIAPPLEAR_TIME*18); --�޵�
	if nLevel >= 1 and nLevel <= getn(tXueHen) then
		CastState("state_p_attack_percent_add",tXueHen[nLevel][2],N_XUHEN_BUFF_TIME*18,1,9908,1); --�⹥����
		CastState("state_m_attack_percent_add",tXueHen[nLevel][2],N_XUHEN_BUFF_TIME*18,1,9909,1);	--�ڹ�����
		CastState("state_life_max_percent_add",tXueHen[nLevel][3],N_XUHEN_BUFF_TIME*18,1,9910,1);		--��������
		CastState("state_buff_resist",tXueHen[nLevel][4],N_XUHEN_BUFF_TIME*18,1,9911,1);					--���߸���״̬
		
		local szName = format("Tuy�t h�n c�p %d", nLevel)
		SyncCustomState(1,9908,1,szName);
		local szState = format("C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n",tXueHen[nLevel][2], tXueHen[nLevel][3], tXueHen[nLevel][4])
		local szMsg = format("Ng��i nh�n ���c %s hi�u qu�: %s k�o d�i %d gi�y.", szName, szState, N_XUHEN_BUFF_TIME)
		Msg2Player(szMsg)
	end
end


--������С����
--function pco_transport_to_xiaoheiwu()
--	nCamp = pco_get_camp()
--	local nType = 0
--	pco_give_rand_task(nType)
--end

function pco_create_rand_npc(nType, nCamp)
	local tPos = t_rand_pos[nCamp]
	local tType = t_randpos_npc_info[nType]
	if tType and tPos then
		local tP,nTp = pco_get_rand_pos(tPos, tType[3])
		if tP then
			tP[3 + tType[3]] = nType
			pco_create_npc(nType, MAPID, tP[1], tP[2],nCamp)
			tType[nCamp + 5 - 1] = nTp
		end
	end
end

function pco_get_rand_pos(tPos,nPosType)
	local nMax = getn(tPos)
	local nRand = random(1,getn(tPos))
	local idx = nRand
	for i=1,nMax do
		local t = tPos[idx]
		if t[3 + nPosType] == 0 then
			return t, idx
		end
		idx = idx+1
		if idx>nMax then
			idx = 1
		end
	end
	return nil, 0
end

function pco_create_npc(nType, mapid, posx, posy,nCamp)
	local tType = t_randpos_npc_info[nType]
	pco_create_npc_by_table(tType, mapid, posx, posy,nCamp)
end
function pco_create_npc_by_table(tType, mapid, posx, posy,nCamp)
	if tType then
		local npcIndex = CreateNpc(tType[2],tType[1],mapid, posx, posy);
		if npcIndex <= 0 then
			print("create npc fail:",tType[1],mapid, posx, posy,npcIndex)
		else
			--print("create npc ok:",tType[1],mapid, posx, posy,npcIndex)
		end
		if tType[3] == 0 then
			SetNpcDeathScript(npcIndex,tType[4]);
			local emCamp = 1-(nCamp-1)+1
			SetCampToNpc(npcIndex,tCampNameP[emCamp]);
		else
			SetNpcScript(npcIndex,tType[4])
		end
	end
end



function pco_get_camp()
	return BT_GetCamp()
end

function pco_get_npc_type_index(npcIndex)
	local szname = GetNpcName(npcIndex)
	local n = t_npc_to_index[szname] or 0
	return n
end
function pco_get_npc_type(npcIndex)
	local n = pco_get_npc_type_index(npcIndex)
	return pco_get_type_by_index(n)
end
function pco_get_type_by_index(n)
	local nRet = 0
	if n >= 1 and n <= 3 then
		nRet = 1
	elseif n >= 4 and n <= 6 then
		nRet = 2
	end
	return nRet
end

function _p(npcIndex,szNpcNameSave)
	pco_on_task_npc_talk_or_death(npcIndex,1,szNpcNameSave)
end

function pco_on_task_npc_talk_or_death(npcIndex, bConfirm,szNpcNameSave)
	if pco_get_npc_type(npcIndex) == 1 then--�ɼ���
		local nTask,sTask = pco_get_rand_task_info()
		if pco_get_type_by_index(nTask) ~= 1 then--���ǲɼ����� ���˲ɼ���û��
			return
		else
			local sNpcName = GetNpcName(npcIndex);
			if not bConfirm then
				local selTab = {
					format("%s%s", "Nhi�m v� thu th�p",format("/#_p(%d,\"%s\")",npcIndex,sNpcName)),
					"K�t th�c ��i tho�i/_pco_nothing",
				}
				local szTitle = format("<color=green>%s<color>Ho�n th�nh nhi�m v� thu th�p", sNpcName)
				Say(szTitle,getn(selTab),selTab);
				return
			else
				if szNpcNameSave ~= sNpcName then
					return
				end
			end
		end	
	end
	
	local nType = pco_get_npc_type_index(npcIndex)
	local nCamp = pco_get_camp()
	local tPos = t_rand_pos[nCamp]
	local tType = t_randpos_npc_info[nType]
	local tP = tPos[tType[nCamp + 5 - 1]]
	tType[nCamp + 5 - 1] = 0
	if tP then
		tP[3+tType[3]] = 0
	end
	SetNpcLifeTime(npcIndex,0)
	pco_create_rand_npc(nType,nCamp)
	
	local nTaskType = tType[8]
	if PlayerIndex ~= 0 then
		local nTask,sTask = pco_get_rand_task_info()
		if nTask == nTaskType then
			pco_return_battle_field()
		else
			--������������ô�죿
			pco_on_enter_battle_field(0,0)
		end
	end
end

function pco_give_rand_task(nType)
	local nRand = random(1,6)
--	if nType == 1 then
--		nRand = random(1,3)
--	elseif nType==2 then
--		nRand = random(4,6)
--	end
	local szName = GetName() or ""
	t_player_rand_task[szName] = nRand
	return pco_get_rand_task_info()
end
function pco_clear_rand_task()
	local szName = GetName() or ""
	t_player_rand_task[szName] = nil
end
function pco_get_rand_task_info()
	local szName = GetName() or ""
	local nTaskId  = t_player_rand_task[szName] or 0
	local t = t_randpos_npc_info[nTaskId]
	local szTaskName = ""
	if t then
		if t[3] == 1 then
			szTaskName = "Thu th�p"
		else
			szTaskName = "K�ch s�t"
		end
		szTaskName = format("%s%sx1",szTaskName, t[7])
	end
	return nTaskId, szTaskName
end

function pco_jiaoguan_talk()
	local selTab = {
			format("Vi�c nh� th�i m� (%s) mua �t r��u cho gi�o quan %s", "2 v�ng","/_pco_pay_money"),
			"K�t th�c ��i tho�i/_pco_nothing",
			}
	local sNpcName = "";
	if pco_get_camp() == 1 then
		sNpcName = "T�ng Qu�n Gi�o Quan";
	else
		sNpcName = "Li�u Qu�n Gi�o Quan";
	end;
	local nTask,szTask = pco_get_rand_task_info()
	local szTitle = format("<color=green>%s<color>: xem ra ng��i th� hi�n trong chi�n tr��ng h�i t� r�i ��y, m�i b� ��a ��n ��y. Nh�ng m� kh�ng sao, � ��y c� linh d��c �� t�ng c��ng s�c m�nh c�a ng��i, c�ng c� kh�i l�i �� cho ng��i hu�n luy�n. Ch� c�n ng��i ho�n th�nh nhi�m v�, th� ng��i c� th� quay tr� l�i chi�n tr��ng.", sNpcName)
	
	szTitle = format("%s\n<color=red>%s<color>",szTitle, szTask)
	Say(szTitle,getn(selTab),selTab);
end

function _pco_pay_money()
	if Pay(20000) == 1 then
		pco_return_battle_field()
	else
		Talk(1, "", format("V�ng mang theo kh�ng ��, hay l� ho�n th�nh nhi�m v� hu�n luy�n tr��c �i"));
	end
end
function _pco_nothing()
end

t_cheat_level = {
	0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 2100000000
}
t_task_type = {--0�� 1�ɼ� 2ɱ��
	0, 0, 1, 1, 1, 2, 2, 2, 2, 2, 2
}
function pco_get_cheat_level()
	local nCheatPoint = pcd_get_cheat_weight()
	local nLevel = 0
	if nCheatPoint > 0 then
		for i=1,getn(t_cheat_level)-1 do
			nLevel = i
			if nCheatPoint > t_cheat_level[i] and nCheatPoint <= t_cheat_level[i+1] then
				break
			end
		end
	end
	return nLevel
end

_pco_initialize()--reload֮�����³�ʼ��table

