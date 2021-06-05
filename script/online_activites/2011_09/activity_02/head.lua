--=============================================
--create by xiongyizhi
--describe:Խ�ϰ�2010��12�»3 ͷ�ļ�
--related files: 
--modify by liubo
--=============================================

Include("\\script\\online_activites\\2011_09\\activity_02\\strings.lua") --��ַ���
Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua") 
VET_201110_TIME_USER_DEFINE = 2555 	--ʱ�䴥�����Զ���ID
VET_201110_TIME_TB_DEFINE = 1513 	--ʱ�䴥��������ID
VET_201110_ROSE_SEED_COST = 300000  	--����۸�30��
VET_201110_MAX_TIMES = 4  				--ÿ��������4��
VET_201110_ROSE_LIFE = 5*60          	--����npc���ʱ�䣬ʵ��ʱ�޺ʹ�����ʱ�޶���΢�мӳ��޸�
VET_201110_ROSE_ACTIVITY_ID = 41	--�ID
--�����������
VET_201110_ROSE_TaskGroup = TaskManager:Create(2,5)
VET_201110_ROSE_TaskGroup.Rose_Times = 1
VET_201110_ROSE_TaskGroup.Time_End = 2
VET_201110_ROSE_TaskGroup.Npc_Index = 3
VET_201110_ROSE_TaskGroup.Date = 4

function VET_201110_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201110_ROSE_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog, VET_201110_STRING_LIST[1].."/active_fire_for_warm")
		tinsert(tbSayDialog, VET_201110_STRING_LIST[2].."/buy_match") 
	end
    return tbSayDialog, szSayHead 
end

--����õ�廨
function active_fire_for_warm()
    local nTeamSize = GetTeamSize()
    if nTeamSize < 2 then
        Talk(1, "", VET_201110_STRING_LIST[6])
        return
    end
    if GetCaptainName() ~= GetName() then
        Talk(1, "", VET_201110_STRING_LIST[5])
        return
    end
    if TalkToCaptain() == 1 then
    	return
    end
    if Check_team_member(nTeamSize) == 0 then
    	  Talk(1, "", "C� th�nh vi�n trong t� ��i ch�a �� �i�u ki�n k�ch ho�t!")
        return 0 
    end
    if team_check_rose_activated() == 1 then
    		Talk(1, "", "C� th�nh vi�n trong t� ��i �ang k�ch ho�t m�m hoa r�i!")
    		return 0;
    end
    to_set_fire_now(nTeamSize)
end

function buy_match()
    if GetCash() < VET_201110_ROSE_SEED_COST then
        Talk(1, "", VET_201110_STRING_LIST[4])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if Pay(VET_201110_ROSE_SEED_COST) == 1 then
        local tbItemIds = {VET_201110_TB_ITEM_LIST[1][2],VET_201110_TB_ITEM_LIST[1][3],VET_201110_TB_ITEM_LIST[1][4],1}
        gf_AddItemEx2(tbItemIds, VET_201110_TB_ITEM_LIST[1][1],VET_201110_LOG_TITLE,VET_201110_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function Is_In_City_Map()
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201110_TB_MAPID) do
        if nMapId == VET_201110_TB_MAPID[i] then
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
            Talk(1, "", VET_201110_STRING_LIST[7]) 
            return 0 
        end
		local nDate = zgc_pub_day_turn()
		if VET_201110_ROSE_TaskGroup:GetTask(VET_201110_ROSE_TaskGroup.Date) ~= nDate then
			VET_201110_ROSE_TaskGroup:SetTask(VET_201110_ROSE_TaskGroup.Date,nDate)
			VET_201110_ROSE_TaskGroup:SetTask(VET_201110_ROSE_TaskGroup.Rose_Times,0)
		end
        if Is_In_City_Map() == 0 then
            PlayerIndex = nOldPlayer  --�����Ϣ���߶ӳ�������
            Talk(1, "", VET_201110_STRING_LIST[12]) 
            return 0 
        end
        local nLevel = GetLevel()
        if nLevel < 77 or GetPlayerFaction() == 0 or gf_Check55HaveSkill() == 0 then
            Talk(1, "", VET_201110_STRING_LIST[10]) 
            PlayerIndex = nOldPlayer  --�����Ϣ���߶ӳ�������
            Talk(1, "", VET_201110_STRING_LIST[10]) 
            return 0 
        end
        if GetItemCount(VET_201110_TB_ITEM_LIST[1][2],VET_201110_TB_ITEM_LIST[1][3],VET_201110_TB_ITEM_LIST[1][4]) < 1 then
            PlayerIndex = nOldPlayer  --�����Ϣ���߶ӳ�������
            Talk(1, "", VET_201110_STRING_LIST[8]) 
            return 0 
        end
        local nTimes = VET_201110_ROSE_TaskGroup:GetTask(VET_201110_ROSE_TaskGroup.Rose_Times)
        if times == nil then
            times = 0
        end
        if nTimes >= VET_201110_MAX_TIMES then
            Talk(1, "", format(VET_201110_STRING_LIST[11], VET_201110_MAX_TIMES));
            return 0;
        end
		--ֻ��ͬʱ����һ��������Ϣ
		local nTime = tonumber(GetTime())
		if nTime < (VET_201110_ROSE_TaskGroup:GetTask(VET_201110_ROSE_TaskGroup.Time_End)) then
			Talk(1, "",VET_201110_STRING_LIST[13])
			if PlayerIndex ~= nOldPlayer then
				PlayerIndex = nOldPlayer --һ�����߶ӳ�
				Talk(1, "",VET_201110_STRING_LIST[13])
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
				Talk(1, "", VET_201110_STRING_LIST[14])
				return
        end
    end
	--�Ƿ����߲�ɾ����Ʒ
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201110_STRING_LIST[7])
			PlayerIndex = nOldPlayer
            return
        end
        if DelItem(VET_201110_TB_ITEM_LIST[1][2],VET_201110_TB_ITEM_LIST[1][3],VET_201110_TB_ITEM_LIST[1][4],1) ~= 1 then
			PlayerIndex = nOldPlayer
            return
        end
    end
    PlayerIndex = nOldPlayer
	local nNpcIndex
	local nResult = random(100)
	if  nResult < 95 then
		nNpcIndex = CreateNpc(VET_201110_TB_NPCS[1][1],VET_201110_TB_NPCS[1][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_201110_ROSE_LIFE + 2)  --������ֹNPC��ʧ�ò������һ�ξ���
	else
		nNpcIndex = CreateNpc(VET_201110_TB_NPCS[2][1],VET_201110_TB_NPCS[2][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_201110_ROSE_LIFE + 2)  --������ֹNPC��ʧ�ò������һ�ξ���
	end
    local nOldPlayer = PlayerIndex
    local nEndTime = GetTime() + 300
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201110_STRING_LIST[7])
			PlayerIndex = nOldPlayer
            return
        end
        VET_201110_ROSE_TaskGroup:SetTask(VET_201110_ROSE_TaskGroup.Time_End, GetTime() + VET_201110_ROSE_LIFE + 20)     --��������ֹʱ�䣬��ֹNPC���ⶪʧ������������NPCʱ��10�����ʧ
        CreateTrigger(1, VET_201110_TIME_TB_DEFINE, VET_201110_TIME_USER_DEFINE) 
        ContinueTimer(GetTrigger(VET_201110_TIME_USER_DEFINE)) 
        gf_WriteLogEx(VET_201110_LOG_TITLE,VET_201110_TB_LOG_ACTION_LIST[2]) 					--by xiongyizhi �¼Ӳμӻlog
        VET_201110_ROSE_TaskGroup:SetTask(VET_201110_ROSE_TaskGroup.Npc_Index,nNpcIndex) 
        VET_201110_ROSE_TaskGroup:SetTask(VET_201110_ROSE_TaskGroup.Rose_Times,VET_201110_ROSE_TaskGroup:GetTask(VET_201110_ROSE_TaskGroup.Rose_Times) + 1) 
    end
    PlayerIndex = nOldPlayer
end

function team_check_rose_activated()
	local nCount = 0
	local nOldPlayerIdx = PlayerIndex
	local nTeamSize = GetTeamSize()
	
	for i = 1, nTeamSize do
     		PlayerIndex = GetTeamMember(i)
	    	if GetTrigger(VET_201110_TIME_USER_DEFINE) ~= 0 then
			nCount = 1
			break
		end
	end
	PlayerIndex = nOldPlayerIdx
	return nCount
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

--��������
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end

function CheckToCaptain()
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex
	for i = 1, nTeamSize do
     		PlayerIndex = GetTeamMember(i)
	    	local nTimes = VET_201110_ROSE_TaskGroup:GetTask(VET_201110_ROSE_TaskGroup.Rose_Times)
	    	if nTimes >= 4 then
	    		PlayerIndex = nOldPlayerIdx
	    		return 1
	    	end
	 end
	PlayerIndex = nOldPlayerIdx
	return 0
end

function TalkToCaptain()
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex
	if CheckToCaptain() == 1 then
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetCaptainName() == GetName() then
        			Talk(1, "", "Th�nh vi�n trong team b�n �� tham gia nh�n th��ng 4 l�n trong ng�y h�m nay ")
        			PlayerIndex = nOldPlayerIdx
        			return 1
    			end
		end
	end
	return 0
end
