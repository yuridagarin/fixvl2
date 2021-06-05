Include("\\script\\online\\viet_event\\pet_instance\\head.lua");
Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\̫��þ�\\head.lua")
--Խ��09��7�»����ͷ�ļ�
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua");
--Խ��09��12�»ͷ�ļ�
Include("\\script\\online\\viet_event\\200912\\event_head.lua")
--�ճ�����ͷ�ļ�
Include("\\script\\task\\richangrenwu\\head.lua");
Include("\\script\\online_activites\\task_values.lua");--�������ͷ�ļ�
Include("\\script\\online_activites\\award.lua");--�̫����ؽ���������ɱ��һ���ָ�������ͨ��̫���������
Include("\\script\\online\\award_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

function OnTimer()
	local nMap = GetWorldPos()
	if nMap == 1010 or nMap == 2010 then
		local nSteps = GetTaskTemp(TAIXU_STEPS)
--		local nMapID = GetTaskTemp(TAIXU_MAP_ID)
		local nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
		local nStage = GetTaskTemp(TAIXU_STEP_CONTROL)
		SetTaskTemp(TAIXU_STEPS, nSteps + 1)
		SetMapTaskTemp(nMap, 1, nZone)
		SetMapTaskTemp(nMap, 2, nStage)
		
		local nRemainCount = CountGroupUnit(GROUP_MOB)
		local nRemainPet = CountPet()
		if GetMapTaskTemp(nMap, 4) >= 1 then
			if (nRemainCount > 0 and nSteps == 41) or nRemainPet == 0 then
				local nRealStage = nStage - 1
				Msg2Team("Th�t ��ng ti�c, t� ��i v� b�n ��ng h�nh �� kh�ng v��t qua ���c th� th�ch, k�t qu� �� v��t qua t�i �i th� "..nZone.." t�ng "..nRealStage)
			--	L�u l�i k� l�c s� �i �� v��t qua
				local OldPlayer = PlayerIndex
				for i=1, GetTeamSize() do
	        			PlayerIndex = GetTeamMember(i)
	        			pet_save_history()
	    			end
	    			PlayerIndex = OldPlayer
				PetGameOver(1)
			end
			
			if nRemainCount == 0 and nSteps > 1 and nSteps < 41 then
				if nStage < 10 then
					SetTaskTemp(TAIXU_STEP_CONTROL, nStage + 1)
				else
					SetTaskTemp(TAIXU_ZONE_INDEX, nZone + 1)
					if mod(nZone + 1, 5) == 0 then
						AddGlobalNews("Ch�c m�ng t� ��i c�a "..GetName().." �� xu�t s�c c�ng b�n ��ng h�nh �� v��t qua ���c �i th� "..nZone.." c�a Th�i H� Huy�n C�nh.")
					end
					PetCreateTreasureChest(nZone)
					SetTaskTemp(TAIXU_STEP_CONTROL, 2)
				end
				local OldPlayer = PlayerIndex
				for i=1, GetTeamSize() do
	        			PlayerIndex = GetTeamMember(i)
	        			local nZone1 = GetMapTaskTemp(nMap, 1)
	        			local nStage1 = GetMapTaskTemp(nMap, 2)
	        			local nExp = tMobType[nZone1][3] * nStage1
	    				ModifyExp(nExp)
	    				Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m!")
	    				WriteLogEx("Thai Hu Huyen Canh Ban Dong Hanh", "nh�n exp qua �i")
	    				if GetTaskTemp(TAIXU_PET_USEFOOD) < tLimitPetFoodUsed[nZone1] then
	    					SetTaskTemp(TAIXU_PET_USEFOOD, GetTaskTemp(TAIXU_PET_USEFOOD) + 1)
	    				end
	    				StopTimeGuage(nMap)
	    			end
	    			PlayerIndex = OldPlayer
				SetTaskTemp(TAIXU_STEPS, 0)
			end
		end

		if nSteps == 1 and nRemainCount == 0 then
			local nRealState = nStage - 1
			Msg2Team("B�t ��u �i th� "..nZone.." t�ng "..nRealState)
			PetCreateMonster(nZone, nStage)
			local OldPlayer = PlayerIndex
			for i=1, GetTeamSize() do
        			PlayerIndex = GetTeamMember(i)
        			local nZone1 = GetMapTaskTemp(nMap, 1)
        			local nStage1 = GetMapTaskTemp(nMap, 2) - 1
        			if nZone1 == 1 and nStage1 == 1 then
        				CreatePet(i, nMap)
        				SetMapTaskTemp(nMap, 4, 1)
        			end
        			pet_save_history()		
				WriteLogEx("Thai Hu Huyen Canh Ban Dong Hanh", "V��t �i "..nZone1.." t�ng "..nStage1)
				StartTimeGuage("V��t �i "..nZone1.." t�ng "..nStage1, 600, 0, nMap)
    			end
    			PlayerIndex = OldPlayer
		end
		if GetMapTaskTemp(nMap, 3) == 1 then
			if nZone > 3 then
				Msg2Team("Xin ch�c m�ng, t� ��i c�ng b�n ��ng h�nh �� v��t qua th� th�ch c�a Th�i H� Huy�n C�nh, �� c� th� tham gia c�c th� th�ch kh�c kh� kh�n h�n ph�i s� d�ng Th�i H� �a M�t Qu�!")
				PetGameOver(1)
			end
		end
		if nZone > 17 then
			Msg2Team("Xin ch�c m�ng, t� ��i c�ng b�n ��ng h�nh �� v��t qua ���c to�n b� th� th�ch c�a Th�i H� Huy�n C�nh, h�n g�p l�i � nh�ng th� th�ch kh�c kh� kh�n h�n!")
			AddGlobalNews("Ch�c m�ng t� ��i c�a "..GetName().." �� xu�t s�c c�ng b�n ��ng h�nh v��t qua ���c to�n b� th� th�ch c�a Th�i H� Huy�n C�nh.")
			local OldPlayer = PlayerIndex
			for i=1, GetTeamSize() do
	        		PlayerIndex = GetTeamMember(i)
	        		pet_save_history()
	    		end
	    		PlayerIndex = OldPlayer
			PetGameOver(1)
		end
	else	
		local nSteps = GetTaskTemp(TAIXU_STEPS)
		local nMapid = GetTaskTemp(TAIXU_MAP_ID)
		local nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
		local nStepControl = GetTaskTemp(TAIXU_STEP_CONTROL)
		-- ��¼��ZONE���е�ʱ��
		SetMapTaskTemp(nMapid, nZone + 4, nSteps * 14)
		SetTaskTemp(TAIXU_STEPS, nSteps + 1)
		
		BroadCast(nSteps)		-- �㲥����
	
		if nSteps == nStepControl then		--ˢ��
			if GetTaskTemp(TAIXU_RINGS) >= 4 then		-- ��5���Ժ����ˢ��װ����
				CreateMonster(GetTaskTemp(TAIXU_ZONE_INDEX), 1)
			else
				CreateMonster(GetTaskTemp(TAIXU_ZONE_INDEX), 0)
			end
			SetTaskTemp(TAIXU_RINGS, GetTaskTemp(TAIXU_RINGS) + 1)
			--�������е��˶�����OnKill
			gf_TeamOperateEX(function () 
				SetTaskTemp(TMP_TASK_TAIXU_TAG, 0);
			end);
		end
	end
end

function BroadCast(nSteps)
	-- �㲥ʱ����ȣ���Լ1����һ��
	if mod(nSteps, 4) == 0 and nSteps < 129 then
		Msg2Team("Trong th�i gian �� qua---["..nSteps.." / 129]")
	end
	
	if nSteps == 0 then			-- �տ�ʼ����
		Msg2Team("��i ng� �� v�o Th�i H� Huy�n C�nh, �a M�t qu� b�t ��u ph�t huy t�c d�ng")
	elseif nSteps == 21 or nSteps == 42 or nSteps == 64 then	-- 5, 10, 15����
		Msg2Team("T�c d�ng �a M�t qu� c�ng l�c c�ng m�nh")
	elseif nSteps == 86 then
		Msg2Team("H�nh nh� c� c�n gi� m�t th�i qua")
	elseif nSteps == 107 then
		Msg2Team("C�n gi� m�nh th�i qua l�m m�i ng��i b�ng t�nh")
	elseif nSteps == 120 then
		Msg2Team("Th�i H� Huy�n C�nh ph�t huy s�c m�nh m�i ng��i ��u t�nh gi�c")
	elseif nSteps == 129 then
		Msg2Team("�a M�t qu� m�t t�c d�ng m�i ng��i b� ��a v� th�nh")
		GameOver(1)
	elseif nSteps == 200 + RINGS_INTERVAL then
		GameOver(1)
	end
end

function OnKill()
	if GetTaskTemp(TMP_TASK_TAIXU_TAG) ~= 0 then
		return
	end
	local TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
	
	local nMonsterType = 0
	local nRingMax = 0
	local nZone = 0

	--�Ƿ���ɸ����ճ�����
	if DAILY_TASK_0912_SWITCH == 1 then
		is_he_finish_the_personal_task(TT_TARGET_Name);
	end

	--Խ��09��7�»�������У������ĸ��ʵ�1���¾��ر�
	give_viet20090607_miben();
	--Խ��09��8�»�������У������ĸ��ʵ�1��ˮ����
	give_viet200908_shuiguodai();
	--Խ��2009	���ڻ
	if is_new_year_09_viet_open() == 1 then
		local nRandom = random(1,100)
		if nRandom <= 30 then
			add_bag_new_year_09_viet(1, "Th�i H� Huy�n C�nh")
		end
	end
	
	local nOldIndex = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		nMonsterType = GetTaskTemp(TAIXU_MONSTER_TYPE)
		nRingMax = GetTaskTemp(TAIXU_RINGS_MAX)
		nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
	end
	PlayerIndex = nOldIndex
	
	SetNpcDeathScript(TT_TARGET_Index, "")
	DelGroupUnit(nZone + GROUP_OFFSET, TT_TARGET_Index)
	SetNpcLifeTime(TT_TARGET_Index, 10)
	
	local nRemainCount = CountGroupUnit(nZone + GROUP_OFFSET)
	local nKilledCount = FILE_ROW_COUNT - 2 - nRemainCount
	
	local szType = ""
	local nExp = 0
	
--	if nMonsterType == 1 then	--����
		szType = "Kinh nghi�m"
		nExp = ONE_MONSTER_EXP
--	elseif nMonsterType == 2 then	--��Ϊ
--		szType = "Luy�n"
--		nExp = ONE_MONSTER_POPUR
--	end
	
	
--	if szType ~= "" and (nKilledCount == 1 or mod(nKilledCount, 8) == 0) then
--		Msg2Team("��i ng� hi�n t�i nh�n ���c"..szType.."l� ("..(nExp * nKilledCount * nRingMax)..")")
--	end
	
	-- ����Ƿ�ɱ����һ���������й���
	-- �ǵĻ�
	nOldIndex = PlayerIndex
	if nRemainCount == 0 then
		PlayerIndex = GetTeamMember(0)

		if PlayerIndex > 0 then
			-- ɱ����һ�����������
			local nRingCount = GetTaskTemp(TAIXU_RINGS_MAX)
			local nCurRing = GetTaskTemp(TAIXU_RINGS)
			GiveAward(nMonsterType)	

			-- �Ƿ�ɱ�����е�̫�����
			--���غ���������������
			if nCurRing == nRingCount then
				SetTaskTemp(TAIXU_STEPS, 200)
				--�������ι��ܣ��޸�ˢ���ؽ�����BUG��
				--�������е��˶��ر�OnKill
				gf_TeamOperateEX(function () 
					SetTaskTemp(TMP_TASK_TAIXU_TAG, 1);
				end)
				Msg2Team("Ch�c m�ng! ��i ng� �� tr�i qua �o gi�c th�nh c�ng!")
				--�������ؽ�������
				gf_TeamOperateEX(aw_taixu_award, nCurRing);
				Observer:onTeamEvent(SYSEVENT_TAIXU_STAGE_FINISH, nCurRing)
				return
			end
			-- �����´�ˢ�ֵ�ʱ��Ϊ30���
			SetTaskTemp(TAIXU_STEP_CONTROL, GetTaskTemp(TAIXU_STEPS) + RINGS_INTERVAL)
			--�������ι��ܣ��޸�ˢ���ؽ�����BUG��
			--�������е��˶��ر�OnKill
			gf_TeamOperateEX(function () 
				SetTaskTemp(TMP_TASK_TAIXU_TAG, 1);
			end)
			Msg2Team("Ch�c m�ng ��i ng� �� qua ���c �o gi�c th�"..nCurRing..", �o gi�c th�"..(nCurRing + 1).."H� �nh 30 gi�y sau s� xu�t hi�n, xin chu�n b� th�t t�t! �o gi�c m� ��i ng� nh�n ���c t�ng c�ng "..nRingCount)
			--�������ؽ�������
			gf_TeamOperateEX(aw_taixu_award, nCurRing);
			Observer:onTeamEvent(SYSEVENT_TAIXU_STAGE_FINISH, nCurRing)
		end
	end
	PlayerIndex = nOldIndex
end

function Leave_Map()
	local nMap = GetTaskTemp(TAIXU_MAP_ID)
	if IsCaptain() == 1 then
		if nMap == 1010 or nMap == 2010 then
			PetGameOver(1)
		else
			GameOver(1)
		end
	else
		if nMap == 1010 or nMap == 2010 then
			PetGameOver(0)
		else
			GameOver(0)
		end
	end
end

function OnLogin()
	RemoveTrigger(GetTrigger(TRIGGER_TIMER))
	RemoveTrigger(GetTrigger(TRIGGER_KILL))
	RemoveTrigger(GetTrigger(TRIGGER_RECT))
	RemoveTrigger(GetRunningTrigger())
	
	SetFightState(0)					-- ����Ϊ��ս��
	SetCreateTeam(0)					-- �ر���ӹ���
  InteractiveEnable(1)				-- �������أ�0�رգ�1��
  StallEnable(1)		   				-- ��̯����
	ForbitTrade(0)						-- ��ֹ����
	OpenFriendliness(1)					-- �����ø�
end

--��09��6��7�³¾��ܱ�����
function give_viet20090607_miben()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09071924 then
		local nRand = random(1, 100);
		if nRand <= 10 then
			gf_SetLogCaption("Truy t�m tr��ng sinh ph�");
			gf_AddItemEx({2, 1, 30088, 1}, "B� Ph� C� N�t");
			WriteLogEx("Hoat dong thang 6","Th�i H�",1,"B� Ph� C� N�t");
			gf_SetLogCaption("");
		end
	end
end


--��09��8�»ˮ��������
function give_viet200908_shuiguodai()
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 090907 then
		local nRand = random(1, 100);
		if nRand <= 10 then
			gf_SetLogCaption("[Hoat dong thang 8]");
			nRet = gf_AddItemEx({2, 1, 30097, 1}, "T�i Tr�i C�y");
			if nRet == 1 then
				WriteLogEx("Hoat dong thang 8","Nhan tui trai cay",1,"Danh quai Thai Hu");
			end;
			gf_SetLogCaption("");
		end
	end
end

--��09��12�»ʥ���ǹ�
function give_viet200912_shengdantangguo()
    local nDate = tonumber(date("%y%m%d"));
    if nDate >= 091218 and nDate < 100117 then
        local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE.."- V��t �i th�i h� thu ���c k�o gi�ng sinh"
        gf_AddItemEx2({2, 1, 30138, 10}, "C�y K�o Gi�ng Sinh", szFullLog, 0, 1, 10, 1);
    end
end

function pet_save_history()
	local nMap = GetWorldPos()
	local nZone1 = GetMapTaskTemp(nMap, 1)
	local nStage1 = GetMapTaskTemp(nMap, 2)
	local nSavedStage = mod(GetTask(TSK_PET_TAIXU_POINT), 10) + 1
	local nSavedZone = floor(mod(GetTask(TSK_PET_TAIXU_POINT), 1000) / 10)
	if nSavedZone < nZone1 then
		SetTask(TSK_PET_TAIXU_POINT, GetTask(TSK_PET_TAIXU_POINT) + (nZone1 - nSavedZone) * 10)
		SetTask(TSK_PET_TAIXU_POINT, GetTask(TSK_PET_TAIXU_POINT) - nSavedStage + nStage1 - 1)
	elseif nSavedZone == nZone1 and nSavedStage < nStage1 then
		SetTask(TSK_PET_TAIXU_POINT, GetTask(TSK_PET_TAIXU_POINT) - nSavedStage + nStage1 - 1)
	end
end