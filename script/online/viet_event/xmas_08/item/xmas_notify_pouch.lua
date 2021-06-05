--File name:	xmas_notify_pouch.lua
--Describe:		���Ҵ��¼��ű�
--Item ID:		2,1,30045
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")


g_szLogTitle = "Giang Sinh 2008"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���

g_tbMap = 
{
	[100] = QZ_LUCK_BOX_NUM_XMAS_VIET,
	[200] = BJ_LUCK_BOX_NUM_XMAS_VIET,
	[300] = CD_LUCK_BOX_NUM_XMAS_VIET,
}


function OnUse()
	if is_xmas_08_viet_open() == 0 then
		return
	end

	if GetTask(GAIN_STAR_08_XMAS_VIET) == 0 then
		if GetLevel() >= 50 then
			if gf_Judge_Room_Weight(1, 20) == 0 then
				Msg2Player("Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
				return
			end
			
			add_item_ex( {"Ng�i Sao Gi�ng Sinh",	2,	1,	30044,	1} )
			SetTask(GAIN_STAR_08_XMAS_VIET, 1)
		end
	end
	local selTab = {
			"Gi�ng Sinh �m �p C�ng B�ng Nhi./#xmas_08_info_viet(1)",
			"Qu� T�ng C�a C�y Th�ng./#xmas_08_info_viet(2)",
			"Truy T�m C�y Th�ng./#xmas_08_info_viet(3)",
			"Vui Gi�ng Sinh C�ng Nhau Nh�n Th��ng./#xmas_08_info_viet(4)",
			"S�c M�u Ph�o Hoa./#xmas_08_info_viet(5)",
			"Nh�n h�p qu� may m�n (Vui gi�ng sinh c�ng nhau nh�n th��ng)/obtain_lucky_box",
			"K�t th�c ��i tho�i/no"
			}
	
	Say("Gi�ng sinh l�i v� tr�n to�n c�i V� L�m. Nh� nh�, ng��i ng��i �ang r�n r�ng ch�o ��n 1 ��m gi�ng sinh an l�nh b�n ng��i th�n c�a m�nh. Ho�t ��ng gi�ng sinh b�t ��u t� 06-12-2008 ��n 04-01-2009, c�c v� c� th� t�m hi�u th�ng tin chi ti�t s� ki�n nh� sau:\n",getn(selTab),selTab);
end
function xmas_08_info_viet(nType)
	local selTab =
	{
		{
		"Ho�t ��ng Gi�ng Sinh �m �p C�ng B�ng Nhi di�n ra t� ng�y 06-12-2008 ��n 24:00 ng�y 04-01-2009. Trong th�i gian ho�t ��ng, c�c v� v� l�m nh�n s� c� th� th�ng qua ��nh qu�i v� tham gia c�c t�nh n�ng trong game �� thu th�p H�p Qu� Gi�ng Sinh. M� c�c H�p qu� gi�ng sinh �� thu th�p c�c nguy�n li�u c�n thi�t, ��i tho�i v�i NPC B�ng Nhi �� ��i l�y c�c H�p Qu�, m� c�c h�p qu� s� nh�n ���c ph�n th��ng. R�t nhi�u ph�n th��ng �ang ch� qu� v�!.",
		},
		
		{
		"Ho�t ��ng Qu� T�ng C�y Th�ng di�n ra t� 06-12-2008 ��n 24:00 04-01-2009. trong th�i gian s� ki�n, t�t c� c�c t�i kho�n ���c t�o m�i trong th�i gian n�y c� nh�n v�t ��t c�p 55, �i�m s� m�n l�n h�n 1200, danh v�ng l�n h�n 600, �i�m T�ng Ki�m l�n h�n 1000 v� �i�m c�ng tr�ng T�ng Li�u l�n h�n 500 th� c� th� ��n ��i tho�i v�i NPC C�y Th�ng GI�ng Sinh �� nh�n Long Huy�t Ho�n v� 1 H�p Qu�. S� d�ng Long Huy�t Ho�n �� ��t ngay c�p �� 73, s� d�ng H�p Qu� �� s� h�u 1 trong nh�ng trang b� T�ng Ki�m 8x.",
		},
			
		{
		"Ho�t ��ng Truy T�m C�y Th�ng di�n ra v�o c�c ng�y th� s�u, th� b�y v� ch� nh�t h�ng tu�n, t� ng�y 06-12-2008 ��n 24:00 ng�y 04-01-2009. M�i ng�y c� 4 ��t xu�t hi�n c�y th�ng tr�n c�c b�n �� (13:30, 14:00, 19:00, 22:30) c�c v� v� l�m nh�n s� h�y d�ng v�t ph�m C�y K�o Gi�ng Sinh (c� b�n t�i NPC B�ng Nhi) �� trang tr� c�c c�y th�ng ���c ph�n b� tr�n c�c b�n �� ch� ��nh. M�i ng�y ch� c� th� trang tr� 10 c�y th�ng. H�y nh� b�t ch�c n�ng chi�n ��u(F9) l�n nh�!",
		},
			
		{
		"Ho�t ��ng vui gi�ng sinh c�ng nhau nh�n th��ng di�n ra v�o c�c ng�y th� 7 ch� nh�t t� 06-12-2008 ��n 24:00 04-01-2009. M�i ng�y t� 13:300 ��n 14:30 (1 ti�ng), t�t c� v� l�m nh�n s� c� th� th�ng qua c�m nang ��i s� ki�n ho�c ��i tho�i v�i NPC C�y Th�ng Gi�ng Sinh (6 ��i th�nh th�) th� c� th� thu ���c H�p Qu� May M�n. Ngo�i ra m�i ng�y s� c� 1 nh�n v�t ���c l�a ch�n ng�u nhi�n �� trao t�ng ph�n qu� ��c bi�t, ��i h�p qu� ��c bi�t � NPC Gi�o S�.",
		},
			
		{
		"Ho�t ��ng Ph�o Hoa di�n ra v�o c�c ng�y th� 6, th� 7 v� ch� nh�t h�ng tu�n ng�y 06-12-2008 ��n 24:00 04-01-2008. Trong th�i gian t� 13:00 ��n 15:00, c�c v� v� l�m nh�n s� c� th� ��n NPC Th��ng Nh�n T�y V�c �� nh�n 10 Ph�o Hoa, s� d�ng ph�o hoa �� nh�n ph�n th��ng, ch� c� th� s� d�ng t�i �a 10 ph�o hoa trong 1 ng�y. Ngo�i ra, c�c v� v� l�m nh�n s� c�n c� c� h�i s� h�u nh�ng b� ngo�i trang ��p m�t khi tham gia ��t ph�o hoa.",
		},
	}

	Say(selTab[nType][1], 1, "Ta mu�n xem ho�t ��ng kh�c/OnUse" );
end

function obtain_lucky_box()
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 6 and nWeek ~= 0 then
		Say("C�c h� v�n ch�a �� �i�u ki�n l�nh th��ng",1,"K�t th�c ��i tho�i/no")
		return
	end

	local nTime = tonumber(date("%H%M"))
	if nTime < 930 or nTime >= 1033 then
		Say("C�c h� v�n ch�a �� �i�u ki�n l�nh th��ng",1,"K�t th�c ��i tho�i/no")
		return
	end
	
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(LUCK_BOX_DATE_08_XMAS_VIET) then
		SetTask(LUCK_BOX_DATE_08_XMAS_VIET, nDate)
		SetTask(LUCK_BOX_NUM_08_XMAS_VIET, 0)
		SetTask(LUCK_BOX_TURN_08_XMAS_VIET, 0)
	end
	
	if GetTask(LUCK_BOX_NUM_08_XMAS_VIET) >= 6 then
		Say("M�i ng�y m�i nh�n v�t ch� c� th� nh�n 6 h�p qu� may m�n.",1,"K�t th�c ��i tho�i/no")
		return
	end

	local tTime =
	{
		{930,938},
		{939,947},
		{948,956},
		{957,1005},
		{1006,1014},
		{1015,1023},
		{1024,1032},
	}
	local nTurn = 0
	local nTurnNum = getn(tTime)
	for i = 1, nTurnNum do
		if nTime >= tTime[i][1] and nTime <= tTime[i][2] then
			nTurn = i
			break
		end
	end
	if GetTask(LUCK_BOX_TURN_08_XMAS_VIET) == nTurn then
		Say("C�c h� v�n ch�a �� �i�u ki�n l�nh th��ng",1,"K�t th�c ��i tho�i/no")
		return
	else
		if gf_Judge_Room_Weight(1, 20) == 0 then
			Msg2Player("Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
			return
		end

		add_item_ex( {"H�p Qu� May M�n",	2,	1,	30038,	1} )
		SetTask(LUCK_BOX_TURN_08_XMAS_VIET, nTurn)
		SetTask(LUCK_BOX_NUM_08_XMAS_VIET, GetTask(LUCK_BOX_NUM_08_XMAS_VIET)+1 )

		local nMapID = GetWorldPos()
		if GetGlbValue(AWARD_MAP_IDX_XMAS_VIET) == nMapID then
			if GetGlbValue(AWARD_TURN_XMAS_VIET) == nTurn then
				SetGlbValue(g_tbMap[nMapID], GetGlbValue(g_tbMap[nMapID])+1)
				if GetGlbValue(g_tbMap[nMapID]) == 68 then
					add_item_ex( {"H�p Qu� ��c Bi�t",	2,	1,	30037,	1} )
				end
			end
		end
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName..", V�n c�n r�t nhi�u ph�n th��ng �ang ch� b�n, xin m�i h�y ti�p t�c tham gia ho�t ��ng.");
		WriteLogEx(g_szLogTitle, "C�m Nang ��i S� Ki�n", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "C�m Nang ��i S� Ki�n", "", "", "", "", "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end

function no()
end



