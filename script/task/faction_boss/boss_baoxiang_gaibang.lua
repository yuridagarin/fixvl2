-- =============================================================
-- FileName : boss_baoxiang_gaibang.lua
-- Desc     : ؤ��boss����Ľű�������boss�����е���ı��䣬��ȡ���Ի�úö�good�����Ĺ���
-- Date     : Dec 19 2006
-- Creator  : Tony(Jizheng)
-- =============================================================
Include("\\script\\lib\\writelog.lua")

TASK_ID_LAST_GET_DATE = 88			-- �ϴ���ȡ�����ʱ�䣬�������ID
TASK_ID_HAVE_GOT_TODAY = 89			-- �����Ƿ��Ѿ���ȡ������,�������ID

tGaojiMiji = {
	[0] = {{"Kim Cang B�t Nh� Kinh",0,107,166},{"V� Tr�n B� �� Kinh",0,107,168},{"Ti�m Long T�ch Di�t Kinh",0,107,167},{"Thi�n La Li�n Ch�u L�c",0,107,169},{"Nh� � Kim ��nh M�t T�ch",0,107,170},{"B�ch H�i Tuy�t �m Ph�",0,107,171},{"H�n ��n Tr�n Nh�c M�t T�ch",0,107,172},{"Qu� Thi�n Du Long M�t T�ch",0,107,173},{"Huy�n �nh M� Tung M�t T�ch",0,107,174},{"Qu�n T� Ti�t Phong M�t T�ch",0,107,175},{"Tr�n Qu�n Phi Long Th��ng Ph�",0,107,176},{"Xuy�n V�n L�c H�ng M�t T�ch",0,107,177},{"U Minh Phong Ma L�c",0,107,178},{"Linh C� Huy�n T� L�c",0,107,179}},
	[1] = {{"Kim Cang B�t Nh� Kinh",0,107,166},{"V� Tr�n B� �� Kinh",0,107,168},{"Ti�m Long T�ch Di�t Kinh",0,107,167}},
	[2] = {{"Kim Cang B�t Nh� Kinh",0,107,166}},
	[3] = {{"V� Tr�n B� �� Kinh",0,107,168}},
	[4] = {{"Ti�m Long T�ch Di�t Kinh",0,107,167}},
	[5] = {{"Thi�n La Li�n Ch�u L�c",0,107,169}},
	[6] = {{"Thi�n La Li�n Ch�u L�c",0,107,169}},
	[7] = {{"Nh� � Kim ��nh M�t T�ch",0,107,170},{"B�ch H�i Tuy�t �m Ph�",0,107,171}},
	[8] = {{"Nh� � Kim ��nh M�t T�ch",0,107,170}},
	[9] = {{"B�ch H�i Tuy�t �m Ph�",0,107,171}},
	[10] = {{"H�n ��n Tr�n Nh�c M�t T�ch",0,107,172},{"Qu� Thi�n Du Long M�t T�ch",0,107,173}},
	[11] = {{"H�n ��n Tr�n Nh�c M�t T�ch",0,107,172}},
	[12] = {{"Qu� Thi�n Du Long M�t T�ch",0,107,173}},
	[13] = {{"Huy�n �nh M� Tung M�t T�ch",0,107,174},{"Qu�n T� Ti�t Phong M�t T�ch",0,107,175}},
	[14] = {{"Huy�n �nh M� Tung M�t T�ch",0,107,174}},
	[15] = {{"Qu�n T� Ti�t Phong M�t T�ch",0,107,175}},
	[16] = {{"Tr�n Qu�n Phi Long Th��ng Ph�",0,107,176},{"Xuy�n V�n L�c H�ng M�t T�ch",0,107,177}},
	[17] = {{"Tr�n Qu�n Phi Long Th��ng Ph�",0,107,176}},
	[18] = {{"Xuy�n V�n L�c H�ng M�t T�ch",0,107,177}},
	[19] = {{"U Minh Phong Ma L�c",0,107,178},{"Linh C� Huy�n T� L�c",0,107,179}},
	[20] = {{"U Minh Phong Ma L�c",0,107,178}},
	[21] = {{"Linh C� Huy�n T� L�c",0,107,179}}
};

-- ��ʼ�Ի����
function main()
	local nLastGetTaskDate = GetTask(TASK_ID_LAST_GET_DATE)		-- �ϴν�������ʲôʱ��
	local nCurrTime = {date("%y"), date("%m"), date("%d")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	
	local nCurNpcIndex = GetTargetNpc()
	local nCurLevel = GetUnitCurStates(nCurNpcIndex, 0)
	if (nCurLevel == 99) then
		return
	end
	AddUnitStates(nCurNpcIndex, 0, 100)		-- �˶η�ˢ
	
	
	if (nLastGetTaskDate < nCurDay) then	-- ���컹û����ȡ����
		Say("B�n v�n ch�a b�o danh tham gia cao th� th� th� luy�n, t�i qu� n�y kh�ng th� nh�n.", 0)
		AddUnitStates(nCurNpcIndex, 0, -100)		-- �˶η�ˢ
		return
	end
	
	-- û�������ɾͲ��ܿ�����
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B�n v�n ch�a b�i s� h�c v�, t�i qu� n�y kh�ng th� nh�n!", 0)
		AddUnitStates(nCurNpcIndex, 0, -100)		-- �˶η�ˢ
		return
	end
	
	-- �����Ѿ���ȡ��һ��
	local nCanGotBox = GetTask(TASK_ID_HAVE_GOT_TODAY)
	if (nCanGotBox == 0) then
		Say("Xin l�i, h�m nay b�n �� nh�n qu� r�i kh�ng th� nh�n th�m.", 0)
		AddUnitStates(nCurNpcIndex, 0, -100)		-- �˶η�ˢ
		return
	end
	
	local nRand = random(1,1000);
	if nRand <= 20 then
		local nRandIdx = random(1,getn(tGaojiMiji[10]));
		AddItem(tGaojiMiji[10][nRandIdx][2],tGaojiMiji[10][nRandIdx][3],tGaojiMiji[10][nRandIdx][4],1);
		Msg2Player("Thi�u hi�p m� b�o r��ng nh�n ���c "..tGaojiMiji[10][nRandIdx][1]);
	else
		local nSel = random(1, 1000)	-- ����������ĸ���
		
		if (nSel <= 478) then			-- 47.8%�ĸ��ʣ��õ�100w����
			ModifyExp(1000000)
			Msg2Player("B�n �� m� ���c b�o r��ng, nh�n ���c 1000000 �i�m kinh nghi�m.")
		elseif (nSel <= 956) then		-- 47.8%�ĸ��ʣ��õ�δ�����76������
			get_76_weapon()
			ModifyExp(500000)
		Msg2Player("B�n m� ���c b�o r��ng, nh�n ���c m�t v� kh� c�p 76 v� 500000 �i�m kinh nghi�m!")
		elseif (nSel <= 966) then		-- 1%   �ĸ��ʣ��õ�ʦ�ž���
			get_faction_misbook(0)
		elseif (nSel <= 971) then		-- 0.5% �ĸ��ʣ��õ�ʦ�ž���
			get_faction_misbook(1)
		elseif (nSel <= 973) then		-- 0.2% �ĸ��ʣ��õ�ʦ�ž���
			get_faction_misbook(2)
		elseif (nSel <= 989) then		-- 1.6% �ĸ��ʣ��õ�ʦ����װ������
			get_suit_2_shoe()
			ModifyExp(500000)
			Msg2Player("B�n �� m� ���c b�o r��ng, nh�n ���c trang ph�c c�a s� m�n v� 500000 �i�m kinh nghi�m!")
		elseif (nSel <= 992) then		-- 0.3% �ĸ��ʣ��õ�ʦ����װ��ͷ
			get_suit_3_head()
			Msg2Player("B�n m� ���c b�o r��ng, nh�n ���c trang ph�c c�a s� m�n.")
		elseif (nSel <= 997) then		-- 0.5% �ĸ��ʣ��õ�ʦ����װ������
			get_suit_3_deco()
			Msg2Player("B�n m� ���c b�o r��ng, nh�n ���c v�t ph�m trang s�c c�a s� m�n.")
		elseif (nSel <= 1000) then		-- 0.3% �ĸ��ʣ��õ���ʦ����
			AddItem(2, 0, 397, 1)
			Msg2Player("B�n m� ���c b�o r��ng, nh�n ���c 1 quy�n m�t t�ch.")
		end
	end
	Msg2SubWorld("Ng��i ch�i"..GetName().."��nh b�i Ho�ng Ch�nh Nh�t, nh�n ���c T�i t�y th�n");
	-- ���Լ�ɾ��
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)
	SetTask(TASK_ID_HAVE_GOT_TODAY, 0)
	WriteLogEx("Boss su mon","nh�t t�i C�i Bang")
end;

-- �õ�ʦ����װ��ͷ
function get_suit_3_head()
	local nBodyType = GetBody()
	local nItemDetail = 0
	-- ��׼�� - 1
	-- ������ - 2
	-- �Ը�Ů - 3
	-- ��СŮ - 4

	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- �����׼�
		if (nBodyType <= 2) then
			nItemDetail = 220 + nBodyType
		else
			nItemDetail = 220 + random(1, 2)
		end
	elseif (nSel <= 8) then		-- ������ɮ
		if (nBodyType <= 2) then
			nItemDetail = 320 + nBodyType
		else
			nItemDetail = 320 + random(1, 2)
		end
	elseif (nSel <= 12) then		-- ������ɮ
		if (nBodyType <= 2) then
			nItemDetail = 420 + nBodyType
		else
			nItemDetail = 420 + random(1, 2)
		end
	elseif (nSel <= 16) then		-- ����				
		nItemDetail = 620 + nBodyType
	elseif (nSel <= 20) then		-- ���ҷ��
		if (nBodyType > 2) then
			nItemDetail = 820 + (nBodyType - 2)
		else
			nItemDetail = 820 + random(1, 2)
		end
	elseif (nSel <= 24) then		-- �����׼�
		if (nBodyType > 2) then
			nItemDetail = 920 + (nBodyType - 2)
		else
			nItemDetail = 920 + random(1, 2)
		end
	elseif (nSel <= 50) then		-- ؤ�ﾻ���Լ��ĸ��ʱȽϸ�
		nItemDetail = 1120 + nBodyType
	elseif (nSel <= 76) then		-- ؤ�������Լ��ĸ��ʱȽϸ�
		nItemDetail = 1220 + nBodyType
	elseif (nSel <= 80) then		-- �䵱����
		nItemDetail = 1420 + nBodyType
	elseif (nSel <= 84) then		-- �䵱�׼�
		nItemDetail = 1520 + nBodyType
	elseif (nSel <= 86) then		-- ����ǹ��
		nItemDetail = 1720 + nBodyType
	elseif (nSel <= 92) then		-- ���Ź���
		nItemDetail = 1820 + nBodyType
	elseif (nSel <= 96) then		-- �嶾��ʦ
		nItemDetail = 2020 + nBodyType
	elseif (nSel <= 100) then		-- �嶾а��
		nItemDetail = 2120 + nBodyType
	end
	
	AddItem(0, 103, nItemDetail, 1, 1, -1, -1, -1, -1, -1, -1)
	WriteLogEx("Boss su mon","m� m�n ph�i",1,"","G:0,D:103,P:"..nItemDetail)
end;

-- �õ�ʦ����װ������
function get_suit_3_deco()
	local nBodyType = GetBody()
	local nItemDetail = 0
	-- ��׼�� - 1
	-- ������ - 2
	-- �Ը�Ů - 3
	-- ��СŮ - 4

	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- �����׼�
		if (nBodyType <= 2) then
			nItemDetail = 220 + nBodyType
		else
			nItemDetail = 220 + random(1, 2)
		end
	elseif (nSel <= 8) then		-- ������ɮ
		if (nBodyType <= 2) then
			nItemDetail = 320 + nBodyType
		else
			nItemDetail = 320 + random(1, 2)
		end
	elseif (nSel <= 12) then		-- ������ɮ
		if (nBodyType <= 2) then
			nItemDetail = 420 + nBodyType
		else
			nItemDetail = 420 + random(1, 2)
		end
	elseif (nSel <= 16) then		-- ����				
		nItemDetail = 620 + nBodyType
	elseif (nSel <= 20) then		-- ���ҷ��
		if (nBodyType > 2) then
			nItemDetail = 820 + (nBodyType - 2)
		else
			nItemDetail = 820 + random(1, 2)
		end
	elseif (nSel <= 24) then		-- �����׼�
		if (nBodyType > 2) then
			nItemDetail = 920 + (nBodyType - 2)
		else
			nItemDetail = 920 + random(1, 2)
		end
	elseif (nSel <= 50) then		-- ؤ�ﾻ���Լ��ĸ��ʱȽϸ�
		nItemDetail = 1120 + nBodyType
	elseif (nSel <= 76) then		-- ؤ�������Լ��ĸ��ʱȽϸ�
		nItemDetail = 1220 + nBodyType
	elseif (nSel <= 80) then		-- �䵱����
		nItemDetail = 1420 + nBodyType
	elseif (nSel <= 84) then		-- �䵱�׼�
		nItemDetail = 1520 + nBodyType
	elseif (nSel <= 88) then		-- ����ǹ��
		nItemDetail = 1720 + nBodyType
	elseif (nSel <= 92) then		-- ���Ź���
		nItemDetail = 1820 + nBodyType
	elseif (nSel <= 96) then		-- �嶾��ʦ
		nItemDetail = 2020 + nBodyType
	elseif (nSel <= 100) then		-- �嶾а��
		nItemDetail = 2120 + nBodyType
	end
	
	AddItem(0, 102, nItemDetail, 1, 1, -1, -1, -1, -1, -1, -1)
	WriteLogEx("Boss su mon","trang s�c m�n ph�i",1,"","G:0,D:102,P:"..nItemDetail)
end;

-- �õ�ʦ����װ������
function get_suit_2_shoe()
	local nBodyType = GetBody()
	local nItemDetail = 0
	-- ��׼�� - 1
	-- ������ - 2
	-- �Ը�Ů - 3
	-- ��СŮ - 4

	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- �����׼�
		if (nBodyType <= 2) then
			nItemDetail = 210 + nBodyType
		else
			nItemDetail = 210 + random(1, 2)
		end
	elseif (nSel <= 8) then		-- ������ɮ
		if (nBodyType <= 2) then
			nItemDetail = 310 + nBodyType
		else
			nItemDetail = 310 + random(1, 2)
		end
	elseif (nSel <= 12) then		-- ������ɮ
		if (nBodyType <= 2) then
			nItemDetail = 410 + nBodyType
		else
			nItemDetail = 410 + random(1, 2)
		end
	elseif (nSel <= 16) then		-- ����				
		nItemDetail = 610 + nBodyType
	elseif (nSel <= 20) then		-- ���ҷ��
		if (nBodyType > 2) then
			nItemDetail = 810 + (nBodyType - 2)
		else
			nItemDetail = 810 + random(1, 2)
		end
	elseif (nSel <= 24) then		-- �����׼�
		if (nBodyType > 2) then
			nItemDetail = 910 + (nBodyType - 2)
		else
			nItemDetail = 910 + random(1, 2)
		end
	elseif (nSel <= 50) then		-- ؤ�ﾻ���Լ��ĸ��ʱȽϸ�
		nItemDetail = 1110 + nBodyType
	elseif (nSel <= 76) then		-- ؤ�������Լ��ĸ��ʱȽϸ�
		nItemDetail = 1210 + nBodyType
	elseif (nSel <= 80) then		-- �䵱����
		nItemDetail = 1410 + nBodyType
	elseif (nSel <= 84) then		-- �䵱�׼�
		nItemDetail = 1510 + nBodyType
	elseif (nSel <= 88) then		-- ����ǹ��
		nItemDetail = 1710 + nBodyType
	elseif (nSel <= 92) then		-- ���Ź���
		nItemDetail = 1810 + nBodyType
	elseif (nSel <= 96) then		-- �嶾��ʦ
		nItemDetail = 2010 + nBodyType
	elseif (nSel <= 100) then		-- �嶾а��
		nItemDetail = 2110 + nBodyType
	end
	
	AddItem(0, 101, nItemDetail, 1, 1, -1, -1, -1, -1, -1, -1)
	WriteLogEx("Boss su mon","h� y m�n ph�i",1,"","G:0,D:101,P:"..nItemDetail)
end;

-- ���ݿ����ӵ��˵����ɣ����76��δ���������
function get_76_weapon()
	local nPlayerRoute = GetPlayerRoute()

	if (nPlayerRoute == 2) then				-- �����׼�
		if (random(1, 2) == 1) then
			AddItem(2, 1, 377, 1)
		else
			AddItem(2, 1, 379, 1)
		end
	elseif (nPlayerRoute == 3) then			-- ��������
		AddItem(2, 1, 382, 1)
	elseif (nPlayerRoute == 4) then			-- ��������
		AddItem(2, 1, 375, 1)
	elseif (nPlayerRoute == 6) then			-- ����
		AddItem(2, 1, 378, 1)
	elseif (nPlayerRoute == 8) then			-- ���ҷ��
		AddItem(2, 1, 376, 1)
	elseif (nPlayerRoute == 9) then			-- �����׼�
		AddItem(2, 1, 380, 1)
	elseif (nPlayerRoute == 11) then		-- ؤ�ﾻ��
		AddItem(2, 1, 375, 1)
	elseif (nPlayerRoute == 12) then		-- ؤ������
		AddItem(2, 1, 377, 1)
	elseif (nPlayerRoute == 14) then		-- �䵱����
		AddItem(2, 1, 376, 1)
	elseif (nPlayerRoute == 15) then		-- �䵱�׼�
		AddItem(2, 1, 381, 1)
	elseif (nPlayerRoute == 17) then		-- ����ǹ��
		AddItem(2, 1, 383, 1)
	elseif (nPlayerRoute == 18) then		-- ���Ź���
		AddItem(2, 1, 384, 1)
	elseif (nPlayerRoute == 20) then		-- �嶾а��
		AddItem(2, 1, 386, 1)
	elseif (nPlayerRoute == 21) then		-- �嶾��ʦ
		AddItem(2, 1, 385, 1)
	end
	WriteLogEx("Boss su mon","v� kh� ch�a gi�m ��nh",1)
end;

-- ���ʦ���ؼ���һ����nType = 0/1/2 ��ʾ �Ͼ�/�о�/�¾�
function get_faction_misbook(nType)
	local strTab = {"[th��ng]", "[trung]", "[h�]"}
	
	local nBookType = tonumber(nType)
	local nBase = 0
	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- �����׼�
		nBase = 916
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch Thi�u L�m T�c gia."..strTab[nBookType + 1])
	elseif (nSel <= 8) then		-- ������ɮ
		nBase = 919
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch Thi�u L�m V� t�ng"..strTab[nBookType + 1])
	elseif (nSel <= 12) then		-- ������ɮ
		nBase = 922
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch Thi�u L�m Thi�n t�ng"..strTab[nBookType + 1])
	elseif (nSel <= 16) then		-- ����				
		nBase = 925
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch ���ng M�n"..strTab[nBookType + 1])
	elseif (nSel <= 20) then		-- ���ҷ��
		nBase = 928
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch Nga My Ph�t gia"..strTab[nBookType + 1])
	elseif (nSel <= 24) then		-- �����׼�
		nBase = 931
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch Nga My T�c gia"..strTab[nBookType + 1])
	elseif (nSel <= 50) then		-- ؤ�ﾻ���Լ��ĸ��ʱȽϸ�
		nBase = 934
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch C�i Bang T�nh y"..strTab[nBookType + 1])
	elseif (nSel <= 76) then		-- ؤ�������Լ��ĸ��ʱȽϸ�
		nBase = 937
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch C�i Bang � y"..strTab[nBookType + 1])
	elseif (nSel <= 80) then		-- �䵱����
		nBase = 940
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch V� �ang ��o gia"..strTab[nBookType + 1])
	elseif (nSel <= 84) then		-- �䵱�׼�
		nBase = 943
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch V� �ang T�c gia"..strTab[nBookType + 1])
	elseif (nSel <= 88) then		-- ����ǹ��
		nBase = 946
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch D��ng M�n Th��ng k�"..strTab[nBookType + 1])
	elseif (nSel <= 92) then		-- ���Ź���
		nBase = 949
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch D��ng M�n Cung k�"..strTab[nBookType + 1])
	elseif (nSel <= 96) then		-- �嶾��ʦ
		nBase = 952
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch Ng� ��c C� s�"..strTab[nBookType + 1])
	elseif (nSel <= 100) then		-- �嶾а��
		nBase = 955
		Msg2Player("B�n m� b�o r��ng, nh�n ���c m�t ph�n c�a quy�n m�t t�ch Ng� ��c T� hi�p"..strTab[nBookType + 1])
	end
	
	AddItem(2, 1, nBase + nBookType, 1)
	WriteLogEx("Boss su mon","m�t t�ch tr�n ph�i",1,"","G:2,D:1,P:"..(nBase + nBookType))
end;

