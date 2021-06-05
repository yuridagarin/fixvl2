-- ================================================================================================ <INCLUDE> ====
Include("\\script\\�ؽ�ɽׯ\\task_script\\����\\task_head.lua");

-- ================================================================================================ <CONST> ====
-- ------------------------------------------------------------------------------------------------ <Act I> ----
-- ------------------------------------------------------------------------------------------------ <Act II> ----
-- ------------------------------------------------------------------------------------------------ <Act III> ----
-- ------------------------------------------------------------------------------------------------ <Act IV> ----
-- ------------------------------------------------------------------------------------------------ <Act V> ----
-- ------------------------------------------------------------------------------------------------ <Act VI> ----
-- ------------------------------------------------------------------------------------------------ <Act VII> ----
-- ------------------------------------------------------------------------------------------------ <Act VIII> ----
-- ------------------------------------------------------------------------------------------------ <Act IX> ---

-- ================================================================================================ <Variable> ====
-- ------------------------------------------------------------------------------------------------ <Act I> ----
ACT1_BOSS_Index = {}
-- ------------------------------------------------------------------------------------------------ <Act I Function> ----
function ACT1_Trap()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()
	-- ===========������򣺽���ؽ�����20G edit by yanjun================
	local nPreservedPlayerIndex = PlayerIndex;	--����PlayerIndex
    	local nMemCount = GetTeamSize();	--��ö�������
    	for i=1,nMemCount do
    		PlayerIndex = GetTeamMember(i);	--��ö�ԱIndex
		Earn(200000);	--����20G
		Msg2Player("Ph�n th��ng: 20 ti�n v�ng.")
	end
	PlayerIndex = nPreservedPlayerIndex;	--�ָ�֮ǰ��PlayerIndex	
	-- ===================================================================	
	if (TC_TASK_EventCount[nZone][2] ~= 1) and (TC_STAGE_State[nZone] >= 10) then
		TC_STAGE_State[nZone] = 11
		TC_TASK_EventCount[nZone][2] = 1
		MC_NoSpawnNPCs(nStage, nMaxLevel, "Gia �inh")
		MC_BeSpawnNPCs(nStage, nMaxLevel, "Gia �inh")
		-- Stage Event Start
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
--		Msg2Player(nETRow.." "..TM_GetMinLevel())
		local nScore = TB_BONUS_TABLE[nETRow][1]/30
		local nCTime = random(180, 360)
		local nRelation = random(-5, 0)
		SetTask(TB_BONUS_SCORE, (GetTask(TB_BONUS_SCORE)+nScore))	-- ���ӻ���
		if random(1,100000) <= 80000 then
			SetTask(TB_BONUS_RELATION, (GetTask(TB_BONUS_RELATION)+nRelation))		-- �����Ѻö�
			Msg2Player("H�ng lo�t gia �inh ph�n n酅")
		end
		if random(1,100000) <= 50000 then
			CastState("state_confusion",100, nCTime)
			Msg2Player("Th�nh l�nh b� mai ph�c, ch�ng bi�t xoay s� ra sao.")
		end
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 3, 1)
		SetTask(SB_EVENT_STAGE[1], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
--		TaskTip("�����¼����ɽ�š��Ҷ�����\n    ���ֱ仯��+"..nScore.."\n    �Ѻñ仯��"..nRelation.."\n    ����ʱ�䣺"..(nCTime/18).."s")
		TaskTip("G�y ra s� ki�n ��c bi�t: S�n M�n. C�m b�y gia �inh")
		-- Stage Event End
		MU_Msg2Team("C� ng��i l�n v�o s�n trang! Ng��i ��u mau b�t h�n!", 2)
		MU_Msg2Team("Ph�a tr��c xu�t hi�n nhi�u h� vi�n gia �inh.")
	end
end
function ACT1_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		if TC_STAGE_State[nZone] < 11 then
--			MC_BeSpawnNPCs(nStage, nMaxLevel, "���Ź�")
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		else
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		end
	end 
end
function ACT1_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_Name == "Gia �inh" then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
--		MU_Msg2Team(TC_TASK_EventCount[nZone][1].."/"..TC_TASK_Conditions[nZone][1])
	end
	if (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][1]) and (TC_STAGE_State[nZone] <= 11) then
		TC_STAGE_State[nZone] = 12
		ACT1_BOSS_Index[nZone] = MC_CreateBoss(1)
		MU_Msg2Team("K� n�o d�m v�o T�ng Ki�m s�n trang n�o lo�n v�y?", 2)
		MU_Msg2Team("Kinh ��ng ��n T�ng qu�n ngo�i vi�n!")
		TC_TASK_Conditions[nZone][4] = TC_TASK_Conditions[nZone][4] + TC_KILL_Stage[nZone]
--		Msg2Player("fenlu: "..TC_TASK_Conditions[nZone][4])
	end
	if (TC_KILL_Stage[nZone] == TC_TASK_Conditions[nZone][4]) and (random(1, 100000) <= 75000) and (TC_STAGE_State[nZone] == 12) then
		-- Stage Event Start
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 4, 1)
		SetTask(SB_EVENT_STAGE[1], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 4, 1)
		AddUnitStates(ACT1_BOSS_Index[nZone], 1, GetUnitBaseStates(ACT1_BOSS_Index[nZone], 1)*2)
		AddUnitStates(ACT1_BOSS_Index[nZone], 2, GetUnitBaseStates(ACT1_BOSS_Index[nZone], 2)*2)
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
		TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/30))
		TB_AddScore(3, random(-5, 0))
		TaskTip("K�ch ho�t s� ki�n ��c bi�t: S�n M�n. T�ng qu�n ngo�i vi�n ph�n n�")
		MU_Msg2Team("D�m ��n T�ng Ki�m s�n trang g�y chuy�n! H�y xem ta d�y d� c�c ng��i th� n�o!!!", 2)
		-- Stage Event End
	end
	if TT_TARGET_Name == "Ch� canh" then
		TC_TASK_EventCount[nZone][3] = TC_TASK_EventCount[nZone][3] + 1
--		Msg2Player("���Ź��� "..TC_TASK_EventCount[nZone][3].."/"..TC_TASK_Conditions[nZone][3])
		if (TC_TASK_EventCount[nZone][3] == TC_TASK_Conditions[nZone][3]) then
			-- Stage Event Start
			local nRnd = random(1,100000)
--			Msg2Player("Random: "..nRnd)
			if nRnd <= 20000 then
				local nETRow = MU_Div(TM_GetMinLevel()) - 2
				TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/30))
				TB_AddScore(3, random(-5, 0))
				local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 2, 1)
				SetTask(SB_EVENT_STAGE[1], nFlag)
				SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
				local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
				local LastedCreatedUnit = CreateNpc("Gia �inh"..tostring(nlevel), "Gia �inh ph�n n�", GetWorldPos())		
				MC_Add2Group(LastedCreatedUnit)
				AddUnitStates(LastedCreatedUnit, 1, GetUnitBaseStates(LastedCreatedUnit, 1)*5)
				AddUnitStates(LastedCreatedUnit, 2, GetUnitBaseStates(LastedCreatedUnit, 2)*5)
				TaskTip("K�ch ho�t s� ki�n ��c bi�t: S�n M�n.Gia �inh ph�n n�")
				MU_Msg2Team("Gia �inh ph�n n�: B�n ng��i d�m �� th��ng ch� y�u c�a ta nu�i! H�y xem l�i h�i c�a ta!", 2)
			end
			-- Stage Event End
		end
	end
	if TT_TARGET_Name == "T�ng qu�n ngo�i vi�n" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
--		Msg2Player("hahaha:"..TC_TASK_EventCount[nZone][3])
		if (TC_TASK_EventCount[nZone][3] == 0) and (GetBit(SB_STAGE_RECORD[nZone], 4) == 0) then
			-- Stage Event Start
			MU_Msg2Team("C�c ng��i v��t qua s�n trang, ch�a �� th��ng b�t c� Ch� gi� nh� n�o! Xem ng��i ch�ng ph�i k� hung t�n, ta kh�ng l�m kh� ng��i n�a!", 2)
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 1, 1)
			SetTask(SB_EVENT_STAGE[1], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
			TB_AddScore(3, random(5, 10))
			TaskTip("K�ch ho�t s� ki�n ��c bi�t: S�n M�n. L� Ng�")
			-- Stage Event End
		else
			MU_Msg2Team("C�c ng��i �� ta ��i l�u qu�!", 2)
		end
		MU_Msg2Team("T�ng qu�n ngo�i vi�n �� b� ��nh b�i!")
	end
	if TT_TARGET_Name == "Gia �inh ph�n n�" then
		MU_Msg2Team("Gia �inh ph�n n�: 55555555555!", 2)
	end
end
-- ------------------------------------------------------------------------------------------------ <Act II> ----
ACT2_BOSSTALK = {
"��n ��ng l�c l�m, b�n trang c� vi�c n�y c�n th��ng l��ng. Khi c�c ng��i v�o ��i vi�n th� Thi�n C��ng Du Long ki�m b�ng nhi�n bi�n m�t. Ta kh�ng nghi ng� c�c ng��i nh�ng vi�c n�y c�ng n�n l�m r�.",
"Sao l�i n�i h� �� v�y? H�y xem ��y!/ACT2_StartBoss",
"L�i t�ng qu�n/ACT2_StartBossWithRules",
"N�u c�c ng��i kh�ng c� t�t gi�t m�nh, h� t�t ph�i x�u h� m� h�a gi�n th�? Xem T�ng Ki�m s�n trang ta l� ch�n kh�ng ng��i �? B�y ��u? B�t n� cho ta!",
"Ch�c ch�n c� k� ��nh c�p Du Long ki�m r�i vu oan cho ta, Ta ph�i l�m r� chuy�n n�y m�i ���c. \n ���c! Ta ��i tin c�a ng��i!",
"Ch�a c� tin t�c Du Long ki�m sao? Chuy�n n�y e r�ng c� ch�t kh� nghi!",
"Th� ra l� do S�n trang gi�o ��nh c�p! Th�t c� l�i v�i c�c v�, l�o phu v� c�ng x�u h�! T�ng qu�n ngo�i vi�n n�i: C�c v� qu� th�t th�n th� b�t ph�m! L�o phu mu�n l�nh gi�o v�i chi�u, xin c�c v� t�n t�nh ch� b�o! B�y ��u? Lui!",
"Ti�u t�c kia! C�c ng��i kh�ng th� �i ���c! ��i ti�u th� �ang ch� c�c ng��i � h�u vi�n!",
"Qu� l� tu�i tr� t�i cao, l�o phu kh�ng th�ng n�i c�c ng��i! Xin m�i v�o trong.",
"C�y ki�m B�ch T�m m� c�c ng��i t�m ���c kh�ng ph�i l� b�o ki�m ta l�m m�t nh�ng n� ���c ��c t� XXX. N�u g�p ���c t�ng qu�n XXX nh� mang tr� l�i cho h�n.",
"Qua Li�n Ho�n S�o l� ��n ��i ��c ki�m, n�u g�p ���c t�ng qu�n th� g�i l�i cho h�n, nh� ��ng l�m kinh ��ng ti�u th�."}		-- ������Ϊ���[����]������
ACT2_GotSword = {}
-- ------------------------------------------------------------------------------------------------ <Act II Function> ----
function ACT2_Talk()
	local nZone = TC_GetTeamZone()
	if TC_STAGE_State[nZone] < 16 then
		if TM_IsCaptain() == 1 then
			Say(ACT2_BOSSTALK[1], 2, ACT2_BOSSTALK[2], ACT2_BOSSTALK[3])
		else
			Talk(1, "", ACT2_BOSSTALK[1])
		end
	else
		if TC_STAGE_State[nZone] == 16 then
			Talk(1, "", ACT2_BOSSTALK[6])
		elseif TC_STAGE_State[nZone] == 17 then
			Talk(1, "", ACT2_BOSSTALK[7])
			MC_Del4Group(TT_GetTarget(), 0)
			MC_ClearGroup(2)
			TC_STAGE_State[nZone] = 19
			MC_CreateBoss(2)
			-- Stage Event Start
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 2, 1)
			SetTask(SB_EVENT_STAGE[2], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/30))
			TB_AddScore(3, random(1, 5))
			TaskTip("K�ch ho�t s� ki�n ��c bi�t: S�n M�n.Th�y L�c Th�ch Xu�t?")
			-- Stage Event End
		elseif TC_STAGE_State[nZone] == 18 then
			Talk(1, "", ACT2_BOSSTALK[10])
			MC_Del4Group(TT_GetTarget(), 0)
			MC_ClearGroup(2)
			TC_STAGE_State[nZone] = 19
			MC_CreateBoss(2)
			ACT2_GotSword[nZone] = 1					-- ������¼�Ƿ�õ��� �̲Ͻ�
			-- Stage Event Start
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 3, 1)
			SetTask(SB_EVENT_STAGE[2], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/30))
			TB_AddScore(3, random(1, 5))
			TaskTip("K�ch ho�t s� ki�n ��c bi�t: S�n M�n. Ki�m T�c")
			-- Stage Event End
		end
	end
end
function ACT2_StartBoss()
	local nZone = TC_GetTeamZone()
	TC_STAGE_State[nZone] = 11			-- 11~14 �ǲ�����
	MC_Del4Group(TT_GetTarget(), 0)
	local nBossIndex = MC_CreateBoss(2)
	AddUnitStates(nBossIndex, 1, 100)
	MU_Msg2Team(ACT2_BOSSTALK[4], 2)
	-- Stage Event Start
	local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 1, 1)
	SetTask(SB_EVENT_STAGE[2], nFlag)
	SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
	local nETRow = MU_Div(TM_GetMinLevel()) - 2
	TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/40))
	TB_AddScore(3, random(-5, 0))
	TaskTip("K�ch ho�t s� ki�n ��c bi�t: S�n M�n. Hi�u l�m")
	-- Stage Event End
end
function ACT2_StartBossWithRules()
	local nZone = TC_GetTeamZone()
	TC_STAGE_State[nZone] = 16			-- 16~19 �ǽ���
	MU_Msg2Team(ACT2_BOSSTALK[5], 2)
end
function ACT2_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		if TC_STAGE_State[nZone] < 11 then
			MC_BeSpawnNPCs(nStage, nMaxLevel, "Gia �inh")
		elseif TC_STAGE_State[nZone] < 19 then
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		end
	end 
end
function ACT2_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "Gi�o ��u") and (TC_STAGE_State[nZone] == 16) then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
--		MU_Msg2Team(TC_TASK_EventCount[nZone][1].."/"..TC_TASK_Conditions[nZone][1])
		if (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][1]) then
			if (random(1,100000) <= 30000) or (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][2]) then
				TC_STAGE_State[nZone] = 17
				MU_Msg2Team(GetName().." ��nh b�i S�n trang gi�o ��u ph�t hi�n 1 thanh h�c ki�m.", 2)
				MU_Msg2Team("��i nh�n ���c v�t ph�m nhi�m v�: Du Long.")
			elseif random(1,100000) <= 10000 then
				TC_STAGE_State[nZone] = 18
				MU_Msg2Team(GetName().." ��nh b�i S�n trang gi�o ��u ph�t hi�n 1 thanh l�c ki�m.", 2)
				MU_Msg2Team("��i nh�n ���c v�t ph�m nhi�m v�: B�ch T�m")
			end
		end
	end
	if TT_TARGET_Name == "T�ng qu�n n�i vi�n" then
		if (TC_STAGE_State[nZone] == 11) then
			MU_Msg2Team(ACT2_BOSSTALK[8], 2)
		elseif (TC_STAGE_State[nZone] == 19) and (ACT2_GotSword[nZone] ~= 1) then
			MU_Msg2Team(ACT2_BOSSTALK[9], 2)
		elseif (TC_STAGE_State[nZone] == 19) and (ACT2_GotSword[nZone] == 1) then
			MU_Msg2Team(ACT2_BOSSTALK[11], 1)
		end
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("T�ng qu�n ngo�i vi�n �� b� ��nh b�i!")
	end
end
-- ------------------------------------------------------------------------------------------------ <Act III> ----
ACT3_ODDER_POS = {
{1587, 3134}, {1609, 3111}, {1631, 3088}, {1660, 3092}, {1684, 3113}, {1681, 3132}, {1664, 3153}, {1644, 3174}}
ACT3_ODDER_Table = {}
ACT3_Keeper = {}
ACT3_Traped = {}
ACT3_CONTRACK = {2, 0, 213}				-- ������
ACT3_SKEY = {2, 0, 337}					-- ��Կ��
ACT3_CKEY = {2, 0, 336}					-- ͭԿ��
ACT3_ContrackSent = {}
-- ------------------------------------------------------------------------------------------------ <Act VIII Function> ----
function ACT3_Trap()
	local nZone = TC_GetTeamZone()
	-- Stage Event Start
	Msg2Player("B�n �� gi�m l�n v��n hoa�� "..ACT3_Traped[nZone].."/3]")
	ACT3_Traped[nZone] = ACT3_Traped[nZone] + 1
	-- Stage Event End
end
function ACT3_Talk()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_ModID == "�n m�y" then
		-- Stage Event Start
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
		TB_AddScore(1, (TB_BONUS_TABLE[nETRow][3]/30))
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 3, 1)
		SetTask(SB_EVENT_STAGE[3], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
		if (GetItemCount(ACT3_CONTRACK[1], ACT3_CONTRACK[2], ACT3_CONTRACK[3]) >= 1) and (ACT3_ContrackSent[nZone] == 0) then
			DelItem(ACT3_CONTRACK[1], ACT3_CONTRACK[2], ACT3_CONTRACK[3], 1)
			ACT3_ContrackSent[nZone] = 1
			if random(1,100000) < 10000 then
				AddItem(ACT3_SKEY[1], ACT3_SKEY[2], ACT3_SKEY[3], 1)
			else
				AddItem(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3], 1)
			end
			MU_Msg2Team("��y l� <color=green>Ch�a kh�a th�n k�<color> tr��c ��y khi ti�u nh�n b� l�c � h�u s�n nh�t ���c, xin t�ng l�i cho ��i nh�n!", 1)
		elseif (ACT3_ContrackSent[nZone] == 1) then
			MU_Msg2Team("�a t� ��i nh�n! Cu�i c�ng ti�u nh�n �� ���c t� do!", 2)
		else
			MU_Msg2Team("Ti�u nh�n v�n s�ng � T� Ch�u, ��i ti�u th� b�o ng��c, c��p ti�n c�a r�i b�t giam c�m ��n nay (s�t s�i kh�c)�C�c ��i hi�p th�n c�ng c�i th�, x�t th��ng k� kh�n kh� n�y h�y gi�p 2800 l��ng chu�c th�n �� ti�u nh�n tr� v� �o�n t� v�i gia ��nh!", 1)
		end
		-- Stage Event End
	end
end
function ACT3_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 19) then
		MC_BeSpawnNPCs(nStage, nMaxLevel, "Gia �inh")
	end 
end
function ACT3_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "Gia �inh") and (TC_TASK_EventCount[nZone][1] < TC_TASK_Conditions[nZone][1]) then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
--		MU_Msg2Team(TC_TASK_EventCount[nZone][1].."/"..TC_TASK_Conditions[nZone][1])
		if mod(TC_TASK_EventCount[nZone][1], 2) == 0 then
			MU_Msg2Team(MU_GetColoredText("L�o b�c", "green")..": Ng��i ��u! C� k� x�m nh�p H�u vi�n tr�m ��!", 2)
			ACT3_CreateOdder()
		end
	end
	if (TT_TARGET_Name == "L�o b�c") then
		TC_STAGE_State[nZone] = TC_STAGE_State[nZone] + 1
--		Msg2Player(TC_STAGE_State[nZone])
		if TC_STAGE_State[nZone] == 18 then
			TC_STAGE_State[nZone] = 19
			local nBossIndex = MC_CreateBoss(3)
			if ACT3_Traped[nZone] >= 3 then
				MU_Msg2Team("K� n�o d�m ��n ��y n�o lo�n, kinh ��ng b�n ti�u th� ngh� ng�i? �i da! Sao ��p n�t hoa ph� dung c�a ta! Th�t kh�ng th� tha th�!", 2)
				-- Stage Event Start
				local nETRow = MU_Div(TM_GetMinLevel()) - 2
				TB_AddScore(1, (TB_BONUS_TABLE[nETRow][3]/30))
				TB_AddScore(3, random(-5,0))
				local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 2, 1)
				SetTask(SB_EVENT_STAGE[3], nFlag)
				SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
				AddUnitStates(nBossIndex, 1, GetUnitBaseStates(nBossIndex, 1)*(ACT3_Traped[nZone]^0.5))
				AddUnitStates(nBossIndex, 2, GetUnitBaseStates(nBossIndex, 2)*(ACT3_Traped[nZone]^0.5))
				TaskTip("K�ch ho�t s� ki�n ��c bi�t: H�u Hoa Vi�n. ��i ti�u th� ph�n n�")
				-- Stage Event End
			else
				MU_Msg2Team("K� n�o d�m ��n ��y n�o lo�n, kinh ��ng b�n ti�u th� ngh� ng�i?", 2)
			end
			MU_Msg2Team("�� l�m kinh ��ng ��i ti�u th�!")
		end
	end
	if (TC_TASK_EventCount[nZone][2] >= 6) and (TC_STAGE_State[nZone] <= 12) and (ACT3_Keeper[nZone] == 0) then		-- �ж��Ƿ��� 6 ��Ů��ͬʱ����
		-- Stage Event Start
		ACT3_Keeper[nZone] = 1
		-- Stage Event End
	end
	if (TC_STAGE_State[nZone] == 19) and (ACT3_Keeper[nZone] == 1) then			-- ����ִ��
		ACT3_Keeper[nZone] = 2
		if random(1, 100000) <= 80000 then
			-- Stage Event Start
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/30))
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 1, 1)
			SetTask(SB_EVENT_STAGE[3], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
			local nMapID = GetWorldPos()
			local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
			local LastedCreatedUnit = CreateNpc("L�o b�c"..tostring(nlevel), "H�u Hoa Vi�n nghi tr��ng", nMapID, 1630, 3147)		
			MC_Add2Group(LastedCreatedUnit)
			AddUnitStates(LastedCreatedUnit, 1, GetUnitBaseStates(LastedCreatedUnit, 1)*5)
			AddUnitStates(LastedCreatedUnit, 2, GetUnitBaseStates(LastedCreatedUnit, 2)*5)
			TaskTip("K�ch ho�t s� ki�n ��c bi�t: H�u Hoa Vi�n.H�u Hoa Vi�n nghi tr��ng")
			MU_Msg2Team("L�i c� k� to gan x�m nh�p H�u Hoa vi�n! ��i ti�u th� ph�i ta ��n b�o v�!", 2)
			-- Stage Event End
		end
	end
	if TT_TARGET_Name == "��i ti�u th�" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		if TM_SexCount() == 0 then
			-- Stage Event Start
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/30))
			TB_AddScore(3, random(4, 6))
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 4, 1)
			SetTask(SB_EVENT_STAGE[3], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 4, 1)
			TaskTip("K�ch ho�t s� ki�n ��c bi�t: H�u Hoa Vi�n. T�m t� thi�u n�")
			MU_Msg2Team("C�c c� n��ng qu� nhi�n v� ngh� cao c��ng! B�n ti�u th� v�n kh�m ph�c c�c n� nh�n kh�ng t� v� nhu m� �o l�, ch�ng t� n� nhi ta kh�ng thua g� b�n nam nh�n ��ng tr�ch! M�i ch� v� �i qua! H�y gi�p ta gi�o hu�n m�y g� kia!", 2)
			-- Stage Event End
		else
			MU_Msg2Team("C�c ng��i �� ��p n�t hoa ph� dung c�a ta, ch�y ��u cho tho�t h�?", 2)
		end
		MU_Msg2Team("�� ��nh b�i ��i ti�u th�!")
		if random(1,100000) <= 90000 then
			local nMapID = GetWorldPos()
			local nRndPoint = random(1, 8)
			local LastedCreatedUnit = CreateNpc("�n m�y", "Gia �inh ��ng th��ng", nMapID, ACT3_ODDER_POS[nRndPoint][1], ACT3_ODDER_POS[nRndPoint][2])
			SetNpcDeathScript(LastedCreatedUnit, SF_FILE)
			MC_Add2Group(LastedCreatedUnit)
			MU_Msg2Team("Gia �inh ��ng th��ng:......", 2)
		end
	end
end
-- ------------------------------------------------------------------------------------------------ <Act IV> ----
ACT4_SWITCH_POS = {					-- ��������
{1796, 2912}, {1810, 2955}, {1856, 2977}, {1761, 2949}, {1770, 2999}, {1818, 3009}, {1714, 2998}, {1741, 3032}, {1772, 3064}}
ACT4_SWITCH_DEFENDER = {			-- ��������
{{1795, 2911}, {1801, 2910}, {1798, 2900}, {1790, 2907}}, {{1801, 2960}, {1806, 2952}, {1812, 2942}, {1804, 2949}},
{{1856, 2981}, {1862, 2973}, {1857, 2963}, {1850, 2972}}, {{1761, 2853}, {1767, 2947}, {1763, 2938}, {1756, 2944}},
{{1769, 3004}, {1776, 2995}, {1772, 2986}, {1764, 2993}}, {{1817, 3013}, {1822, 3005}, {1819, 2996}, {1812, 3005}},
{{1713, 3003}, {1708, 2995}, {1719, 2996}, {1716, 2985}}, {{1741, 3037}, {1747, 3030}, {1743, 3020}, {1736, 3027}},
{{1772, 3070}, {1777, 3062}, {1773, 3051}, {1766, 3059}}}
ACT4_SWITCH_Name = {"<T� Thanh L� h��ng >","<Thanh Lam L� h��ng >","<T� Lam L� h��ng >"}
ACT4_SWITCH_Table = {}
ACT4_SWITCH_Count = {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
ACT4_SWITCH_DEBUFF = {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
ACT4_SWITCH_TimeLim = {{999,999,999},{999,999,999},{999,999,999},{999,999,999},{999,999,999}}
ACT4_SWITCH_Index = {{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}}}
ACT4_BOSS_Spwaned = {0,0,0,0,0}
-- ------------------------------------------------------------------------------------------------ <Act IV Function> ----
function ACT4_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		MC_BeSpawnNPCs(nStage, nMaxLevel)
		if mod(TC_TIMER_Count[nZone],2) == 0 then		-- ÿ28�����һ�� Debuff
--			MU_Msg2Team("ʱ�侭���С��� ["..TC_TIMER_Count[nZone].."]")
			ACT4_Debuff(1)
		end
--		Msg2Player(ACT4_SWITCH_TimeLim[nZone][1].."/"..ACT4_SWITCH_TimeLim[nZone][2].."/"..ACT4_SWITCH_TimeLim[nZone][3])
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][1] then
			ACT4_RebrithSwitch(nZone, 1)
			ACT4_SWITCH_TimeLim[nZone][1] = 999
			MU_Msg2Team("K� Th�ch c�m �ng, b� ph� ho�i"..ACT4_SWITCH_Name[1].."�� t� ��ng tr�ng sinh!")
		end
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][2] then
			ACT4_RebrithSwitch(nZone, 2)
			ACT4_SWITCH_TimeLim[nZone][2] = 999
			MU_Msg2Team("K� Th�ch c�m �ng, b� ph� ho�i"..ACT4_SWITCH_Name[2].."�� t� ��ng tr�ng sinh!")
		end
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][3] then
			ACT4_RebrithSwitch(nZone, 3)
			ACT4_SWITCH_TimeLim[nZone][3] = 999
			MU_Msg2Team("K� Th�ch c�m �ng, b� ph� ho�i"..ACT4_SWITCH_Name[3].."�� t� ��ng tr�ng sinh!")
		end
	end 
end
function ACT4_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_ModID == "Ng��i V� h�nh2" then
		local nType = ACT4_GetSwitchType(TT_TARGET_Name)
		ACT4_SWITCH_TimeLim[nZone][nType] = TC_TIMER_Count[nZone] + 6				-- ʱ�䰡ʱ��
		ACT4_SWITCH_Count[nZone][nType] = ACT4_SWITCH_Count[nZone][nType] - 1
		MU_Msg2Team("Trong 90 gi�y h�y ph� h�ng 1"..ACT4_SWITCH_Name[nType]..", b�ng kh�ng K� Th�ch c�m �ng b� ph� h�ng"..ACT4_SWITCH_Name[nType].." s� t� ��ng tr�ng sinh!")
		MC_Del4Group(TT_TARGET_Index, 2)
		for i=1,3 do
			for j=1,3 do
				if ACT4_SWITCH_Index[nZone][i][j] == TT_TARGET_Index then
					ACT4_SWITCH_Index[nZone][i][j] = 0
				end
			end
		end
		if (ACT4_SWITCH_Count[nZone][nType] == 0) then
			ACT4_SWITCH_DEBUFF[nZone][nType] = 1
			ACT4_SWITCH_TimeLim[nZone][nType] = 999
			if (ACT4_BOSS_Spwaned[nZone] == 0) then
				MU_Msg2Team("Ti�p t�c th�ng ti�n l� c�m ��a c�a b�n trang, c�c anh h�ng h�y quay l�i �i!",2)
				MC_CreateBoss(4)
				ACT4_BOSS_Spwaned[nZone] = 1
			else
				MU_Msg2Team("��nh �m m�t ti�ng,"..ACT4_SWITCH_Name[nType].."�� b� ph� h�ng ho�n to�n, kh�ng th� tr�ng sinh n�a, �� ph�t huy h�t uy l�c!")
			end
		end
	end
	if TT_TARGET_Name == "��i trang ch�" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("B�n ta ch� xem! C�c ng��i ch�y kh�ng tho�t ��u!", 2)
		MU_Msg2Team("�� ��nh b�i ��i trang ch�!")
	end
end

-- ------------------------------------------------------------------------------------------------ <Act V> ----
ACT5_SWORD_PICKPOS = {					-- ȡ������
{1710, 3317}, {1673, 3343}, {1678, 3407}, {1718, 3420}, {1728, 3363}}
ACT5_SWORD_DROPPOS = {					-- �彣����
{1632, 3193}, {1610, 3164}, {1583, 3170}, {1574, 3203}, {1600, 3225}}
ACT5_SWORD_PICKDEFENDER = {				-- ȡ��ʱ��������
{{1710, 3326}, {1716, 3325}, {1714, 3330}, {1711, 3332}, {1707, 3330}, {1704, 3324}},
{{1682, 3341}, {1681, 3330}, {1685, 3334}, {1686, 3340}, {1685, 3347}, {1682, 3350}},
{{1686, 3400}, {1684, 3390}, {1689, 3391}, {1691, 3398}, {1690, 3405}, {1687, 3408}},
{{1710, 3404}, {1716, 3399}, {1711, 3395}, {1706, 3396}, {1705, 3404}, {1705, 3411}},
{{1720, 3357}, {1721, 3345}, {1716, 3349}, {1715, 3358}, {1719, 3364}, {1723, 3365}}}
ACT5_SWORD_DROPDEFENDER = {				-- �彣ʱ��������
{{1630, 3188}, {1634, 3185}, {1630, 3179}, {1625, 3182}, {1625, 3190}, {1628, 3196}},
{{1609, 3165}, {1606, 3159}, {1605, 3166}, {1608, 3171}, {1612, 3171}, {1615, 3168}},
{{1585, 3172}, {1587, 3164}, {1588, 3171}, {1586, 3175}, {1582, 3175}, {1579, 3172}},
{{1575, 3199}, {1569, 3195}, {1573, 3192}, {1577, 3193}, {1579, 3201}, {1578, 3207}},
{{1599, 3216}, {1607, 3217}, {1603, 3211}, {1597, 3211}, {1596, 3219}, {1597, 3227}}}
ACT5_SWORD_SHAPE = {
{{1, 1}, {2, 2}, {3, 3}, {4, 4}, {5, 5}},	-- ����ľ��ľ��ˮ��ˮ������������
{{1, 3}, {3, 2}, {2, 4}, {4, 5}, {5, 1}},	-- ����ˮ��ˮ��ľ��ľ���𣬻�������������
{{1, 2}, {2, 5}, {5, 3}, {3, 4}, {4, 1}},	-- ���ľ��ľ����������ˮ��ˮ�˻𣬻�˽�
{{1, 4}, {4, 3}, {3, 5}, {5, 2}, {2, 1}},	-- ��ӻ𣬻��ˮ��ˮ����������ľ��ľ�ӽ�
{{1, 5}, {5, 4}, {4, 2}, {2, 3}, {3, 1}}}	-- �����������ƻ𣬻���ľ��ľ��ˮ��ˮ�ƽ�
ACT5_SWORD_SHAPEWORD = {
"Kim quy Kim, M�c quy M�c, Th�y quy Th�y, H�a quy H�a, Th� quy Th�, ��u l� <color=metal>T��ng Th�<color>.",
"Kim sinh Th�y, Th�y sinh M�c, M�c sinh H�a, H�a sinh Th�, Th� sinh Kim, ��u l� <color=metal>T��ng Sinh<color>.",
"Kim kh�c M�c, M�c kh�c Th�, Th� kh�c Th�y, Th�y kh�c H�a, H�a kh�c Kim, ��u l� <color=metal>T��ng T�<color>.",
"Kim t�ng H�a, H�a t�ng Th�y, Th�y t�ng Th�, Th� t�ng M�c, M�c t�ng Kim, ��u l� <color=metal>T��ng Tr�<color>.",
"Kim ph� Th�, Th� ph� H�a, H�a ph� M�c, M�c ph� Th�y, Th�y ph� Kim, ��u l� <color=metal>T��ng Ph�<color>."}
ACT5_PICKORDER_Table = {}
ACT5_DROP_ROW = {0,0,0,0,0}		-- ��¼�彣ʱȷ������
-- ------------------------------------------------------------------------------------------------ <Act V Function> ----
function ACT5_Talk()
	local nZone = TC_GetTeamZone()
	local nStatesLimit = 100
	if TT_TARGET_ModID ~= "" then
--		Msg2Player(type(TT_TARGET_ModID))
--		return
	end
	local nSwordType = ACT5_GetSwordFlag(TT_GetTarget())
	if TC_STAGE_State[nZone] < 15 then
		if (TT_TARGET_Name == "Kim ki�m") and (GetStrength() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "M�c ki�m") and (GetDexterity() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "Th�y ki�m") and (GetEnergy() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "H�a Ki�m") and (GetObserve() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "Th� ki�m") and (GetVitality() >= nStatesLimit) then
		else
			Msg2Player("B�n kh�ng �� n�ng l�c r�t thanh ki�m n�y!")
			return
		end
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
		if TC_TASK_EventCount[nZone][1] == 1 then
			ACT5_PICKORDER_Table[nZone] = {}
		end
		ACT5_PICKORDER_Table[nZone][TC_TASK_EventCount[nZone][1]] = TT_TARGET_Name
		MU_Msg2Team(TT_TARGET_Name.."�� b� r�t ra!", 2)
		MC_Del4Group(TT_GetTarget(), 0)
--		Msg2Player(nSwordType.." "..TT_TARGET_Name)
		ACT5_CreateDefender(nSwordType, TT_TARGET_Name)
	else
		Msg2Player(GetName().."nh�p v�o Ki�m ��i.")
		local nWithOrder = ACT5_Word2Num(ACT5_PICKORDER_Table[nZone][TC_TASK_EventCount[nZone][2]])
		local IndexForLoop = 1
		local IndexForLoopEnd = 5
		if ACT5_DROP_ROW[nZone] ~= 0 then
			IndexForLoop = ACT5_DROP_ROW[nZone]
			IndexForLoopEnd = ACT5_DROP_ROW[nZone]
		end
		for i=IndexForLoop, IndexForLoopEnd do
			for j=1, 5 do
				if (ACT5_SWORD_SHAPE[i][j][1] == nWithOrder) and (ACT5_SWORD_SHAPE[i][j][2] == nSwordType) then
					if (ACT5_DROP_ROW[nZone] == 0) or (ACT5_DROP_ROW[nZone] == i) then
						ACT5_DROP_ROW[nZone] = i
						TC_TASK_EventCount[nZone][2] = TC_TASK_EventCount[nZone][2] + 1
						MC_Del4Group(TT_GetTarget(), 0)
						MU_Msg2Team(GetName().."��m "..ACT5_Word2Num(nWithOrder).." v�o "..ACT5_Word2Num(nSwordType)..". ["..(TC_TASK_EventCount[nZone][2]-1).."/"..(TC_TASK_Conditions[nZone][2]-1).."]")
						if TC_TASK_EventCount[nZone][2] >= TC_TASK_Conditions[nZone][2] then
							MC_CreateBoss(5)
							MU_Msg2Team("Tr��ng l�o T�ng Ki�m C�c:"..ACT5_SWORD_SHAPEWORD[ACT5_DROP_ROW[nZone]].."�� l�u ko c� ai d�m qua ��y. Ti�u t�! Ng��i l�i ��n �? �� ta xem b�n l�nh c�a ng��i th� n�o.", 2)
							MU_Msg2Team("Tr��ng l�o T�ng Ki�m C�c hi�n th�n!")
							-- Stage Event Start
							local nETRow = MU_Div(TM_GetMinLevel()) - 2
							TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/30))
							TB_AddScore(3, random(3, 6))
							local nFlag = SetBit(GetTask(SB_EVENT_STAGE[5]), ACT5_DROP_ROW[nZone], 1)
							SetTask(SB_EVENT_STAGE[5], nFlag)
							SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], ACT5_DROP_ROW[nZone], 1)
							TaskTip("K�ch ho�t s� ki�n ��c bi�t: T�ng Ki�m C�c. Ng� h�nh chi t��ng")
							-- Stage Event End
						end
						return
					end
				end
			end
		end
		MU_Msg2Team("C�m ki�m xu�ng ph�t hi�n m�t lu�ng s�c m�nh d�i ra, kh� l�ng ��ch n�i!")
		ACT5_CreateDefender(nSwordType, 1)		
	end
end
function ACT5_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
end
function ACT5_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "B�o v� ng� h�nh") and (TC_STAGE_State[nZone] < 15) then
		TC_STAGE_State[nZone] = TC_STAGE_State[nZone] + 1
--		MU_Msg2Team((TC_STAGE_State[nZone]-10).."/5")
		if TC_STAGE_State[nZone] == 15 then
			ACT5_CreateDesk()
			MU_Msg2Team("T�ng Ki�m C�c ��i Vi�n v�ng ��n ti�ng ch�y n�ng n� c�a gu�ng quay.", 2)
		end
	end
	if (TT_TARGET_Name == "Tr��ng l�o T�ng Ki�m C�c") then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("Giang s�n l�m ng��i t�i gi�i! L� n�o ta l�i b� g�i n�i n�y! Th�t ta �� gi� r�i sao?", 2)
		MU_Msg2Team("�� ��nh b�i Tr��ng l�o T�ng Ki�m C�c!")	
	end
end

-- ------------------------------------------------------------------------------------------------ <Act VI> ----
-- ------------------------------------------------------------------------------------------------ <Act VII> ----
-- ------------------------------------------------------------------------------------------------ <Act VIII> ----
ACT8_PATH_Pointer = {}
ACT8_PATH_PortIn = {
{8,1387,3093},{8,1432,3161},{8,1441,3046},
{8,1536,3157},{8,1593,3081},{8,1534,3052},
{8,1597,2839},{8,1551,2752},{8,1546,2863},
{8,1429,2752},{8,1381,2834},{8,1437,2866},
{8,1489,3108},{8,1572,2946},{8,1484,2786},{8,1405,2956}}
ACT8_PATH_PortOut = {
{8,1383,3098},{8,1427,3163},{8,1437,3053},
{8,1542,3161},{8,1598,3086},{8,1539,3058},
{8,1594,2845},{8,1547,2758},{8,1541,2866},
{8,1434,2753},{8,1382,2842},{8,1438,2871},
{8,1489,3116},{8,1566,2949},{8,1483,2794},{8,1409,2961}}
ACT8_CHEST_S_Pos = {
{1378,3098}, {1434,3046}, {1423,3165}, {1495,3117}, {1546,3161}, {1541,3050}, {1589,3090}, {1564,2941},
{1590,2837}, {1539,2859}, {1545,2750}, {1491,2790}, {1438,2750}, {1444,2865}, {1389,2830}, {1409,2947}}
ACT8_CHEST_L_Pos = {
{1378,2989}, {1489,3168}, {1510,3154}, {1594,2984}, {1589,2936}, {1497,2755}, {1473,2756}, {1383,2947}, {1497,3030},
{1590,2837}, {1513,3103}, {1522,3021}, {1505,2963}, {1520,2921}, {1510,2889}, {1472,2887}, {1459,2927}, {1444,3000}}
ACT8_CHEST_StoreIndex = {}
-- ------------------------------------------------------------------------------------------------ <Act VIII Function> ----
function ACT8_CalculatePath(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local PATH_Pointer = {}
	local TP_COMMON = {{1, 2, 3},{1, 3, 2},{2, 1, 3},{2, 3, 1},{3, 1, 2},{3, 2, 1}}
	local TP_START = {{3, 2, 1},{2, 3, 1},{3, 1, 2},{1, 3, 2}}
	local TP_END = {{1, 3, 2},{2, 3, 1},{3, 2, 1},{3, 1, 2}}
	local GroupPath = {{1, 2, 3},{1, 2, 3},{1, 2, 3},{1, 2, 3}}
	local GroupPathLink = {1, 2, 3, 4}
	local GroupStart = random(1, 4)
	GroupPathLink[GroupStart] = 1
	local GroupEnd = GroupPathLink[random(2, 4)]
	GroupPathLink = {1, 2, 3, 4}
	for i=1, 4 do
		local nTempRND = random(i, 4)
		local nTempEXC = GroupPathLink[nTempRND]
		GroupPathLink[nTempRND] = GroupPathLink[i]
		GroupPathLink[i] = nTempEXC
	end
	for i=1, 4 do
		if i == GroupStart then
			local nTempRND = random(i, 4)
			for j=1, 3 do
				GroupPath[i][j] = TP_START[nTempRND][j]
			end
		elseif i == GroupEnd then
			local nTempRND = random(i, 4)
			for j=1, 3 do
				GroupPath[i][j] = TP_END[nTempRND][j]
			end
		else
			local nTempRND = random(i, 6)
			for j=1, 3 do
				GroupPath[i][j] = TP_COMMON[nTempRND][j]
			end
		end	
	end
	local nCurGroup = 0
	local nPreGroup = 0
	local nNextGroup = 0
	local nTempINT = 0
	for i=1, 4 do
		for j=1, 4 do
			if i == GroupPathLink[j] then
				nCurGroup = j
			end
		end
		nPreGroup = nCurGroup - 1
		nNextGroup = nCurGroup + 1
		if nPreGroup == 0 then
			nPreGroup = 4
		end
		if nNextGroup == 5 then
			nNextGroup = 1
		end
		local nCurGroupIndex = (GroupPathLink[nCurGroup]-1)*3
		local nPreGroupIndex = (GroupPathLink[nPreGroup]-1)*3
		local nNextGroupIndex = (GroupPathLink[nNextGroup]-1)*3
		PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][1]] = nPreGroupIndex+GroupPath[GroupPathLink[nPreGroup]][2]
		PATH_Pointer[nPreGroupIndex+GroupPath[GroupPathLink[nPreGroup]][2]] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][1]
		PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][2]] = nNextGroupIndex+GroupPath[GroupPathLink[nNextGroup]][1]
		PATH_Pointer[nNextGroupIndex+GroupPath[GroupPathLink[nNextGroup]][1]] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][2]
		if i == GroupStart then
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = 0
		elseif i == GroupEnd then
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = 17
		else
			local nBonusPos = 13 + nTempINT * 2
			nTempINT = nTempINT + 1
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = nBonusPos
			PATH_Pointer[nBonusPos] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]
			PATH_Pointer[nBonusPos+1] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]
		end
	end
	ACT8_PATH_Pointer[nZone] = {}
	for i=1, 16 do
		ACT8_PATH_Pointer[nZone][i] = PATH_Pointer[i]
	end
end
--------------------------------------------------------------------------------

function ACT8_Trap()
	local nZone = TC_GetTeamZone()
	ACT8_CalculatePath();
	TC_STAGE_State[nZone] = 20;
	if (TC_STAGE_State[nZone] >= 10) then
		local nTrapIndex = ACT8_GetTPTIndex()
		local nTrapTarget = ACT8_PATH_Pointer[nZone][nTrapIndex]
--		local nMapID = 898 + nZone * 10
--		if (nTrapTarget >= 1) and (nTrapTarget <= 16) then
--			nMapID = ACT8_PATH_PortOut[nTrapTarget][1] - 10 + nZone * 10
--		end
		local nMapID = GetWorldPos();
		if nTrapTarget == 0 then
		elseif nTrapTarget == 17 then
		elseif (nTrapTarget == 13) or (nTrapTarget == 15) then
			if random(1, 10000) <= 5000 then
				NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget][2], ACT8_PATH_PortOut[nTrapTarget][3])
			else
				NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget+1][2], ACT8_PATH_PortOut[nTrapTarget+1][3])
			end
		else
			NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget][2], ACT8_PATH_PortOut[nTrapTarget][3])
		end
	end
end
function ACT8_Timer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMaxLevel = TM_GetMaxLevel()
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 30) then
		MC_BeSpawnNPCs(nStage, nMaxLevel)
	end
	if mod(TC_TIMER_Count[nZone], 20) == 0 then
		ACT8_DelSmallChest()
		ACT8_CreateSmallChest()
	end
end
function ACT8_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_Name == "Ho�ng Kim b�o r��ng" then
		Earn(100000)
	end
	if TT_TARGET_Name == "R��ng b�c" then
		ModifyExp(100000)
	end
end
-- ------------------------------------------------------------------------------------------------ <Act IX> ----
SWORD_LOC = {{1505, 3154}, {1473, 3335}, {1612, 3374}, {1677, 3218}, {1589, 3116}}
SWORD_NAME = {"Kim Ki�m phong kh�c", "M�c Ki�m phong kh�c", "Th�y Ki�m phong kh�c", "H�a Ki�m phong kh�c", "Th� Ki�m phong kh�c"}
SWORD_MINNAME = {"Kim ki�m", "M�c ki�m", "Th�y ki�m", "H�a Ki�m", "Th� ki�m"}
SWORD_SEALTIME = {}
SWORD_SEALINDEX = {}
SWORD_BOSSSPWANED = {0,0,0,0,0}
SWORD_SleepOne = {}
-- ------------------------------------------------------------------------------------------------ <Act IX Function> ----
function ACT9_Talk()
	if TT_TARGET_ModID == "B�n Long Tr�" then
		Talk(1,"","C�u Tuy�t hi�n th�, ki�m kh� tung ho�nh, tr�n tr�i d��i ��t, duy ng� ��c t�n!")
	end
end
function ACT9_Timer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMaxLevel = TM_GetMaxLevel()
	if 	TC_STAGE_State[nZone] < 10 then
		return
	end
	for i=1, 5 do
		if (SWORD_SEALINDEX[nZone][i] > 0) then
			if TC_TIMER_Count[nZone] < SWORD_SEALTIME[nZone][i] then		-- û��ʱ��
				Msg2Player(SWORD_MINNAME[i].."Phong kh�c �ang ���c gi�i kh�a. ["..TC_TIMER_Count[nZone].."/"..SWORD_SEALTIME[nZone][i].."]["..SWORD_SEALINDEX[nZone][i].."]")
				MC_BeSpawnNPCs(nStage, nMaxLevel, SWORD_MINNAME[i])
			else															-- ��ʱ����
				MC_Del4Group(SWORD_SEALINDEX[nZone][i], 0)
				Msg2Player(SWORD_MINNAME[i].."gi�i kh�a ho�n th�nh. ["..SWORD_SEALINDEX[nZone][i].."]")
				SWORD_SEALTIME[nZone][i] = 0
				SWORD_SEALINDEX[nZone][i] = -1	
			end
		end
	end
	local nSealCount = 0
	for i=1,5 do
		if SWORD_SEALINDEX[nZone][1] == -1 then
			nSealCount = nSealCount + 1
		end
	end
	if (SWORD_SEALINDEX[nZone][1] < 0) and (SWORD_SEALINDEX[nZone][2] < 0) and (SWORD_SEALINDEX[nZone][3] < 0) and (SWORD_SEALINDEX[nZone][4] < 0) and (SWORD_SEALINDEX[nZone][5] < 0) and (SWORD_BOSSSPWANED[nZone] == 0) then
		local nBossIndex = MC_CreateBoss(9)
		MC_Del4Group(SWORD_SleepOne[nZone],0)
		SWORD_BOSSSPWANED[nZone] = 1
		AddUnitStates(nBossIndex, 1, GetUnitBaseStates(nBossIndex, 1)*(nSealCount+1))
		AddUnitStates(nBossIndex, 2, GetUnitBaseStates(nBossIndex, 2)*(nSealCount+1))
		AddUnitStates(nBossIndex, 3, GetUnitBaseStates(nBossIndex, 3)*(nSealCount+1))
		AddUnitStates(nBossIndex, 4, GetUnitBaseStates(nBossIndex, 4)*(nSealCount+1))
		AddUnitStates(nBossIndex, 5, GetUnitBaseStates(nBossIndex, 5)*(nSealCount+1))
	end
end
function ACT9_Killer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMapID = GetWorldPos()
	local nLevel = MU_Div(TM_GetMaxLevel())*10
	local nMaxLevel = TM_GetMaxLevel()
	local nSwordFlag = 0
	for i=1,5 do
		if TT_TARGET_Name == SWORD_NAME[i] then
			nSwordFlag = i
			break;
		end
	end
	for i=1,5 do
		if TT_TARGET_Name == SWORD_NAME[i].."(�ang gi�i kh�a)" then
			MC_Del4Group(TT_TARGET_Index, 2)
			Msg2Player("Ng�n ch�n"..SWORD_MINNAME[i].."Gi�i kh�a th�nh c�ng.["..SWORD_SEALINDEX[nZone][i].."]")
			SWORD_SEALTIME[nZone][i] = 0
			SWORD_SEALINDEX[nZone][i] = -2	
			break;
		end
	end
	local nSealCount = 0
	for i=1,5 do
		if SWORD_SEALINDEX[nZone][1] == -1 then
			nSealCount = nSealCount + 1
		end
	end
	if (SWORD_SEALINDEX[nZone][1] < 0) and (SWORD_SEALINDEX[nZone][2] < 0) and (SWORD_SEALINDEX[nZone][3] < 0) and (SWORD_SEALINDEX[nZone][4] < 0) and (SWORD_SEALINDEX[nZone][5] < 0) and (SWORD_BOSSSPWANED[nZone] == 0) then
		local nBossIndex = MC_CreateBoss(9)
		MC_Del4Group(SWORD_SleepOne[nZone],0)
		SWORD_BOSSSPWANED[nZone] = 1
		AddUnitStates(nBossIndex, 1, GetUnitBaseStates(nBossIndex, 1)*(nSealCount+1))
		AddUnitStates(nBossIndex, 2, GetUnitBaseStates(nBossIndex, 2)*(nSealCount+1))
		AddUnitStates(nBossIndex, 3, GetUnitBaseStates(nBossIndex, 3)*(nSealCount+1))
		AddUnitStates(nBossIndex, 4, GetUnitBaseStates(nBossIndex, 4)*(nSealCount+1))
		AddUnitStates(nBossIndex, 5, GetUnitBaseStates(nBossIndex, 5)*(nSealCount+1))
	end
	if nSwordFlag ~= 0 then
		local nBossIndex = CreateNpc("Ki�m ��i"..nLevel, SWORD_NAME[nSwordFlag].."(�ang gi�i kh�a)", nMapID, SWORD_LOC[nSwordFlag][1], SWORD_LOC[nSwordFlag][2])
		MC_Add2Group(nBossIndex)
		MC_BeSpawnNPCs(nStage, nMaxLevel, SWORD_MINNAME[nSwordFlag], nil, 1)			-- ˢ����
		SWORD_SEALTIME[nZone][nSwordFlag] = TC_TIMER_Count[nZone] + 40		-- ��¼��ʼ�����ӡ�Ľ�̨�Ľ��ʱ��
		if SWORD_SEALTIME[nZone][nSwordFlag] >= 127 then
			SWORD_SEALTIME[nZone][nSwordFlag] = 127
		end
		SWORD_SEALINDEX[nZone][nSwordFlag] = nBossIndex						-- ��¼��ʼ�����ӡ�Ľ�̨��INDEX
	end
-- ===============�������ͨ�ؽ��� edit by yanjun============================
       local nPreservedPlayerIndex = PlayerIndex;	--����PlayerIndex
	local nMemCount = GetTeamSize();	--��ö�������
	for i=1,nMemCount do
		PlayerIndex = GetTeamMember(i);	
		Earn(5000000)	--����500G
		Msg2Player("Ph�n th��ng v��t �i: nh�n ���c 50 ti�n v�ng.")
		randomseed(os.time)
		local nHorse_type = random(3,7)	
		AddItem(0,105,nHorse_type,1,1)	--����һƥ70������(�������)
		Msg2Player("Ph�n th��ng v��t �i: nh�n ���c 1 con tu�n m�.")
		nRoute = GetPlayerRoute()	
		local nType = nRoute*100+floor(GetLevel()/10)*10+GetBody()
		AddItem(0,103,nType,1,1)	--������װ��ñ��
		AddItem(0,100,nType,1,1)	--������װ������
		AddItem(0,101,nType,1,1)	--������װ���ڿ�
		AddItem(0,102,nType,1,1)	--������װ������
		--������װ:����
		if nRoute == 2 then	
			AddItem(0,3,nType,1,1) --�����׼ҽ�����������
			AddItem(0,5,nType,1,1)
		elseif nRoute == 3 then
			AddItem(0,8,nType,1,1)
		elseif nRoute == 4 then
			AddItem(0,0,nType,1,1)
		elseif nRoute == 6 then
			AddItem(0,1,nType,1,1)
		elseif nRoute == 8 then
			AddItem(0,2,nType,1,1)
		elseif nRoute == 9 then
			AddItem(0,10,nType,1,1)
		elseif nRoute == 11 then
			AddItem(0,0,nType,1,1)
		elseif nRoute == 12 then
			AddItem(0,5,nType,1,1)
		elseif nRoute == 14 then
			AddItem(0,2,nType,1,1)
		elseif nRoute == 15 then
			AddItem(0,9,nType,1,1)
		end
		Msg2Player("Ph�n th��ng v��t �i: nh�n ���c 1 trang b�.")
	end
-- =============================================================================
end

-- ================================================================================================ <MAIN> ====
-- ------------------------------------------------------------------------------------------------ <Function> ----
function main()

	local nMapId = GetWorldPos();
	if mod(nMapId, 10) == 8 then
		ACT8_Trap();
	end;
	
--	local nZone = TC_GetTeamZone()
--	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
--	TT_SetTarget(TT_TARGET_Index)
--	if (nZone < 1) or (nZone == nil) and (TT_TARGET_ModID == "����ʯ") and (TT_TARGET_Name == "�ؽ�ʹ��") then
--		GS_EnterTaskTalk()
--	else
----		Msg2Player(TT_TARGET_Name.." "..GetName())
----		if (TT_TARGET_ModID ~= "����ʯ") and (TT_TARGET_Name == GetName()) then
--		if TM_IsPlayer() == 1 then
--			On_Trap()
--		elseif (TT_TARGET_ModID == "����ʯ") and (TT_TARGET_Name == "�ؽ�ʹ��") then	-- ֻ���ںͲؽ�ʹ��˵����ʱ�����Ч��
--			GS_TalkWithMessenger()
--		elseif (TT_TARGET_ModID == "����Ǯ") and (TT_TARGET_Name == "���µ�����") then
--			On_Dropis()
--		else	-- ���������ĿǰΪ�Ի���
--			On_Talk()
--		end
--	end
-----------------------------------------------------------------------------------
end

-- ================================================================================================ <TRIGGER> ====
-- ------------------------------------------------------------------------------------------------ <Timer Function> ----
function Period_Timer()
	local nZone = TC_GetTeamZone()
	TT_Stepper()			-- �ǲ���
	if TC_CheckTimer() == 1 then
		return
	end
	if mod(TC_TIMER_Count[nZone],4) == 0 then
		MU_Msg2Team("Trong th�i gian �� qua....["..TC_TIMER_Count[nZone].."]")
	end
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
		ACT1_Timer()
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		ACT2_Timer()
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		ACT3_Timer()
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
		ACT4_Timer()
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_Timer()
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
		ACT8_Timer()
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		ACT9_Timer()
	end	
end

-- ------------------------------------------------------------------------------------------------ <Killer Function> ----
function Killing_Unit()
	local nZone = TC_GetTeamZone()
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
--	Msg2Player(TT_TARGET_Name.." �ĵ�ǰ�ȼ�Ϊ�� "..GetUnitBaseStates(TT_TARGET_Index, 0))
	local nTargetLife = GetUnitBaseStates(TT_TARGET_Index, 1)
	if (GetItemCount(2,0,334) >= 1) and (random(1,100000) <= 10000) then
		local nDrainedLife = (nTargetLife*GetLevel()/100)*0.02
		ModifyLife(GetLife()+nDrainedLife)
		nDrainedLife = SB_Div(nDrainedLife, 1)
		if nDrainedLife > 0 then
			Msg2Player("[Huy�t Ph�ch]c�a b�n ph�t ra �nh s�ng h�ng m� �o, �� kh�i ph�c cho b�n"..nDrainedLife.." �i�m sinh l�c.")
		end
	end
	if (GetItemCount(2,0,335) >= 1) and (random(1,100000) <= 10000) then
		local nDrainedNeili = (nTargetLife*GetLevel()/100)*0.02
		ModifyNeili(GetNeili()+nDrainedNeili)
		nDrainedNeili = SB_Div(nDrainedNeili, 1)
		if nDrainedNeili > 0 then
			Msg2Player("[Th�y Tinh]c�a b�n ph�t ra �nh s�ng xanh, �� kh�i ph�c cho b�n"..nDrainedNeili.." �i�m n�i l�c.")
		end
	end
	TC_RefKilledNpc()				-- ɱ��������¼
	if TT_TARGET_Name == "B�o r��ng ng�u nhi�n" then
		TB_OpenCommonChest()
	else
		TT_SetTarget(TT_TARGET_Index)
		MC_Del4Group(TT_TARGET_Index, 2)
--		Msg2Player("ɱ����! Stage "..TC_STAGE_Index[nZone].." Zone "..nZone)
		
		if TC_STAGE_Index[nZone] == 1 then					-- ACT I
			ACT1_Killer()
		elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
			ACT2_Killer()
		elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
			ACT3_Killer()
		elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
			ACT4_Killer()
		elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
			ACT5_Killer()
		elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
		elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
		elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
			ACT8_Killer()
		elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
			ACT9_Killer()
		end	
		GT_Drop(TT_TARGET_Name, 2)
	end
	local nChecka, nCheckb = SB_Div(TC_KILL_Stage[nZone], 50)
--	Msg2Player("Կ�׵��䣺"..nChecka.."/"..nCheckb.." ["..TC_KILL_KeyGot[nZone].."/".."1]")
	if (nCheckb == 0) and (TC_KILL_KeyGot[nZone] >= 1) then
		TC_KILL_KeyGot[nZone] = TC_KILL_KeyGot[nZone] - 1
		AddItem(2,0,336,1)
		-- Stage Event Start
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[10]), 3, 1)
		SetTask(SB_EVENT_STAGE[10], nFlag)
		TB_AddScore(3, random(0, 2))
		TaskTip("K�ch ho�t s� ki�n ��c bi�t: Th�ng th��ng. Ch�a kh�a s�t")
		-- Stage Event End
	end
end

-- ------------------------------------------------------------------------------------------------ <Rect Function> ----
function Leave_Map()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
--	Msg2Player(TC_STAGE_State[nZone].." "..nStage.." "..GetWorldPos())
	if (TC_STAGE_State[nZone] < 30) and (nStage >= 1) and (nStage <= 9) then
--		Msg2Player("��ȥ�Է�������")
		TM_LeaveMap(nZone, PlayerIndex)
	end
end

-- ------------------------------------------------------------------------------------------------ <DropChest Function> ----
function On_Dropis()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	if nIsUsed == 1 then
		Msg2Player("R��ng n�y hi�n �ang c� ng��i s� d�ng.")
		return
	end
	if nIsLocked == 0 then											-- û������������
		local nNewChestState = SetBit(nChestState, 2, 1) - nChestState
		AddUnitStates(nChestIndex, 8, nNewChestState)				-- �������ӵĶ�ռȨ��
		On_Dropis_Loot()
	elseif nIsLocked == 1 then										-- ����������
		if GetItemCount(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3]) < 1 then
			Msg2Player("Kh�ng c� ��ng ch�a kh�a, sao c� th� m� r��ng!")
		elseif GetItemCount(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3]) >= 1 then
			Say("S� d�ng ch�a kh�a m� r��ng n�y?", 2, "S� d�ng ch�a kh�a/On_Dropis_Open", "R�i kh�i/On_Dropis_Exit")
		end
	end
end
function On_Dropis_Open()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	if nIsLocked == 1 then
		if GetItemCount(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3]) >= 1 then
			DelItem(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3], 1)
			AddUnitStates(nChestIndex, 8, (2-nChestState))		-- �����������ö�ռģʽ
			MU_Msg2Team(GetName().."�� k�ch ho�t b�o r��ng. ("..nChestIndex..")")
			On_Dropis_Loot()
		else
			Msg2Player("Kh�ng c� ��ng ch�a kh�a, sao c� th� m� r��ng!")
		end
	else
		local nNewChestState = SetBit(nChestState, 2, 1) - nChestState			-- �������ӵĶ�ռȨ��
		AddUnitStates(nChestIndex, 8, SetBit(nChestState, 2, 1))				-- �������ӵĶ�ռȨ��
		On_Dropis_Loot()
	end
end
function On_Dropis_Loot()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local aGearsIndex = {GetUnitCurStates(nChestIndex, 5), GetUnitCurStates(nChestIndex, 6), GetUnitCurStates(nChestIndex, 1)}
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	local nBody =  GetBody()
	aGearsIndex[3] = aGearsIndex[3] + nBody
--	Msg2Player("#"..aGearsIndex[1].." "..aGearsIndex[2].." "..aGearsIndex[3])
	Say("Trong r��ng c�"..GT_GetGearFaction(aGearsIndex[3]).."-"..GT_GetGearPart(aGearsIndex[2]).."trang b�, mu�n l�y kh�ng?", 2, "L�y trang b�/On_Dropis_Get", "R�i kh�i/On_Dropis_Exit")
	MU_Msg2Team(GetName().."Trong r��ng"..GT_GetGearFaction(aGearsIndex[3]).."-"..GT_GetGearPart(aGearsIndex[2]).."trang b�")
end
function On_Dropis_Get()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local aGearsIndex = {GetUnitCurStates(nChestIndex, 5), GetUnitCurStates(nChestIndex, 6), GetUnitCurStates(nChestIndex, 1)}
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	local nBody = GetBody()
	-- emei & shaolin check
	local nFaction = MU_Div(aGearsIndex[3], 100)
	if (nFaction == 2) or (nFaction == 3) then
		if nBody > 2 then
			aGearsIndex[3] = aGearsIndex[3] + random(1, 2)
		else
			aGearsIndex[3] = aGearsIndex[3] + nBody
		end
	elseif (nFaction == 8) or (nFaction == 9) then
		if nBody < 3 then
			aGearsIndex[3] = aGearsIndex[3] + random(3, 4)
		else
			aGearsIndex[3] = aGearsIndex[3] + nBody
		end
	else
		aGearsIndex[3] = aGearsIndex[3] + nBody
	end
	AddItem(aGearsIndex[1], aGearsIndex[2], aGearsIndex[3], 1)
--	Msg2Player("#"..aGearsIndex[1].." "..aGearsIndex[2].." "..aGearsIndex[3])
	MU_Msg2Team(GetName().."Nh�t ���c "..GT_GetGearFaction(aGearsIndex[3]).."-"..GT_GetGearPart(aGearsIndex[2])..".."..aGearsIndex[1].." "..aGearsIndex[2].." "..aGearsIndex[3])
	MC_Del4Group(nChestIndex, 0)
end
function On_Dropis_Exit()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	local nNewChestState = SetBit(nChestState, 2, 0) - nChestState
	AddUnitStates(nChestIndex, 8, nNewChestState)	-- ������ӵĶ�ռȨ��
end
-- ------------------------------------------------------------------------------------------------ <Trap Function> ----
function On_Trap()
--	local nZone = TC_GetTeamZone()
--	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
----	Msg2Player("�ȵ� BB �ˡ���")
--	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
----		ACT1_Trap()
--	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
--	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
--		ACT3_Trap()
--	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
--	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
--	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
--	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
--	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
		ACT8_Trap()
--	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
--	end	
end

-- ------------------------------------------------------------------------------------------------ <Talk Function> ----
function On_Talk()
	local nZone = TC_GetTeamZone()
--	Msg2Player("˵���С���")
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		ACT2_Talk()
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		ACT3_Talk()
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_Talk()
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		ACT9_Talk()
	end	
end

-- ================================================================================================ <GAME STAGE> ====
-- ------------------------------------------------------------------------------------------------ <Function> ----
function OnDeath()
--	Msg2Player("Death."..GetTriggeringUnit())
end

-- ================================================================================================ <SCORE BAR> ====
SB_PAGE_INFO = {
"Thu h�i m�t t�ch",
"Xem ph�n th� 1 [Th�ng tin c� b�n c�a T�ng Ki�m s�n trang] ",
"Xem ph�n th� 2 [Th�ng tin nh�n v�t][V� �i�m t�ch l�y] ",
"Xem ph�n th� 3 [Th�ng tin v��t �i][Tin t�c �i] ",
"Xem ph�n th� 4 [S� ki�n v��t �i]",
"Xem ph�n b�n tr�n",
"Xem ph�n b�n d��i"}

-- ͨ���Ƿ����¼��󼤻���ʾ��Щ��Ϣ����Ҳ�и���ϡ����Ϣ��ͨ��ĳ��;�������Żᷴӳ����Ϸ�С�
SB_EVENT_CRUSTG = 1809		-- ��¼��ǰ������Nҳ�ı����� Task
SB_EVENT_STAGE = {1811, 1812, 1813, 1814, 1815,  1816, 1817, 1818, 1819, 1810}		-- ��¼�ؿ��¼��ı����� Task
SB_STAGE_RECORD = {}
SB_EVENT_TITLE = {
{"  .  ", "  S�n  ", "      ", "  M�n  ", "      "},
{"  .  ", "  ��i  ", "      ", "  vi�n  ", "      "},
{"  .  ", "  H�u  ", "  Hoa  ", "  Vi�n  ", "      "},
{"  .  ", "  Li�n  ", "  Ho�n   ", "  s�o  ", "      "},
{"  .  ", "  T�ng  ", "  Ki�m  ", "  c�c  ", "      "},
{"  .  ", "  ?  ", "  ?  ", "  ?  ", "      "},
{"  .  ", "  ?  ", "  ?  ", "  ?  ", "      "},
{"  .  ", "  T�  ", "  Tr�c  ", "  L�m  ", "      "},
{"  .  ", "  Ki�m  ", "      ", "  Tr�ng  ", "      "},
{"  .  ", "  th�ng  ", "      ", "  Th��ng  ", "      "}}
SB_EVENT_CONT = {
	{"  [Ch�a gi�t ���c <color=metal>Ch� canh c�a<color> n�o ]",
	 "  [Gi�t nhi�u <color=metal>Ch� canh c�a<color> c� th� ch�c t�c <color=metal>Gia �inh ph�n n�<color>]",
	 "  [Qua c�a s� g�p r�t nhi�u <color=metal>Gia �inh h� vi�n<color> mai ph�c ]",
	 "  [��nh b�i nhi�u <color=metal>Gia �inh h� vi�n<color> c� th� ch�c t�c <color=metal>T�ng qu�n Ngo�i vi�n<color>]",
	 "  ??????",
	 "  ??????",
	 "S�n M�n"},
	{"  [C� th� ��i tho�i v�i <color=metal>T�ng qu�n N�i vi�n<color>, ch�n tr�c ti�p chi�n ��u!]",
	 "  [Gi�p <color=metal>T�ng qu�n N�i vi�n<color> t�m Du Long ki�m v�, c� th� c�ng h�n luy�n t�p v� ngh�.]",
	 "  [Khi gi�p <color=metal>T�ng qu�n N�i vi�n<color> t�m Du Long ki�m c� th� th�y ���c B�ch T�m ki�m.]",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "��i Vi�n"},
	{"  [N�u <color=metal>N� l�o b�c<color> � H�u Hoa Vi�n qu� nhi�u c� th� l�m kinh ��ng <color=metal>H�u Hoa Vi�n nghi tr��ng<color> ]",
	 "  [�i qua v��n hoa, s� khi�n <color=metal>��i ti�u th�<color> c�ng ph�n n�.]",
	 "  [N�u t�m ���c <color=metal>Gia �inh<color> b� <color=metal>��i ti�u th�<color> b�c hi�p, gi�p h�n tr� ti�n chu�c th�n.]",							-- �ɽ������Կ��
	 "  [<color=metal>��i ti�u th�<color> s� kh�ng qu� l�m kh� (n�u ��i ng� ��u l� n�)]",
	 "  ??????",
	 "  ??????",
	 "H�u hoa vi�n"},
	{"  [L�y ���c 3 vi�n k� th�ch <color=metal>Ng� h�nh ki�m linh<color> s� xu�t hi�n]",
	 "  [L�y ���c<color=metal>Kim Ng�c Th�<color>, m�i c� th� v�o <color=metal>T�ng Ki�m C�c<color> ]",
	 "  [L�y ���c<color=metal>M�c Ng�c Th�<color>, m�i c� th� v�o <color=metal>!<color> ]",
	 "  [L�y ���c<color=metal>H�a Ng�c Th�<color>, m�i c� th� v�o <color=metal>!<color> ]",
	 "  ??????",
	 "  ??????",
	 "Li�n Ho�n S�o"},
	{"  [Kim quy Kim, M�c quy M�c, Th�y quy Th�y, H�a quy H�a, Th� quy Th�, ��u l� <color=metal>T��ng Th�<color> ]",	-- 70������ ֻ��������� ؤ�͵�컻�վ�Ҫ		���ҡ���ˮ�ķ���Ҫ
	 "  [Kim sinh Th�y, Th�y sinh M�c, M�c sinh H�a, H�a sinh Th�, Th� sinh Kim, ��u l� <color=metal>T��ng Sinh<color> ]",	-- 70������ ֻ��������� ���ҡ���ȴ����Ҫ	���֡���������ķ���Ҫ
	 "  [Kim kh�c M�c, M�c kh�c Th�, Th� kh�c Th�y, Th�y kh�c H�a, H�a kh�c Kim, ��u l� <color=metal>T��ng T�<color> ]",	-- 70������ ֻ��������� ���š������滨���Ҫ	�䵱����Ӱ���ķ�
	 "  [Kim t�ng H�a, H�a t�ng Th�y, Th�y t�ng Th�, Th� t�ng M�c, M�c t�ng Kim,��u l� <color=metal>T��ng Tr�<color> ]",	-- 60������ ֻ��������� �䵱�����佣���Ҫ		���֡��޺����Ҫ
	 "  [Kim ph� Th�, Th� ph� H�a, H�a ph� M�c, M�c ph� Th�y, Th�y ph� Kim, ��u l� <color=metal>T��ng Ph�<color> ]",	-- 60������ ֻ��������� ���֡������񹦾�Ҫ		ؤ������Ҫ
	 "  ??????",
	 "T�ng Ki�m c�c"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "???"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "???"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "T� Tr�c l�m"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "Ki�m Ch�ng"},
	{"  ??????",
	 "  [�� h�o h�u c�ng cao, c� th� ��n g�p S� gi� T�ng Ki�m k�ch ho�t r��ng, kh�ng ti�u hao Anh H�ng thi�p]",
	 "  [Khi gi�t qu�i � m�i �i ��u c� th� nh�n ���c ch�a kh�a m� R��ng tinh ch� ]",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "Th�ng Th��ng"}}
SB_UNKNOWN_INFO = "  [?????? ]"
-- ------------------------------------------------------------------------------------------------ <Function> ----
function SB_Page_0()
end
function SB_Page_1()
	local nZone = TC_GetTeamZone()
	if not ((nZone >= 1) and (nZone <= 5)) then
		SB_Page_1_Bak()
	else
		GS_ViewZone(nZone)
	end
end
function SB_Page_1_Bak()
	local sL1 = "<color=green>.<color><color=gold>Li�n quan ��n S�n trang<color>: <color=gray>X n�m Y T�ng Ki�m s�n trang thi�t l�p ��n nay ch�ng nh�ng �� thu nh�n nhi�u danh ki�m trong thi�n h�, m� c�n c� c�ng ngh� ��c t�o v� kh� ph�ng v� l� tuy�t k� b� truy�n �� nh�t trong giang h�. Nhi�u nh�n s� t�m ��n mong t�m cho m�nh Th�n Binh B�o Gi�p.<color>".."\n"
	local sL2 = ""..""
	local sL3 = ""..""
	local sL4 = "<color=green>.<color> <color=gold>Li�n quan ��n Khi�u chi�n<color>: <color=gray>Hi�n nay trang ch� m�i c�c nh�n s� ��n T�ng Ki�m s�n trang. Nh�ng ai c� th�nh � xin ��n g�p s� gi� � T��ng D��ng<color>.".."\n"
	local sL5 = ""..""
	local sL6 = ""..""
	
	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."./SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."/SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL3..sL4..sL5..sL6, 5, sP1, sP2, sP3, sP4, sP0)
end
function SB_Page_2()
	local nName = "<color=wood>"..SB_FormatStr().."<color>"
	local nScore = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_SCORE), 12).."<color>"
	local nTime = tostring(GetTask(TB_BONUS_TIME))
	local nDataS, nDataM, nDataH = 0, 0, 0
	nTime, nDataS = SB_Div(nTime, 60)
	nTime, nDataM = SB_Div(nTime, 60)
	nTime, nDataH = SB_Div(nTime, 60)
	local nData = "<color=green>"..SB_FormatStr(nDataH, 5, 3).."<color><color=water>:<color><color=green>"..SB_FormatStr(nDataM, 2, 3).."<color><color=water>:<color><color=green>"..SB_FormatStr(nDataS, 2, 3).."<color><color=water>'<color>"
	local nRelation = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_RELATION), 8)
	
	local sL1 = "<color=green>.<color><color=gold>Th�ng tin nh�n v�t<color>: <color=gray>Bao g�m �i�m danh v�ng v� n�ng l�c chi�n ��u.<color>".."\n"
	local sL2 = "  T�n:"..nName.."  Danh v�ng: Chi�n ��u:".."\n"
	local sL3 = "".."\n"
	local sL4 = "<color=green>.<color> <color=gold>�i�m t�ch l�y<color>: <color=gray>Tr�nh �� h�o h�u bi�u th� tr�nh �� quan h� th� l�c trong T�ng Ki�m s�n trang.<color>".."\n"
	local sL5 = "  T�ch l�y:"..nScore.."  Th�i gian:"..nData.."  Quan h� S�n trang:"..nRelation.."\n"
	local sL6 = "".."\n"	

	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end	
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."/SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."./SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."/SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL4..sL5, 5, sP1, sP2, sP3, sP4, sP0)	
end
function SB_Page_3()
	local nPlayed = GetTask(TB_BONUS_PLAYED)
	local nFinished = GetTask(TB_BONUS_FINISHED)
	local nSRate = "<color=wood>0%<color>"
	if nPlayed ~= 0 then
		nSRate = "<color=wood>"..(SB_Div(((nFinished*10000)/nPlayed), 1)/100).."<color>%"
	end
	local nPlayed = "<color=wood>"..SB_FormatStr(nPlayed, 12) .."<color>"
	local nFinished = "<color=wood>"..SB_FormatStr(nFinished, 12).."<color>"
	local nStage = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_STAGE), 12).."<color>"
	local nKilled = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_KILLED), 12).."<color>"
	local nBecaptain = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_BECAPTAIN), 12).."<color>"
	
	local sL1 = "<color=green>.<color><color=gold>Tin t�c v��t �i<color>: <color=gray>Th�ng qua s� l�n tham d� v� s� l�n �� th�ng qua �� t�nh t� l�.<color>".."\n"
	local sL2 = "  S� l�n tham d�:"..nPlayed.."  S� l�n v��t �i:"..nFinished.."  T� l� th�ng qua:"..nSRate.."\n"
	local sL3 = "".."\n"
	local sL4 = "<color=green>.<color><color=gold>Th�ng tin �i<color>: <color=gray>Ghi nh� v�i th�ng tin vu�t �i ��n gi�n.<color>".."\n"
	local sL5 = "  T�ng s� v��t �i:"..nStage.."  T�ng s� s�t qu�i:"..nKilled.."  S� l�n ��i tr��ng:"..nBecaptain.."\n"
	local sL6 = "".."\n"

	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."/SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."./SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL4..sL5, 5, sP1, sP2, sP3, sP4, sP0)
end
function SB_Page_Event(nStage)
	if nStage == nil then
		nStage = GetTask(SB_EVENT_CRUSTG)
	end
	if (nStage < 1) or (nStage > 9) then
		nStage = 10
	end
	SetTask(SB_EVENT_CRUSTG, nStage)
	--local sLine = "  [<color=green>----"..SB_EVENT_CONT[nStage][7].."----<color>]".."\n"
	local sLine = ""
	for i=1,5 do
		sLine = sLine.."<color=green>"..SB_EVENT_TITLE[nStage][i].."<color>"
		if GetBit(GetTask(SB_EVENT_STAGE[nStage]), i) == 1 then
			sLine = sLine..SB_EVENT_CONT[nStage][i].."\n"
		else
			sLine = sLine..SB_UNKNOWN_INFO.."\n"
		end
	end
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	local sP0 = SB_PAGE_INFO[6].." ["..SB_EVENT_CONT[nStagePre][7].."]/SB_Page_Event_Pre"
	local sP1 = SB_PAGE_INFO[7].." ["..SB_EVENT_CONT[nStageNext][7].."]/SB_Page_Event_Next"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[1].."/SB_Page_0"
	Say(sLine, 4, sP0, sP1, sP2, sP3)
end
function SB_Page_Event_Pre()
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	SB_Page_Event(nStagePre)
end
function SB_Page_Event_Next()
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	SB_Page_Event(nStageNext)
end

function OnUse()
	SB_Page_2()
end

