-- ����˵��
-- �˽ű��ļ��������ÿ�ν�������һ��������(��ʶ����ļ���)���Զ�ִ�� main ��������Ľű�
-- �򵥵�˵���л���ͼ����½��Ϸ����ִ�д˽ű��ļ��� main ����������

-- ����Ŀ��
-- ͨ������Ϊ������ʺŽ����������Ϸǰ��ʼ��һЩ������Ϣ
-- �����Զ����س�ʼ�����


--���ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ�����ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ
--���ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ	���ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ
--���ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ	���ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ
--���ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ	���ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ
--���ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ	���ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ
--Include([[\script\lib.lua]]);
Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\online\\laborday06\\laborday_head.lua");
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\global\\mate_head.lua");
Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
Include("\\script\\shinynight_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\online\\qixi07\\qixi07_head.lua")
Include("\\script\\task\\lingshi_task.lua")
Include("\\script\\global\\c2s_execute_func.lua")
Include("\\script\\online\\viet_event\\new_year_09\\new_year_head.lua");

Include("\\script\\lib\\writelog.lua")
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");--Խ��09��7�»����ͷ�ļ�
Include("\\script\\online\\viet_event\\200907\\event_head.lua");
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Include("\\script\\online\\viet_event\\200909\\event_head.lua");--09��9������ͷ�ļ�
Include("\\script\\task\\richangrenwu\\init_task.lua");--����ʹ���ճ��ͷ�ļ�
Include("\\script\\online_activites\\player_login_today.lua");
Include("\\script\\online_activites\\player_login_common.lua");
Include("\\script\\online_activites\\daily_reset.lua");
Include("\\script\\online_activites\\2010_12\\activity_05\\head.lua");
Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");

Include("\\script\\system_switch_config.lua") --gtask switch
Include("\\script\\task\\global_task\\gtask_head.lua") --new task
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")
Include("\\script\\item\\item_yunling_box.lua")--Ƿ���
Include("\\script\\function\\zq_battles\\zq_head.lua")
Include("\\settings\\static_script\\exchg_server\\exchgsvr_player_login.lua")
Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\script\\online_activites\\2014_04\\wuxingfulongshu.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\meridian\\meridian_payer_login.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\settings\\static_script\\global\\merit.lua")
Include("\\script\\missions\\siling_trial\\slt_head.lua")
Include("\\script\\online\\item_buchang\\ibc_head.lua")

Include("\\script\\lib\\define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\writelog.lua")
Include("\\script\\online\\zgc_public_fun.lua")

--���ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ	���ͷ�ļ�ʱ��ȷ��ȫ�ֱ����뺯�������ͻ
g_nBWAwardDate = 2014051200;	--������׶��Է����Ľ�������
Include("\\script\\online\\viet_event\\nationality\\head.lua"); -- Server ID header
Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\script\\online\\viet_event\\vng_task_control.lua"); -- VNG Task Control
Include("\\script\\online_activites\\task_values.lua"); -- KS Task Control
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")  -- Chuyen sinh VN
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua") 
Include("\\script\\vng\\vanmay_daohuu\\vanmay_npc.lua") 
Include("\\script\\vng\\vng_playerlogin.lua")
Include("\\script\\biwudahui\\tournament\\tournament_head.lua")
g_szThisFile = "\\script\\global\\playerloginin.lua"

--�������ڼ���0����������
function GetWeekDay()
	return tonumber(date("%w"))
end;
--���ص�ǰСʱ�ͷ���
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23��59��
function CheckTime(day)

	--�����
	if WEEKEND_SWITCH == 0 then
		return 0
	end;

	if day ~= GetWeekDay() then
		return 0
	end;

	local nBegin;
	local nEnd;
	if day == 0 then	--����������2��00 - ����10��00
		nBegin = 14 * 60;
		nEnd = 22 * 60;
	else
		nBegin = 19 * 60;	--��������������7��00������12��00
		nEnd = 24 * 60;
	end;

	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end;
end;

function ItemLockAlert()
	local isfirst, haveitemunlock, bForceUnlock = GetItemLockStatus()
	if isfirst > 0 then
		Say("H� th�ng kh�a v�t ph�m gi�p b�o qu�n t�i kho�n \n Trong h�nh trang th�m n�t kh�a v�t ph�m, ch� c�n thi�t l�p m�t m� ban ��u l� c� th� kh�a v�t ph�m. �� bi�t th�m chi ti�t nh�n F1.", 0)
	end

	if haveitemunlock > 0 then
		Msg2Player("B�n hi�n c� v�t ph�m �ang m� kh�a")
	end

	if bForceUnlock > 0 then
		Msg2Player("Trang b� kh�a �ang � tr�ng th�i ch� ��nh m�")
	end
end

function main(ExchangeComing)
	local nPlayerRoute = GetPlayerRoute();
	--NOTE: it MUST be the 1st one calling for resetting things by SunZhuoshi
	--< Added by SunZhuoshi
	DR_OnPlayerLogin();
	PLT_OnPlayerLogin();
	--PLC_OnPlayerLogin();
	-->
--	SB_OnPlayerLogin();
	FG_OnPlayerLogin();
	-->

	LearnSkill(11)	--���ż���11
	LearnSkill(12)	--���ż���12
	local nDate = tonumber(date("%Y%m%d"))
	-- �ؽ�ɽׯ�����ߺ��������ӻسǴ���
	RemoveTrigger(GetTrigger(1101))
	RemoveTrigger(GetTrigger(1102))
	RemoveTrigger(GetTrigger(1103))
	RemoveTrigger(GetTrigger(1104))
	if GetTrigger(2517) ~= 0 then
		RemoveTrigger(GetTrigger(2517));
	end;
	if GetTrigger(2518) ~= 0 then
		RemoveTrigger(GetTrigger(2518));
	end;
	if GetTrigger(2519) ~= 0 then
		RemoveTrigger(GetTrigger(2519));
	end;
	local nMapID, nX, nY = GetWorldPos()
	if ((nMapID >= 1011) and (nMapID <= 1059)) or ((nMapID >= 2011) and (nMapID <= 2059)) or ((nMapID >= 3011) and (nMapID <= 3059))or ((nMapID >= 4011) and (nMapID <= 4059))or ((nMapID >= 5011) and (nMapID <= 5059)) then  --�ؽ���ͼ����
		print("#T�ng Ki�m s�n trang: Ng��i ch�i ["..GetName().."] xu�t hi�n s� c� kh�c th��ng, ��t k�t n�i server, b� chuy�n v� th�nh.")
		NewWorld(350,1397,2852)
		SetFightState(0)
	end

	-- ɾ��Ӣ����ĵ���
	if (GetTrigger(100)~=0 and GetTask(1152) == 0) then
		SetTask(1152,1)
		RemoveTrigger(GetTrigger(100))
	end
	RemoveTrigger(GetTrigger(555))
	if GetTrigger(2509) ~= 0 then
		RemoveTrigger(GetTrigger(2509))
	end
	if GetTrigger(2516) ~= 0 then
		RemoveTrigger(GetTrigger(2516))
	end

	--����ʱ"��ȯ"���䴥������
	RemoveTrigger(GetTrigger(260));	--2008��7��31��ȥ����ȯ����
	--================================================================
	--05��ʥ���
	if (nDate >= 20051223 and nDate <= 20051228) then
		if GetTrigger(3000) == 0 then
			CreateTrigger(0,1200,3000);
		end
			Msg2Player("Ho�t ��ng l� gi�ng sinh �� b�t ��u, h�y ��n Truy�n gi�o s� � c�c th�nh th� ch�nh tra xem th�ng tin c� th�!")
	else
		if GetTrigger(3000) ~= 0 then
			RemoveTrigger(GetTrigger(3000));
		end;
	end
	--================================================================
	--06��Ԫ���
	--��Ϊ���ڻҲ��ɾ������Ĳ��������������KillFollower�ڴ��ڻ�ڼ�Ҫע�͵�
	--KillFollower()	--ȷ������/�����ʱ��û�и���
	RemoveTitle(3,3)	--ȷ������/�����ʱ��û�С������ڴˣ����ĳƺ�
	if (nDate >= 20051231 and nDate <= 20060105) then
		local mapID = GetWorldPos()
		if mapID == 108 or mapID == 201 or mapID == 304 then
			SetDeathPunish(0)	--�ڻ�ڼ�ȷ������/�����ʱ�򣬽�������ͼû�������ͷ���
		end
		local bCreateFailed = 0	--������¼�������Ƿ񴴽��ɹ�
		if CreateTrigger(2,1700,3200) == 0 then	--����Ȫ�ݶ��������ͼ������
			bCreateFailed = 1
		end
		if CreateTrigger(2,1701,3201) == 0 then	--�뿪Ȫ�ݶ��������ͼ������
			bCreateFailed = 1
		end
		if CreateTrigger(2,1702,3202) == 0 then	--�����꾩���������ͼ������
			bCreateFailed = 1
		end
		if CreateTrigger(2,1703,3203) == 0 then	--�뿪�꾩���������ͼ������
			bCreateFailed = 1
		end
		if CreateTrigger(2,1704,3204) == 0 then	--����ɶ����������ͼ������
			bCreateFailed = 1
		end
		if CreateTrigger(2,1705,3205) == 0 then	--�뿪�ɶ����������ͼ������
			bCreateFailed = 1
		end

		if bCreateFailed == 1 then
			Msg2Player("B�n kh�ng th� tham d� ho�t ��ng T�t Nguy�n ��n trong l�n ��ng nh�p n�y! H�y th� ��ng nh�p l�i!")
		else
			Msg2Player("Ho�t ��ng T�t Nguy�n ��n �� b�t ��u! Th�i gian ho�t ��ng b�t ��u t� 31/12/2005 ��n 5/1/2006 k�t th�c.")
			--TaskTip("�뵽�꾩���ϡ��ɶ����ϡ�Ȫ�ݸ����Ķ����ͷ���˽������ϸ��")
		end
	else
		for i = 3200,3205 do
			if GetTrigger(i) ~= 0 then
				RemoveTrigger(GetTrigger(i))
			end
		end;
	end
	--================================================================
	--06�괺�ڻ
	if GetWorldPos() == 961 or GetWorldPos() == 962 or GetWorldPos() == 963 or GetWorldPos() == 964 or GetWorldPos() == 965 then
		SetDeathPunish(0)	--���ߵ�ѩ�̵�ͼʱ���������ͷ�
		for SkillID=843,851 do
			LearnSkill(SkillID)	--���ߵ�ѩ�̵�ͼʱѧ���ѩ�̼���
		end
		SetDeathScript("\\script\\online\\���ڻ\\playerdeath.lua")
		UseScrollEnable(0)
	end

	if (nDate >= 20060120 and nDate <=20060205) then
		if CreateTrigger(0,1201,3100) == 0 then
			Msg2Player("B�n ��nh qu�i kh�ng r�i ra v�t li�u l�m b�nh trong l�n ��ng nh�p n�y. H�y th� ��ng nh�p l�i!")
		end

		local id,idx = 0,0
		bCreateFailed = 0
		for i=1,5 do
			Tid = 1710 + i
			Tidx = 3100 + i
			if CreateTrigger(2,Tid,Tidx) == 0 then	--�����뿪��ͼ������
				bCreateFailed = 1
			end
		end
		if bCreateFailed == 1 then
			Msg2Player("B�n kh�ng th� tham gia n�m tuy�t b�nh th��ng trong l�n ��ng nh�p n�y. H�y th� ��ng nh�p l�i!")
			WriteLog("[Ho�t ��ng m�a xu�n -K�t n�i th�t b�i]:"..GetName().."��ng nh�p/m�t k�t n�i server r�i kh�i b� k�t n�i map (3101-3105).")
		end
	else
		for i=3100,3105 do
			if GetTrigger(i) ~= 0 then
				RemoveTrigger(GetTrigger(i))
			end
		end
		local MapID = GetWorldPos()
		local Map_Pos = {
					{961,300,1820,3573},
					{962,200,1409,3048},
					{963,100,1365,2932},
					{964,350,1575,2970},
					{965,150,1781,3154}
					}
		for i=1,5 do
			if MapID == Map_Pos[i][1] then	--������ڻ�ڼ����ߵ�ѩ�̵�ͼ�����ͳ�ȥ��
				NewWorld(Map_Pos[i][2],Map_Pos[i][3],Map_Pos[i][4])
				if GetWorldPos() == Map_Pos[i][2] then
					SetDeathPunish(1)
					SetFightState(0)
					UseScrollEnable(1)
					SetTempRevPos(0,0,0)
					for SkillID=843,851 do
						if HaveLearnedSkill(SkillID) == 1 then
							RemoveSkill(SkillID)	--���Ǵ�ѩ�̼���
						end;
					end
					SetDeathScript("")
					break
				end
			end
		end
	end

	--================================================================
	--06�����˽ڣ�Ԫ���ڻ(Խ�ϰ�)
	if Is_QRYX_Activity() == 1 and GetSex() == 2 then
		CreateTrigger(0,1202,3110);					-- ��ֵ����ɿ����Ĵ�����
	elseif GetTrigger(3110) ~= 0 then
		RemoveTrigger(GetTrigger(3110))
	end
	--================================================================

	--08�������ڻ
	if nDate <= 20080412 then
		Msg2Player("Ho�t ��ng ti�t Thanh Minh �� b�t ��u, c�c hi�p kh�ch h�y ��n D�n L� nh�n g�n D� T�u �� bi�t th�ng tin chi ti�t!");
	else	--�������ڻ�ڼ����ߵ��ݼ���ͼʱ���Զ�������ҳ�ȥ
		local Map_Pos_QM = {
					{818,100,1458,2807},
					{819,200,1170,2828},
					{820,300,1640,3526},
					}
		local MapID_QM = GetWorldPos();
		for i=1,getn(Map_Pos_QM) do
			if MapID_QM == Map_Pos_QM[i][1] then
				NewWorld(Map_Pos_QM[i][2],Map_Pos_QM[i][3],Map_Pos_QM[i][4]);
				break;
			end;
		end;
	end;
	--================================================================
	--06����һ�ڻ
	----- boss���̻����� ��½����----
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20060428 and nDate <= 20060430 then
		Msg2Player("21:30 t�i nay, boss M� T�c ��u m�c xu�t hi�n g�n t�y Bi�n Kinh c��p m�t 1 con Tu�n M�, �� ��n l�c c�c hi�p kh�ch tr� h�i cho d�n!")
		Msg2Player("Ph�n th��ng Nhi�m v� Th��ng h�i h�m nay r�t phong ph�! Nhi�m v� th� 10 v�ng 2 v� nhi�m v� th� 10 v�ng 3 ��u c� ph�n th��ng l�n ch� ��i b�n!")
	end
	--================================================================
	--06�����ڻ
	if GetTask(1715) == 2 then
		WriteLog("Do tho�t game ��t ng�t, d�n ��n ng��i ch�i"..GetName().."Thay ��i nhi�m v� s� 1715 ch�a reset, v� th� khi ��ng nh�p c�n ti�n h�nh kh�i ph�c tr�ng th�i cho ng��i ch�i.")
		Restore_Player_State();
	end;
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	local bOnBoat = 0;
	if nGenre == 0 and nDetail ==105 then
		for i=25,31 do
			if nParticular == i then
				bOnBoat = 1;
				break;
			end;
		end;
	end;
	if bOnBoat == 1 then
		UnEquipAtPosition(10);
	end;

	for i=854,859 do
		if HaveLearnedSkill(i) == 1 then
			RemoveSkill(i);
		end;
	end;
	if Get_DragonBoatDay_State() == 3 then
		bCreateFailed = 0;
		for i=0,5 do
			Tid = 1107 + i
			Tidx = 3113 + i
			if GetTrigger(Tidx) == 0 then
				if CreateTrigger(2,Tid,Tidx) == 0 then	--���������뿪������ͼ������
					bCreateFailed = 1	--ĳһ������������ʧ����
				end
			end;
		end;
		if bCreateFailed == 1 then
			Msg2Player("L�n ��ng nh�p n�y khi�n b�n kh�ng th� ti�n h�nh tr�ng c�y b�nh th��ng! Vui l�ng ��ng nh�p l�i!")
			WriteLog("[Ho�t ��ng Th�i H� Qu� Th� (K�t n�i th�t b�i)]:"..GetName().."��ng nh�p/m�t k�t n�i server r�i kh�i b� k�t n�i map (3113-3118).")
		end
	else
		for i = 3113,3118 do
			if GetTrigger(i) ~= 0 then
				RemoveTrigger(GetTrigger(i))
			end
		end;
	end;
	SetDeathScript("");
	SetTask(TASK_TREEINDEX,0);	--
	SetTask(TASK_TREEGROW,0);	--
	SetTask(TASK_PLANTTIME,0);
	--================================================================
	--Я�����籭�
	if GetTrigger(3119) ~= 0 then
		RemoveTrigger(GetTrigger(3119));
	end;
--	if GetTask(TASK_GOTPET_TIME) ~= 0 and GetTime() - GetTask(TASK_GOTPET_TIME) > 60*60*24 then
--		KillFollower();
--		SetTask(TASK_GOTPET_TIME,0);
--	end;
	--================================================================
	--������̨
	for i=1,getn(MultiMapTab) do
		if GetWorldPos() == MultiMapTab[i][1] then
			NewWorld(300,1832,3582)
		end
	end

	for i=1,getn(SingleTeamMapTab) do
		if GetWorldPos() == SingleTeamMapTab[i][1] then
			NewWorld(300,1832,3582)
		end
	end

	for i=1,getn(TeamMapTab) do
		if GetWorldPos() == TeamMapTab[i][1] then
			NewWorld(300,1832,3582)
		end
	end

	if GetTask(1151) == 1 then
		SetPlayerState(3);
		SetTask(1151,0);
	end
	--================================================================
	--��ĩ�
	if WEEKEND_SWITCH == 1 then
		if GetTrigger(2000) == 0 then
			CreateTrigger(0, 1000, 2000);
		end;
	else
		if GetTrigger(2000) ~= 0 then
			RemoveTrigger(GetTrigger(2000));
		end;
	end;
	--================================================================
	--������������������
	if GetTask(1314) >= 2 and (GetTask(1312) == 5 or GetTask(1313) == 4) then
		SetTask(1312,6);
		SetTask(1313,5);
	end
	--================================================================
	--����������ʾ
	if GetLevel() >= 70 and GetTask(2030) == 0 then
		Msg2Player("G�n ��y Kh�u chu�n Bi�n Kinh nh�n ���c tin Nh�t Ph�m ���ng �� h�nh ��ng t�i bi�n gi�i T�y B�c ��i T�ng, b�ng h�u c�ng c� danh ti�ng tr�n giang h�. Xin ra tay gi�p ��.");
	end

	--��������̽����Ʊ��ʾ
	if GetTask(2031) >= 68 then
		give_xibei_ticket()
		if random(1,100) <= 33 then
			Msg2Player("��i T�ng v� mu�n ti�n cho c�c ��i hi�p tr�n ���ng v��t �i th�n b� �� ph�i 1 M�t s� � Ph�ng T��ng ph� gi�p ��a c�c ��i hi�p ��n n�i th�n b�, h�y ��n Ph�ng T��ng (219, 196) �� t�m hi�u.")
		end
	end

	if GetTask(101) ~= 874 then
		remove_oldquest()	-- ɾ��ԭ��������
	end

	if (IsInGatherMap() == 1) then
		SetInGatherMap(1)
	else
		SetInGatherMap(0)
	end

	if GetTask(1) == 0 then
	    SetTask(1, 100);
	    TaskTip("H��ng d�n nhi�m v� t�n th�: B�i ki�n D� T�u");
	end;

	if GetTask(111) > 0 and GetTask(111) < 100 then
	    SetTask(111, 0);
	end;

	if GetTask(121) > 0 and GetTask(121) < 100 then
	    SetTask(121, 0);
	    SetTask(122, 0);
	end;
	--================================================================
	-- �Ի�֮ҹ��ʾ
	ShowShinyNightMsg()
	--================================================================
	--�η����
	if GetWorldPos() == 701 then
		SetCanRestorePK(1);	--4���ٶ���PKֵ
		UseScrollEnable(0);	--����ʹ�ûسǷ�
		ForbidRead(1);	--��������
	end;

	-- �����η����
	if GetWorldPos() >= 730 and GetWorldPos() <= 734 then
		StallEnable(0)	-- ���ܰ�̯
		ForbidRead(1)	--��������
		UseScrollEnable(0)	--��ֹʹ�ûس�
		SetFightState(0)
		ContinueTimer(GetTrigger(261))
	end
	--================================================================
	--ս�����
	if GetTask(800) == 0 then	--��ս���������
		for i=701,799 do
			if i ~= 747 then
				SetTask(i,0);
			end;
		end;
		SetTask(800,1);
	end;
	CalcBattleRank()	--����ս������
	UpdateBattleMaxRank()
	VerifyEquip()		-- ���װ������ȥ�Ƿ���Ч
	if GetTask(741) == 1 then
		KillFollower();
		SetTask(741,0)
	end;
	--================================================================
	--������
	UnSedan()	-- �»���
	OnDoll()	-- ������������
	--================================================================
	Del_overdue_goods();	--ɾ��������Ʒ
	--�峤�ĵ�½ִ�к���
	Zgc_login_fun_main()
	--================================================================
	--��СѾ�������ʧ��־λ���
	SetTask(615,0)
	SetTask(629,0)  --�շѰ���628 IB����629
	--================================================================
	--07��Ϧ�
	local nQixiDate = tonumber(date("%Y%m%d"))
	if nQixiDate >= 20070816 and nQixiDate <= 20070830 then
		Msg2Player("Ho�t ��ng Th�t t�ch �� khai m�c, b�ch Hoa s� gi� kh�p n�i � trung t�m Bi�n Kinh , Th�nh ��, Tuy�n Ch�u �� chu�n b� v� s� l� v�t cho t�nh nh�n trong d�p l� l�ng m�n n�y, mau mau ��n xem!")
	end

	flower_time();
	--================================================================
	--�Ƴ��Ѿ���ֹ�ļ���: "����ȭ��"
	if HaveLearnedSkill("H�n ��n quy�n ph�p") == 1 then
		RemoveSkill("H�n ��n quy�n ph�p")
	end
	--================================================================
	--========��ʯ����==============
	if GetTask(TASK_LINGSHI_ID) == 0 then
		--talk_I();
	elseif GetLevel() >= 80 and GetTask(689) == 0 then	--�ȼ����ڵ���80������һ�ε�½
		local tbBWSay = {
					"Ta mu�n ��n ch� b�o danh/go_to_biwudahui",
					"�� ta suy ngh�/nothing",
					}
		Say("<color=green>Minh Ch� Kim S�n<color>: Nh�m t�o n�n m�t giang s�n th�i b�nh th�nh tr�, tri�u ��nh kh�ng ng�ng xem tr�ng v� trang. �� bi�n c��ng kh�ng b� x�m l��c v� �� vang danh sa tr��ng, ��i h�i t� v� Thi�n H� �� Nh�t ch�nh th�c b�t ��u.",getn(tbBWSay),tbBWSay);
		SetTask(689,1,TASK_ACCESS_CODE_BIWUDAHUI);
	elseif GetLevel() >= 70 and GetTask(544) == 0 then --�ȼ����ڵ���70������һ�ε�½
		Talk(1,"about_suohun","<color=red>Nh�c nh� quan tr�ng<color>: V� l�m truy�n k� 2 th�m bi�n ph�p an to�n m�i, m�i ng��i c�n ch� �:\nTh�m <color=red>�n kh�a h�n<color>, kh�a v�t ph�m hi�n t�i ph�n 2 lo�i, <color=red>Kh�a th��ng<color> v� <color=red>Kh�a h�n v�t ph�m<color>.\n<color=red>Kh�a th��ng<color> l� ch�c n�ng kh�a v�t ph�m �� m�, v�t ph�m kh�a kh�ng th� giao d�ch, n�m b�, b�n ti�m v� l�m c�c thao t�c ��c bi�t.\n<color=red>�n kh�a h�n<color> t�c l� th�m ch�c n�ng an to�n. V�t ph�m kh�a h�n <color=red>c� th� giao d�ch<color>, nh�ng <color=red>kh�ng th�<color> n�m b�, b�n ti�m v� l�m c�c thao t�c ��c bi�t.");
	elseif GetTask(549) == 0 then
		Say("    V� l�m truy�n k� 2 ch�nh th�c c�ng b� ch�c n�ng <color=yellow>T� t�m ���ng<color>. T� t�m ���ng, t�m NPC, t�m ng��i ch�i, d� s� d�ng.\n    Nh�n ph�m '<color=red>G<color>' m� b�n �� l�n: T�m ��a �i�m ho�c nh�n c�c b�n �� nh� �� v�o, d� d�ng ��n ��a �i�m b�t k� tr�n b�n ��; C�ng c� th� t�m t�n NPC �� t� t�m ��n NPC. Nh�n ph�m '<color=red>H<color>', c� th� m� to�n c�nh b�n �� nh� ��n v� tr� b�t k� tr�n b�n ��.\n    C� th� 'T�m ng��i' qua danh s�ch h�o h�u ho�c c�u nh�n, danh s�ch t�n g�u �� t�m v� tr� ng��i ch�i.",0);
		SetTask(549,1);
--	elseif GetTask(443) == 0 then
--		Say("Th�i gian x�c nh�n 5 gi� ch�i �� h�t, xin ��ng nh�p v�o <color=yellow>http://volam2.zing.vn �� ��ng k� th�ng tin.",0);
--		SetTask(443,1);
	end;
	--========���гƺ�==============
	local tTongCityTitle =
	{
		[100] = {5,6,7,8},
		[300] = {1,2,3,4},
		[350] = {9,10,11,12},
	}
	local szPlayerName_CityWarUse = GetName()
	for index, value in tTongCityTitle do
		local szSelfTong = GetTongName()
		local szTongName, _2, _3, nCityEndTime = GetCityWarInfo(index, "base")
		for i=1, 4 do
			if IsTitleExist(51, value[i]) > 0 then
				if szTongName == nil or szTongName ~= szSelfTong then
					RemoveTitle(51, value[1])
					RemoveTitle(51, value[2])
					RemoveTitle(51, value[3])
					RemoveTitle(51, value[4])
					break
				else
					if i == 1 or i == 2 then	-- ����or����
						local nCount, szBoss = GetCityWarInfo(index, "boss")
						if szBoss ~= szPlayerName_CityWarUse then
							RemoveTitle(51, value[1])
							RemoveTitle(51, value[2])
							RemoveTitle(51, value[3])
							RemoveTitle(51, value[4])
						end
					elseif i == 3 then			-- ��ʦ
						local nCount, szManager = GetCityWarInfo(index, "manager")
						if szManager ~= szPlayerName_CityWarUse then
							RemoveTitle(51, value[1])
							RemoveTitle(51, value[2])
							RemoveTitle(51, value[3])
							RemoveTitle(51, value[4])
						end
					elseif i == 4 then			-- ����
						local nCount, sF1, sF2, sF3, sF4 = GetCityWarInfo(index, "fighter")
						if not (sF1 == szPlayerName_CityWarUse or
							sF2 == szPlayerName_CityWarUse or
							sF3 == szPlayerName_CityWarUse or
							sF4 == szPlayerName_CityWarUse) then
								RemoveTitle(51, value[1])
								RemoveTitle(51, value[2])
								RemoveTitle(51, value[3])
								RemoveTitle(51, value[4])
						end
					end
				end
				break
			end
		end
	end
	--========��һ�ν�����Ϸ�����ʦ��=========
	if CustomDataRead("mp_p_give_baishitie") == nil then
		AddItem(2,1,587,1,1)
		CustomDataSave("mp_p_give_baishitie", "d", 0)
	end
	--=============�������ҳ============================
	if GetTask(TASK_CHUWUXIANG_JIAYE) ~= 1 and GetTask(805) >= 2 and GetStoreBoxPageCount() <= 4 then
		SetStoreBoxPageCount(GetStoreBoxPageCount()+1);
		SetTask(TASK_CHUWUXIANG_JIAYE,1);
		Msg2Player("To�n th� nh�n vi�n V� L�m 2 ch�c b�n ch�i vui v�, ch�ng t�i t�ng b�n th�m 1 R��ng ch�a ��, ch�c b�n k�t th�m nhi�u b�n m�i.");
	end
	--===============08���˽�================================
	if GetTask(2407) ~= 0 and GetTime() - GetTask(2407) > 60*60*24 then
		KillFollower();
		SetTask(2407,0);
	end;
	if GetTask(444) == 0 and nPlayerRoute == 21 then	--����ǹ�ʦ��һ������
		AddItem(2,0,1063,1);	--����һ����ľ����
		Msg2Player("B�n nh�n ���c 1 Th�n M�c V��ng ��nh");
		TaskTip("B�n nh�n ���c 1 Th�n M�c V��ng ��nh");
		SetTask(444,1);
	end;
	if nPlayerRoute == 21 then
		sync_guinsect_num_in_guding();	--ͬ����ʦ�ƶ�����ĹƵ��������ͻ���
	end;
	
	--������߲���
	exchgsvr_on_player_login()--�����
	
	process_biwudahui();	--����������������
	process_shimenguanka();	--����ʦ�Źؿ��������
	process_ip_issue();		--���ϴε�½IP��ͬʱ����ʾ


	--===================================���������뿪��Ȫ���ͼ������(���µ�һ��)======================================
	first_tong_pk_config();
--	AddItemForViet200906()
--	AddItemForViet200909()
	AddItemForViet200911()
    	AddItemForViet200912()
-- B�o v� R��ng T�i Nguy�n
	local nDate = tonumber(date("%w"))
	if nDate == 3 then
		if GetTrigger(3204) == 0 then
			if CreateTrigger(2,1704,3204) == 0 then	--����ɶ����������ͼ������
				WriteLog(GetName().." CreateTrigger 1704 failed")
			end
		end
		if GetTrigger(3205) == 0 then
			if CreateTrigger(2,1705,3205) == 0 then	--�뿪�ɶ����������ͼ������
				WriteLog(GetName().." CreateTrigger 1705 failed")
			end
		end
	else
		for i = 3204,3205 do
			if GetTrigger(i) ~= 0 then
				RemoveTrigger(GetTrigger(i))
			end
		end;
	end

     --ȡ���ճ��������
     set_ruchangrenwu_type()
	
	if GetPlayerRoute() ~= 0 then
		local nDate = tonumber(date("%w%H"))
		if nDate >= 319 and nDate < 320 then
			local nMapID, nX, nY = GetWorldPos()
			if nMapID == 304 then
				local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(300, "base")
				if IsTongMember() == 0 or GetTongName() ~= szTongName then
					LeaveTeam()
					local nFlag = random(1,2)
					SetPKFlag(1,nFlag)
					ForbidChangePK(1)
					SetTaskTemp(105,1)
				end
			end
		end
	end
	
-- reset VNG TaskID	
	ResetTask()
	removeLiangshan()
	
-- VNG clear event item
	DelEventItem()
		
-- VNG IP Bonus
	IpBonusReset()
	IpBonusStart()
	
-- Server ID
--	get_server_id()
	vng_set_nationality()
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 49 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 52)
		return
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 45 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 53)
		return
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 54 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 50)
		return
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 30 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 12)
		return
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 46 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 16)
		return
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 51 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 17)
		return
	end
	
--	if gf_GetTaskByte(TSK_SERVER_ID,1) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
--		gf_SetTaskByte(TSK_SERVER_ID,1,GetGlbValue(GLB_TSK_SERVER_ID))
--	end
	
-- Add Ti�u Ng�o Giang H� L�c n�u ch�a c�
	if GetItemCount(2, 1, 30240) < 1 then
		AddItem(2, 1, 30240, 1)
		Msg2Player("B�n nh�n ���c 1 quy�n Ti�u Ng�o Giang H� L�c!")
	end	
	
-- Th�ng b�o s� d�ng ��u th�nh
	if GetTask(2154) > 0 then
		TaskTip("B�n �� k�ch ho�t s� d�ng ��u Th�nh T�n, ��u Th�nh Th�, ��u Th�nh Bi�u. �� h�y b� k�ch ho�t h�y ��n Bi�n Kinh t�m Tri�u Ph�.")
	end
	vng_merge_server()
	local nCheckLServer = GetGlbValue(GLB_TSK_SERVER_ID)
	if nCheckLServer < 150 or nCheckLServer > 158 then
		init_new_server()
		Init_Change_Server()
	end
	
	-- Set ID cho server Th�nh Long
	local nDateSpec = tonumber(date("%y%m%d"))
	if nDateSpec >= 111223 and nDateSpec <= 120123 then
		if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= 70 and GetGlbValue(GLB_TSK_SERVER_ID) == 70 then
			gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 70)
		end
	end
	
	vng_playerlogin_init()
	
	local nDenBuDate = tonumber(date("%y%m%d"))
	if nDenBuDate >= 120814 and nDenBuDate <= 120814 then
		DenBu_BKL()
	end
	
--  Khu  v�c tr�ng b�t nh� l�n
	local nMapID = GetWorldPos()
	if (nMapID  == 301 or  nMapID == 108) and GetFightState() == 0 then
		SetFightState(1)
	end
	-- ����׾Ե�����ע��������
	if ExchangeComing == 0 then
		OfflineLiveEx()
	end
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 49 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 52)
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 45 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 53)
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 54 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 50)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 31 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 43)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 18 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 16)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 37 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 26)
	end
	--==========================================201110�º�������ս==============================
	if GetTask(2929) == 2 then
		dragon_boat_201110()
	end
	--==============================================
	
	local nDate = tonumber( date( "%y%m%d" ) )
	local nCurDate = floor ( GetTask( TSK_NEWRES_CALC_DAILY ) / 10 ) 
	if nCurDate ~= nDate then
		SetTask ( TSK_NEWRES_CALC_DAILY, nDate * 10 )
	end
	
	local nWeek = tonumber ( date ("%w") ) -- tr� v� ng�y trong tu�n
	-- Ch� reset task v�o th� 5 v� th� 7
	if  nWeek == 4 or nWeek == 6 or nWeek == 0 then
		if mod(GetTask(TSK_NEWRES_CALC_DAILY), 10) == 0 then
			SetTask(TSK_TRANS_POINT_ALLOW,0)
			SetTask(TSK_NEWRES_CALC_DAILY,GetTask(TSK_NEWRES_CALC_DAILY) + 1)			
		end
	end
	-------------------------------------------------------------------------------------------------------------------------------------------
--	--Check ng�y h�t h�n B�ch Kim L�nh BKL
--	local nBKL_End = GetTime()
--	local nCountBKL = CheckCharged_BKL() 
--	local nCountBKLbyTSK = GetTask(TSK_BKLB_COUNT)
--	local nActivebyTSK = GetTask(TSK_BKLB_ACTIVE)
--	--Msg2Player("G�a tr� byte 1: "..nCountBKL)
--	--Msg2Player("Gi� tr� n�p by task: ".. nCountBKLbyTSK)
--	--Msg2Player("Gi� tr� kich ho�t by task: ".. nActivebyTSK)
--
--	if CheckAccountExt_BKL() <= 0 then
--	--Msg2Player("�� v�o 1")
--		if nCountBKLbyTSK > nCountBKL then
--			--Msg2Player("�� v�o 2")
--			nCountBKL = nCountBKLbyTSK
--			local nTempExt = GetExtPoint(EXT_POINT_BKLB)
--			PayExtPoint(EXT_POINT_BKLB, nTempExt)
--			--SetByte(nTempExt,1, nCountBKL)
--			gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_COUNT, nCountBKL)
--			--local tam1 = gf_GetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_COUNT)  -- x�a
--			--Msg2Player("Gi� tr� byte 1 Ext sau: ".. tam1)			
--			--SetByte(nTempExt,2, nActivebyTSK)
--			gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, nActivebyTSK)
--			--local tam2 = gf_GetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE) 			
--			--Msg2Player("Gi� tr� byte 2 Ext sau: ".. tam2)			
--			--AddExtPoint(EXT_POINT_BKLB, nTempExt)
--			--Msg2Player("Gi� tr� n�p Ext sau: ".. nTempExt)			
--			
--		end
--	end
--	if GetTask(TSK_BKLB_ACTIVE) > 0 then -- or nCountBKL >= 1 	--nCountBKLbyTSK == nCountBKL and 
--	--Msg2Player("�� v�o 3")
--		if nCountBKL == nCountBKLbyTSK then
--		--Msg2Player("�� v�o 4")
--			if nBKL_End - GetTask(TSK_BKLB_START) > 5270400 then --and CheckAccountExt_BKL() <= 0  ch� c�n check ~ tr��ng h�p �� n�p trong game
--			--Msg2Player("�� v�o 5")
--				SetTask(TSK_BKLB_ACTIVE,0)
--				--local nTempExt1 = GetExtPoint(EXT_POINT_BKLB)
--				--PayExtPoint(EXT_POINT_BKLB, nTempExt1)
--				gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 0)
--				--SetByte(nTempExt1,2, 0)
--				--AddExtPoint(EXT_POINT_BKLB, nTempExt1)		
--				--gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_COUNT, nCountBKL)
--				Msg2Player("B�ch Kim L�nh �� h�t hi�u l�c. Vui l�ng k�ch ho�t l�i.")
--				Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: B�ch Kim L�nh �� h�t hi�u l�c. Vui l�ng k�ch ho�t l�i.")
--			end	
--		end
--	end
--	--------------- x�a tr�ng task HKLB
--	if nDate >= 120323 and nDate <=120329 then
--		if GetTask(TSK_BKLB_HAVETASK) == 0 and GetTask(TSK_BKLB_START) >= 1332370895 and GetTask(TSK_BKLB_START) <= 1332457260 then
--			SetTask(2720, GetTask(2282))
--			SetTask(TSK_BKLB_HAVETASK, 1)
--		end
--	end
	--====================�ؿ�������������ܶ������ﴦ��ɾ��==============================
	--RemoveNewSkill()
	--=================������=====================================================
	treasure_box()
	--gtask֧��NPC�Ի������� [���ִ��������쳣]
	gtask_support()
	--�ؿ�ָ�������ż���
	get_message_task()
	--������Ա���
	--give_baguabaodian();
	VietResetDate() -- reset task m�i ng�y
	--��ս��ɽboss�
	LSB_Challenge_Trigger();
	--���˻
	oly_create_trigger();
	--ǧѰ������������
	qht_create_trigger();
	--׷����������ս
	dzt_tmz_trigger();
-- Nhi�m v� ��nh qu�i chuy�n sinh 6
	if GetTask(TSK_CS6_TULINH) == 4 then
		CreateTrigger(0,1279,2558)
	end
	if GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FLAG_LEVEL) == 1 then
		local nLevel_CS6 = GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_SAVE_LEVEL)
		SetLevel(nLevel_CS6,0)
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FLAG_LEVEL, 0)	
	end
	---------	
	--V�n may ��o h�u
--	if nDate > 130423 and nDate <= 131230 then
		vanmay_daohuu()		--t�nh n�ng �ang ��ng (set �i�m v� 100, khi m� l�i ph�i m� gi�i h�n ng�y th�ng)
--	end	
--	if nDate <= 130423 then --��n b� ng�y 22/4/2013
--		vanmay_daohuu_denbu()
--	end	
	--������ȡǷ�����ʾ
	show_yunling_box_login_message()
	--����ս��
	ZQ_Leave_Game();
	--���ʢ���BUFF
	tf_PlayerLoginAddBuff();
	--Npc����������
	--\script\global\npcdeath_trigger.lua
	if GetTrigger(1297*2) <= 0 then
		CreateTrigger(0, 1297, 1297*2);
	end
	--���ڻ
	sp_CreateTalkTrigger();
	--��������
	wxfls_AddItemPlayerlogin();
	
	onlogin_fix_meridian_attr_point_addon()--�Զ��޸�����������Ǳ�ܵ�������չ
	
	Observer:onEvent(SYSEVENT_PLAYER_LOGIN, ExchangeComing)
	--��¼������ֹ�ѫ�汾�Ƿ���Ҫ����
	merit_PlayerLogin();
	--������������
	slt_LeaveGame();
	ibc_PlayerLogin(); --�ڵ��߲����
	
	-------------------------------------------------------
end;
--*****************************ɾ��������Ʒ*************************
overdue_goods_list = {
	--װ������-����------------------------С���б�---------------------��Ч�ڣ��죩--ɾ����Ʒ��ʾ
	{0,		109,173,174,175,176,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,1,"Y ph�c h�n l� b�n thu� �� h�t h�n!"},	--����·�
	{0,		108,131,132,133,134,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,1,"Trang s�c h�n l� b�n thu� �� h�t h�n!"},	--���ͷ��
	{0,		109,177,178,179,180,1,"Ch� h�n l� b�n thu� �� h�t h�n!"},
	{0,		105,32,1,"Ki�u hoa h�n l� b�n thu� �� h�t h�n!"},
	-- Ph�n n�y kh�ng Merg khi c� event m�i
	--{0,		105,33,1,"Ni�n th� c�a b�n �� h�t h�n!"},
}
function Del_overdue_goods()
	local time_now = GetTime()
	local obj_index, item_index = GetFirstItem();
	local nDeletedCount = 0;
	while (obj_index ~= 0 and item_index ~= 0) do
		local genre = GetItemGenre(item_index)
		local detail = GetItemDetail(item_index)
		local particular = GetItemParticular(item_index)
		for i = 1, getn(overdue_goods_list) do
			local nSize = getn(overdue_goods_list[i]);
			if genre == overdue_goods_list[i][1] and detail == overdue_goods_list[i][2] then
				for j = 3,nSize-2 do
					if particular == overdue_goods_list[i][j] and time_now - GetItemCreateTime(item_index) >= (86400 * overdue_goods_list[i][nSize-1]) then
						DelItemByIndex(item_index,-1)
						Msg2Player(overdue_goods_list[i][nSize])
						nDeletedCount = nDeletedCount + 1;
					end
				end
			end
		end
		obj_index, item_index = GetNextItem(obj_index, item_index)
	end
	if nDeletedCount ~= 0 then
		Say("B�n c� "..nDeletedCount.."v�t ph�m �� h�t h�n, chi ti�t xem h� th�ng th�ng b�o!",0);
	end;
end

function add_pouch_new_year_09_viet(tItem, szLog)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName)
		WriteLogEx(szLog, "Nh�n ���c", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(szLog, "Nh�n ���c", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end

function remove_oldquest()
	SetTask(101, 874)
	if GetTrigger(51) ~= 0 then
		RemoveTrigger(GetTrigger(51))
	end
	if GetTrigger(52) ~= 0 then
		RemoveTrigger(GetTrigger(52))
	end
	if GetTrigger(53) ~= 0 then
		RemoveTrigger(GetTrigger(53))
	end
	if GetTrigger(61) ~= 0 then
		RemoveTrigger(GetTrigger(51))
	end
	if GetTrigger(71) ~= 0 then
		RemoveTrigger(GetTrigger(51))
	end
	if GetTrigger(72) ~= 0 then
		RemoveTrigger(GetTrigger(51))
	end
end

-- �½�
function UnSedan()
	local genre, detail, particular = GetPlayerEquipInfo(10)
	if (genre == 0 and detail == 105 and particular == 32) then
		DesaltPlayer(1, 7)
	end
end

function OnDoll()
	if (GetTask(TASKVAR_DOLLTIME) ~= 0) then
		if (GetMateOnlineStatus() == 1) then
			KillFollower()
			ActivateDoll(0)
		else
			local follower = GetFollower()
			if follower > 0 then
				SetCurrentNpcSFX(follower, SFX_DOLL, 1, 1)
			end;
			ActivateDoll(1)
		end
	end
end

function ShowShinyNightMsg()
	local system = GetGlbValue(GAMESVRGLB_SYSTEM)
	local multiple = GetGlbValue(GAMESVRGLB_MULTIPLE)
	if (system ~= 0) then
		Msg2Player(format("�Ի�֮ҹ������У�����������ϵͳ��%s��������%1.1f",
			map_sysnames[system],
			multiple / 100))
	end
end

--=================================�峤�ĵ�½ִ�к���=============================
function Zgc_login_fun_main()
	player_out_huashan()
	nw_mission_out()
	tomb_sweep_2008()
	ma_same_heart_deal()			--ͬ��ֵ�Զ�����
	task_talk_deal()				--������ʾ����
end

--*********************************��ɽ����******************************
function player_out_huashan()
	--���ܣ����ڻ�ɽ�����ߺ����ߵ�����������ɽ��ͼ��
	local map_id = GetWorldPos()
	if map_id == 969 then
		NewWorld(100,1420,2989)
	end
end


--�����ؿ���������
function nw_mission_out()
	local mapid = GetWorldPos()
	for i= 1, 6 do
		for j	= 1,2 do
			for k = 1,getn(Stage_info[i].map[j]) do
				if Stage_info[i].map[j][k] == mapid then
					Ms_on_log_in()
					break
				end
			end
		end
	end
end

function north_west_mission_out()
	local mission_diff = GetTask(Task_ID_stage_diff)
	if mission_diff == 2 then
		SetPKFlag(1,1)		--PK״̬
		ForbidChangePK(0)	--��ֹת��PK״̬
	end
	UseScrollEnable(1)	--����ʹ�ûسǷ�
	ForbitTrade(0)		--���Խ���
	StallEnable(1)		--���԰�̯
	SetDeathPunish(1)	--�������ͷ�
	OpenFriendliness(1)	--���Ӻøж�
	RestoreAll()		--ȫ���ظ�
end
--*******************************2008�����ڻ**************************
function tomb_sweep_2008()
	--������ɾ��
	local task_diff = GetTask(1854)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate <= 20080412 then
		return
	end
	if task_diff ~= 1 and task_diff ~= 3 and task_diff ~= 8 and task_diff ~= 10 then
		return
	end
	for i = 900,903 do
		local trigger_ID = GetTrigger(i)
		if trigger_ID ~= 0  then
			RemoveTrigger(GetTrigger(trigger_ID))
		end
	end
end
--******************************ͬ��ֵ˥������***************************
TaskID_attenuation_date_seq = 1219
TaskID_same_heart_value = 2015
Same_heart_value_max_TaskID = 2023		--ͬ��ֵ����id
function ma_same_heart_deal()
	---------------------------ͬ��ֵ���޴���---------------------------
	if GetTask(Same_heart_value_max_TaskID) <= 500 then
		SetTask(Same_heart_value_max_TaskID,500)
	end
	---------------------------ͬ��ֵ˥������---------------------------
	local day_seq_dealed = GetTask(TaskID_attenuation_date_seq)
	local day_seq_now = zgc_pub_day_turn(1)
	--��һ�β�����
	if day_seq_dealed == nil or day_seq_dealed == 0 then
		SetTask(TaskID_attenuation_date_seq,day_seq_now)
		return
	end
	--�����������
	local day_distance = day_seq_now - day_seq_dealed
	if day_distance < 7 then
		return
	end
	--ͬ��ֵ˥��
	local same_heart_value = GetTask(2015)
	local attenuation_num = 0
	if same_heart_value <= 500 then
		attenuation_num = (day_distance * 4)
	elseif same_heart_value >501 and same_heart_value <= 2000 then
		attenuation_num = floor(same_heart_value * (0.06/7) * day_distance)
	else
		attenuation_num = floor(same_heart_value * (0.12/7) * day_distance)
	end
	--���뵱ǰ������
	SetTask(TaskID_attenuation_date_seq,day_seq_now)
	--���˥��ֵ���ڵ�ǰֵ������Ϊ0
	if same_heart_value <= attenuation_num then
		SetTask(TaskID_same_heart_value,0)
	else
		SetTask(TaskID_same_heart_value,(same_heart_value - attenuation_num))
	end
end
--��ɽ�ؿ���������������ʾ
nTaskId_LS_TMS_TALK = 2856
tLsTmz_TALK_INFO = {
	{70,"Thi�n M�n Tr�n: Nh�m t�ng quy m� tham gia chi�n tr��ng Di�n V� Thi�n M�n Tr�n, qu�n s� ��i T�ng �� m� th�m chi�n tr�n di�n v� Thi�n M�n Tr�n t�i Th�nh �� (231, 229) v� ��i L� (179,179) h�y ��n �� t�m Qu�ch Qu�n B�ng b�o danh tham gia"},
	{80,"Khi�u chi�n L��ng S�n: L��ng S�n 108 v� t��ng g�i l�i m�i ��n c�c v� h�o ki�t tr�n giang h� ��n t� v� giao h�u, ��i hi�p c� th� ��n c�c th�nh ch� t�m Th�nh H�nh Th�i B�o ��i T�ng (b�n c�nh Th�n Du Ch�n Nh�n) �� ���c tham gia v��t �i"},
}
function task_talk_deal()
	local nPlayerLevel = GetLevel()
	local nTalkValue = GetTask(nTaskId_LS_TMS_TALK)
	for i = 1,getn(tLsTmz_TALK_INFO) do
		if nPlayerLevel >= tLsTmz_TALK_INFO[i][1] and GetBit(nTalkValue,i) == 0 then
			LsTmz_login_talk(i)
			break
		end
	end
end
function LsTmz_login_talk(nTalkSeq)
	Talk(1,"#LsTmzTalkFinish("..nTalkSeq..")",tLsTmz_TALK_INFO[nTalkSeq][2])
end
function LsTmzTalkFinish(nTalkSeq)
	local nTalkValue = GetTask(nTaskId_LS_TMS_TALK)
	nTalkValue = SetBit(nTalkValue,nTalkSeq,1)
	SetTask(nTaskId_LS_TMS_TALK,nTalkValue)
end
--==================================����=================================

--========================07��Ϧ�======================================
--ͳ������ʱ�䣬�����ӳɳ���
function flower_time()
	--û�ֻ���ͳ��
	if GetTask(TASK_IS_PLANT) == 0 then
		return
	end
	--�ɳ��ȵ�100����ͳ��
	if GetTask(TASK_FLOWER_GROW) >= 100 then
		return
	end
	--����ɳ����Ѿ���1������ͳ��
	local now_days = floor((GetTime()+28800)/86400);
	if now_days == GetTask(TASK_IS_GROW) then
		return
	end

	if GetTask(TASK_LAST_LOGIN) ~= GetLastLoginTime()+28800 then   --�ж��Ƿ���
		SetTask(TASK_CURRENT_LOGIN,GetTime()+28800);  --��¼��ǰ��½ʱ��
		SetTask(TASK_LAST_LOGIN,GetLastLoginTime()+28800);
	else                     --���Ҳ��ͳ��
		return
	end

	local nThisTime = floor(GetTask(TASK_CURRENT_LOGIN)/86400);
	local nLastTime = floor((GetLastLoginTime()+28800)/86400);
	if nLastTime ~= 0 and nThisTime ~= nLastTime then
		SetTask(TASK_TOTAL_TIME,0);
	end
end
--==========================================================================================
function process_biwudahui()
	StopTimeGuage(-1);
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		SetFightState(0);
--		if GetSvrConfig("IsSaveRoleData") == 0 then
--			Del_Item_By_List();
--			Add_Item_By_List(g_tGiveItemList);
--			Del_Spe_Item();
--			--��ȯ����������ȸɵ���ȯ
--			local nValue = GetYinQuan();
--			ModifyYinQuan(-nValue);
--			Msg2Player("��ȯ�����ڷ���ԭ����ָ���");
--		end
		ForbidChangePK(1);
		ForbitTrade(1);	--��ֹ����
		StallEnable(0);	--��ֹ��̯
		local nMap_ID = GetWorldPos();
		local tDLGC_Map = {};
		if _JX2WZ ~= 2 then
			tDLGC_Map = {
				[7990] = 1,
				[7991] = 1,
				[7992] = 1,
				[7993] = 1,
				[7994] = 1,
			};
		else
			tDLGC_Map = {
				[7990] = 1,
				[7991] = 1,
				[7992] = 1,
			};
		end
		if nMap_ID == 7100 then --������
			SetTask(TSK_JOIN_LIST_TYPE,-1,TASK_ACCESS_CODE_BIWUDAHUI);
			JoinGestConvention();
			RemoveRevivals();	--����嶾����
			SetTask(TSK_JOIN_LIST,1,TASK_ACCESS_CODE_BIWUDAHUI);
			Add_Item_By_List(g_tGiveItemList_biwu)
		elseif nMap_ID == 7980 then --���������
			Add_Item_By_List(g_tGiveItemList_tmz_dlgc)
		elseif nMap_ID == 8000 then	-- NVN
--			NvnHall_Enter();
--			SendScript2Client(format("Open('nvnHall', %d)",1));
--			NVN_UpdateItemEnhance();
			Add_Item_By_List(g_tGiveItemList_biwu)
			P3v3_Join();
			SendScript2Client("Open('3v3')");
--		elseif tDLGC_Map[nMap_ID] == 1 then --��³�ųǱ�����
--			Add_Item_By_List(g_tGiveItemList_tmz_dlgc)
--			DLGC_Join();
--			SendScript2VM("\\script\\missions\\dlgc\\dlgc_sign_up.lua", "onPlayerLogin()");
--			--SendScript2Client("Open('DLGCBattle')");
--			WriteLog(format("[date:%s][role:%s][acc:%s][��³�ųǵ�¼��������][GSID:%d]",date("%Y%m%d%H%M%S"),GetName(),GetAccount(), GetGSIndex()[0]));
--		elseif nMap_ID == 7102 then
--			SetTask(TASKID_XSBK_ENTER_TIME, GetTime());
--			local nMinute = tonumber(date("%M"));
--			local nSecond = tonumber(date("%S"));
--			local nDeltaTime = (40 - nMinute) * 60 + nSecond;
--			if nDeltaTime > 0 then
--				StartTimeGuage("��ɽ���⵹��ʱ", nDeltaTime, 0, 1);
--			end
--			local szMsg = "ʧ���µ���ɽ��������" .. date("%H") .. "��40����ʽ��ʼ���������ڴ˵ȴ��������ĵȺ�";
--			Talk(1, "", szMsg);
--			Msg2Player(szMsg);
		end
		--��װ���飺���������ǧ���
--		local nQBHCount = BigGetItemCount(2,95,572);
--		if nQBHCount > 0 then
--			BigDelItem(2,95,572,nQBHCount);
--		end
		--����ʯ����
--		local nJNSCount = BigGetItemCount(2,1,10010);
--		if nJNSCount > 0 then
--			BigDelItem(2,1,10010,nJNSCount);
--		end
	else
		--ǧ���
--		local nQBHCount = BigGetItemCount(2,95,572);
--		if nQBHCount < 1 then
--			AddItem(2,95,572,1);
--		end
		--����ʯ����
--		if 0 >= BigGetItemCount(2,1,10010) then
--		AddItem(2,1,10010,1,4);
--		end
	
		SendScript2Client(format("Open('nvnHall', %d)",0));
		SendScript2Client(format("Open('nvnRoom', %d)",0));
		local nNowDate = tonumber(date("%Y%m%d%H"));
		if nNowDate < g_nBWAwardDate then
			Msg2Player("Ph�t th��ng ��i H�i T� V� li�n ��u, t� 10 gi� 12/05/2014 ��n 22 gi� 18/05/2014 c� th� ��n ��c s� ��i H�i T� V� nh�n th��ng.");
		end
--		if GetTask(TASKID_BIWU_IS_REALM) ~= 0 then
--			GLB_BW_SynData(0,0);--ͬ������
--			local nRoute = GetPlayerRoute();
--			if nRoute == 21 then
--				GLB_BW_SynData(0,1);
--			end
--			GLB_BW_SynData(0,2);
--			GLB_BW_SynData(0,3);
--		else
			process_biwudahui_update_zige()
			process_biwudahui_2()
--		end
	end
end;

function process_biwudahui_2()
	--SetTask(TASKID_BIWU_IS_REALM,0);
	g_tZiGePoint = {};
	local nCurPoint = GetTask(666);
	local nSignUpInfo = GetTask(678);
	local nBeginTime = MkTime(2014,5,12,10,0,0);
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-nBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --�ڼ�����
	local nSeasonWeek = mod(nWeek,g_nBWWeeks); --��ǰ�����ĵڼ���
	if nSeasonWeek == 0 then
		nSeasonWeek = g_nBWWeeks;
	end
	local nCurWeek = tonumber(date("%w"));
	nBeginTime = nBeginTime+(nCurSeason-1)*g_nBWWeeks*7*24*3600;

	if nCurTime >= nBeginTime and GetTask(649) ~= nBeginTime then
		if BWDH_DEBUG_VERSION == 1 then
			print("biwudahui new season:", GetName(), nCurTime, GetTask(649));
		end
		SetTask(647,nSignUpInfo, TASK_ACCESS_CODE_BIWUDAHUI);	--��¼�ϲ�ǰ�ı������
		if nSignUpInfo ~= 0 then	--�����������
			if nSignUpInfo == 1 then	--��������������ѡ��
				SetTask(678,2);
			end;
			if nCurPoint < 200 then	--ֻ��200�����µ�������ӻ���
				if nCurPoint + 100 > 200 then
					SetTask(666,200,TASK_ACCESS_CODE_BIWUDAHUI);
					Msg2Player("�i�m t� v� �� t�ng"..(200 - nCurPoint).." Ph�t ");
				else
					SetTask(666,nCurPoint+100,TASK_ACCESS_CODE_BIWUDAHUI);
					Msg2Player("�i�m t� v� �� t�ng 100 �i�m");
				end;
			end;
			SetTask(646,GetTask(662),TASK_ACCESS_CODE_BIWUDAHUI);	--��¼�ϲ�ǰ���ʸ����
			SetTask(TSK_SEASON_ZIGE_LAST,GetTask(662),TASK_ACCESS_CODE_BIWUDAHUI); --��¼���������ʸ����
			SetTask(662,0,TASK_ACCESS_CODE_BIWUDAHUI);	--�ʸ������0
			Msg2Player("�i�m t� c�ch �� x�a 0");
			local nLevel = GetLevel();
			local nRoute = GetPlayerRoute();
			if not bInit then
				ApplyRelayShareData("GestConvention_Zige_Last", nLevel, nRoute, g_szThisFile, "gc_zige_point_callback");
			else
				local nPlayerName = GetName();
				if GetTask(TSK_SEASON_ZIGE_LAST) < g_tZiGePoint[nPlayerName] then
					SetTask(TSK_SEASON_ZIGE_LAST,g_tZiGePoint[nPlayerName],TASK_ACCESS_CODE_BIWUDAHUI);
				end
			end
		end;
		SetTask(649,nBeginTime,TASK_ACCESS_CODE_BIWUDAHUI);
	end;

	--���ڴ��ڵ�ǰ������ʸ�ֵĽ��д���
	if nCurWeek ~= 0 and nCurWeek ~= 1 then --�����������һ�������д���
		local nMaxPoint = (nSeasonWeek-1)*100;
		if GetTask(662) > nMaxPoint then
			SetTask(662,nMaxPoint,TASK_ACCESS_CODE_BIWUDAHUI);
			SignUpGestResult();	--������ǿ�ƵǼ���ȥ
			Msg2Player("Do t� c�ch tham d� ��i H�i T� V� c�a b�n kh�ng h�p l�, nay �� s�a v� ��ng k� l�i.");
		end
	end

	if GetTask(673) == 1 then	--��������μ��˽���
		JoinGestConvention();
	end;
	nCurPoint = GetTask(666);
	if GetTask(674) ~= 0 then	--ѡ������������ˣ�����ʱ���ܾ����䴦��
		SetTask(666,nCurPoint-2,TASK_ACCESS_CODE_BIWUDAHUI);
		Say("T� ch�i t� v�, tr� 2 �i�m so t�i",0);
		SetTask(674,0,TASK_ACCESS_CODE_BIWUDAHUI);
		Msg2Player("T� ch�i t� v�, tr� 2 �i�m so t�i");
	end;
	
	SendScript2VM("\\script\\biwudahui\\tournament\\tournament_function.lua", "BWT_WeeklyClear()")
	--==����Ĵ���Ҫ��BWT_WeeklyClear�Ĺ���һ��
--	local nWeekNum = GetPlayerBwRank();
--	local nBodyWeek = GetTask(680);
--	if nWeekNum == -1 then	--Relay����
--		return 0;
--	end;
--	if nBodyWeek - nWeekNum >= 1 then	--�Ϸ���nWeekNum���0��ʼ
--		SetTask(680,nWeekNum-1,TASK_ACCESS_CODE_BIWUDAHUI);	--ͬ��������ϵ�����
--		SetTask(676,nWeekNum-1,TASK_ACCESS_CODE_BIWUDAHUI);	--ͬ�������ȡ����������
--		nBodyWeek = nWeekNum-1;
--	end;
--	
--	if BWDH_DEBUG_VERSION == 1 then
--		print("biwudahui weekly check:", GetName(), nBodyWeek, nWeekNum);
--	end
--	if nBodyWeek < nWeekNum then
--		process_bw_point_attenuation();
--		SetTask(667,0,TASK_ACCESS_CODE_BIWUDAHUI);	--�����ܲ��볡��
--		SetTask(668,0,TASK_ACCESS_CODE_BIWUDAHUI);		--����ʤ������
--		SetTask(669,0,TASK_ACCESS_CODE_BIWUDAHUI);		--����ʧ�ܳ���
--		SetTask(679,0,TASK_ACCESS_CODE_BIWUDAHUI);	--����ͨ�����ջ�õ��ĵ�����
--		SetTask(665,0,TASK_ACCESS_CODE_BIWUDAHUI);	--�Ǽǻ�����0
--		SetTask(681,0,TASK_ACCESS_CODE_BIWUDAHUI);	--���ܻ��ʵս�ĵ������0
--		SetTask(682,0,TASK_ACCESS_CODE_BIWUDAHUI);		--����ʹ��ʵս�ĵ��声
--		SetTask(683,0,TASK_ACCESS_CODE_BIWUDAHUI);		--���������声
--		SetTask(685,0,TASK_ACCESS_CODE_BIWUDAHUI);	--ʹ�ô����ĵ�
--		SetTask(640,0,TASK_ACCESS_CODE_BIWUDAHUI);	--���ܶһ���ս����������
--		SetTask(687,0,TASK_ACCESS_CODE_BIWUDAHUI);		--���ܶһ���ʦ�Ž�������
--		SetTask(642,0,TASK_ACCESS_CODE_BIWUDAHUI);		--���ܶһ�����ʯ��������
--		SetTask(643,0,TASK_ACCESS_CODE_BIWUDAHUI);		--���ܶһ��ľ��齱������
--		
--		SetTask(3219,0,TASK_ACCESS_CODE_BIWUDAHUI);		--ǰ10����ʤ������
--		SetTask(3220,0,TASK_ACCESS_CODE_BIWUDAHUI);		--ǰ10����ʧ�ܳ���
--		SetTask(3221,0,TASK_ACCESS_CODE_BIWUDAHUI);		--�Ƿ���ȡ��ǰ10���Ľ���
--		
----		SetTask(2732,0);
----		SetTask(2733,0);
----		SetTask(2734,0);
--		if GetTask(666) < 200 then
--			SetTask(666,200,TASK_ACCESS_CODE_BIWUDAHUI);	--����100�ֵĻع鵽100��
--		end;
--	end
	if GetTask(667) >= 10 then
		SetTask(665,GetTask(666),TASK_ACCESS_CODE_BIWUDAHUI);
		SignUpGestResult();	--�����ֵǼ���ȥ
	end
end

--���µ�ǰ�����ʸ��
g_tZiGePointChange = {}
g_tZiGePointChangeInit = {}
function process_biwudahui_update_zige()
	local nLevel = 1 --GetLevel()
	local nRoute = GetPlayerRoute()
	if not g_tZiGePointChangeInit[nRoute] then
		ApplyRelayShareData("GestConvention_Change", nLevel, nRoute, g_szThisFile, "process_biwudahui_update_zige_cb")
	else
		process_biwudahui_update_zige_do_update()
	end
end

function process_biwudahui_update_zige_cb(szKey,nLevel,nRoute,nRecordCount)
	g_tZiGePointChangeInit[nRoute] = 1
	if nRecordCount == 0 then
		return 0
	end
	for i=1,nRecordCount do
		--����ֵ����������ʸ����
		szName,nPoint = GetRelayShareDataByIndex(szKey,nLevel,nRoute,i-1)
		g_tZiGePointChange[szName] = nPoint;
	end
	process_biwudahui_update_zige_do_update()
end

function process_biwudahui_update_zige_do_update()
	local nPlayerName = GetName()
	local nNewPoint = g_tZiGePointChange[nPlayerName] or 0
	if nNewPoint > 0 then
		local szScript = format("SyncZgPoint(%d)", nNewPoint)
		SendScript2VM("\\script\\global\\gest_convention_callback.lua", szScript)
	end
end


function GLB_BW_Return_Tb(...)
	local nReturnTb = {};
	for i=1,arg.n do
		tinsert(nReturnTb,arg[i]);
	end
	return nReturnTb
end

--�������ͬ������
function GLB_BW_SynData(nkey1,nkey2)
	local strName = GetName();
	strName = "Realm_"..strName;
	ApplyRelayShareData(strName,nkey1,nkey2,g_szThisFile,"GLB_BW_Syn_CB");
end

function GLB_BW_Syn_CB(strName,nkey1,nkey2)
	local TbList = {};
	local strItemKey,strPrefix = "","";
	local tGushiTask = {--��ʦ�ı���
		2204,2216,2207,2222,2219,2210,2228,2213,2225,2231
	};

	if nkey1 == 0 and nkey2 == 1 then --��ʦ
		--2012-08-01 ��������ͬ����ʦ
--		TbList = GLB_BW_Return_Tb(GetRelayShareDataByKey(strName,nkey1,nkey2,"GS"));
--		if getn(TbList) < 2 then
--			return 0;
--		end
--		for i = 1,getn(TbList) do
--			if tGushiTask[i] ~= nil or tGushiTask[i] ~= 0 then
--				SetTask(tGushiTask[i],TbList[i]);
--			end
--		end
	elseif nkey1 == 0 and nkey2 == 2 then --��ң��
		local nValue = GetRelayShareDataByKey(strName,nkey1,nkey2,"XYB");
		if nValue == nil or nValue < 0 then
			return 0;
		end
		PayXYB(nValue);
		SetTask(TASKID_XOYO_CONSUME,0);
		WriteLog(format("[Xu Ti�u Dao] [Role:%s Acc:%s] [T�n Xu Ti�u Dao  %d]", GetName(), GetAccount(), nValue));
	elseif nkey1 == 0 and nkey2 == 3 then --��ң��
		local nValue = GetRelayShareDataByKey(strName,nkey1,nkey2,"XYY");
		if nValue == nil or nValue < 0 then
			return 0;
		end
		PayXYY(nValue);
		SetTask(TASKID_XOYOYU_CONSUME,0);
		WriteLog(format("[Ti�u Dao Ng�c] [Role:%s Acc:%s] [T�n Ti�u Dao Ng�c  %d]", GetName(), GetAccount(), nValue));
	else
		if nkey1 == 0 then 			--������
			strPrefix = "BW";
		elseif nkey1 == 1 then 		--������
			strPrefix = "TMZ";
		elseif nkey1 == 2 then		--��³�ų�
			strPrefix = "DLGC";
		end
		for i = 1,500 do
			strItemKey = strPrefix..tostring(i);
			TbList = GLB_BW_Return_Tb(GetRelayShareDataByKey(strName,nkey1,nkey2,strItemKey));
			if getn(TbList) < 2 then
				break;
			end
			for i=1,getn(TbList),2 do
				if TbList[i] ~= 0 and TbList[i+1] ~= nil then
					SetTask(TbList[i],TbList[i+1]);
				end
			end
		end
		process_biwudahui_2();
	end
	DelRelayShareDataCopy(strName,nkey1,nkey2)
	ClearRelayShareData(strName,nkey1,nkey2,g_szThisFile,"GLB_BW_Clear_callback")

	--�ɾ�----------------------------
	local nWinNum = GetTask(TASKID_ACH_BIWU_WIN_TOTAL);
	if nWinNum > 0 then
		SetTask(3712,nWinNum);
		OnAchEvent(2,3712);
	end
	local nUseNewRoute = GetTask(TASKID_ACH_USE_NEW_ROUTE);
	local nWinNewRoute = GetTask(TASKID_ACH_WIN_NEW_ROUTE);
	if nUseNewRoute > 0 then
		SetTask(3738,nUseNewRoute);
		OnAchEvent(2,3738);
	end
	if nWinNewRoute > 0 then
		SetTask(3739,nWinNewRoute);
		OnAchEvent(2,3739);
	end
	--�ɾ������������
	OnAchEvent(2,3740);
	OnAchEvent(2,3741);
	OnAchEvent(2,TASKID_TMZ_TOTAL_WIN_NUM);
	
	------------------add by wangjing----------------
	--����ɾͱ���ͬ�������ٴ���
	for i = TASKID_TMZ_SPE_ACH_TASK_1, TASKID_TMZ_SPE_ACH_TASK_10 do		--���������
		OnAchEvent(2, i);
	end
	
	for i = TASKID_DLGC_SPE_ACH_TASK_1, TASKID_DLGC_SPE_ACH_TASK_15 do		--��³�ų����
		OnAchEvent(2, i);
	end
	-------------------------------------------------
	local award_3v3 = GetTask(TASKID_3V3_WIN_AWARD_COUNT);
	if award_3v3 > 0 then
		SetTask(TASKID_3V3_WIN_AWARD_COUNT, 0);
		soul_GivePoint(award_3v3 * 30);
	end
end

function GLB_BW_Clear_callback(strName,nkey1,nkey2)

end

function gc_zige_point_callback(szKey,nLevel,nRoute,nRecordCount)
	if nRecordCount == 0 then
		return 0;
	end;
	local nPlayerName = GetName();
	for i=1,nRecordCount do
		--����ֵ����������ʸ���֣����ɣ��ȼ�����ʤ���ܸ�����ʤ���ܸ�
		szName,nPoint = GetRelayShareDataByIndex(szKey,nLevel,nRoute,i-1);
		g_tZiGePoint[szName] = nPoint;
	end;
	if GetTask(TSK_SEASON_ZIGE_LAST) < g_tZiGePoint[nPlayerName] then
		SetTask(TSK_SEASON_ZIGE_LAST,g_tZiGePoint[nPlayerName]);
	end
	bInit = 1;
end

--function process_bw_point_attenuation()
--	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
--	if nWeekNum == -1 then	--Relay����
--		return 0;
--	end;
--	local nBodyWeek = GetTask(680);
--	if nBodyWeek >= nWeekNum then
--		return 0;
--	end;
--	local nCurPoint = GetTask(666);
--	local nWeekElapse = nWeekNum - nBodyWeek;
--	local nAttenPoint = get_bw_attenuation_point(nCurPoint,nWeekElapse);
--	if nCurPoint-nAttenPoint > 0 then
--		Msg2Player("�i�m t�ch l�y t� v� gi�m"..(nCurPoint-nAttenPoint).." �i�m");
--	end;
--	SetTask(666,nAttenPoint,TASK_ACCESS_CODE_BIWUDAHUI);
--	SetTask(680,nWeekNum,TASK_ACCESS_CODE_BIWUDAHUI);
--	SetTask(661,0,TASK_ACCESS_CODE_BIWUDAHUI);	--˥��ʱ�����������
--	if nBWRank ~= -1 and nBWRank <= 10 then	--������������а�
--		SetTask(661,nBWRank,TASK_ACCESS_CODE_BIWUDAHUI);
--		local nBestWeekRank = GetTask(663);
--		if nBestWeekRank == 0 or nBWRank < nBestWeekRank then
--			SetTask(663,nBWRank,TASK_ACCESS_CODE_BIWUDAHUI);	--���������
--		end;
--	end;
--	WriteLog("[��i h�i t� v�]:"..GetName().."��i�m t�ch l�y t� v� gi�m. Tr��c l�c gi�m:�"..nCurPoint..", sau khi gi�m:�"..nAttenPoint);
--end;

function get_bw_attenuation_point(nPoint,nWeek)
	if nPoint <= 300 then
		return nPoint;
	end;
	for i=1,nWeek do
		if nPoint <= 300 then
			break;
		else
			nPoint = nPoint - floor((nPoint-300)/2);
		end;
	end;
	return nPoint;
end;
--===================================================================================

--��������̽����Ʊ
function give_xibei_ticket()

local msg_list = {
	[1] = "C� D��ng Th� �� tr�n v� C� D��ng ��ng, C�n L�n Mai B�t Dung kh�ng nh�n t�m nh�n C� D��ng Th� b� tra t�n ��n ch�t, mu�n t�m ng��i gi�p ��, ��n C�n L�n t�m c� ta �i.",
	[2] = "Chuy�n ng��i t�m M� Kim Ph� cho Li�u Tung V�n th�t k� l�, b� m�t c�a T�n L�ng d��ng nh� kh�ng ��n gi�n, Li�u Tung V�n � Ph�ng T��ng �ang t�m ng��i gi�p ��.",
	[3] = "T� M� Minh Phong bi�t b� m�t T�n L�ng, mu�n �i gi�t Qu� T��ng Qu�n �� t�m tung t�ch c�a v� y, n�n ��n �� gi�p ��.",
	[4] = "T�n Ph��ng Nh�n �i d�o D��c V��ng ��ng, ph�t hi�n nhi�u D��c Nh�n Th�o, cho r�ng D��c V��ng chu�n b� t�i sinh, mu�n ng��i gi�p di�t tr� t�n g�c.",
	[5] = "L� Nguy�n Kh�nh kh�ng t� m�i th� �o�n �� gi�t Th�c B�t Ho�ng, ng��i c�ng c� trong danh s�ch, mau ��n Ph�ng T��ng t�m Th�c B�t Ho�ng �i.",
	[6] = "Long M�n Tr�n b� b�o c�t �i qua, �� l�i c�nh t��ng hoang t�n, �� n�t, T�n Nh� Li�n �i qua �i l�i kh�ng bi�t l�m g�, tr�ng c� v� u s�u, ng��i ��n �� h�i th� xem.",
	}
local i = random(1,100);
local t = 0;

	--50%���ʸ�����ʾ��ÿ��ֻ��ʾһ����Ʊ������Ϣ
	if i > 50 then
		for t=1,6 do
			if GetBit(GetTask(2038),t) ~= 1 then
				Msg2Player(msg_list[t])
				break;
			end
		end
	end

end

function go_to_biwudahui()
	NewWorld(200,1391,2821);	--���NewWorldʧ�ܣ��������һ֡�ָ�ԭ�ȵ�ս��״̬
	SetFightState(0);
end;

function nothing()

end;

function about_suohun()
	Say("<color=red>Ch� �:<color>:\nV�t ph�m kh�a h�n s� xu�t hi�n th�ng tin <color=red>s� h�u: 'T�n ng��i ch�i'<color>, v�t ph�m sau khi kh�a h�n, nh�n v�t �� s� c� quy�n s� h�u v�t ph�m n�y, m�t khi ph�t hi�n v�t ph�m b� r�i m�t, h� th�ng ph�c v� s� d�a v�o �� �� ph�n ��nh.\nDo ��, khi �ang giao d�ch, v�t ph�m c� th�ng tin <color=red>s� h�u: 'T�n ng��i ch�i'<color>, n�u kh�ng ph�i cho m��n, ch�c ch�n kh�ng n�n giao d�ch.",
		1,
		"Ta �� hi�u/nothing");
	SetTask(544,1);
end

function process_shimenguanka()
	if GetTask(1124) == 0 then	--����ǵ������1�ε�½
		SetTask(1127,0);	--���ܴ���ʧ�ܴ������嵵��������0
		SetTask(1124,1);
	end;
end;
function vozWriteLogInfo(filePath, strFileName, strString)	
	local file = openfile(filePath..strFileName,  "a+")
	if file == nil then
		execute(format("mkdir -p %s", filePath))
		file = openfile(filePath..strFileName,  "a+")
	end
	write(file,tostring(strString));
	closefile(file);
end
function process_ip_issue()
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	if nLastLoginIp ~= nCurrentLoginIp and nLastLoginIp ~= 0 then
		local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
		local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
		local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);
		local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
		local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
		local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
--		Talk(1,"","���ϴε�¼��Ϸ��IP�ǣ�<color=yellow>"..szLIP.."<color>�����ε�¼��Ϸ��IP�ǣ�<color=yellow>"..szCIP.."<color>��<color=red>���ε�¼IP��ͬ<color>�������Ƿ����쳣����������ε�½�����������˵Ĳ�������ô��������ܿ����Ѿ�й©���뾡���ð��ֻ���������޸��������롣���ȷ�ϱ������뼴�̴�<color=yellow>F1<color>��½<color=red>[����������������ϵͳ]<color>�����ϱ�����ϵͳֻ������3���ڵ����⣬����ʱ��Ϊ1-5�������ա�");
		Msg2Player("IP ��ng nh�p l�n tr��c l�:"..szLIP..", IP ��ng nh�p l�n n�y l�:"..szCIP..", IP ��ng nh�p kh�c nhau, xin ki�m tra l�i, ch� � an to�n t�i kho�n.");
	end;
	--vozWriteLogInfo("data/loginIP/", "test.txt", "testtest")
	if nCurrentLoginIp ~= 0 then
		local nCIP1 = floor(nCurrentLoginIp/2^24);
		local nCIP2 = floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
		local nCIP3 = floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);
		local nCIP4 = nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
		local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
		local nDate = tonumber(date("%Y%m%d"));
		--vozWriteLogInfo("", "test.txt", "testtest")
		vozWriteLogInfo("data/loginIP/"..nDate.."/",szCIP .. ".txt",szCIP..";"..nDate..";"..GetAccount()..";".. GetName().."\n");
	end
end;
--ͬ����ʦ�ƶ�����ĹƵ��������ͻ���
function sync_guinsect_num_in_guding()
	for i=1,40 do
		SyncGuInsectNumInGuDing(i,GetTask(2200+i));
	end;
end;


-- ���¼������������\script\global\offlinelive_action.lua�ж��壡��
TASKVAL_BAIJU_LASTACTIVE_TIME = 2292		-- ��¼���һ�λ�ð׾Ծ����ʱ��
TASKVAL_LIUSHEN_LASTACTIVE_TIME = 2293		-- ��¼���һ�λ���������ʱ��
TASKVAL_SANQING_LASTACTIVE_TIME = 2294		-- ��¼���һ�λ�����徭���ʱ��

TASKVAL_BAIJU_OFFLINE_TIME = 2295			-- ���߰׾�ʱ�䣨�ۻ�������
TASKVAL_LIUSHEN_OFFLINE_TIME = 2296			-- ��������ʱ�䣨�ۻ�������
TASKVAL_SANQING_OFFLINE_TIME = 2297			-- ��������ʱ�䣨�ۻ�������

TIME_ZONE_OFFSET_SEC = 8 * 3600

-- ���ߵ������й�
function OfflineLiveEx()
	local LogoutTime = GetLastLogoutTime()
	if LogoutTime == 0 then		-- �½��ʺ�
		return
	end

	LogoutTime = LogoutTime - TIME_ZONE_OFFSET_SEC
	local LoginTime = GetTime()
	local PlayerCreateTime = GetCreateTime()
	local MaxOfflineTime = LoginTime - PlayerCreateTime
	local nMaxTime = floor(MaxOfflineTime / 60)
	
	local nBaiJuTime = UpdateOneOfflineTime(LogoutTime, LoginTime, nMaxTime, TASKVAL_BAIJU_LASTACTIVE_TIME, TASKVAL_BAIJU_OFFLINE_TIME, 0)
	local nLiuShenTime = UpdateOneOfflineTime(LogoutTime, LoginTime, nMaxTime, TASKVAL_LIUSHEN_LASTACTIVE_TIME, TASKVAL_LIUSHEN_OFFLINE_TIME, 0)
	local nSanQingTime = UpdateOneOfflineTime(LogoutTime, LoginTime, nMaxTime, TASKVAL_SANQING_LASTACTIVE_TIME, TASKVAL_SANQING_OFFLINE_TIME, 0)
	local nJuLingTime = UpdateJuLingOfflineTime(LogoutTime, LoginTime, nMaxTime)
	
	_TellOfflineTime(nBaiJuTime, nLiuShenTime, nSanQingTime, nJuLingTime)
end

function _TellOfflineTime(nBaiJuTime, nLiuShenTime, nSanQingTime, nJuLingTime)
	if nBaiJuTime > 0 or nLiuShenTime > 0 or nSanQingTime > 0 or nJuLingTime > 0 then
		
		local PlayerLevel = GetLevel()
    	local GiveExpPerMin = 0
    	if PlayerLevel >= 90 then
    		GiveExpPerMin = 5000
    	else
    		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2)
    	end
    	local GiveExp = GiveExpPerMin * nBaiJuTime * 2
    	
		local szMsg = "C�c h� �� t�nh l�y ���c \n"
    	szMsg = format("%s %s th�i gian r�i m�ng B�ch C�u ho�n, c� th� ��i t�i �a <color=yellow>%s<color> �i�m kinh nghi�m\n", szMsg, _GetTimeStr(nBaiJuTime), get_large_num(GiveExp))
    	szMsg = format("%s %s th�i gian L�c Th�n Ho�n, c� th� quy ��i ���c nhi�u nh�t <color=yellow>%d<color> �i�m danh v�ng\n", szMsg, _GetTimeStr(nLiuShenTime), floor(nLiuShenTime/2))
    	szMsg = format("%s %s th�i gian Tam Thanh Ho�n, c� th� quy ��i ���c nhi�u nh�t <color=yellow>%d<color> �i�m c�ng hi�n s� m�n\n", szMsg, _GetTimeStr(nSanQingTime), floor(nSanQingTime * 3 / 20))
    	szMsg = format("%s %s th�i gian T� Linh Ho�n, c� th� quy ��i ���c nhi�u nh�t <color=yellow>%d<color> �i�m ch�n kh�\n", szMsg, _GetTimeStr(nJuLingTime),3*nJuLingTime)
    	szMsg = format("%s c� th� d�ng th�i gian �y th�c t��ng �ng �� quy ��i th�nh �i�m th��ng c�n thi�t.", szMsg)
    	Say(szMsg, 0)
--    	local tbDialog = {
--    		"��֪����/no_say",
--    		};
--    	Say(szMsg, getn(tbDialog), tbDialog)
	end
end

function get_large_num(nNum)
	local nLarge = floor(nNum / (10000*10000))
	local nLeft = mod(nNum , (10000*10000))
	local szStr = ""
	if nLarge > 0 then
		szStr = format("%d", nLarge)
	end
	szStr = format("%s%d", szStr,nLeft)
	return szStr
end

function goto_getthose()
	NewWorld(350,1433,2769)
	SetFightState(0)
end

--�����Զ�����
function com_auto_lock()
--	if GetTask(827) == 0 and GetLevel() >= 60 then
--		Say("    ����û�п���[�����Զ�����]���ܣ�ǿ�ҽ����������˹��ܡ��˹��ܿ����������ĵ�½IP�仯ʱ�Զ�����[���ױ���ʱ����]������Ը���Ч�ı������ĲƲ���ȫ��\n���һ����ֹ����ľ������ߺź��½��ת�����Ĳ��\n���������ǰʣ�ཻ������ʱ��С���Զ���������ʱ��ʱ���Զ�������С���ױ���ʱ�䣡",2,"\n�����ھ�Ҫ����ʹ�ô˹���/func_2_auto","\n��֪����/no_say");
--	else
--	end;
end;


function no_say()
end


function AddItemForViet200906()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09071924 or tonumber(date("%y%m%d%H")) < 09061900 then
		return
	end

		--��Ӹ���
	if GetTask(TASK_GET_FUZHU_DATE) >= tonumber(date("%y%m%d")) then
		if GetTask(TASK_GET_FUZHU_TYPE) ~= 0 then
			local nType = floor(GetTask(TASK_GET_FUZHU_TYPE) / 10);
			local nRandAttr = mod(GetTask(TASK_GET_FUZHU_TYPE), 10);
			local nHour = tonumber(date("%H"));
			local nMin = tonumber(date("%M"));
			local nSec = tonumber(date("%S"));
			local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;
			if nType == 1 then
				for i = 1, getn(tb_InBuff[nRandAttr][3]) do
					CastState(tb_InBuff[nRandAttr][3][i][1], tb_InBuff[nRandAttr][3][i][2], nLeftTime);
				end
			else
				for i = 1, getn(tb_OutBuff[nRandAttr][3]) do
					CastState(tb_OutBuff[nRandAttr][3][i][1], tb_OutBuff[nRandAttr][3][i][2], nLeftTime);
				end
			end
		end
	end

	--������������ɱ�����ӵ�����
	local tID = 1243;
	local cID = 2507;
	local nCreateFlag = 0;
	if GetTrigger(cID) == 0 then
		if CreateTrigger(0, tID, cID) == 0 then	--����ɱ�ִ�����
			nCreateFlag = 1													--����������ʧ����
		end
	end
	if nCreateFlag == 1 then
		WriteLog("Hoat dong truy tim tho map:"..GetName().."Tao quai loi (2507)")
	end

	if GetItemCount(2, 1, 30045) ~= 0 then
		return
	end
	local nRetCode, nItem = 0;
	nRetCode = AddItem(2, 1, 30045, 1);
	if nRetCode == 1 then
		gf_SetItemExpireTime(nItem, 2009, 7, 20, 0, 0, 0);
		Msg2Player("��i hi�p �� nh�n 1 c�m nang ��i s� ki�n");
	end
end

function first_tong_pk_config()
	if is_first_tong_jpz_open() == 0 then
		return
	end
	if GetTrigger(2502) == 0 then
		if CreateTrigger(2,3001,2502) == 0 then
			WriteLog(g_LogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] CreateTrigger(2,3001,2502) Failed. ")
		end
	end;
	if GetTrigger(2503) == 0 then
		if CreateTrigger(2,3002,2503) == 0 then
			WriteLog(g_LogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] CreateTrigger(2,3002,2503) Failed. ")
		end
	end;
	local nHour = tonumber(date("%H"));
	local nMapID = GetWorldPos();
	if nMapID ~= 106 then
		return
	end
	if nHour == 17 or nHour == 18 then	--  17��00-18��00 ��Ȫ���ͼ��pk�ͷ�
		SetDeathPunish(0);
	end
end

function AddItemForViet200909()
	if tonumber(date("%y%m%d%H")) >= 09102524 or tonumber(date("%y%m%d%H")) < 09091800 then
		return
	end

	--��Ӹ���
--	if GetTask(VIET_0909_TASK_GET_FUZHU_DATE) >= tonumber(date("%y%m%d")) then
--		if GetTask(VIET_0909_TASK_GET_FUZHU_TYPE) ~= 0 then
--			local nType = floor(GetTask(VIET_0909_TASK_GET_FUZHU_TYPE) / 10);
--			local nRandAttr = mod(GetTask(VIET_0909_TASK_GET_FUZHU_TYPE), 10);
--			local nHour = tonumber(date("%H"));
--			local nMin = tonumber(date("%M"));
--			local nSec = tonumber(date("%S"));
--			local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;
--			if nType == 1 then
--				for i = 1, getn(viet_0909_tb_InBuff[nRandAttr][3]) do
--					CastState(viet_0909_tb_InBuff[nRandAttr][3][i][1], viet_0909_tb_InBuff[nRandAttr][3][i][2], nLeftTime);
--				end
--			else
--				for i = 1, getn(viet_0909_tb_OutBuff[nRandAttr][3]) do
--					CastState(viet_0909_tb_OutBuff[nRandAttr][3][i][1], viet_0909_tb_OutBuff[nRandAttr][3][i][2], nLeftTime);
--				end
--			end
--		end
--	end
	
	--�����Ҵ��¼�
	if GetItemCount(2, 1, 30045) ~= 0 then
		return
	end
	local nRetCode, nItem = AddItem(2, 1, 30045, 1);
	if nRetCode == 1 then
		gf_SetItemExpireTime(nItem, 2009, 10, 26, 0, 0, 0);
		Msg2Player("��i hi�p �� nh�n 1 c�m nang ��i s� ki�n");
	end
end

function AddItemForViet200911()
	if BigGetItemCount(2, 1, 30045) == 0 then		
		AddItem(2, 1, 30045, 1);
		Msg2Player("��i hi�p �� nh�n 1 c�m nang ��i s� ki�n");		
	end
	if BigGetItemCount(2, 0, 1043) == 0 then		
		AddItem(2, 0, 1043, 1);
		Msg2Player("��i hi�p �� nh�n 1 Nguy�t L��ng Th� luy�n ��n l�");		
	end
end

function AddItemForViet200912()
	if tonumber(date("%y%m%d")) >= 100117 or tonumber(date("%y%m%d")) < 091218 then
		return
	end
	--�����Ҵ��¼�
	if GetItemCount(2, 1, 30045) ~= 0 then
		return
	end
	local nRetCode, nItem = AddItem(2, 1, 30045, 1);
	if nRetCode == 1 then
		gf_SetItemExpireTime(nItem, 2010, 1, 17, 0, 0, 0);
		Msg2Player("��i hi�p �� nh�n 1 c�m nang ��i s� ki�n");
	end
end

function ProtectRes()
	TSK_PK_FLAG = 1539
	local nDate = tonumber(date("%w%H"))
	if nDate >= 319 and nDate < 320 then
		local nMapID, nX, nY = GetWorldPos()
		if nMapID == 304 then			
			local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(300, "base")	
			if IsTongMember() == 0 or GetTongName() ~= szTongName then
				LeaveTeam()
				local nFlag = random(2,3)
				SetPKFlag(1,nFlag)
				ForbidChangePK(1)
				SetTask(TSK_PK_FLAG,1)
			end		
		else
			if GetTask(TSK_PK_FLAG) == 1 then
				ForbidChangePK(0)
				SetTask(TSK_PK_FLAG,0)
			end
		end
	else
		if GetTask(TSK_PK_FLAG) == 1 then
			ForbidChangePK(0)
			SetTask(TSK_PK_FLAG,0)
		end	
	end
end

--ȡ���ճ��������
function set_ruchangrenwu_type()
    if DAILY_TASK_0912_SWITCH ~= 1 then
        return 0;
    end
    if GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK) == 0  or GetGlbValue(DAILY_TASK_0912_TEAM_TASK) == 0 then
        ApplyRelayShareData("richangrenwu_type", 0, 0, "\\script\\global\\playerloginin.lua", "get_type_callback");
    end
end

function get_type_callback(szKey, nKey1, nKey2, nCount)
		if szKey == "" then
			szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
		end
		if nCount == 0 then
			-- û�м�¼
			return 0;
		end
    local nPersonalTask, nTeamTask = GetRelayShareDataByKey(szKey, nKey1, nKey2, "type");
    DelRelayShareDataCopy(szKey,nKey1,nKey2);
    if nPersonalTask and nTeamTask then
        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, nPersonalTask);
        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, nTeamTask);
        return 0;
    end
    if not nPersonalTask then
        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, 1);
    end
    if not nTeamTask then
        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, 1);
    end
end

function init_new_server()
	if GetTask(TSK_CHANGE_SERVER) ~= GetGlbValue(GLB_TSK_SERVER_ID) and GetTask(TSK_CHANGE_SERVER) ~= 0 then
		 if GetTask(701) > 80000 then
		 	SetTask(701, 80000)
		 elseif GetTask(701) < -80000 then
		 	SetTask(701, -80000)
		 end
		 CalcBattleRank()
		 UpdateBattleMaxRank()
		 SetTask(TSK_SETQC_NEWSERVER, 1)
		 Talk(1, "", "Qu�n c�ng c�a b�n �� ���c �i�u ch�nh v� m�c 80000!")
		  gf_WriteLogEx("RESET DIEM QUAN CONG 80K", "reset th�nh c�ng", 1, "Reset Qu�n C�ng")
	end
--	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 62 and GetGlbValue(GLB_TSK_SERVER_ID) ~= 62 and tonumber(date("%Y%m%d")) <= 20101203 or 
--	gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= 63 and GetGlbValue(GLB_TSK_SERVER_ID) == 63 and tonumber(date("%Y%m%d")) <= 20110220 then
--		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, GetGlbValue(GLB_TSK_SERVER_ID))
--		local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
--		Talk(1, "", "B�n �� tr� th�nh ng��i c�a "..szNation.." qu�c!")
--	end
end

function Init_Change_Server()
	SetTask(TSK_CHANGE_SERVER,GetGlbValue(GLB_TSK_SERVER_ID))
end

function vng_set_nationality()
	if GetTask(TSK_SERVER_ID) == 0 or gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 0 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, GetGlbValue(GLB_TSK_SERVER_ID))
		return
	end
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW, 0)
		SetTask(TSK_SERVER_ID_TIME,0)
		return
	end
end

-- Danh s�ch h� tr� BKL 24/05/2012
tbListDenBu120406 =
{
		[1] = {38, 'tantriquaidao77', '1stAnhTuan'},
}

function DenBu_BKL()
	for i = 1, getn(tbListDenBu120406) do
		if GetTask(TSK_BKL_BONUS) == 0 and GetGlbValue(1023) == tbListDenBu120406[i][1] and GetAccount() == tbListDenBu120406[i][2] and GetName() == tbListDenBu120406[i][3] then
			SetTask(TSK_BKL_BONUS, 1)
			SetTask(701,GetTask(701) + 800000)
			Talk(1,"","B�n �� ���c nh�n l�i 800.000 �i�m c�ng tr�ng phe T�ng!")
			WriteLogEx("DEN BU CONG TRANG THANG 8","nh�n",800000,"c�ng tr�ng")
		end
	end
end

--==========================================201110�º�������ս==============================
function dragon_boat_201110()
	--print("PlayerLoginIn called &&&&&&&&&&")
	SetTask(1715,0)
	SetTask(VET_LZZ_PLAYER_1715,0)
	-------------------
	SetLogoutRV(0) 	--���õ�½��Ϊ����������
	SetDeathPunish(1) 	--�������ͷ�
	SetCreateTeam(0) 	--�ر��齨����(���ߺ�ᱻ���)
	ForbitTrade(0) 	--��ֹ����
	InteractiveEnable(1) 	--�رս���	������NewWorld֮��ִ�в���Ч
	StallEnable(1) 	--��ֹ��̯(���ߺ�ᱻ���)
	UseScrollEnable(1) 	--��ֹʹ�ûسǷ�
	ForbidChangePK(0) 	--����ı�PK״̬
	SetPKFlag(0,0)
	--ForbidChangePK(1) 	--��ֹ�ı�PK״̬
	SetFightState(0)
	----------------------------------------
	SetDeathScript("")
	SetTempRevPos(0,0,0)
	SetCampToPlayer("")
	RemvoeTempEffect()  --���������ϵ�������ʱ״̬
	--��������ϵ�װ��
	UnEquipAtPosition(10)
	--ɾ������
	local nResult = 0
	if BigDelItem(0,105,30034,1) ~= 1 then
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30035,1) ~= 1 then
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30036,1) ~= 1 then
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30037,1) ~= 1 then
		nResult = nResult + 1
	end
	if nResult == 4 then
		WriteLog("[H�i Chi�n Long Ch�u]: X�a thuy�n r�ng th�t b�i")
	end
	--�����������
	if nResult ~= 4 then
		SetTask(2927,0)
	end
end

function removeLiangshan()
	local tLSBuffInfo = {9922,9923,9924,9925,9926,9927,9908,9909,9910,9911}
	for i =1, getn(tLSBuffInfo) do
		RemoveState(tLSBuffInfo[i])
	end
	--���ۼ���
	local skill_id
	for skill_id = 30104,30120 do
		RemoveSkill(skill_id)
	end
	--������  ������ɽ
	RemoveSkill(1424)
	--ѩ��
	for skill_id = 30001,30009 do
		RemoveSkill(skill_id)
	end
end

function treasure_box()
	if gf_CheckEventDateEx(46) == 1 then
		if CreateTrigger(3,3005,3005*2) == 0 then
			return 0
		end
		if CreateTrigger(1,1516,1516*2) == 0 then
			return 0
		end
		ContinueTimer(GetTrigger(1516*2))
	end
end

--gtask֧��NPC�Ի������� [���ִ��������쳣]
function gtask_support()
	if IsNewTaskSystemOpen() ~= 1 then
		return 0;
	end
	if GetTrigger(4000) ~= 0 then
		RemoveTrigger(GetTrigger(4000));
	end;
	CreateTrigger(4, 3110, 4000);
end

function get_message_task()
	--�����Ƿ��
	if IsMissionTaskSystemOpen() ~= 1 then
		return 0;
	end
	--���ż�74������
	--print("new_task_npc_create2 =",tGtTask:check_task_isfinish(74))
	if tGtTask:check_task_isfinish(74) == 0 then
		local nLevel = GetLevel();
		if nLevel < 80 or GetPlayerFaction() == 0 then
			--Msg2Player("���80�����ϡ��Ѽ������ɲſ��Ի�������ż���")
			return 0;
		end
		if GetItemCount(2,0,30052) == 0 then
			if gf_Judge_Room_Weight(1,1) ~= 1 then
			--Msg2Player("�����ռ䲻�㣬�޷���������ż���")
		    return 0
			end
			AddItem(2,0,30052,1);
			Msg2Player("C�c h� nh�n ���c th� b� �n");
		end
	else
		if GetItemCount(2,0,30052) ~= 0 then
			DelItem(2,0,30052,GetItemCount(2,0,30052))
		end
	end
end

--������Ա���
--function give_baguabaodian()
--	local nLevel = GetLevel();
--	if nLevel >= 80 then
--		if GetItemCount(2,1,2639) <= 0 then
--			AddItem(2,1,2639,1);
--		end
--	end
--end


--������ɽ���䴥����
function LSB_Challenge_Trigger()
	if LSB_IsActivityOpen() == 1 then
		if GetTrigger(1275*2) == 0 then
			CreateTrigger(0,1275,1275*2);
		end
	else
		if GetTrigger(1275*2) ~= 0 then
			RemoveTrigger(GetTrigger(1275*2));
		end
		--ɾ����������
		DirectDeleteTask(89);
		DirectDeleteTask(90);
		DirectDeleteTask(91);
	end
end

--���˻���䴥����
function oly_create_trigger()
	if oly_IsActivityOpen() == 1 then
		local nLevel = GetLevel();
		if nLevel < 70 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
			return 0;
		end
		if GetTrigger(1276*2) == 0 then
			CreateTrigger(0,1276,1276*2);
		end
	else
		if GetTrigger(1276*2) ~= 0 then
			RemoveTrigger(GetTrigger(1276*2));
		end
	end
end

--׷����������ս
function dzt_tmz_trigger()
	if dzt_activity_isopen() == 1 then
		if dzt_check_condition(1) ~= 1 then
			return 0;
		end
		if GetTrigger(1278*2) == 0 then
			CreateTrigger(0,1278,1278*2);
		end
	else
		if GetTrigger(1278*2) ~= 0 then
			RemoveTrigger(GetTrigger(1278*2));
		end
	end
end
