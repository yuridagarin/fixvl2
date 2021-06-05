Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_LOG_TITLE = "Hoat Dong Hoa Hong Thang 9/2013";

VET_TB_LOG_ACTION_LIST = {
    [1] = "Mua M�m Hoa",
    [2] = "K�ch ho�t tr�ng hoa",
};

VET_STRING_LIST = {
    [1] = "K�ch ho�t tr�ng hoa",
    [2] = "Mua M�m Hoa (1 M�m Hoa = 19 v�ng)",
    [3] = "K�t th�c ��i tho�i",
    [4] = "Ti�n v�ng ��i hi�p mang theo kh�ng ��.",
    [5] = "Ch� c� ��i tr��ng m�i c� th� k�ch ho�t tr�ng hoa.",
    [6] = "C�n t� ��i tr�n 2 ng��i, m�i c� th� k�ch ho�t tr�ng hoa.",
    [7] = "�i�u ki�n tr�ng hoa l�i.",
    [8] = "T� ��i th�nh vi�n m�i ng��i c�n mang theo 1 m�m hoa m�i c� th� k�ch ho�t tr�ng hoa.",
    [9] = "M�i ng�y m�i ng��i ch�i gi�i h�n mua 1 m�m hoa.",
    [10] = "Nh�n v�t c�p 77 tr� l�n, �� gia nh�p m�n ph�i v� luy�n ���c k� n�ng c�p 55 m�i c� th� tham gia ho�t ��ng",
    [11] = "M�i ng�y m�i nh�n v�t ch� ���c tham gia ho�t ��ng %d l�n.",
    [12] = "Ch� ���c k�ch ho�t tr�ng hoa t�i c�c th�nh th� l�n (Bi�n Kinh, Th�nh ��, Tuy�n Ch�u, T��ng D��ng, D��ng Ch�u, ��i L�, Ph��ng T��ng).",
		[13] = "Ch� c� th� c�ng l�c k�ch ho�t 1 m�m hoa.",
		[14] = "��i vi�n kh�ng c� b�n c�nh, kh�ng th� k�ch ho�t tr�ng hoa."
};

VET_TB_ITEM_LIST = {
    [1] = {"M�m Hoa h�ng",2,1,30289},
};

VET_TB_MAPID = {
    100,150,200,300,350,400,500,
}

VET_TB_NPCS = {
	[1] = {"Hoa h�ng ��","Hoa h�ng ��"},    
	[2] = {"Hoa h�ng v�ng","Hoa h�ng v�ng"},
};

VET_EXP_TABLE = {
	[2] = {100000,200000},
	[3] = {105000,210000},
	[4] = {110000,220000},	
	[5] = {115000,230000},
	[6] = {120000,240000},
	[7] = {130000,260000},
	[8] = {160000,320000},
}

VET_ROSE_ACTIVITY_ID = 100	--�ID
VET_TIME_TB_DEFINE = 1532 	--ʱ�䴥��������ID
VET_TIME_USER_DEFINE = VET_TIME_TB_DEFINE*2 	--ʱ�䴥�����Զ���ID
VET_ROSE_SEED_COST = 190000  	--����۸�
VET_MAX_TIMES = 8  				--ÿ��������4��
VET_ROSE_LIFE = 10*60      --����npc���ʱ��
VET_ADDIONAL_EXP = 19000000 --���һ�ζ��⽱��

--�����������
VET_ROSE_TaskGroup = TaskManager:Create(10,6)
VET_ROSE_TaskGroup.Rose_Times = 1
VET_ROSE_TaskGroup.Time_End = 2
VET_ROSE_TaskGroup.Npc_Index = 3
VET_ROSE_TaskGroup.Date = 4
VET_ROSE_TaskGroup.TeamSize = 5

function VET_201309_AdditionDialog() --tbSayDialog, szSayHead
local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."
	if gf_CheckEventDateEx(VET_ROSE_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog, VET_STRING_LIST[1].."/active_fire_for_warm")
		tinsert(tbSayDialog, VET_STRING_LIST[2].."/buy_match") 
		tinsert(tbSayDialog, "Tho�t/do_nothing");
	end
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

--����õ�廨
function active_fire_for_warm()
    local nTeamSize = GetTeamSize()
    if nTeamSize < 2 then
        Talk(1, "", VET_STRING_LIST[6])
        return
    end
    if GetCaptainName() ~= GetName() then
        Talk(1, "", VET_STRING_LIST[5])
        return
    end
    if Check_team_member(nTeamSize) == 0 then
        return 0 
    end
    to_set_fire_now(nTeamSize)
end

function buy_match()
    if GetCash() < VET_ROSE_SEED_COST then
        Talk(1, "", VET_STRING_LIST[4])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if Pay(VET_ROSE_SEED_COST) == 1 then
        local tbItemIds = {VET_TB_ITEM_LIST[1][2],VET_TB_ITEM_LIST[1][3],VET_TB_ITEM_LIST[1][4],1}
        gf_AddItemEx2(tbItemIds, VET_TB_ITEM_LIST[1][1],VET_LOG_TITLE,VET_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function Is_In_City_Map()
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_TB_MAPID) do
        if nMapId == VET_TB_MAPID[i] then
            bMapIsOk = 1 
            break
        end
    end
    if bMapIsOk == 0 then
        return 0 
    end
end

function Check_team_member(nTeamSize)
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
      PlayerIndex = GetTeamMember(i)
      if PlayerIndex <= 0 then
        Talk(1, "", VET_STRING_LIST[7]) 
      	return 0 
    	end
    	local szCurrName = GetName();
			local nDate = zgc_pub_day_turn()
			if VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Date) ~= nDate then
				VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Date,nDate)
				VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Rose_Times,0)
			end
      if Is_In_City_Map() == 0 then
        PlayerIndex = nOldPlayer  --�����Ϣ���߶ӳ�������
        Talk(1, "", VET_STRING_LIST[12]) 
        return 0;
      end
      local nLevel = GetLevel()
      if nLevel < 77 or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
          Talk(1, "", VET_STRING_LIST[10]) 
          PlayerIndex = nOldPlayer  --�����Ϣ���߶ӳ�������
          Talk(1, "", VET_STRING_LIST[10]..format("\n<color=red>%s<color>", szCurrName)) 
          return 0 
      end
      if GetItemCount(VET_TB_ITEM_LIST[1][2],VET_TB_ITEM_LIST[1][3],VET_TB_ITEM_LIST[1][4]) < 1 then
          PlayerIndex = nOldPlayer  --�����Ϣ���߶ӳ�������
          Talk(1, "", VET_STRING_LIST[8]..format("\n<color=red>%s<color>", szCurrName)) 
          return 0 
      end
      local nTimes = VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Rose_Times)
      if not nTimes or nTimes >= VET_MAX_TIMES then
          Talk(1, "", format(VET_STRING_LIST[11], VET_MAX_TIMES));
          PlayerIndex = nOldPlayer
          Talk(1, "", format(VET_STRING_LIST[11], VET_MAX_TIMES)..format("\n<color=red>%s<color>", szCurrName));
          return 0;
      end
			--ֻ��ͬʱ����һ��������Ϣ
			local nTime = tonumber(GetTime())
			if nTime < VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Time_End) then
				Talk(1, "",VET_STRING_LIST[13])
				if PlayerIndex ~= nOldPlayer then
					PlayerIndex = nOldPlayer --һ�����߶ӳ�
					Talk(1, "",VET_STRING_LIST[13]..format("\n<color=red>%s<color>", szCurrName))
				end
				return 0
			end
    end
    PlayerIndex = nOldPlayer
end

function to_set_fire_now(nTeamSize)
	--�ж϶����Ƿ������24��
	local nMapId1,nX1,nY1=GetWorldPos()
	nOldPlayer = PlayerIndex
	local nMapId2,nX2,nY2
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
		nMapId2,nX2,nY2 = GetWorldPos()
		local nDis = DistanceBetweenPoints(nMapId1,nX1,nY1,nMapId2,nX2,nY2)
    if  nDis < 0 or nDis > 24 then
      PlayerIndex = nOldPlayer
			Talk(1, "", VET_STRING_LIST[14])
		  return
    end
  end
	--�Ƿ����߲�ɾ����Ʒ
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
    if PlayerIndex <= 0 then
      Talk(1, "", VET_STRING_LIST[7])
			PlayerIndex = nOldPlayer
      return
    end
    if DelItem(VET_TB_ITEM_LIST[1][2],VET_TB_ITEM_LIST[1][3],VET_TB_ITEM_LIST[1][4],1) ~= 1 then
			PlayerIndex = nOldPlayer
    	return
    end
  end
  PlayerIndex = nOldPlayer
	local nNpcIndex
	local nResult = random(100)
	if  nResult < 61 then
		nNpcIndex = CreateNpc(VET_TB_NPCS[1][1],VET_TB_NPCS[1][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_ROSE_LIFE)
	else
		nNpcIndex = CreateNpc(VET_TB_NPCS[2][1],VET_TB_NPCS[2][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_ROSE_LIFE)
	end
  local nOldPlayer = PlayerIndex
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
    if PlayerIndex <= 0 then
      Talk(1, "", VET_STRING_LIST[7])
			PlayerIndex = nOldPlayer
      return
    end
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Time_End, GetTime() + VET_ROSE_LIFE + 20)     --��������ֹʱ�䣬��ֹNPC���ⶪʧ������������NPCʱ��10�����ʧ
    CreateTrigger(1, VET_TIME_TB_DEFINE, VET_TIME_USER_DEFINE) 
    ContinueTimer(GetTrigger(VET_TIME_USER_DEFINE)) 
    gf_WriteLogEx(VET_LOG_TITLE,VET_TB_LOG_ACTION_LIST[2])
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Npc_Index,nNpcIndex) 
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Rose_Times,VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Rose_Times) + 1)
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.TeamSize,nTeamSize) 
  end
  PlayerIndex = nOldPlayer
end

--�жϾ���
function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
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
  nTeamSize = min(VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.TeamSize), nTeamSize);
  if not VET_EXP_TABLE[nTeamSize] then
  	RemoveTrigger(GetTrigger(VET_TIME_USER_DEFINE))
  	VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Time_End, GetTime())
    return 0
  end
  VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.TeamSize, nTeamSize);
  local nTime = tonumber(GetTime())
  if nTime >= VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Time_End) then
  	--���һ�ζ��⽱��
  	if VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Rose_Times) >= VET_MAX_TIMES then
  		gf_ModifyExp(VET_ADDIONAL_EXP);
  	end
    RemoveTrigger(GetTrigger(VET_TIME_USER_DEFINE))
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Time_End, GetTime())
    return 0
  end
  local nRoseIndex = VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Npc_Index)
  local nIndex = 1;
  if GetNpcName(nRoseIndex) == VET_TB_NPCS[2][2] then
  	nIndex = 2;
  end
  local nExpNum = VET_EXP_TABLE[nTeamSize][nIndex];
  if not nExpNum then return end
  local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nRoseIndex)
  local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
  local nDist = DistanceBetweenPoints(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
  if nDist >= 0 and nDist <= 18 then
		ModifyExp(nExpNum)
  	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
  end
end
function do_nothing()

end