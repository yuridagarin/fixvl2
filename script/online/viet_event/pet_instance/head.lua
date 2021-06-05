-- Pet Instance
-- Created by TriHM

Include("\\script\\lib\\offline_head.lua");
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")

GROUP_MOB = 10

TAIXU_TASK_TEMP_BEGIN = 100
TAIXU_MONSTER_TYPE = 100
TAIXU_ZONE_INDEX = 101	
TAIXU_MAP_ID = 102	
TAIXU_TEAM_SIZE = 107	
TAIXU_PET_USEFOOD = 103
TAIXU_TEAM_INDEX = 108
TAIXU_RINGS = 104	
TAIXU_STEPS = 105	
TAIXU_STEP_CONTROL = 106

TAIXU_TASK_TEMP_END = 108

TRIGGER_TIMER = 1011
TRIGGER_KILL = 1012
TRIGGER_RECT = 1013
TRIGGER_LOG = 1014

MAX_MONSTER_COUNT = 80

--tGroupOffset =
--{
--	[2010] = 0,
--	[1010] = 10,
--}

tPos = 
{
	[2010] = {200, 1489, 2957},
	[1010] = {300, 1923, 3475},
}

tMobType = 
{
	[1] = {"Ti�u D� tr�", "Heo r�ng", 25000},
	[2] = {"Ong ��c nh�", "Ong nh�", 30000},
	[3] = {"��c Gi�p Tr�ng", "��c gi�p tr�ng", 35000},
	[4] = {"D�i h�t m�u", "D�i", 40000},
	[5] = {"H� Ly", "H� ly", 45000},
	[6] = {"S�i �i�n", "S�i �i�n", 50000},
	[7] = {"Qu� �en", "Qu� �en", 55000},
	[8] = {"C� s�u1", "C� s�u", 60000},
	[9] = {"C�c1", "C�c", 65000},
	[10] = {"D�i ��c", "D�i h�t m�u",70000},
	[11] = {"B� c�p", "B� c�p", 75000},
	[12] = {"Ng�n H�", "Ng�n H�", 80000},
	[13] = {"Th��ng Vi�n", "Th��ng Vi�n", 85000},
	[14] = {"Th� Qu�i1", "Th� Qu�i", 90000},
	[15] = {"G�u x�m", "G�u x�m", 95000},
	[16] = {"Ong ��c", "Ong ��c", 100000},
	[17] = {"Kim Gi�p", "Kim Gi�p", 105000},
	[18] = {"R��ng ti�n", "R��ng ph�n th��ng", 0},
}

tTreasureChestScript =
{
	[1] = "\\script\\online\\viet_event\\pet_instance\\mob\\treasure_chest_1.lua",
	[2] = "\\script\\online\\viet_event\\pet_instance\\mob\\treasure_chest_2.lua",
	[3] = "\\script\\online\\viet_event\\pet_instance\\mob\\treasure_chest_3.lua",
	[4] = "\\script\\online\\viet_event\\pet_instance\\mob\\treasure_chest_4.lua",
	[5] = "\\script\\online\\viet_event\\pet_instance\\mob\\treasure_chest_5.lua",
}

tPetPos =
{
	[1] = {2010, 1624, 3288},
	[2] = {2010, 1624, 3287},
	[3] = {2010, 1624, 3289},
	[4] = {2010, 1626, 3289},
	[5] = {2010, 1626, 3287},
	[6] = {2010, 1628, 3288},
	[7] = {2010, 1628, 3287},
	[8] = {2010, 1628, 3289},
}

tMobPos =
{
	[1] = {2010, 1623, 3288},
	[2] = {2010, 1623, 3289},
	[3] = {2010, 1623, 3287},
	[4] = {2010, 1626, 3289},
	[5] = {2010, 1626, 3291},
	[6] = {2010, 1629, 3288},
	[7] = {2010, 1629, 3287},
	[8] = {2010, 1629, 3289},
	[9] = {2010, 1626, 3285},
	[10] = {2010, 1626, 3285},
	[11] = {2010, 1622, 3288},
	[12] = {2010, 1622, 3289},
	[13] = {2010, 1622, 3287},
	[14] = {2010, 1627, 3289},
	[15] = {2010, 1627, 3291},
	[16] = {2010, 1630, 3288},
	[17] = {2010, 1630, 3287},
	[18] = {2010, 1630, 3289},
	[19] = {2010, 1627, 3285},
	[20] = {2010, 1627, 3285},
}

tTreasurePos =
{
	[1] = {2010, 1626, 3288},
}

tPetFoodNum =
{
	[1] = 1,
	[2] = 1,
	[3] = 1,
	[4] = 2,
	[5] = 2,
	[6] = 2,
	[7] = 2,
	[8] = 3,
	[9] = 3,
	[10] = 3,
	[11] = 3,
	[12] = 3,
	[13] = 3,
	[14] = 4,
	[15] = 4,
	[16] = 4,	
	[17] = 4,
}

tLimitPetFoodUsed =
{
	[1] = 18,
	[2] = 18,
	[3] = 18,
	[4] = 18,
	[5] = 18,
	[6] = 40,
	[7] = 40,
	[8] = 40,
	[9] = 40,
	[10] = 40,
	[11] = 65,
	[12] = 65,
	[13] = 65,
	[14] = 65,
	[15] = 65,
	[16] = 80,	
	[17] = 80,
}

function Chk_Enter(nType)
	local szSex = {"Thi�u hi�p", "N� hi�p "}
	local szNoTeam ={"Th�i H� Huy�n C�nh nguy hi�m tr�ng tr�ng,", " n�n t� ��i hay h�n!"}
	local nSex = GetSex()
	local szLevel = "<color=green>l�n h�n ho�c b�ng c�p 70<color>"
	local szItemCount = "<color=green>c�n 1 Th�i H� �a M�t qu�<color>"	
	local szTimes = "<color=green>3 l�n<color>"
	if nType == 2 then
		szTimes = "<color=green>2 l�n<color>"
	end
	local szLeader = "<color=green>��i tr��ng<color>"
	local szTown = "<color=green>, ��i vi�n c�ng m�t th�nh th�<color>"
	local szExMsg = ""	
	local szPet = ""
	local nRetCode = 1
	
	if IsinTeam() == 0 then
		nRetCode = 0
		return nRetCode, szNoTeam[1]..szSex[nSex]..szNoTeam[2]
	end
	
	if IsCaptain() == 0 then
		nRetCode = 0
		szLeader = "<color=red>��i tr��ng<color>" 
	end
	
	local nSize = GetTeamSize()
	local nCount = 1
	local OldPlayer = PlayerIndex
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() < 70 then
			nRetCode = 0
			szLevel = "<color=red>l�n h�n ho�c b�ng c�p 70<color>"
			break
		end
		if nType == 2 then
			if GetItemCount(2,1,387) < 5 then
   				nRetCode = 0
   				szItemCount = "<color=red>c�n 5 Th�i H� �a M�t qu�<color>"	
   				break
  			end
  		end
  		local nPartnerLevel = mod(GetTask(TASK_VNG_PET), 100)
  		if nPartnerLevel < 2 then
  			nRetCode = 0
  			szPet = "<color=red>ch�a c� b�n ��ng h�nh c�p 2 tr� l�n, <color>"
  			break
  		end
	end
    
    for i = 1, nSize do
    	PlayerIndex = GetTeamMember(i)
    	if TodayCanEnter(nType) <= 0 then
    		nRetCode = 0
    		szTimes = "<color=red>v��t qu� s� l�n<color>"
    		szExMsg = szExMsg..GetName()..", "
    	end
    end
    PlayerIndex = OldPlayer
    if szExMsg ~= "" then
	    local nLen = strlen(szExMsg)
	    szExMsg = strsub(szExMsg, 1, nLen - 2)
	    szExMsg = szExMsg.."Kh�ng v�o ���c Th�i H� Huy�n C�nh (H�m nay �� v�o �� s� l�n)"
	end
    
    if AreaCheck() == 0 then
    	nRetCode = 0
    	szTown = "<color=red>��i vi�n c�ng m�t th�nh th�<color>"
    end
    
    local nSleepCheckRet = 0
    local szSleepCheck = ""
    nSleepCheckRet, szSleepCheck = SleepCheck()
    if nSleepCheckRet == 0 then
    	nRetCode = 0
    end

	if szExMsg ~= "" then
		Msg2Team(szExMsg)
	end
	if szSleepCheck ~= "" then
		Msg2Team(szSleepCheck)
	end

    local szMsg = "T� ��i do "..szLeader.." d�n ��u, "..szLevel..szTown..", "..szPet..szItemCount..", 1 ng�y c�ng b�n ��ng h�nh v�o Th�i H� Huy�n C�nh "..szTimes..". \n\n(<color=white>M�u xanh t��ng tr�ng �� �i�u ki�n, m�u �� kh�ng �� nguy�n nh�n<color>)"
    return nRetCode, szMsg
end

function IsinTeam()
	if GetTeamSize() < 1 then
		return 0
	else
		return 1
	end
end

function IsCaptain()
	if IsinTeam() == 0 then
		return 0
	end
	
	local nCaptain = GetTeamMember(0)
	if nCaptain == PlayerIndex then
		return 1
	else
		return 0
	end
end

function TodayCanEnter(nType)
	local nNow = tonumber(date("%y%m%d"))
	local nLastTime = floor(GetTask(TSK_PET_TAIXU_DATE) / 1000)
	if nLastTime ~= nNow then
		SetTask(TSK_PET_TAIXU_DATE, nNow * 1000)
	end
	local nFreeTime = floor(mod(GetTask(TSK_PET_TAIXU_DATE), 100) / 10)
	local nPaidTime = floor(mod(GetTask(TSK_PET_TAIXU_DATE), 1000) / 100)
	if (nType == 1 and nFreeTime >= 3) or (nType == 2 and nPaidTime >= 2) then
		return 0
	else
		return 1
	end
end

function InitPlayerStatus(nMapid, nIndex, nType)
	if IsCaptain() == 1 then
		SetTaskTemp(TAIXU_STEP_CONTROL, 2)
		SetTaskTemp(TAIXU_STEPS, 0)
		SetTaskTemp(TAIXU_ZONE_INDEX, 1)
		SetTaskTemp(TAIXU_TEAM_SIZE, GetTeamSize())

		SetMapTaskTemp(nMapid, 0, 1)
		local nTrigger = CreateTrigger(1, 1106, TRIGGER_TIMER)
		
		ContinueTimer(nTrigger)
	end
	RemvoeTempEffect()
	RemoveRevivals()
	SetLogoutRV(1)	
	SetFightState(0)	
	SetCreateTeam(1)
	SetPKFlag(1,1)
	ForbidChangePK(1)
	UseScrollEnable(0)
	UseSkillEnable(0)
     InteractiveEnable(0)		
     StallEnable(0)		   		
	ForbitTrade(1)				
	OpenFriendliness(0)		
	SetDeathPunish(0)		
	
	CreateTrigger(2, 1106, TRIGGER_RECT)
	CreateTrigger(3, 1106, TRIGGER_LOG)

end

function ClearMonster(nIndex)
	nIndex = nIndex + 10
	SetGroupLifeTime(nIndex, nLifeTime)
	SetGroupDeathScript(nIndex, "")
	return ClearGroup(nIndex)
end

function Move2Stage(nIndex, nType, nMapID)
	local szMsg = ""
		
	local tOffset =
	{
		{-2, 0},
		{-1, 0},
		{0, 0},
		{1, 0},
		{-2, 1},
		{-1, 1},
		{0, 1},
		{1, 1},
	}

	local pos = {}
	pos[1] = nMapID

	local nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		CleanInteractive()
		SCCheckOfflineExp(3)
		local nPlayerTeamIndex = GetTaskTemp(TAIXU_TEAM_INDEX)
		
		if nPlayerTeamIndex > 0 and nPlayerTeamIndex <= 8 then
			pos[2] = 1625 + tOffset[nPlayerTeamIndex][1]
			pos[3] = 3300 + tOffset[nPlayerTeamIndex][2]
		else
			pos[2] = 1625
			pos[3] = 3300
		end
		
		if NewWorld(pos[1], pos[2], pos[3]) ~= 1 then
			Msg2Player("chuy�n ti�p th�t b�i, kh�ng th� v�o Th�i H� Huy�n C�nh")
			LeaveTeam()
			WriteLog("**Th�i H� Huy�n C�nh "..GetName().."Chuy�n ti�p th�t b�i, th�i gian : "..date("%H%M"))	
		end
	end
	
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if nType == 2 then
			if DelItem(2,1,387,5) == 1 then
				InitPlayerStatus(pos[1], nIndex, nType)
				KillFollower()
				SetTaskTemp(TAIXU_MAP_ID, pos[1])
			end
		elseif nType == 1 then
			InitPlayerStatus(pos[1], nIndex, nType)
			KillFollower()
			SetTaskTemp(TAIXU_MAP_ID, pos[1])
		end
		
		local szLocation = "Th�nh ��"
		if pos[1] == 2010 then
			szLocation = "Bi�n Kinh"
		end
		gf_WriteLogEx("Thai Hu Huyen Canh Ban Dong Hanh", "tham gia v��t �i lo�i "..nType.." t�i Th�i H� "..szLocation)
	end
	PlayerIndex = nOldPlayer
end

function EnterTx()
	Say("Th� ch� h�y ch�n h�nh th�c v�o Th�i H�:", 3, "B�nh th��ng/#confirm_EnterTx(1)", "S� d�ng Th�i H� �a M�t Qu� /#confirm_EnterTx(2)", "Ta ch� h�i th�i!/no")
end

function confirm_EnterTx(nType)
	local nMap = GetWorldPos()
	if nMap ~= 200 and nMap ~= 300 then
		Talk(1,"","C�c h� ch� c� th� v�o Th�i H� Huy�n C�nh c�ng b�n ��ng h�nh t� Th�nh �� v� Bi�n Kinh!")
		return
	end
	if GetTeamSize() < 2 then
		Talk(1,"","C�c h� ch� c� th� v�o Th�i H� Huy�n C�nh c�ng b�n ��ng h�nh khi c� t� ��i �t nh�t t� 2 ng��i tr� l�n!")
		return
	end
	
	local nRetCode, szMsg = Chk_Enter(nType)
	if nRetCode == 0 then
		Talk(1, "", szMsg)
		return
	end
	
	local nCount = 0

	local nMapID = 1010
	if nMap == 200 then
		nMapID = 2010
	end
	
	for i = 0, 2 do
		local nValue = GetMapTaskTemp(nMapID, i)
		if nValue ==1 then
			Msg2Team("Th�i H� Huy�n C�nh �� ��y, khi kh�c h�y quay l�i!", 2)
			return
		end
	end

	local nIndex = random(1, 8)
	SetMapTaskTemp(nMapID, 3, nType)
	SetMapTaskTemp(nMapID, 4, 0)
	ClearMapNpc(nMapID)
	Msg2Team("H�y chu�n b� s�n s�ng, �o �nh th� trong Th�i H� Huy�n C�nh s� xu�t hi�n sau 15 gi�y n�a!", 2)
	SetPlayerTeamIndex()
	ClearMonster(nIndex)
	local OldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
     		PlayerIndex = GetTeamMember(i)
     		if GetMapTaskTemp(nMapID, 3) == 1 then
     			SetTask(TSK_PET_TAIXU_DATE, GetTask(TSK_PET_TAIXU_DATE) + 10)
     		else
     			SetTask(TSK_PET_TAIXU_DATE, GetTask(TSK_PET_TAIXU_DATE) + 100)
     		end
     	end
     	PlayerIndex = OldPlayer
	Move2Stage(nIndex, nType, nMapID)
end

function Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    local OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end

function PetCreateMonster(nZone, nStage)
	local nMapid = GetWorldPos()
	if nMapid ~= 1010 and nMapid ~= 2010 then
		RemoveTrigger(GetTrigger(TRIGGER_TIMER))
		RemoveTrigger(GetTrigger(TRIGGER_KILL))
		RemoveTrigger(GetTrigger(TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TRIGGER_LOG))
		return
	end
	
	local nQuantity = nStage * 2
	for i = 1, nQuantity do
		local nNpcIdx = CreateNpc(tMobType[nZone][1], tMobType[nZone][2], nMapid, tMobPos[i][2], tMobPos[i][3])
		SetCampToNpc(nNpcIdx,"daliao")
		SetNpcDeathScript(nNpcIdx, "\\script\\online\\viet_event\\pet_instance\\mob\\mob_death.lua")
		AddUnitStates(nNpcIdx,7,10)
		AddUnitStates(nNpcIdx,8, 999)
		SetNpcLifeTime(nNpcIdx,630)
		AddGroupUnit(GROUP_MOB, nNpcIdx)
	end
end

function PetCreateTreasureChest(nZone)
	local nMapid = GetWorldPos()
	if nMapid ~= 1010 and nMapid ~= 2010 then
		RemoveTrigger(GetTrigger(TRIGGER_TIMER))
		RemoveTrigger(GetTrigger(TRIGGER_KILL))
		RemoveTrigger(GetTrigger(TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TRIGGER_LOG))
		return
	end
	
	local nNpcIdx = CreateNpc(tMobType[18][1], tMobType[18][2], nMapid, tTreasurePos[1][2], tTreasurePos[1][3])
	if nZone < 5 then
		SetNpcScript(nNpcIdx, tTreasureChestScript[nZone])
	else
		SetNpcScript(nNpcIdx, tTreasureChestScript[5])
	end
	SetNpcLifeTime(nNpcIdx, 10)
end

function ResetPlayerStatus()
	RemvoeTempEffect()
	SetLogoutRV(0)						
	SetFightState(0)					
	SetCreateTeam(0)					
	ForbidChangePK(0)
	UseSkillEnable(1)
	UseScrollEnable(1)				
    InteractiveEnable(1)				
    StallEnable(1)		   				
	ForbitTrade(0)					
	OpenFriendliness(1)				
	SetDeathPunish(1)			
end

function PetGameOver(nType)
	local nMapid = 0
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		nMapid = GetTaskTemp(TAIXU_MAP_ID)
	end
	PlayerIndex = nOldPlayer
	
	if nType == 0 then		-- Member r�i ��i
		RemoveTrigger(GetTrigger(TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TRIGGER_LOG))
		local nPetIdx = GetTask(TSK_PET_TAIXU_INFO)
		SetNpcDeathScript(nPetIdx, "")
		SetNpcLifeTime(nPetIdx, 0)
		local nPetNum = mod(GetTask(TSK_PET_TAIXU_DATE), 10)
		if nPetNum >= 1 then
			SetTask(TSK_PET_TAIXU_DATE, GetTask(TSK_PET_TAIXU_DATE) - nPetNum)
		end
		SetTask(TSK_PET_TAIXU_INFO, 0)
		NewWorld(tPos[nMapid][1], tPos[nMapid][2], tPos[nMapid][3])
		ResetPlayerStatus()
		LeaveTeam()
	elseif nType == 1 then	-- ��i tr��ng r�i ��i
		nOldPlayer = PlayerIndex
		PlayerIndex = GetTeamMember(0)
		local nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
		RemoveTrigger(GetTrigger(TRIGGER_TIMER))
		for i = TAIXU_TASK_TEMP_BEGIN, TAIXU_TASK_TEMP_END do
			SetTaskTemp(i, 0)
		end
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if PlayerIndex > 0 then
				SetTaskTemp(TAIXU_TEAM_INDEX, 0)
				local nPetIdx = GetTask(TSK_PET_TAIXU_INFO)
				SetNpcDeathScript(nPetIdx, "")
				SetNpcLifeTime(nPetIdx, 0)
				local nPetNum = mod(GetTask(TSK_PET_TAIXU_DATE), 10)
				if nPetNum >= 1 then
					SetTask(TSK_PET_TAIXU_DATE, GetTask(TSK_PET_TAIXU_DATE) - nPetNum)
				end
				SetTask(TSK_PET_TAIXU_INFO, 0)
				RemoveTrigger(GetTrigger(TRIGGER_RECT))
				RemoveTrigger(GetTrigger(TRIGGER_LOG))
				StopTimeGuage(nMapid)
				NewWorld(tPos[nMapid][1], tPos[nMapid][2], tPos[nMapid][3])
				ResetPlayerStatus()
			end
		end
		PlayerIndex = nOldPlayer
		for i = 0, 4 do
			SetMapTaskTemp(nMapid, i, 0)
		end
		
		SetGroupLifeTime(GROUP_MOB, 1)
		ClearGroup(GROUP_MOB)
	end
end

function no()

end


function Hewei()
	Say("C�u Thi�n Huy�n N� l�y tam thu thanh l� v� b�ch hoa qu� m�t l�m ra nhi�u lo�i linh th�; ngo�i ra c�n l�y m�y m� luy�n ng� s�c k� th�ch ��t ch�ng t�i m�t th� gi�i huy�n �o c� t�n Th�i H�. Ph�m ai v�o ���c trong ��u to�i nguy�n.",
		2, "L�m sao v�o ���c Th�i H� Huy�n C�nh?/Ruhe", "Ta ch� h�i th�i!/no")
end

function Ruhe()
	Say("Ch� c�n <color=yellow>t� ��i<color> �i k�m v�i <color=yellow>b�n ��ng h�nh<color> ��n t�m b�n ��o l� ���c. Th�i H� Huy�n C�nh l� ch�n th�n ti�n m�i ng�y ch� v�o ���c t�i �a <color=yellow>1 l�n<color> b�nh th��ng v� <color=yellow>8 l�n<color> th�ng qua s� d�ng Th�i H� �a M�t Qu�.",
		2, "Th�i H� Huy�n C�nh l� sao?/Hewei", "Ta ch� h�i th�i!/no")
end

-- �ڽ���ǰ�ж����ж�Ա�Ƿ���ͬһ������
function AreaCheck()
	local nTeamSize = 0
	local nMapid = GetWorldPos()	--���ȡһ����Ա��worldpos
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetWorldPos() == nMapid then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if GetTeamSize() == nTeamSize then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function SleepCheck()
	local nTeamSize = 0
	local szExMsg = ""
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsSleeping() == 1 then
			szExMsg = szExMsg..GetName()..", "
		else
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if szExMsg ~= "" then
	    local nLen = strlen(szExMsg)
	    szExMsg = strsub(szExMsg, 1, nLen - 2)
	    szExMsg = szExMsg.."Kh�ng th� v�o Th�i H� Huy�n C�nh (�ang ��ng)"
	end
	if (GetTeamSize() == nTeamSize) and (GetTeamSize() > 0) then
		return 1, szExMsg
	else
		return 0, szExMsg
	end
end

function SetPlayerTeamIndex()
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		SetTaskTemp(TAIXU_TEAM_INDEX, i)
		WriteLogEx("Thai Hu Huyen Canh Ban Dong Hanh", "Tham gia");
	end
	PlayerIndex = nOldIndex
end

function CreatePet(nNum, nMap)
	local nPartnerLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nPetType = gf_GetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_TYPE)
	local nNpcIdx = CreateNpc(VET_201003_TONGBAN_STR_MODE_NAME[nPartnerLevel][nPetType], GetName(), nMap, tPetPos[nNum][2], tPetPos[nNum][3])
	SetCampToNpc(nNpcIdx,"dasong")
	SetNpcDeathScript(nNpcIdx,"\\script\\online\\viet_event\\pet_instance\\pet_death.lua")
	AddUnitStates(nNpcIdx,7,10)
	local nState = GetUnitCurStates(nNpcIdx,6)
	AddUnitStates(nNpcIdx,8, 999)
	AddUnitStates(nNpcIdx,6, - nState)
	AddUnitStates(nNpcIdx,6,PlayerIndex)
	SetTask(TSK_PET_TAIXU_DATE, GetTask(TSK_PET_TAIXU_DATE) + 1)
	SetTask(TSK_PET_TAIXU_INFO, nNpcIdx)
end

function CountPet()
	local nOldIndex = PlayerIndex
	local nCount = 0
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if mod(GetTask(TSK_PET_TAIXU_DATE), 10) >= 1 then
			nCount = nCount + 1
		end
	end
	PlayerIndex = nOldIndex
	return nCount
end