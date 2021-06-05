--=============================================
--create by liubo 2011.8
--describe:Խ�ϰ�8�·ݻ �������ű�
--related files: baked_cakes_main.lua
--=============================================

Include ("\\script\\online_activites\\2011_08\\activity_02\\baked_cakes_main.lua")
--��ַ���
Include("\\script\\online_activites\\2011_08\\string.lua")

function OnTimer()
	local nTime = tonumber(GetTime())
    if nTime >= (VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End)) then
        RemoveTrigger(GetTrigger(VET_201108_TIME_USER_DEFINE))
		--����tag�������
		VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake,1)
        return 0
    end
    local nRoseIndex = VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Npc_Index)
    local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nRoseIndex)
	local nExpNum = VET_201108_TB_NPCS[1][3]
	if GetNpcName(nRoseIndex) == VET_201108_TB_NPCS[2][2] then
		nExpNum = VET_201108_TB_NPCS[2][3]
	end
    local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
    local nDist = DistanceBetweenPoints(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
    if nDist >= 0 and nDist <= 18 then
		ModifyExp(nExpNum)
		Msg2Player("B�n nh�n d��c "..nExpNum.." �i�m kinh nghi�m")
        	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
    end
end