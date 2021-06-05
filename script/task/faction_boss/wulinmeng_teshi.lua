-- =============================================================
-- FileName : wulinmeng_teshi.lua
-- Desc     : ��������ʹ�Ľű�,����boss�Ĺ���
-- Date     : Dec 14 2006
-- Creator  : Tony(Jizheng)
-- =============================================================

Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\task\\killer_hall\\killer_hall_head.lua");	--ɱ��������
Include("\\script\\lib\\writelog.lua")

TASK_ID_LAST_GET_DATE = 88			-- �ϴ���ȡ�����ʱ��,�������ID
TASK_ID_HAVE_GOT_TODAY = 89			-- �����Ƿ��Ѿ���ȡ������,�������ID

-- Ĭ�϶Ի����
--function main()
--	if GetPlayerFaction() == 0 then				--2007�Ͷ�������ʦ�������
--		Say("<color=green>��������ʹ<color>����񽭺����ң����������׿��Ż�֮����ѡ�����Ÿ�����һ���д���ѧ���������������ϼѵ����ֵ��Ӵ��ڱ��ž�ѧ���������������ί�����ƾٸ������ɵĺ���֮�㣬���Ծ�ѧ������Ҫ��Ҫ�˽⿴����",
--			6,
--			"��Ҫ������������/get_boss_task_now",
--			"��֪������Щ����ǰ��/get_boss_info",
--			"��Щ����ǰ�������ںδ�/get_bossweizhi_info",		
--			"��β��ܻ�þ�ѧ�����/get_prize_info",
--			"���������/#labor_07_dia_main(2)",
--			"�п���������/cancel_dialog")
--			return
--	else
--		Say("<color=green>��c s� V� L�m<color>: ����񽭺����ң����������׿��Ż�֮����ѡ�����Ÿ�����һ���д���ѧ���������������ϼѵ����ֵ��Ӵ��ڱ��ž�ѧ���������������ί�����ƾٸ������ɵĺ���֮�㣬���Ծ�ѧ������Ҫ��Ҫ�˽⿴����",
--			5,
--			"��Ҫ������������/get_boss_task_now",
--			"��֪������Щ����ǰ��/get_boss_info",
--			"��Щ����ǰ�������ںδ�/get_bossweizhi_info",		
--			"��β��ܻ�þ�ѧ�����/get_prize_info",
--			"�п���������/cancel_dialog")
--			return		
--	end
--end;

function get_factionboss_task()
		Say("<color=green>��c s� V� L�m<color>: V� l�m giang h� ��i lo�n, <color=yellow>c�c ��i m�n ph�i<color> �ang ch�n trong b�n m�n m�t cao th� c� t� ch�t phi ph�m �� truy�n th� tuy�t h�c v� th�n binh c�a b�n m�n. <color=yellow>C�c ��i m�n ph�i<color> nh� ta ti�n c� ng��i �u t� nh�t c�a c�c m�n ph�i, thi�u hi�p mu�n t�m hi�u kh�ng?",
			5,
			"Ta mu�n b�o danh tham gia th� luy�n/get_boss_task_now",
			"Kh�ng bi�t l� v� v� l�m ti�n b�i n�o/get_boss_info",
			"V� ti�n b�i n�y b�y gi� �ang � ��u/get_bossweizhi_info",		
			"L�m th� n�o �� c� ���c tuy�t h�c v� th�n binh/get_prize_info",
			"R�nh th� quay l�i nh�!/cancel_dialog")
			return	
end
function main()
	local selTab = {
				"Ta mu�n d�ng 2 l�nh b�i s� m�n ��i m�t n� S�t Th� ���ng/want_mask",
				"Ta mu�n mua m�t n� S�t Th� ���ng (60 v�ng)/buy_mask",
				"Nghe n�i �ang c� ho�t ��ng th� luy�n S� m�n/get_factionboss_task",
				"R�nh th� quay l�i nh�!/cancel_dialog",
				}
	Say("<color=green>��c s� V� L�m<color>: T�i <color=yellow>Tr�c Ty ��ng t�ng 2<color>, S�t th� ���ng do t� ��i �c nh�n <color=yellow>Nh�n �� ph� - L� ��i Ch�y<color> tr�n th� v�o l�c <color=yellow>12:30-13:30<color> v� <color=yellow>21:00-22:00<color> m�i ng�y s� tri�u h�i m�t s� s�t th� t� b�n ngo�i. N�u ng��i c� 2 l�nh b�i s� m�n, ta s� t�ng ng��i 1 m�t n� S�t Th� ���ng �� �i v�o S�t th� ���ng ��nh b�i nh�ng t�n b�i ho�i c�a V� L�m. Tuy nhi�n ng��i c�n ph�i luy�n th�nh <color=red>v� c�ng cao c�p b�n m�n<color>.",getn(selTab),selTab);
end;

function want_mask()
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Ch�a gia nh�p m�n ph�i, t�t h�n ��ng b��c ch�n v�o S�t th� ���ng!");
		return 0;
	end;
	if KH_Check_Skill_Level() ~= 1 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: C�n ph�i h�c th�nh th�c v� c�ng cao c�p r�i m�i ��n g�p ta.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(KH_TASK_GOT_MASK_DATE) >= nDate then
		Talk(1,"","<color=green>��c s� V� L�m<color>: M�t n� S�t th� ���ng n�y ch� t�o kh�ng ph�i d�, ng�y mai h�y quay l�i.");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0;
	end;
	if DelItem(tFactionTokenRing[nFaction][1],tFactionTokenRing[nFaction][2],tFactionTokenRing[nFaction][3],2) == 1 then
		SetTask(KH_TASK_GOT_MASK_DATE,nDate);
		AddItem(tItemInfo[1][2],tItemInfo[1][3],tItemInfo[1][4],1)
		Msg2Player("Nh�n ���c 1"..tItemInfo[1][1]);
	else
		Talk(1,"","<color=green>��c s� V� L�m<color>: S� l�nh b�i s� m�n mang theo kh�ng ��, c�n ph�i c� �� <color=yellow>2 l�nh b�i s� m�n<color> �� ch�ng minh n�ng l�c!");
	end;
end;

function buy_mask()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0
	end
	if GetCash() < 600000 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Ng��i kh�ng c� �� ti�n m� mu�n mua �!");
		return 0
	else
		if Pay(600000) == 1 then
			gf_AddItemEx2({2,1,1087,1}, "M�t N� S�t Th� ���ng", "Hoat dong thang 5", "mua", 24*60*60)
		else
			return 0
		end
	end
end


-- �˳��Ի��ĺ���
function cancel_dialog()
end;

-- �������ǰ���Ľ���
function get_boss_info()
	Talk(3, "", 
		 "Giang h� ��i lo�n k� t� khi B� Phi Y�n �o�t Sinh Th�n C��ng.", 
		 "<color=yellow>C�c ��i m�n ph�i<color> �ang chi�u m� anh h�o ki�t xu�t �� truy�n th� tuy�t th� v� c�ng v� ch� t�o th�n kh�.",
		 "C�c v� cao th� n�y g�m: Tr��ng l�o <color=yellow>Huy�n Ch�n_Thi�u L�m <color>, ��i hi�p <color=yellow>Thanh Th�_V� �ang<color>, s� th�i <color=yellow>Tu� Minh_Nga My<color>, �� ch� <color=yellow>Ho�ng Ch�nh Nh�t_C�i Bang<color>, nghi tr��ng <color=yellow>���ng H�_���ng M�n<color>, t��ng qu�n <color=yellow>D��ng Di�n ��c_Thi�n Ba D��ng Ph� <color>, v� <color=yellow>C� M�c t� hi�p_Ng� ��c <color>.")
end;

-- �������;�ѧ��ȡ��;������
function get_prize_info()
	Talk(3, "", 
		 "M�i th� 6, 7 ch� nh�t h�ng tu�n, l�c <color=yellow>21:00<color> c�c v� cao th� s� xu�t hi�n b�n ngo�i c�c m�n ph�i. Tr��c ti�n h�y ��n ch� ta b�o danh �� ta xem n�ng l�c c�a ng��i th� n�o.", 
		 "N�ng l�c kh�ng �� th� c�c ng��i kh�ng th� nh�n <color=yellow>V�t ph�m<color>. N�u nh� ��nh b�i c�c v� cao th� ch�ng minh ���c n�ng l�c c�a m�nh, th� c�c ng��i s� nh�n ���c <color=yellow>t�i b�o b�i<color> trong �� �� m�t t�ch v� h�c v� v�t ph�m b� truy�n c�a s� m�n.",
		 "Ngo�i m�t t�ch v� h�c v� v�t ph�m b� truy�n c�a s� m�n ng��i c�n c� c� may nh�n ���c c�c v�t ph�m kh�c, ch� c�n chi�n th�ng c�c b�c cao th� ��, h�y c� l�n !")
end;

-- ������������
function get_boss_task_now()
	-- ��ҵȼ�Ҫ�󳬹�75��
	local nPlayerLevel = GetLevel()
	if (nPlayerLevel < 75) then
		Say("Xem ng��i t� ch�t c�ng kh�ng t�, nh�ng kinh nghi�m giang h� c�n non qu�, ��n <color=yellow>c�p 75<color> quay l�i t�m ta!", 0)
		return
	end
	
	-- 55��������Ҫѧ��
	local bHaveLearnFullSkill = get_full_skill_level()
	if (bHaveLearnFullSkill == 0) then
		Say("<color=yellow>V� h�c c�a b�n m�n<color> ng��i h�y luy�n cho tinh th�ng r�i h�y ��n t�m ta.", 0)
		return	
	end
	
	local nLastGetTaskDate = GetTask(TASK_ID_LAST_GET_DATE)		-- �ϴν�������ʲôʱ��
	local nCurrTime = {date("%y"), date("%m"), date("%d"), date("%H"), date("%w")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	local nCurHour = tonumber(nCurrTime[4])
	local nCurWeekDay = tonumber(nCurrTime[5])
	
	if ((nCurWeekDay == 0 or nCurWeekDay == 5 or nCurWeekDay == 6) and (nCurHour >= 0 and nCurHour < 20)) then
		if (nLastGetTaskDate < nCurDay) then
			nLastGetTaskDate = nCurDay
			SetTask(TASK_ID_LAST_GET_DATE, nLastGetTaskDate)
			SetTask(TASK_ID_HAVE_GOT_TODAY, 1)
		end
		Say("Ng��i chu�n b� khi�u chi�n v�i c�c b�c cao th� ch�ng minh th�c l�c c�a m�nh. M�i  th� 6, 7 ch� nh�t l�c <color=yellow>21:00<color> c�c v� cao th� s� xu�t hi�n b�n ngo�i c�c m�n ph�i. C� l�n!", 0)
		WriteLogEx("Boss su mon","nh�n nhi�m v�")
	else
		Say("<color=yellow>M�i th� 6, 7 v� ch� nh�t h�ng tu�n t� 0:00- 20:00<color>, c� th� ��n ��y b�o danh. Hi�n �� qu� th�i gian, n�u ng��i v�n ch�a b�o danh th� l�n sau quay l�i nh�! <color=yellow>21:00<color> c�c ti�n b�i V� l�m s� xu�t hi�n t�i c�c m�n ph�i.", 0)
	end
end;

-- ���55�������Ƿ��Ѿ�ѧ����
function get_full_skill_level()
	local nRet = 0
	
	local nPlayerRoute = GetPlayerRoute()
	
	if (nPlayerRoute == 2) then				-- �����׼�
		if (GetSkillLevel(31) == 7) then	-- ��Ħ�侭
			nRet = 1
		end
	elseif (nPlayerRoute == 3) then			-- ��������
		if (GetSkillLevel(56) == 7) then	-- �������ָ
			nRet = 1
		end
	elseif (nPlayerRoute == 4) then			-- ��������
		if (GetSkillLevel(43) == 7) then	-- ������צ��
			nRet = 1
		end
	elseif (nPlayerRoute == 6) then			-- ����
		if (GetSkillLevel(73) == 7) then	-- ���컨��
			nRet = 1
		end
	elseif (nPlayerRoute == 8) then			-- ���ҷ��
		if (GetSkillLevel(88) == 7) then	-- ��ȴ���
			nRet = 1
		end
	elseif (nPlayerRoute == 9) then			-- �����׼�
		if (GetSkillLevel(101) == 7) then	-- ����Ʈ����
			nRet = 1
		end
	elseif (nPlayerRoute == 11) then		-- ؤ�ﾻ��
		if (GetSkillLevel(112) == 7) then	-- ��ȭ
			nRet = 1
		end
	elseif (nPlayerRoute == 12) then		-- ؤ������
		if (GetSkillLevel(123) == 7) then	-- �򹷹���
			nRet = 1
		end
	elseif (nPlayerRoute == 14) then		-- �䵱����
		if (GetSkillLevel(145) == 7) then	-- �����߽ؽ�
			nRet = 1
		end
	elseif (nPlayerRoute == 15) then		-- �䵱�׼�
		if (GetSkillLevel(158) == 7) then	-- �����޼���
			nRet = 1
		end
	elseif (nPlayerRoute == 17) then		-- ����ǹ��
		if (GetSkillLevel(731) == 7) then	-- �����w��ǹ
			nRet = 1
		end
	elseif (nPlayerRoute == 18) then		-- ���Ź���
		if (GetSkillLevel(744) == 7) then	-- �����Ӱ��
			nRet = 1
		end
	elseif (nPlayerRoute == 20) then		-- �嶾а��
		if (GetSkillLevel(377) == 7) then	-- ʬ����
			nRet = 1
		end
	elseif (nPlayerRoute == 21) then		-- �嶾��ʦ
		if (GetSkillLevel(363) == 7) then	-- ��ħ
			nRet = 1
		end
	end
	
	return nRet
end;

-- �������ǰ����λ��˵��
function get_bossweizhi_info()
	Talk(1, "", 
		 "\n Tr��ng l�o Thi�u L�m <color=yellow>Huy�n Ch�n<color> � <color=yellow>(172.202)<color>. \n ��i hi�p V� �ang <color=yellow>Thanh Th�<color> � <color=yellow>(197.211)<color>. \n S� th�i Nga My <color=yellow>Tu� Minh<color> � <color=yellow>(209.211)<color>. \n �� ch� C�i Bang <color=yellow>Ho�ng Ch�nh Nh�t<color> � <color=yellow>(185.202)<color>. \n Nghi Tr��ng ���ng M�n <color=yellow>���ng H�<color> � <color=yellow>(196.187)<color>. \n T��ng Qu�n Thi�n Ba D��ng Ph� <color=yellow>D��ng Di�n ��c<color> � <color=yellow>(209.206)<color>. \n T� Hi�p Ng� ��c <color=yellow>C� M�c<color> � <color=yellow>Ng� ��c (213.200)<color>.")
end;

