--bu liubo
--װ��ʥ����
Include("\\script\\online_activites\\2011_11\\activity_04\\decorate_tree.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")

VET_ITEM_COUNT = 5 --����¶ˮ������

VET_DECOTREE_AWARD = {
	{1, 6, "�u ��", {2, 1, 30178, 2}, 0},
	{4, 19, 10, 1},
	{5, 19, 10, 1},
	{31, 25, "get_popur_value()", ""},
	{31, 25, "get_petgrow_value()", ""}, --3�����ɳ�ֵ
	{31, 6, "get_petmp_value()", ""}, --1������ֵ
}

function main()
	-- ��Ƿ���
	if gf_CheckEventDateEx(VET_201111_DECORATE_TREE_ID) ~= 1 then
		return 0
	end
	local npcIndexz = GetTargetNpc()
	local nPlayerIdx = GetUnitCurStates(npcIndexz,6)
	if nPlayerIdx ~= PlayerIndex then
		Talk(1, "", "��y kh�ng ph�i c�y c�a ��i hi�p!")
		return 0
	end
	
	local strName = GetTargetNpcName() or "C�y th�ng gi�o h�i"
	if VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.PlayerIndex) ~= PlayerIndex then
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[9],strName))
		return 0
	end
	
	local tbChoice = {
		[1] = "Trang tr� c�y th�ng gi�ng sinh/to_decorate",
		[2] = "Kh�ng c�n ��u/do_nothing",
	}
	local nTimes = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.IsCreate)
	if nTimes == 5 then 
		tremove(tbChoice,1)
		tinsert(tbChoice,1,"Nh�n l�y ph�n th��ng./to_get_award")
	end	
	Say(format(tSTRING_DECORATETREE_TABLE[9],strName),getn(tbChoice),tbChoice)
end

function to_decorate()
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201111_TABLE[2])
		return 0
	end
	
	local nTimes = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.IsCreate)
	if nTimes <= 0 or nTimes >= 5 then return 0 end
	if VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.DaySeq,zgc_pub_day_turn())
		VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.DecoTimes,0)
	end
	if GetTime() - VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TimeSpace) < VET_201111_TIMESPACE_MAX then
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[8],VET_201111_TIMESPACE_MAX / 60))
		return 0
	end
	if GetItemCount(2,0,351) < VET_ITEM_COUNT then
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[6],VET_ITEM_COUNT))
		return 0
	end
	if DelItem(2,0,351,VET_ITEM_COUNT) == 0 then
		return 0
	end
	local nNpcIndex = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TreeIndex)
	local nMapId,nX,nY = GetNpcWorldPos(nNpcIndex)
	SetNpcLifeTime(nNpcIndex,0)
	nNpcIndex = CreateNpc(VET_201111_TREENPC_NAME[nTimes+1],format(tSTRING_DECORATETREE_TABLE[7],nTimes+1),nMapId,nX,nY)
	SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_11\\activity_04\\npc_decorate.lua")
	SetNpcLifeTime(nNpcIndex,VET_201111_TREE_EXITSTIME)
	AddUnitStates(nNpcIndex,6,PlayerIndex)
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.TreeIndex,nNpcIndex)
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.TimeSpace,GetTime())
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.IsCreate,nTimes+1)
	gf_EventGiveCustomAward(1,500000,1,"Event trang tri cay thong noel","C�y th�ng gi�o h�i")
end

function to_get_award()
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
	end
	gf_EventGiveCustomAward(1,600000,1,"Event trang tri cay thong noel","C�y th�ng gi�o h�i")
	gf_EventGiveRandAward(VET_DECOTREE_AWARD,100,"Event trang tr� c�y th�ng noel","C�y th�ng gi�o h�i")
	local nNpcIndex = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TreeIndex)
	SetNpcLifeTime(nNpcIndex,0)
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.TimeSpace,VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TimeSpace)-VET_201111_TREE_EXITSTIME)
	return 1
end

--����Ϊ
function get_popur_value()
	gf_EventGiveCustomAward(26,1000,1,"Event trang tri cay thong noel","C�y th�ng gi�o h�i")
end

function do_nothing()
	--do nothing
end

------------------------------------------------------
--attention:all the pet-award-api are here
--add pet grow award
function get_petgrow_value()
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel < 1 then
		Talk(1,"","��i hi�p ch�a c� B�n ��ng H�nh n�n ph�n th��ng b� v� hi�u!")		
		return
	end
	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (3 * 100))
	Msg2Player("B�n nh�n ���c 3 �i�m N�ng C�p B�n ��ng H�nh")
	gf_WriteLogEx("Event trang tri cay thong noel" ,"3 �i�m N�ng C�p B�n ��ng H�nh")
end

--add pet mp award api
function get_petmp_value()
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel < 2 then
		Talk(1,"","B�n ��ng H�nh ch�a �� c�p 2 n�n ph�n th��ng b� v� hi�u!")		
		return
	end
	Pet_AddGP(1)
	Msg2Player("B�n nh�n ���c 1 �i�m Linh L�c B�n ��ng H�nh")
	gf_WriteLogEx("Event trang tri cay thong noel" ,"1 �i�m Linh L�c B�n ��ng H�nh")
end