-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �ƹ�Աϵͳ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

--Include("\\script\\task\\teach\\teach_main.lua");
IncludeLib("SPREADER");

	-- �����ƹ�ϵͳ���õ���չ��(16λ)
	GSP_ACCOUNT_EXTPOINT 		= 7;
	GSP_ACCOUNT_TYPE_NORMAL 	= 0; -- ��ͨ�ʺ�
	GSP_ACCOUNT_TYPE_UNKNOWN	= 1; -- ԭ��Ϸ�ƹ�վ�ʺţ���
	GSP_ACCOUNT_TYPE_NEWPLAYER 	= 2; -- �����ƹ��ʺ�[���ֿ�����(KS��ͷ)]
    GSP_ACCOUNT_TYPE_CDKEY 		= 3; -- ͨ��cd-key������ʺ�
-------------------------------------------------------

-------------------------------------------------------
	-- �����������¼��Ϸ�ƹ�Աϵͳ��ɫ��Ϣ	
	GSP_TASKID_ROLEREINFO = 1398;
	GSP_TASKID_TAG_BYTE_ROLETYPE 	= 1;	-- GetBit(1) = 0 - ��ͨ��ɫ, 1 - CDKEY�����ɫ
	GSP_TASKID_TAG_BIT_01BONUS 		= 8+1;	-- GetBit(8+1) = 1 -  ����ȡ 1������
	GSP_TASKID_TAG_BIT_15BONUS 		= 8+2; 	-- GetBit(8+2) = 1 -  ����ȡ15������
	GSP_TASKID_TAG_BIT_30BONUS 		= 8+3;	-- GetBit(8+3) = 1 -  ����ȡ30������
	GSP_TASKID_TAG_BIT_40BONUS 		= 8+4;	-- GetBit(8+4) = 1 -  ����ȡ40������
	GSP_TASKID_TAG_BIT_01BONUS2		= 8+5;	-- GetBit(8+5) = 1 -  ����ȡ û��50�����ӵ�1������
-----------------------
	-- ��ɫ����(��������ĵڸ��ֽ�)
		GSP_TASKID_ROLETYPE_NORMAL 	= 0; -- ��ͨ��ɫ
		GSP_TASKID_ROLETYPE_CDKEY 	= 1; -- CDKEY�����ɫ
-------------------------------------------------------

-------------------------------------------------------
-- ����ֵ��PaySys����һ��
GSP_CDKEY_ACTION_SUCCESS 		= 1 -- �ɹ�
GSP_CDKEY_ACTION_FAILED	 		= 2 -- ʧ��
GSP_CDKEY_E_CDKEYERROR			= 3 -- CDKEY����ȷ
GSP_CDKEY_E_INPUTED_CDKEY		= 74 -- �ʺ��Ѿ���������
GSP_CDKEY_E_NEWTIMEOUT 			= 75 -- �ʺ��ѳ�ʱ��10Сʱ��
GSP_CDKEY_E_NEWACTIVED 			= 76 -- �ʺŲ����ڿ��Լ���Ķ���
GSP_CDKEY_E_CDKEY_USED_OR_NOT_OPEN	= 77 -- �����CDKEY��û�б�ʹ�û����Ѿ�������ʹ����
-------------------------------------------------------

-- ��ں���
function spreader_main()
	Say("Hoan ngh�nh b�n ��n th�m <color=green>S� gi�<color>! Hi�n �ang c� nhi�u ho�t ��ng d�nh cho T�n th�. C� th� gi�p g� cho b�n ch�ng?", 
		1, 
		--"Nh�n ph�n th��ng t�n th�/XSTG_award",
		--"Nh�p [CD-KEY]k�ch ho�t t�i kho�n c�a b�n/gsp_input_cdkey", 
		--"Nh�n ph�n th��ng giai �o�n sau khi k�ch ho�t [CD-KEY]c�a b�n/gsp_phase_prize",
		"Li�n quan S� gi�.../gsp_about")
end;

-- ����[CD-KEY]���������ʺ�
function gsp_input_cdkey()
	local nValue = GetBeSpreadFlag()
	if (nValue == 1) then
		local szError = "T�i kho�n n�y �� k�ch ho�t, kh�ng c�n nh�p [CD-KEY]n�a."
		Say("<color=green>S� gi�<color>:"..szError, 0)
		return
	end
	-- ֪ͨ�ͻ��˴������
	AskClientForString("gsp_on_cdkey_input", "", 1, 20, "Vui l�ng nh�p CD-KEY:")
end

-- ��ȡ����[CD-KEY]�����׶ν���
function gsp_phase_prize()
    local nValue = GetBeSpreadFlag()
    local nStage = GetTask(GSP_TASKID_ROLEREINFO)
    if (nValue ~= 1) then
		Say("B�n ch�a d�ng [CD-KEY]k�ch ho�t t�i kho�n n�y, kh�ng th� l�nh ���c ph�n th��ng. Vui l�ng xem chi ti�t tr�n trang ch�.", 0)
		return
    end
	
	-- �µ������ƹ��ʺŽ���
	get_xstg_award()
end;

-- CDKEY���������ش���
function gsp_cdkey_verify_result(nResult)
	print("Result:"..nResult)
	local szMsg = 
	{	"Ch�a ph�t hi�n l�i, vui l�ng li�n h� v�i d�ch v� kh�ch h�ng c�a ch�ng t�i!",
		"[CD-KEY]v� hi�u, vui l�ng nh�p ch�nh x�c [CD-KEY]!",
		"Nh�p [CD-KEY]ch�nh x�c, k�ch ho�t t�i kho�n th�nh c�ng! Hoan ngh�ng b�n ��n th�m S� gi�!",
		"Th�t b�i: T�i kho�n �� v��t qu� 10 gi� s� d�ng, kh�ng th� ��ng nh�p!",
		"Th�t b�i: T�i kho�n �� k�ch ho�t, kh�ng th� ��ng nh�p l�n n�a!",
		"Th�t b�i: [CD-KEY]n�y t�m th�i kh�ng d�ng ���c ho�c �� b� s� d�ng!",
		"Th�t b�i: T�i kho�n n�y kh�ng th� k�ch ho�t ���c!"}
		
	local nSel = 1
	if (nResult == GSP_CDKEY_E_CDKEYERROR) then
		nSel = 2
	elseif (nResult == GSP_CDKEY_ACTION_SUCCESS) then
	 	nSel = 3
	elseif (nResult == GSP_CDKEY_E_NEWTIMEOUT) then
		nSel = 4
	elseif (nResult == GSP_CDKEY_E_INPUTED_CDKEY) then
		nSel = 5
	elseif (nResult == GSP_CDKEY_E_CDKEY_USED_OR_NOT_OPEN) then
		nSel = 6
	elseif (nResult == GSP_CDKEY_E_NEWACTIVED) then
		nSel = 7
	end

	print("GSP_CDKEY_ACTION_SUCCESS:"..GSP_CDKEY_ACTION_SUCCESS)
	print("GSP_CDKEY_E_NEWTIMEOUT"..GSP_CDKEY_E_NEWTIMEOUT)
	print("nSel:"..nSel)
	Msg2Player(szMsg[nSel])
	Say("[<color=green>S� gi�<color>]:"..szMsg[nSel], 0)

	if (nResult == GSP_CDKEY_ACTION_SUCCESS) then
        SetBeSpreadFlag()
	end
	return 1
end;

function gsp_on_cdkey_input(szCDKey)
	SendSpreaderCDKey(szCDKey)
end;

function gsp_about()
	Say("Hi�n �ang c� nhi�u ho�t ��ng gi�p T�n th� nhanh ch�ng t�ng c�p. Xin xem chi ti�t tr�n trang ch�.", 0)
end;

function gsp_cancel()
end

-- �µ�XSTG�ʺŽ���ϵͳ
function XSTG_award()
	local strAccount = GetAccount()
	local str1 = strsub(strAccount, 1, 1)
	local str2 = strsub(strAccount, 2, 2)
	local str3 = strsub(strAccount, 3, 3)
	local str4 = strsub(strAccount, 4, 4)
	-- �ж��ǲ��������ƹ��ʺ�
	if ((str1 == 'K' or str1 == 'k') and
		(str2 == 'S' or str2 == 's') and
		(str3 == 'T' or str3 == 't') and
		(str4 == 'G' or str4 == 'g')) then
		Say("Khi T�n th� ��t ��n c�p 10, c�p 20, c�p 30, c�p 50, c�p 55, c�p 58, c�p 60 ��u c� th� nh�n ���c ph�n th��ng t��ng �ng, n�i dung c� th� xin xem trang ch�. Xin x�c nh�n l�i kho�ng tr�ng c�a h�nh trang v� c�n l�nh ph�n th��ng g�?",
			2,
			"Ta mu�n l�nh ph�n th��ng /get_xstg_award",
			"T�m th�i kh�ng mu�n l�nh/gsp_cancel")
	else
		Say("Xin l�i! T�i kho�n n�y kh�ng thu�c t�n th�!", 0)
	end
end;

-- �����ȡXSTG�׶ν���
function get_xstg_award()
	local nHaveGetLevel = GetTask(95)		-- �ϴ���ȡ�����ĵȼ�
	local nCurLevel = GetLevel()			-- ��ǰ��ҵȼ�
	
	-- 10���Ľ���
	if (nCurLevel >= 10 and nHaveGetLevel < 10) then
		local nRandom = random(1, 2)
		if (nRandom == 1) then
			AddItem(1, 0, 2, 150)		-- ��ɢ
			Msg2Player("B�n nh�n ���c 150 b�nh Kim S�ng t�n!")
		else
			AddItem(1, 0, 7, 150)		-- С����
			Msg2Player("B�n nh�n ���c 150 b�nh Ti�u Ho�n ��n!")
		end
		SetTask(95, 10)
		return
	end
	
	-- 20���Ľ���
	if (nCurLevel >= 20 and nHaveGetLevel < 20) then
		AddItem(1, 0, 2, 150)		-- ��ɢ
		AddItem(1, 0, 7, 150)		-- С����
		Msg2Player("B�n nh�n ���c 150 b�nh Kim S�ng t�n v� 150 b�nh Ti�u Ho�n ��n!")
		SetTask(95, 20)
		return
	end
	
	-- 30���Ľ���
	if (nCurLevel >= 30 and nHaveGetLevel < 30) then
		get_xstg_suit(0, 30)
		return
	end
	
	-- 50���Ľ���
	if (nCurLevel >= 50 and nHaveGetLevel < 50) then
		get_xstg_book()
		return
	end
	
	-- 55���Ľ���
	if (nCurLevel >= 55 and nHaveGetLevel < 55) then
		get_xstg_suit(10, 55)
		ModifyReputation(500, 0)
		Msg2Player("B�n nh�n ���c 500 �i�m danh v�ng!")
		return
	end
	
	-- 58���Ľ���
	if (nCurLevel >= 58 and nHaveGetLevel < 58) then
		get_xstg_suit(10, 58)
		return
	end
	
	-- 60���Ľ���
	if (nCurLevel >= 60 and nHaveGetLevel < 60) then
		get_xstg_suit(10, 60)
		return
	end
	
	Say("L�m ng��i, tr��c khi nh�m m�t xu�i tay, c� th� c�ng hi�n cho Qu�c gia c�ng l� vi�c n�n l�m!", 0)
end;

-- ����ؼ�һ�������ٸ��ʻ��ʦ���ؼ�
function get_xstg_book()
	local nCurRoute = GetPlayerRoute()
	local nRandomIndex = random(100)
	
	if (nCurRoute == 0 or nCurRoute == 1 or nCurRoute == 5 or 
		nCurRoute == 7 or nCurRoute == 10 or nCurRoute == 13 or 
		nCurRoute == 16 or nCurRoute == 19) then
		Say("Mau gia nh�p m�n ph�i v� b�i s� h�c ngh� �� nh�n m�t t�ch!", 0)
		return
	end
	
	if (nRandomIndex <= 10) then
		AddItem(0, 107, 57, 1)
	elseif (nRandomIndex <= 20) then
		AddItem(0, 107, 58, 1)
	elseif (nRandomIndex <= 30) then
		AddItem(0, 107, 59, 1)
	elseif (nRandomIndex <= 40) then
		AddItem(0, 107, 60, 1)
	elseif (nRandomIndex <= 50) then
		AddItem(0, 107, 61, 1)
	elseif (nRandomIndex <= 60) then
		AddItem(0, 107, 62, 1)
	elseif (nRandomIndex <= 70) then
		AddItem(0, 107, 63, 1)
	elseif (nRandomIndex <= 78) then
		AddItem(0, 107, 64, 1)
	elseif (nRandomIndex <= 86) then
		AddItem(0, 107, 65, 1)		
	elseif (nRandomIndex <= 92) then
		AddItem(0, 107, 66, 1)
	else
		local nPlus = random(0, 1)
		if (nCurRoute == 2) then
			AddItem(0, 107, 1 + nPlus, 1)
		elseif (nCurRoute == 3) then
			AddItem(0, 107, 5 + nPlus, 1)
		elseif (nCurRoute == 4) then
			AddItem(0, 107, 3 + nPlus, 1)
		elseif (nCurRoute == 6) then
			AddItem(0, 107, 7 + nPlus, 1)
		elseif (nCurRoute == 8) then
			AddItem(0, 107, 9 + nPlus, 1)
		elseif (nCurRoute == 9) then
			AddItem(0, 107, 11 + nPlus, 1)
		elseif (nCurRoute == 11) then
			AddItem(0, 107, 13 + nPlus, 1)
		elseif (nCurRoute == 12) then
			AddItem(0, 107, 15 + nPlus, 1)
		elseif (nCurRoute == 14) then
			AddItem(0, 107, 17 + nPlus, 1)
		elseif (nCurRoute == 15) then
			AddItem(0, 107, 19 + nPlus, 1)
		elseif (nCurRoute == 17) then
			AddItem(0, 107, 21 + nPlus, 1)
		elseif (nCurRoute == 18) then
			AddItem(0, 107, 23 + nPlus, 1)
		elseif (nCurRoute == 20) then
			AddItem(0, 107, 25 + nPlus, 1)
		elseif (nCurRoute == 21) then
			AddItem(0, 107, 27 + nPlus, 1)
		end
	end

	Msg2Player("B�n nh�n ���c 1 quy�n m�t t�ch!")
	SetTask(95, 50)
end;

-- ���һ��ʦ�ų�����װ
function get_xstg_suit(nPlus, nLevel)
	local nCurRoute = GetPlayerRoute()
	local nCurBody = GetBody()
	local nParticular = nCurRoute * 100 + nPlus + nCurBody
	-- ������������
	if (nCurRoute == 8 or nCurRoute == 9) then
		nParticular = nParticular - 2
	end
	
	local nDetail = {0, 	-- ����1
					 3, 	-- �����׼�2
					 8, 	-- ��������3
					 0,		-- ��������4
					 0,		-- ����5
					 1,		-- ����6
					 0,		-- ����7
					 2,		-- ���ҷ��8
					 10,	-- �����׼�9
					 0,		-- ؤ��10
					 0,		-- ؤ�ﾻ��11
					 5,		-- ؤ������12
					 0,		-- �䵱13
					 2,		-- �䵱����14
					 9,		-- �䵱�׼�15
					 0,		-- ����16
					 6,		-- ����ǹ��17
					 4,		-- ���Ź���18
					 0,		-- �嶾19
					 7,		-- �嶾а��20
					 11}	-- �嶾��ʦ21

	-- û�������ɻ������ɵ���ң���������
	if (nCurRoute == 0 or nCurRoute == 1 or nCurRoute == 5 or
		nCurRoute == 7 or nCurRoute == 10 or nCurRoute == 13 or
		nCurRoute == 16 or nCurRoute == 19) then
		Say("Mau gia nh�p m�n ph�i v� b�i s� h�c ngh� �� nh�n b� trang b� s� m�n!", 0)
		return
	end

	if (nLevel == 30) then
		AddItem(0, 103, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- ñ��
		AddItem(0, 100, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- �·�
		AddItem(0, 101, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- ����
		AddItem(0, nDetail[nCurRoute], nParticular, 1, 1, -1, -1, -1, -1, -1, -1)	-- ����
	elseif (nLevel == 55) then
		AddItem(0, nDetail[nCurRoute], nParticular, 1, 1, -1, -1, -1, -1, -1, -1)	-- ����
	elseif (nLevel == 58) then
		AddItem(0, 100, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- �·�
	elseif (nLevel == 60) then
		AddItem(0, 102, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- ����
	end
	
	
	if (nPlus == 0) then
		Msg2Player("B�n nh�n ���c 1 b� trang b� s� m�n s� c�p!")
	else
		Msg2Player("B�n nh�n ���c 1 b� trang b� s� m�n trung c�p!")
	end
	SetTask(95, nLevel)
end;