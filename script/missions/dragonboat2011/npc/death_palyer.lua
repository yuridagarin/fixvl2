--by liubo
--��������ű�

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnDeath(Launcher)
	--print("OnDeath() called!")
	ClearColdDown() 	--���ҩCD
	local nBattleState = GetMissionV(MV_LZZ_STATE) 
	if nBattleState ~= MS_STATE_FIGHT then	--�ǿ�ս״̬����
		return 0 
	end 
	--===========================
	local nKillerIndex = NpcIdx2PIdx(Launcher) 
	local nDeathIndex = PlayerIndex
	local nKillerName = "" 
	if nKillerIndex > 0 and nKillerIndex ~= nDeathIndex then
		PlayerIndex = nKillerIndex 
		--���÷���
		local nPoint = 1   --ɱ����һ�õķ���
		local nCampPlace = LZZ_GetCamp()
		--print(nCampPlace)
		if nCampPlace == 1 then 
			SetMissionV(MV_LZZ_CAMPONE_POINT,GetMissionV(MV_LZZ_CAMPONE_POINT)+nPoint)
		elseif nCampPlace == 2 then 
			SetMissionV(MV_LZZ_CAMPTWO_POINT,GetMissionV(MV_LZZ_CAMPTWO_POINT)+nPoint)
		else
			return 0
		end
		--��ʾ
		nKillerName = GetName() 
	else
		return 0
	end	
	PlayerIndex = nDeathIndex 
	Msg2Player("B�n b� "..nKillerName.."C�ng k�ch tr�ng th��ng") 
	--�����ʾ
	LZZ_Panel_Show()
	--============����������==============================
	local nMapId = GetMissionV(MV_LZZ_MAP_ID) 
	--print("nMapId",nMapId)
	local nCampPlace = LZZ_GetCamp()
	--print("nCampPlace",nCampPlace)
	--print(tMsPlayerRev[nCampPlace][1],tMsPlayerRev[nCampPlace][2]);
	SetTempRevPos(nMapId,tMsPlayerRev[nCampPlace][1]*32,tMsPlayerRev[nCampPlace][2]*32) 	--����������
	CastStateToPlayer()
	SetFightState(0)
	return 1
end

--�Ŵ���
function CastStateToPlayer()
	local nKind = GetTask(VET_LZZ_DRAGBOAT_KIND)
	local nLifeValue = GetMaxLife()
	local nCampPlace = LZZ_GetCamp()
	--�������CD
	CastState("imme_clear_skill_interval",-1,0)
	--����
	if nKind == 1 then
		--��ħ������
		CastState("state_life_max_point_add",QINGLONG_LIFE-nLifeValue,18*CONTINUE_TIME,0,201101)
		CastState("state_ignore_defence",100,18*CONTINUE_TIME,0,201105)
		CastState("state_ignore_dodge",100,18*CONTINUE_TIME,0,201109)
	end
	--����
	if nKind == 2 then
		--��ħ������
		CastState("state_life_max_point_add",XUANWU_LFTE-nLifeValue,18*CONTINUE_TIME,0,201107)
		CastState("state_ignore_defence",100,18*CONTINUE_TIME,0,201102)
		CastState("state_ignore_dodge",100,18*CONTINUE_TIME,0,201110)
	end
	--�׻�
	if nKind == 3 then
		--��ħ������
		CastState("state_life_max_point_add",BAIHU_LFTE-nLifeValue,18*CONTINUE_TIME,0,201104)
		CastState("state_ignore_defence",100,18*CONTINUE_TIME,0,201106)
		CastState("state_ignore_dodge",100,18*CONTINUE_TIME,0,201108)
	end
	--��ȸ
	if nKind == 4 then
		--��ħ������
		CastState("state_life_max_point_add",ZHUQUE_LFTE-nLifeValue,18*CONTINUE_TIME,0,201112)
		CastState("state_ignore_defence",100,18*CONTINUE_TIME,0,201103)
		CastState("state_ignore_dodge",100,18*CONTINUE_TIME,0,201111)
	end
	SetPos(tMsPlayerRev[nCampPlace][1],tMsPlayerRev[nCampPlace][2])
end