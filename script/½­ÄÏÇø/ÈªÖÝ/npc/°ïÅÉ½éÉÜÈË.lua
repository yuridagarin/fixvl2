Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\vng\\config\\newserver.lua");
---------------------------------------------------------
--	��������
--	���Ľӿ��� - Jeep tag
---------------------------------------------------------

function main()
--	Talk(1,"","Ta �ang trong giai �o�n ngh� ng�i, ng��i h�y quay l�i sau nh�.")
--	do	return	end
	
	local nDate = tonumber(date("%Y%m%d"))
	-- Gioi han bang hoi Thieu Lam Tu
	if tbGioiHanBangHoi[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanBangHoi[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"","Ch�a ��n th�i gian m� t�nh n�ng Bang H�i, ng��i h�y quay l�i sau nh�!!!");				
			do	return	end
		end
	end
	
	local bWantCreateTong = GetTask(297)
	local bWantDestoryTong = GetTask(295)
	
	local bIsTongMember = IsTongMember()	-- �ǰ���Ա�Ļ����Ͱѽ������������ɵ������������ˣ�����
	if (bIsTongMember == 1) then
		bWantCreateTong = 0;
		SetTask(297, 0)
	end
	
	-- <bWantDestoryTong == 1>��ʾ����Ѿ����������˴������ɢ��ᣬ����������
	-- <bWantDestoryTong == 2>��ʾ����Ѿ��������������ɢ��ᣬ����ɧ�Ž�ɽ��������
	-- <bWantDestoryTong == 3>��ʾ��ɽ�������Ѿ���Ӧ�˽�ɢ��������
	
	-- <bWantCreateTong == 1>��ʾ����Ѿ����������˴����뽨����ᣬ����������
	-- <bWantCreateTong == 2>��ʾ����Ѿ�����˽�ɽ�����˵��Ͽɣ��õ���(��������)
	
-- ��ɢ���Ĳ��ַָ��� -- ��ʼ ------------------------------------------------------------------------------
	if ((bWantDestoryTong == 1) or (bWantDestoryTong == 2)) then	-- �Ѿ������˽�ɢ��ᣬ���ǻ�û�еõ���ɽ�����˵����ȷ��
		Say("L�i th�nh c�u gi�i t�n bang h�i c�a b�ng h�u �� ���c ti�p nh�n! ��i Minh Ch� Kim S�n ��ng �, B�ng h�u c� th� ti�n h�nh gi�i t�n bang h�i!", 0)
		return
	end
	
	if (bWantDestoryTong == 3) then		-- ��ɽ�������Ѿ�ͬ���˽�ɢ�����
		SetTask(295, 0)
		SetTask(296, 0)
		SetTask(297, 0)
		Talk(1,"","Ph�ng l�nh Minh Ch� Kim S�n, �� ch�nh th�c gi�i t�n bang h�i c�a b�ng h�u!")
		DestroyTong()
		return
	end
	
-- ��ɢ���Ĳ��ַָ��� -- ���� ------------------------------------------------------------------------------

-- �������Ĳ��ַָ��� -- ��ʼ ------------------------------------------------------------------------------	
	if (bWantCreateTong == 1) then		-- �Ѿ������˽�����ᣬ��û�еõ������˵����ͬ��
		Talk(1,"","Mu�n x�y d�ng bang h�i ph�i ���c Minh Ch� Kim S�n ��ng �. B�ng h�u c�n giao n�p <color=yellow>H�i Minh l�nh b�i<color> Minh Ch� Kim S�n xem x�t, ���c ch��ng m�n ch�p nh�n m�i c� th� ch�nh th�c x�y d�ng bang h�i. H�y ��n T��ng D��ng t�m Minh Ch� Kim S�n!")
		return
	end
	
	if (bWantCreateTong == 2) then		-- �Ѿ��㵽�˻�������
		Say("Ng��i th�t xu�t s�c! Minh Ch� Kim S�n �� ��ng � cho ng��i x�y d�ng bang h�i!",
		    1,
		    "Xin �a t�! Mong gi�p t�i h� ti�n h�nh x�y d�ng bang h�i!/create_tong_formally")
		return
	end
-- �������Ĳ��ַָ��� -- ���� ------------------------------------------------------------------------------


	--����
	Say("Ta ph�ng l�nh V� l�m minh ch� x� l� chuy�n bang h�i! B�ng h�u c� chuy�n g� kh�ng?",
	    6,
	    "X�y d�ng bang h�i y�u c�u nh�ng �i�u ki�n g�?/introduce_about_create_tong",
	    "C� ph�i nh�n kh� bang h�i cao c� th� nh�n ���c ph�n th��ng ��c bi�t?/introduce_about_population",
	    "Ta mu�n s�ng l�p bang ph�i, tri�u t�p anh h�ng thi�n h�!/apply_create_tong_normal",
	    "Ta mu�n t�ng c�p, khu�ch tr��ng th� l�c bang h�i ta!/apply_level_up_tong",
	    "Ta mu�n gi�i t�n bang h�i, lui v� ch�n s�n l�m!/apply_destroy_tong_normal",
	    "Kh�ng c� g�! Ch� ti�n th� h�i th�m th�i!/chat_xxx")
end;



-- ��Ŀ��Խ�������ˣ�����Ǯ�������ƾ����ϰ��������
function create_tong_formally()
	local bCardIsExist = GetItemCount(2,0,125)  -- �Ƿ��л�������
	if (bCardIsExist < 1) then
		Say("B�ng h�u ph�i chu�n b� <color=yellow>H�i Minh l�nh b�i<color> �� x�y d�ng bang h�i!", 0)
		return
	end
        if GetItemCount(2, 0, 555) < 1 then
            Say("<color=green>S� gi� bang h�i<color>: L�p bang c�n <color=yellow>C�n Kh�n Ph�<color>, ��i hi�p n�n mang theo ��o c� n�y khi l�p bang nh�!", 0);
            return
        end

	local nMoney = GetCash()	--������ϵ�Ǯ
	if (nMoney < 5000000) then	-- ��Ǯ
		Talk(1,"","<color=green>S� gi� bang h�i<color>: L�p bang c�n c�n 500 l��ng v�ng, quy�n g�p cho v� l�m minh ch� �� gi�p b� t�nh thi�n h�. Hi�n t�i ��i hi�p v�n ch�a �� ti�n �� l�p bang!")
		return
	end
        if GetReputation() < 1000 then
            Say("<color=green>S� gi� bang h�i<color>: Ki�n l�p bang h�i c�n <color=yellow>1000 danh v�ng<color>, ��i hi�p luy�n th�m th�i gian n�a r�i h�ng l�p bang h�i!", 0);
            return
        end
	
	CreateTongDialog()
end;

-- ���ܽ����������Ҫ������
function introduce_about_create_tong()
	Talk(1,"","<color=green>S� gi� bang h�i<color>: �i�u ki�n l�p bang c�n nh�n v�t <color=yellow>c�p 50<color> tr� l�n v� ph�i mang <color=yellow>500 v�ng <color> v�i <color=yellow>Minh H�i L�nh B�i<color> v�<color=yellow>c�n kh�n ph�<color>")
end;

-- ���ܰ����������������
function introduce_about_population()
	Talk(1,"","B�ng h�u qu� nhi�n b�t tin nhanh nh�y. M�i ng�y ch�ng ta ��u ph�i c�c truy�n nh�n n�m b�t t�nh h�nh nh�n kh� c�a m�i bang h�i. N�u s� huynh �� trong bang c�ng nhi�u, v� ngh� cao c��ng ho�c th�i gian g�n b� trong bang d�i ��u c� c�ng hi�n l�n cho nh�n kh� c�a bang h�i. C�c h�ng ��u trong b�ng x�p h�ng nh�n kh� bang h�i ��u nh�n ���c ph�n th��ng ��c bi�t c�a Minh Ch� Kim S�n!")
end;

-- ��Ҫ���Խ������
function apply_create_tong_normal()
	local bIsTongMember = IsTongMember()
	if (bIsTongMember == 1) then
		Talk(1,"","B�ng h�u �� l� ng��i c�a bang h�i kh�ng th� khai s�ng bang h�i!")
		return
	end

	local nCurPlayerLevel = GetLevel()
	if (nCurPlayerLevel < 50) then
		Talk(1,"","B�ng h�u ch�a ��n c�p 50! C� g�ng kh� luy�n th�m r�i h�y ��n!")
	else
		SetTask(297, 1)
		Talk(1,"","Mu�n x�y d�ng bang h�i ph�i ���c Minh Ch� Kim S�n ��ng �. B�ng h�u c�n giao n�p <color=yellow>H�i Minh l�nh b�i<color> Minh Ch� Kim S�n xem x�t, ���c ch��ng m�n ch�p nh�n m�i c� th� ch�nh th�c x�y d�ng bang h�i. H�y ��n T��ng D��ng t�m Minh Ch� Kim S�n!")
	end
end;

-- �����ɢ��ᣬ֮��ͱ��򷢵���ɽ����������ȥ��
function apply_destroy_tong_normal()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- ���ǰ���
		Talk(1,"","B�ng h�u kh�ng ph�i bang ch� c�a bang n�o, sao l�i c� th� gi�i t�n bang h�i ch�!")
		return
	end
	
	SetTask(295, 1)
	Talk(1,"","L�i th�nh c�u gi�i t�n bang h�i c�a b�ng h�u �� ���c ti�p nh�n! ��i Minh Ch� Kim S�n ��ng �, B�ng h�u c� th� ti�n h�nh gi�i t�n bang h�i!")
end;

-- �������ģ����û�Ǯ����������
function chat_xxx()
	Talk(1,"","�a t� b�ng h�u quan t�m! Nh�ng g�n ��y c�ng vi�c qu� nhi�u, ��i l�c r�nh r�i s� tr� chuy�n v�i b�ng h�u!")
end;

-- �����������ȼ�
function apply_level_up_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- ���ǰ���
		Talk(1,"","B�ng h�u kh�ng ph�i bang ch�! Mu�n t�ng c�p bang h�i, y�u c�u bang ch� c�a ng��i ��ch th�n ��n!")
		return
	end
	
	local nTongLevel = GetTongLevel()
	if (nTongLevel >= 5) then		-- �������ֻ�������� 5 �����Ժ��Ҫ�Ȱ�Ὠ�蹦�ܳ���������������
		Talk(1,"","Ti�n ch� c� th� t�ng c�p bang h�i ��n c�p 5. N�u mu�n ti�p t�c t�ng c�p c�n ph�i ki�n thi�t bang h�i m�i c� th� ti�p t�c t�ng c�p, nh�ng ch�c n�ng n�y t�m th�i ch�a m�. Xin c�c bang ch� ch� ��i th�ng b�o m�i c�a Minh Ch� Kim S�n!")
		return
	end
	
	if (nTongLevel == 0) then		-- ��ʱ��ᣬֱ�Ӵ��ߣ�TMD����
		Talk(1,"","Bang h�i t�m th�i c�a b�ng h�u hi�n ch�a �� s� ng��i, c�n thu nh�n th�m! ��i ��n khi x�y d�ng bang h�i ch�nh th�c h�y ��n t�m ta!")
		return
	end
	
	-- ���¿�ʼ��1-4�������������ܣ�������Ҫÿһ���𽲵Ļ�����ͬ��
	local strTalk = {
			"Bang h�i hi�n t�i c�a b�ng h�u ch� l� bang h�i c�p th�p! C�n t�ng c�p bang h�i �� ph�t d��ng danh ti�ng trong giang h�, c� th� thu nh�n ���c nhi�u huynh ��. Bang h�i khi t�ng c�p c� th� m� r�ng quy m� nh�ng c�n b� ra <color=yellow>170 ti�n v�ng<color>. B�ng h�u b�ng l�ng giao n�p ti�n t�ng c�p kh�ng?",
			"Bang h�i c�a ng��i tr� tr�n giang h� �� l�u nh�ng c�n t�ng c�p ��n <color=yellow>bang h�i c�p 3<color> v� ���c tri�u ��nh th�a nh�n �� ti�n tri�u t�p huynh �� c�a qu� bang khi Qu�c gia h�u s�. C�n n�p <color=yellow>400 ti�n v�ng<color> ��ng k� v�i tri�u ��nh, bang ch� c� mang �� ti�n kh�ng?",
			"Bu�i ��u x�y d�ng bang h�i, c�n ph�i v� thi�n h� b� t�nh. N�n d�n � Giang T�n th�n tr�i d�t kh�p n�i. Minh Ch� Kim S�n �ang d�c s�c tr� gi�p h�, �� ��n l�c ch�ng ta ph�i g�p s�c. �� t�ng c�p bang h�i m�nh, h�y quy�n g�p ch�t ti�n c�u �� b� t�nh. Theo quy m� c�a bang h�i, c�n quy�n g�p <color=yellow>800 ti�n v�ng<color>!",
			"Bang h�i c�a ng��i tuy ph�t tri�n nhanh ch�ng nh�ng c�n th�ng l�n <color=yellow>bang h�i c�p 5<color> nh�ng ng��i hi�n ch�a �� danh ti�ng giang h�. H�y tri�u t�p ��i h�i v� l�m li�n minh, m�i bang ch� c�a c�c bang h�i l�n v� anh h�ng h�o ki�t c�ng tham gia �� n�ng cao danh ti�ng v� ph�t d��ng th� l�c c�a bang h�i nh�ng c�n ti�u t�n ��n <color=yellow>1400 ti�n v�ng<color>. Ng��i th�y th� n�o?",
			}
	
	Say(strTalk[nTongLevel], 
	    2,
	    "Hay l�m! Huynh �� n�i th�t c� l�! Ta s� giao ti�n, chuy�n c�n l�i b�ng h�u t� lo li�u!/agree_add_tong_level",
	    "��y kh�ng ph�i s� ti�n nh�. T�i h� ph�i v� b�n b�c v�i c�c huynh �� trong bang!/disagree_add_tong_level")
end;

function agree_add_tong_level()
	local nNeedMoney = {1700000, 4000000, 8000000, 14000000}
		
	local nCurTongLevel = GetTongLevel()
	local nCurHaveMoney = GetCash()
	
	if (nCurHaveMoney < nNeedMoney[nCurTongLevel]) then		-- Ǯ�����������ӵ�ƭ�ˣ���
		Say("Hi�n ng��i kh�ng c� �� ti�n. C� ti�n �� r�i ta b�n ti�p!", 0)
		return
	end
	
	Pay(nNeedMoney[nCurTongLevel])
	AddTongLevel()
	Talk(1,"","Ch�c m�ng bang h�i c�a b�ng h�u ���c t�ng c�p! B�ng h�u h�y quay v� ch�n h�ng bang h�i, nh�t ��nh th�nh t�u s� v��t tr�i tr�n ch�n giang h�!")
end;

function disagree_add_tong_level()
	Talk(1,"","Hay l�m! B�ng h�u qu� nhi�n c� t� ch�t bang ch�! Quy�t ��nh xong c� th� quay l�i t�m ta!")
end;

