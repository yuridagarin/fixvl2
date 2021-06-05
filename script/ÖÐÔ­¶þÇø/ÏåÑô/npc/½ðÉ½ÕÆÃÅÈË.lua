
---------------------------------------------------------
--	��ɽ������
--	��������ӿ��� - Jeep tag
---------------------------------------------------------

Include("\\script\\online\\viet_event\\200911\\event_head.lua");
Include("\\script\\online\\viet_event\\200909\\9\\head.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function main()
--	if (SCCheckCanGetOfflineExp() > 0) then
--		Say("<color=green>��ɽ������<color>����λ��ʿ������ѧ�����������������͡��������±��г߶ȣ����̲������Ϸ������������һ�������������������֮�����ɽ�ÿ������Ĺ���������λ�������ѧ������Ϣʱ��Ҳ��������ѧ��һ�δ��͵Ĺ������ɳ���<color=yellow>8��<color>ʱ��������֮�⣬�����Ƴ�һ�����ڴ����Ĺ��������¹������ڽ�<color=yellow>7��<color>�ڻ�ù�<color=yellow>56��<color>ʱ���ĳ�������������ʿ����ȥ����֮�ࡣ��ס�����ڴ����ڼ䲻���ٽ�����ͨ����������ʿ����ÿ���κ�ʱ�������ҡ�",
--			3,
--			"����1�մ������ɻ��ÿ�����߾���8��ʱ��(����5J�����ż�����������)/iiiiiiwantwant",
--			"����7�մ������ɻ��7�����߾���56��ʱ��(����50J�����ż�����������)/i77777777want",
--			"��������������/main_1")
--	else

	local tbDialog = {
		"Ta mu�n gi�i quy�t vi�c li�n quan ��n bang h�i/main_1",
		"R�i kh�i/noooooo_say"
		};
	if tonumber(date("%Y%m%d")) >= 20090928 and tonumber(date("%Y%m%d")) <= 20091025 then
		tinsert(tbDialog ,1,"Nh�n d�p T�t Trung Thu, S� ph� ta c�  m�t ch�t qu� mu�n g�i ��n Minh Ch�, mong Minh Ch� h�y nh�n l�y!/give_letter")
	end	
	
	if GetTaskTrans() >= 8 then
		tinsert(tbDialog ,1,"T�m hi�u c�c h��ng tu luy�n/view_info")	
		tinsert(tbDialog ,1,"Nhi�m v� Chuy�n Sinh - C�i L�o Ho�n ��ng/translife_task_2")
	end
	
	Say("<color=green>Minh Ch� Kim S�n<color>: Ng��i ��n t�m l�o phu c� vi�c g�?",
		getn(tbDialog),
		tbDialog
		)
--	end
end

function translife_task_2()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(2148) ~= nDate then		
		gf_SetTaskByte(2161,2,0)
		gf_SetTaskByte(2161,3,0)
		SetTask(2148,nDate)
	end	
	if gf_GetTaskByte(2161,2) >= 2 then
		if GetTask(1537) == 9 then
			SetTask(1537,10)			
		end
	end	
	if GetTaskTrans() == 8 then
		trans_talk_09()	
	elseif GetTaskTrans() == 10 then
		trans_talk_10()
	elseif GetTaskTrans() == 11 then
		trans_talk_11()
	elseif GetTaskTrans() == 12 then	
		trans_talk_12()
	elseif GetTaskTrans() == 13 then	 	
		trans_talk_13()
	else
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
end


function i77777777want()
	if GetTask(OFFLINE_EXP_TIME) > 0 then
		Say("L�n tr��c c�ng l�c c�a l�o phu truy�n cho c�c ng��i v�n ch�a s� d�ng h�t, l�n n�y c� mu�n ��i kh�ng?",
			2,
			"��ng/yes7777777",
			"�� ta suy ngh�!/noooooo_say")
	else
		yes7777777()
	end
end

function yes7777777()
	local nMoney = GetCash()
	if nMoney < 500000 then
		Talk(1, "", "V� b�ng h�u ��y c�ng th�nh k�nh qu� nh�")
	else
		Pay(500000)
		Talk(1, "", "C�ng l�c l�n n�y duy tr� ���c <color=yellow>112 gi�<color>")
		SCCheckOfflineExp(1, 1)
		Msg2Player("B�n nh�n ���c 112 gi� r�i m�ng t�ng �i�m kinh nghi�m.")
	end
end

function iiiiiiwantwant()
	if GetTask(OFFLINE_EXP_TIME) > 0 then
		Say("L�n tr��c c�ng l�c c�a l�o phu truy�n cho c�c ng��i v�n ch�a s� d�ng h�t, l�n n�y c� mu�n ��i kh�ng?",
			2,
			"��ng/yes1111111",
			"�� ta suy ngh�!/noooooo_say")
	else
		yes1111111()
	end
end

function yes1111111()
	local nMoney = GetCash()
	if (nMoney < 50000) then
		Talk(1, "", "V� b�ng h�u ��y c�ng th�nh k�nh qu� nh�")
	else
		Pay(50000)
		Talk(1, "", "C�ng l�c l�n n�y duy tr� ���c <color=yellow>16 gi�<color>")
		SCCheckOfflineExp(1, 0)
		Msg2Player("B�n nh�n ���c 16 gi� r�i m�ng t�ng �i�m kinh nghi�m")
	end
end

function main_1()
	local bWantCreateTong = GetTask(297)
	local bWantDestoryTong = GetTask(295)

	-- <bWantDestoryTong == 1>��ʾ����Ѿ����������˴������ɢ��ᣬ����������
	-- <bWantDestoryTong == 2>��ʾ����Ѿ��������������ɢ��ᣬ����ɧ�Ž�ɽ��������
	-- <bWantDestoryTong == 3>��ʾ��ɽ�������Ѿ���Ӧ�˽�ɢ��������
	
	-- <bWantCreateTong == 1>��ʾ����Ѿ����������˴����뽨����ᣬ����������
	-- <bWantCreateTong == 2>��ʾ����Ѿ�����˽�ɽ�����˵��Ͽɣ��õ���(��������)
	
-- ��ɢ���Ĳ��ַָ��� -- ��ʼ ------------------------------------------------------------------------------	
	if (bWantDestoryTong == 1) then		-- ��Ҫ��ɢ���
		Say("Ta �� nghe thu�c h� b�o l�i, ng��i mu�n gi�i t�n bang h�i v� �n s�n l�m, ��ng kh�ng?",
		    2,
		    "V�n b�i �� quy�t, xin ch��ng m�n ��ng �!/first_apply_destroy_tong",
		    "V�n b�i �� ngh� l�i, kh�ng mu�n gi�i t�n n�a./cancel_destroy_tong")
		return
	end
	
	if (bWantDestoryTong == 2) then		-- �Ѿ������ˣ���Ҫ��ʽ��ɢ��������ȡ����ɢ���
		Say("L�i ��n n�a �, ph�i ch�ng ng��i mu�n gi�i t�n bang h�i?",
		    2,
		    "V�n b�i �� ngh� k� l�i kh�ng mu�n r�i xa c�c huynh �� trong bang n�n kh�ng mu�n gi�i t�n n�a./cancel_destroy_tong",
		    "��ng v�y, v�n b�i �� thu x�p �n th�a v�i c�c huynh �� trong bang, � ch� �� quy�t mong ch��ng m�n ch�p nh�n cho./second_apply_destroy_tong")
		return
	end
	
	if (bWantDestoryTong == 3) then		-- �Ѿ�����Ӧ��
		Say("Bi�n Kinh, Th�nh ��, Tuy�n Ch�u ��u c� S� gi� bang h�i, ng��i ��n �� xin ���c gi�i t�n bang h�i, nh� thu x�p v�i c�c huynh �� trong bang nh�!", 0)
		return
	end
-- ��ɢ���Ĳ��ַָ��� -- ���� ------------------------------------------------------------------------------

-- �������Ĳ��ַָ��� -- ��ʼ ------------------------------------------------------------------------------
	if (bWantCreateTong == 1) then		-- �������˽������ģ�������������
		Say("Ta �� nghe thu�c h� b�o l�i, ng��i mu�n s�ng l�p bang ph�i, tri�u t�p anh h�ng thi�n h� ��ng kh�ng?",
		    1,
		    "��ng v�y, v�n b�i mu�n t�p h�p anh h�ng trong thi�n h�, xin ch��ng m�n ��ng �/check_apply_create_tong_cond")
		return
	end
	
	if (bWantCreateTong == 2) then
		Talk(1,"","Bi�n Kinh, Th�nh ��, Tuy�n Ch�u ��u c� S� gi� bang h�i, ng��i c� th� ��n �� xin ���c gi�i t�n bang h�i, ta �� ph�i ng��i th�ng b�o cho h� r�i. Ng��i c�m <color=yellow>Minh H�i l�nh b�i<color> v� �i!")
		return
	end
-- �������Ĳ��ַָ��� -- ���� ------------------------------------------------------------------------------
	
-- ��ȡ�ɲ�¶�Ĺ��ܶԻ� -- ��ʼ ------------------------------------------------------------------------------
	local bIsTongMember = IsTongMember()		-- �ж��������ǲ��ǰ���Ա
	local bChangedPopulation = 0			-- �жϰ�������Ƿ��иı��
	local bTongLadder = 0				-- �����ҵİ�ᵱǰ��������
	local nLastTongPopulation = GetTask(298)	-- �������ϴε�������ֵ���͵�ǰ��ͬ�Ļ����ǲ�������ȡ��
	local nLastGetPrizeDate = GetTask(299)		-- �������ϴ���ȡ�ɲݵ����ڣ�ÿ��ֻ����һ�Σ�
	local nCurTongPopulation = nLastTongPopulation	-- �����ҵ�ǰ��������ֵ
	
	local nCurPrizeDate = {date("%y"), date("%m"), date("%d")}
	local nCurPrizeDateNum = tonumber(nCurPrizeDate[1]..nCurPrizeDate[2]..nCurPrizeDate[3])	-- ��ǰʱ��(������)
	local nExpireDataNum = tonumber("5".."11".."11")	-- ���ڵ�ʱ��
	
	-- ����ǰ���Ա�Ļ����͸ı�nCurTongPopulation��bTongLadder������ֵ
	-- ��������2005��11��11����ǰ
	if ((bIsTongMember == 1) and (nCurPrizeDateNum < nExpireDataNum)) then
		bTongLadder = GetTongPopuLadder()
		nCurTongPopulation = GetTongPopulation()
	end
	
	-- ���������ֵ����ȣ������и��¹���
	if ((nCurTongPopulation ~= nLastTongPopulation) and (nCurPrizeDateNum ~= nLastGetPrizeDate)) then
		bChangedPopulation = 1
	end
	
	if ((bTongLadder == 1) and (bChangedPopulation == 1)) then	-- ����ǵ�һ�������ҽ���û���죬��3���ɲ�
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,3)
		Talk(1,"","Nh�n kh� bang h�i c�a ng��i hi�n nay �� nh�t giang h�, nh�n ���c ph�n th��ng <color=yellow>3 Ti�n Th�o L�<color>.")
		return
	end
	
	if ((bTongLadder == 2) and (bChangedPopulation == 1)) then	-- ����ǵڶ��������ҽ���û���죬��2���ɲ�
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,2)
		Talk(1,"","Nh�n kh� bang h�i c�a ng��i hi�n nay x�p th� 2, nh�n ���c ph�n th��ng <color=yellow>2 Ti�n Th�o L�<color>.")
		return
	end
	
	if ((bTongLadder == 3) and (bChangedPopulation == 1)) then	-- ����ǵ����������ҽ���û���죬��1���ɲ�
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,1)
		Talk(1,"","Nh�n kh� bang h�i c�a ng��i hi�n nay x�p th� 3, nh�n ���c ph�n th��ng <color=yellow>1 Ti�n Th�o L�<color>.")
		return
	end

-- ��ȡ�ɲ�¶�Ĺ��ܶԻ� -- ���� ------------------------------------------------------------------------------
	-- û����Ҫ������ᣬ����
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0) then
		Talk(1,"","L�o phu tung ho�nh giang h� �� nhi�u n�m nh�n ���c s�c tin y�u c�a ��ng ��o, nay ��m nh�n ch�c minh ch� c�a V� L�m, kh�ng bi�t trong giang h� c�n ai c� th� x�ng ���c v�i danh hi�u <color=yellow>��i hi�p<color> n�y kh�ng?")
	else
		Talk(1,"","Ng��i �� l� ch� c�a m�t bang h�i, c� th� k�u g�i c�c huynh �� trong bang, h�y c� l�n nh�!")
	end
end;





-- ��һ�������������룬Ҫ��ɢ���
function first_apply_destroy_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- ���ǰ���
		Talk(1,"","Ng��i kh�ng ph�i l� ch� c�a m�t bang, sao l�i ��n ��y ��i gi�i t�n bang h�i?")
		SetTask(295, 0)
		SetTask(296, 0)
		return
	end
	
	local nCurDate = {date("%y"), date("%m"), date("%d")}
	local nCurDateNum = tonumber(nCurDate[1]..nCurDate[2]..nCurDate[3])	-- ��ǰʱ��(������)
	
	SetTask(295, 2)			-- ���ó��Ѿ�����������ڽ�ɽ�����˴�������
	SetTask(296, nCurDateNum)	-- ���������ʱ��
	
	-- ����Ҵ���
	Say("Ng��i v�t v� l�m m�i l�p ���c n�n m�t bang h�i v�y m� ch� v� xung ��t nh� �� mu�n gi�i t�n, nh� v�y c� ��ng kh�ng? V�y nh�, ta cho ng��i 3 ng�y �� suy ngh� sau �� quay l�i g�p ta, th� n�o?",
	    1,
	    "C�ng ���c! �� v�n b�i suy ngh� l�i./delay_for_three_days")
end;

-- ���������ټ��������Ժ�������
function delay_for_three_days()
	Talk(1,"","V�y nh�, 3 ng�y sau quay l�i t�m ta. Nh�ng h�y nh� h�nh t�u giang h� ph�i bi�t coi tr�ng ch� ngh�a, ��ng �� c�c huynh �� trong bang th�t v�ng.")
end;

-- �ڶ�������������ʽ���룬Ҫ��ɢ���
function second_apply_destroy_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- ���ǰ���
		Talk(1,"","Ng��i kh�ng ph�i l� ch� c�a m�t bang, sao l�i ��n ��y ��i gi�i t�n bang h�i?")
		SetTask(295, 0)
		SetTask(296, 0)
		return
	end
	
	local nCurDate = {date("%y"), date("%m"), date("%d")}
	local nCurDateNum = tonumber(nCurDate[1]..nCurDate[2]..nCurDate[3])	-- ��ǰʱ��(������)
	local nApplyDateNum = GetTask(296)					-- �����ɢ��ʱ��
	local nExpiredDate = nCurDateNum - nApplyDateNum			-- �Ѿ������˵�ʱ��
	
	if (nExpiredDate < 3) then		-- �������յ�����
		Talk(1,"","Ng��i n�ng n�y qu�, ch�ng ph�i l� h�n v�i ng��i 3 ng�y sau m�i quay l�i �� sao!")
	else
		SetTask(295, 3)			-- �Ѿ���Ӧ�˽�ɢ��������
		Say("N�u l�ng ng��i �� quy�t th� ta c�ng kh�ng c�n. Ta s� th�ng b�o cho thu�c h� x�a b� bang h�i c�a ng��i. T�i Bi�n Kinh, Th�nh ��, Tuy�n Ch�u ��u c� S� gi� bang h�i, ng��i ��n �� �� xin l�m th� t�c gi�i t�n.", 0)
	end
end;

-- �����˲����ɢ�����
function cancel_destroy_tong()
	SetTask(295, 0)
	SetTask(296, 0)
	Talk(1,"","T�t qu�, ng��i �� k�p th�i ngh� l�i. H�y ti�p t�c th�ng l�nh bang h�i ki�n c�ng l�p nghi�p nh�!")
end;

-- ��һ����Ҫ���������˽����������
function check_apply_create_tong_cond()
	Say("Xem ng��i c�n tr� m� t� ch�t kh�ng t�. Anh h�ng n� hi�p h�y v� <color=yellow>b� t�nh<color> c�c cung t�n t�y nh� v�y m�i x�ng danh <color=yello>��i hi�p<color>!", 
	    1,
	    "�a t� ti�n b�i gi�o hu�n, t�i h� c� th� v� l�p bang h�i cho m�nh ch�a??/get_tong_card")
end;

function get_tong_card()
	local nCurReputation = GetReputation()		-- ��ǰ����
	local bHaveTongCard = GetItemCount(2,0,125)	-- �Ƿ��л�������
	
	if ((nCurReputation >= 1000) and (bHaveTongCard >= 1) and (GetItemCount(2,0,555) >=1)) then
		SetTask(297, 2)				-- ��¼�������
		Talk(1,"","Xem ng��i c�n tr� nh�ng t� ch�t kh�ng t�, v� ngh� cao c��ng x�ng danh ��i hi�p. Ng��i h�y c�m <color=yellow>Minh H�i l�nh b�i v� C�n Kh�n Ph�<color> v� ki�n l�p bang h�i, k�u g�i anh h�ng n� hi�p t�o ph�c cho b� t�nh.")
	else
		Talk(1,"","Ng��i v� c�ng tuy xu�t ch�ng nh�ng v�n ch�a �� �i�u ki�n ki�n l�p bang ph�i. Tr��c ti�n h�y t�ch l�y <color=yellow>1000 �i�m danh v�ng<color> v� <color=yellow>Minh H�i l�nh b�i v� C�n Kh�n Ph�<color>.<color=yellow>Minh H�i l�nh b�i <color> c� th� d�ng �i�m chi�n c�ng ��n Nh�n M�n quan g�p Qu�n Nhu Quan �� ��i. <color=yellow>C�n Kh�n Ph�<color> c� th� mua t�i Ng� C�c.")
	end
end;

function noooooo_say()

end
