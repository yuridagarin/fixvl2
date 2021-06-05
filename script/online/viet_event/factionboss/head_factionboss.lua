--=============================================
-- Event H�i Ng� Cao Th�
-- Created by TuanNA5
--=============================================

Include("\\script\\lib\\globalfunctions.lua");

BOSS_DATE_START = 20100116
BOSS_DATE_END = 20091227
GLB_TSK_BOSS = 1021

tBossName =	{
							[1] = "Huy�n Ch�n", 
							[2] = "Thanh Th�", 
							[3] = "Tu� Minh", 
							[4] = "Ho�ng Ch�nh Nh�t", 
							[5] = "���ng H�", 
							[6] = "D��ng Di�n ��c", 
							[7] = "C� M�c"
						}

function call_faction_boss_new(nTime, nMapID, nX, nY)
	local tHour = {{8,9},{16,17},{22,23}}	
	if tonumber(date("%Y%m%d")) < BOSS_DATE_START then
		return 0
	end	
	if nTime == 0 or tonumber(date("%H")) < tHour[nTime][1] or tonumber(date("%H")) >  tHour[nTime][2]  then
		return 0
	end	
	local nBossVal = GetGlbValue(GLB_TSK_BOSS)
	local nRand = 0
	for i=1,7 do
		if GetBit(nBossVal,i) == 0 then
			nRand = i
			break			
		end
	end	
	if nRand == 0 then
		return
	end
	for i = 1,300 do
	 	nRand = random(1,getn(tBossName))
	 	if GetBit(GetGlbValue(GLB_TSK_BOSS),nRand) == 0 then
	 		SetGlbValue(GLB_TSK_BOSS, SetBit(GetGlbValue(GLB_TSK_BOSS),nRand,1))
	 		break
	 	end
	 end
	local nNpcIndex = CreateNpc(tBossName[nRand], tBossName[nRand], nMapID, nX, nY)
	SetNpcLifeTime(nNpcIndex, 60*60)
	SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\factionboss\\factionboss_death.lua")	
end

function CheckFactionState(szNpcName)
	for i=1,7 do		
		if szNpcName == tBossName[i] then
			return i
		end
	end
	return 0
end