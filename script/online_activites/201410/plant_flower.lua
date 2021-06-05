Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online_activites\\activity_head.lua")

VET_201410_LOG_TITLE = "Hoat Dong Hoa Hong";

VET_201410_TB_LOG_ACTION_LIST = {
    [1] = "Mua M�m Hoa",
    [2] = "K�ch ho�t tr�ng hoa",
};

VET_201410_STRING_LIST = {
    [1] = "K�ch ho�t tr�ng hoa",
    [2] = "Mua M�m Hoa (1 M�m Hoa = 29 xu v�t ph�m)",
    [3] = "K�t th�c ��i tho�i",
    [4] = "XU c�a ��i hi�p kh�ng ��.",
    [5] = "Ch� c� ��i tr��ng m�i c� th� k�ch ho�t tr�ng hoa.",
    [6] = "C�n t� ��i tr�n 2 ng��i, m�i c� th� k�ch ho�t tr�ng hoa.",
    [7] = "�i�u ki�n tr�ng hoa l�i.",
    [8] = "T� ��i th�nh vi�n m�i ng��i c�n mang theo 1 m�m hoa m�i c� th� k�ch ho�t tr�ng hoa.",
    [9] = "M�i ng�y m�i ng��i ch�i gi�i h�n mua 1 m�m hoa.",
    [10] = "Nh�n v�t c�p 77 tr� l�n, �� gia nh�p m�n ph�i v� luy�n ���c k� n�ng c�p 55 m�i c� th� tham gia ho�t ��ng",
    [11] = "M�i ng�y m�i nh�n v�t ch� ���c tham gia ho�t ��ng %d l�n.",
    [12] = "Ch� c� th� k�ch ho�t tr�ng hoa � b�n ngo�i c�c th�nh th� (��ng Bi�n Kinh, T�y Bi�n Kinh, Nam Bi�n Kinh,B�c Th�nh ��,Nam Th�nh ��,T�y Th�nh ��,B�c Thuy�n Ch�u,T�y Thuy�n Ch�u,B�c Ph��ng T��ng,Nam Ph��ng T��ng)",
		[13] = "Ch� c� th� c�ng l�c k�ch ho�t 1 m�m hoa.",
		[14] = "��i vi�n kh�ng c� b�n c�nh, kh�ng th� k�ch ho�t tr�ng hoa."
};

VET_201410_TB_ITEM_LIST = {
    [1] = {"M�m hoa ",2,1,30739},
};

VET_201410_TB_MAPID = {
    205,203,201,308,304,301,108,105,504,501,
}

VET_201410_TB_NPCS = {
	[1] = {"Hoa h�ng ��","Hoa h�ng ��"},    
	[2] = {"Hoa h�ng v�ng","Hoa h�ng v�ng"},
};

VET_201410_EXP_TABLE = {
	[2] = {400000,600000},
	[3] = {420000,630000},
	[4] = {440000,660000},	
	[5] = {460000,690000},
	[6] = {480000,720000},
	[7] = {520000,780000},
	[8] = {640000,960000},
}

VET_201410_ROSE_ACTIVITY_ID = 137	--�ID
VET_201410_TIME_TB_DEFINE = 1537 	--ʱ�䴥��������ID
VET_201410_TIME_USER_DEFINE = VET_201410_TIME_TB_DEFINE*2 	--ʱ�䴥�����Զ���ID
VET_201410_ROSE_SEED_COST = 29  	--����۸�XU
VET_201410_MAX_TIMES = 8  				--ÿ��������8��
VET_201410_ROSE_LIFE = 5*60      --����npc���ʱ��
--VET_ADDIONAL_EXP = 19000000 --���һ�ζ��⽱��
VET_201410_BOSS_NPC = {
	{"shixuemoren", "Th� Huy�t Ma Nh�n"},
	{"jushihuoren", "C� Th�ch H�a Nh�n"},
	{"xuanzhuangunren", "To�n Chuy�n C�n Nh�n"},
	{"qiannianhuoqilin", "Thi�n Ni�n H�a K� L�n"},
	{"dayuguai", "��i Ng� Qu�i"},
}
VET_201410_GOLD_BOX = "R��ng Ho�ng Kim B�o B�i";
VET_201410_PICK_BOX = 1;

--�����������
VET_201410_ROSE_TaskGroup = TaskManager:Create(6, 11)
VET_201410_ROSE_TaskGroup.Rose_Times = 1
VET_201410_ROSE_TaskGroup.Time_End = 2
VET_201410_ROSE_TaskGroup.Npc_Index = 3
VET_201410_ROSE_TaskGroup.Date = 4
VET_201410_ROSE_TaskGroup.TeamSize = 5
VET_201410_ROSE_TaskGroup.PickBox = 6

function VET_201410_AdditionDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201410_ROSE_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog, VET_201410_STRING_LIST[1].."/active_fire_for_warm_201410")
		tinsert(tbSayDialog, VET_201410_STRING_LIST[2].."/buy_match_201410") 
	end
  return tbSayDialog, szSayHead 
end

--����õ�廨
function active_fire_for_warm_201410()
    local nTeamSize = GetTeamSize()
    if nTeamSize < 2 then
        Talk(1, "", VET_201410_STRING_LIST[6])
        return
    end
    if GetCaptainName() ~= GetName() then
        Talk(1, "", VET_201410_STRING_LIST[5])
        return
    end
    if Check_team_member_201410(nTeamSize) == 0 then
        return 0 
    end
    to_set_fire_now_201410(nTeamSize)
end

function buy_match_201410()
    if GetItemCount(2, 1, 30230) < VET_201410_ROSE_SEED_COST then
        Talk(1, "", VET_201410_STRING_LIST[4])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if DelItem(2, 1, 30230, VET_201410_ROSE_SEED_COST) == 1 then
        local tbItemIds = {VET_201410_TB_ITEM_LIST[1][2],VET_201410_TB_ITEM_LIST[1][3],VET_201410_TB_ITEM_LIST[1][4],1}
        gf_AddItemEx2(tbItemIds, VET_201410_TB_ITEM_LIST[1][1],VET_201410_LOG_TITLE,VET_201410_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function Is_In_City_Map_201410()
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201410_TB_MAPID) do
        if nMapId == VET_201410_TB_MAPID[i] then
            bMapIsOk = 1 
            break
        end
    end
    if bMapIsOk == 0 then
        return 0 
    end
end

function Check_team_member_201410(nTeamSize)
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
      PlayerIndex = GetTeamMember(i)
      if PlayerIndex <= 0 then
        Talk(1, "", VET_201410_STRING_LIST[7]) 
      	return 0 
    	end
    	local szCurrName = GetName();
			local nDate = zgc_pub_day_turn()
			if VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Date) ~= nDate then
				VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Date,nDate)
				VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Rose_Times,0)
				VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.PickBox,0)
			end
      if Is_In_City_Map_201410() == 0 then
        PlayerIndex = nOldPlayer  --�����Ϣ���߶ӳ�������
        Talk(1, "", VET_201410_STRING_LIST[12]) 
        return 0;
      end
      if (GetLevel() < 77 and gf_GetPlayerRebornCount() == 0) or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
          PlayerIndex = nOldPlayer  --�����Ϣ���߶ӳ�������
          Talk(1, "", VET_201410_STRING_LIST[10]..format("\n<color=red>%s<color>", szCurrName)) 
          return 0 
      end
      if GetItemCount(VET_201410_TB_ITEM_LIST[1][2],VET_201410_TB_ITEM_LIST[1][3],VET_201410_TB_ITEM_LIST[1][4]) < 1 then
          PlayerIndex = nOldPlayer  --�����Ϣ���߶ӳ�������
          Talk(1, "", VET_201410_STRING_LIST[8]..format("\n<color=red>%s<color>", szCurrName)) 
          return 0 
      end
      local nTimes = VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Rose_Times)
      if not nTimes or nTimes >= VET_201410_MAX_TIMES then
          Talk(1, "", format(VET_201410_STRING_LIST[11], VET_201410_MAX_TIMES));
          PlayerIndex = nOldPlayer
          Talk(1, "", format(VET_201410_STRING_LIST[11], VET_201410_MAX_TIMES)..format("\n<color=red>%s<color>", szCurrName));
          return 0;
      end
			--ֻ��ͬʱ����һ��������Ϣ
			local nTime = tonumber(GetTime())
			if nTime < VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Time_End) then
				Talk(1, "",VET_201410_STRING_LIST[13])
				if PlayerIndex ~= nOldPlayer then
					PlayerIndex = nOldPlayer --һ�����߶ӳ�
					Talk(1, "",VET_201410_STRING_LIST[13]..format("\n<color=red>%s<color>", szCurrName))
				end
				return 0
			end
    end
    PlayerIndex = nOldPlayer
end

function to_set_fire_now_201410(nTeamSize)
	--�ж϶����Ƿ������24��
	local nMapId1,nX1,nY1=GetWorldPos()
	nOldPlayer = PlayerIndex
	local nMapId2,nX2,nY2
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
		nMapId2,nX2,nY2 = GetWorldPos()
		local nDis = DistanceBetweenPoints_201410(nMapId1,nX1,nY1,nMapId2,nX2,nY2)
    if  nDis < 0 or nDis > 24 then
      PlayerIndex = nOldPlayer
			Talk(1, "", VET_201410_STRING_LIST[14])
		  return
    end
  end
	--�Ƿ����߲�ɾ����Ʒ
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
    if PlayerIndex <= 0 then
      Talk(1, "", VET_201410_STRING_LIST[7])
			PlayerIndex = nOldPlayer
      return
    end
    if DelItem(VET_201410_TB_ITEM_LIST[1][2],VET_201410_TB_ITEM_LIST[1][3],VET_201410_TB_ITEM_LIST[1][4],1) ~= 1 then
			PlayerIndex = nOldPlayer
    	return
    end
  end
  PlayerIndex = nOldPlayer
	local nNpcIndex
	local nResult = random(100)
	local nKind = 0;
	if  nResult < 70 then
		nNpcIndex = CreateNpc(VET_201410_TB_NPCS[1][1],VET_201410_TB_NPCS[1][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_201410_ROSE_LIFE)
		nKind = 1;
	else
		nNpcIndex = CreateNpc(VET_201410_TB_NPCS[2][1],VET_201410_TB_NPCS[2][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_201410_ROSE_LIFE)
		nKind = 2;
	end
	local nTag = 1;
  local nOldPlayer = PlayerIndex
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
    if PlayerIndex <= 0 then
      Talk(1, "", VET_201410_STRING_LIST[7])
			PlayerIndex = nOldPlayer
      return
    end
    VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Time_End, GetTime() + VET_201410_ROSE_LIFE + 20)     --��������ֹʱ�䣬��ֹNPC���ⶪʧ������������NPCʱ��10�����ʧ
    CreateTrigger(1, VET_201410_TIME_TB_DEFINE, VET_201410_TIME_USER_DEFINE) 
    ContinueTimer(GetTrigger(VET_201410_TIME_USER_DEFINE)) 
    gf_WriteLogEx(VET_201410_LOG_TITLE,VET_201410_TB_LOG_ACTION_LIST[2])
    VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Npc_Index,nNpcIndex) 
    local roseTime = VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Rose_Times);
    VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Rose_Times, roseTime + 1)
    if roseTime + 1 ~= VET_201410_MAX_TIMES then
    	nTag = nil;
    end
    VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.TeamSize,nTeamSize) 
  	add_pet_lingli_value_201410(nKind);
  end
  PlayerIndex = nOldPlayer
  
	if 1 == nTag and 8 == nTeamSize then
		local tNpc = VET_201410_BOSS_NPC[random(getn(VET_201410_BOSS_NPC))];
		local npcIndex = CreateNpc(tNpc[1], tNpc[2], GetWorldPos());
		if npcIndex > 0 then
			SetNpcDeathScript(npcIndex, "\\script\\online_activites\\201410\\plant_flower.lua");
			SetNpcLifeTime(npcIndex, 10 * 60);
			Msg2Team(format("Mang theo %s - BOSS %s �� ���c t�o m�i!", VET_201410_GOLD_BOX, tNpc[2]), 2);
		end
	end
end

--�жϾ���
function DistanceBetweenPoints_201410(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
    if MapID1 ~= MapID2 then
      return -1
    else
			local dx = MapX2 - MapX1
		  local dy = MapY2 - MapY1
		  local nDist = (dx * dx + dy * dy)^(1/2)
		  return nDist
    end;
end

function OnTimer()
  local nTeamSize = GetTeamSize() or 0;
  nTeamSize = min(VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.TeamSize), nTeamSize);
  if not VET_201410_EXP_TABLE[nTeamSize] then
  	RemoveTrigger(GetTrigger(VET_201410_TIME_USER_DEFINE))
  	VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Time_End, GetTime())
    return 0
  end
  VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.TeamSize, nTeamSize);
  local nTime = tonumber(GetTime())
  if nTime >= VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Time_End) then
  	--���һ�ζ��⽱��
  	--if VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Rose_Times) >= VET_201410_MAX_TIMES then
  	--	gf_ModifyExp(VET_ADDIONAL_EXP);
  	--end
    RemoveTrigger(GetTrigger(VET_201410_TIME_USER_DEFINE))
    VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Time_End, GetTime())
    return 0
  end
  local nRoseIndex = VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Npc_Index)
  local nIndex = 1;
  if GetNpcName(nRoseIndex) == VET_201410_TB_NPCS[2][2] then
  	nIndex = 2;
  end
  local nExpNum = VET_201410_EXP_TABLE[nTeamSize][nIndex];
  if not nExpNum then return end
  local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nRoseIndex)
  local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
  local nDist = DistanceBetweenPoints_201410(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
  if nDist >= 0 and nDist <= 18 then
		ModifyExp(nExpNum)
  	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
  end
end

function OnDeath(id, f, x)
	local npcIndex = CreateNpc("huangjin_box", VET_201410_GOLD_BOX, GetNpcWorldPos(id));
	SetNpcScript(npcIndex, "\\script\\online_activites\\201410\\plant_flower.lua");
	SetNpcLifeTime(npcIndex, 90);
	SetNpcTempData(npcIndex, 1, PlayerIndex);
	Msg2Team(format("BOSS %s �� b� ��nh b�i, r�i ra 1 %s.", GetNpcName(id), VET_201410_GOLD_BOX), 1);
	SetNpcLifeTime(id, 0);
end

function main()
	local npcIndex = GetTargetNpc();
	if GetNpcName(npcIndex) ~= VET_201410_GOLD_BOX then
		return 0;
	end
	local pickedTimes = GetNpcTempData(npcIndex, 2);
	if pickedTimes >= 8 then
		SetNpcLifeTime(npcIndex, 0);
		return 0;
	end
	local pIdx = GetNpcTempData(npcIndex, 1);
	local canPick = nil;
	for i = 1, GetTeamSize() do
		if GetTeamMember(i) == pIdx then
			canPick = 1;
			break;
		end
	end
	if not canPick then
		Say("B�n kh�ng th� nh�t ph�n th��ng R��ng Ho�ng Kim B�o B�i n�y!", 0);
		return 0;
	end
	if VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.PickBox) >= VET_201410_PICK_BOX then
		Say(format("M�i ng�y ch� ���c nh�t t�i �a %d l�n R��ng Ho�ng Kim B�o B�i", VET_201410_PICK_BOX), 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.PickBox, VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.PickBox) + 1)
	SetNpcTempData(npcIndex, 2, pickedTimes + 1);
	local tAward = {
		{1, 250, "Hoa h�ng", {2, 1, 30736, 1000}, 0},
		{1, 70, "B�ch C�u Ti�n ��n", {2, 1, 1008, 1, 4}, 7 * 24 * 3600},
		{1, 70, "Tam Thanh Ti�n ��n", {2, 1, 1099, 1, 4}, 7 * 24 * 3600},
		{1, 70, "L�c Th�n Ti�n ��n", {2, 1, 1066, 1, 4}, 7 * 24 * 3600},
		{1, 70, "Th�n N�ng ��n", {2, 1, 343, 1, 4}, 7 * 24 * 3600},
		{1, 70, "B�n Long b�ch", {2, 1, 1000, 1, 4}, 7 * 24 * 3600},
		{1, 100, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1, 4}, 7 * 24 * 3600},
		{1, 40, "Qu�n C�ng ��i", {2, 1, 9998, 1, 4}, 7 * 24 * 3600},
		{1, 30, "Thi�n Ki�u L�nh", {2, 97, 236, 1, 4}, 0},
		{1, 10, "L�ng Ba Vi B�", {0, 112, 78, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "L�ng Ba Vi B� to�n t�p", {0, 112, 158, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 109, "B�ng th�ch", {2, 1, 149, 1}, 0},
		{1, 10, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1, 4}, 7 * 24 * 3600},
		{31, 100, "ahf_GetLevel3JSEquip()", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, VET_201410_LOG_TITLE, VET_201410_GOLD_BOX);
end

--complete by veit��pet value��
function add_pet_lingli_value_201410(nKind)
	if 1 == nKind then
		--add pet value : 5 points
	elseif 2 == nKind  then
		--add pet value : 10 points
	end
end