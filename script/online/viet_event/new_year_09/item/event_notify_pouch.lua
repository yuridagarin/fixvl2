--File name:	event_notify_pouch.lua
--Describe:		���Ҵ��¼��ű�
--Item ID:		2,1,30045
--Create Date:	2008-12-26
--Author:		chenbenqian

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")


g_szLogTitle = "N�m m�i m�ng xu�n : ".."C�m Nang ��i S� Ki�n"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���

g_szFileName = "\\script\\online\\viet_event\\new_year_09\\item\\event_notify_pouch.lua"

g_tbMap = 
{
	[100] = QZ_LUCK_BOX_NUM_XMAS_VIET,
	[200] = BJ_LUCK_BOX_NUM_XMAS_VIET,
	[300] = CD_LUCK_BOX_NUM_XMAS_VIET,
}

function OnUse()
	if is_new_year_09_viet_open() == 0 then
		Talk(1,"", "Ho�t ��ng t�t �� k�t th�c.");
		return
	end

	local selTab = {
			"Mai - ��o ch�c t�t./#new_year_09_info_viet(1)",
			"Ng�u V��ng H� Th�./#new_year_09_info_viet(2)",
			"Ti�n T� Tr� L�i./#new_year_09_info_viet(3)",
			"H�t gi�ng h�nh ph�c./#new_year_09_info_viet(4)",
			"Mua nh�nh hoa ��o (1 v�ng 50 b�c)/buy_peach",
			"Nh�n [T�i L�c M�ng Xu�n]/want_new_bag",
			"K�t th�c ��i tho�i/no"
			}
	
	Say("N�m h�t t�t ��n b�n trang xin ch�c t�t c� v� l�m nh�n s� n�m m�i vui v�, an khang th�nh v��ng. \nTh�i gian ho�t ��ng t�t di�n ra t� 16-01-2009 ��n 24:00 15-02-2009. Chi ti�t ho�t ��ng:\n",getn(selTab),selTab)
end

function buy_peach()
	if GetCash() < 15000 then
		Talk(1,"","��i hi�p kh�ng �� ng�n l��ng tr�n ng��i r�i!")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end
	if pay_ex(15000) == 1 then
		add_item_ex( {"Nh�nh ��o",	2,	1,	30050,	1},"mua" )
	else
		Talk(1,"","��i hi�p kh�ng �� ng�n l��ng tr�n ng��i r�i!")
		return
	end
	OnUse()
end

function new_year_09_info_viet(nType)
	local selTab =
	{
		{
		"- Trong th�i gian ho�t ��ng, ng��i ch�i c� th� th�ng qua ��nh qu�i, nhi�m v� s� m�n, t�ng ki�m s�n trang, s�t th� ���ng, th�i h�, t� quang c�c �� thu ���c T�i L�c M�ng Xu�n. \n- M� T�i L�c M�ng Xu�n s� thu ���c nguy�n li�u tr�ng hoa Mai v� ��o \n- ng��i ch�i c� th� mua nh�nh hoa ��o � NPC Ti�u S�u ho�c c�m nang ��i s� ki�n.\n- v� mua nh�nh hoa Mai t�i Ng� C�c. \n- S� d�ng hoa Mai s� thu ���c kinh nghi�m v� b� ch� Mai Lan C�c Tr�c �� h�p th�nh ph�n th��ng.",
		},
		
		{
		"- Ho�t ��ng Ng�u V��ng H� Th� di�n ra ng�y th� s�u, th� b�y v� ch� nh�t h�ng tu�n,  m�i ng�y Boss Ng�u V��ng xu�t hi�n 2 l�n (L�n th� nh�t: 13:00�15:00, l�n th� 2: 21:00�23:00). M�i l�n xu�t hi�n c�ng l�c 3 Boss t�i 3 b�n �� ch� ��nh. Ng��i ch�i h� Ng�u V��ng xong s� c� nh�ng ph�n th��ng h�p d�n v� 1 th� c��i K� L�n (N�ng cao 100% t�c �� di chuy�n).",
		},
			
		{
		"- Trong th�i gian ho�t ��ng Ti�n T� Tr� L�i, m�i ng�y ng��i ch�i c� c�p 10 tr� l�n v� �� gia nh�p m�n ph�i t�ng hoa Mai cho Phi Y�n Ti�n T� NPC s� ���c nh�ng ph�n qu� th� v�: \n-T� 0:05 ��n 19:00: Ng��i ch�i t�ng 4 hoa mai cho Phi Y�n Ti�n T� s� l�p t�c ���c ph�n th��ng kinh nghi�m.\n-T� 19:05 ��n 24:00: Nh�ng ng��i ch�i t�ng �� 4 hoa mai v� ��i tho�i v�i Phi Y�n s� ���c ph�n th��ng h�p d�n\n-Ngo�i ra m�i ng�y s� c� ph�n th��ng cho ng��i may m�n nh�t.",
		},
			
		{
		"- Th�i gian ho�t ��ng h�t gi�ng h�nh ph�c t� th� hai ��n th� n�m, tham gia ph�i ��t  c�p 10 v� �� gia nh�p m�n ph�i.  M�i ng�y h�t gi�ng h�nh ph�c xu�t hi�n 4 l�n (12:00 - 13:00, 13:30 - 14:30, 21:00 - 22:00, 22:30 - 23:30), m�i l�n c� 100 h�t gi�ng xu�t hi�n tr�n 24 b�n ��. M� H�ng B�o R��ng (mua t�i Ng� C�c) �� nh�n ���c 10 bao tay thu th�p. M�i l�n ��o h�t gi�ng s� m�t 1 bao tay thu th�p. S� d�ng h�t gi�ng h�nh ph�c s� thu ���c kinh nghi�m v� ph�n th��ng ng�u nhi�n.",
		},
	}

	Say(selTab[nType][1], 1, "Ta mu�n xem ho�t ��ng kh�c/OnUse" )
end

function want_new_bag()
	local selTab = {
				"X�c nh�n nh�n th��ng/give_new_bag",
				"K�t th�c ��i tho�i/no",
				}
	Say("Bang h�i th�nh c�ng v��t �i T� Quang C�c m�i c� th� nh�n T�i L�c M�ng Xu�n \n ��i hi�p c� ch�c mu�n nh�n?",getn(selTab),selTab)
end

function give_new_bag()
	if GetLevel() < 73 then
		Say("C�c h� v�n ch�a �� �i�u ki�n �� nh�n T�i L�c M�ng Xu�n l�n n�y.", 0)
		return
	end
	if IsTongMember() == 0 then
		Say("C�c h� v�n ch�a �� �i�u ki�n �� nh�n T�i L�c M�ng Xu�n l�n n�y.", 0)
		return
	end
	if GetTime() - GetJoinTongTime() <= JOIN_TONG_DAY_09_NEWYEAR_VIET*24*3600 then
		Say("C�c h� v�n ch�a �� �i�u ki�n �� nh�n T�i L�c M�ng Xu�n l�n n�y.", 0)
		return
	end
	if gf_Judge_Room_Weight(1,100) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end

	local nWeek = tonumber(date("%y%W"))
	if nWeek > GetTask(NEW_BAG_WEEK_09_NEWYEAR_VIET) then
		SetTask(NEW_BAG_WEEK_09_NEWYEAR_VIET, nWeek)
		SetTask(NEW_BAG_NUM_09_NEWYEAR_VIET, 0)
		SetTask(STAGE_NUM_09_NEWYEAR_VIET, 0)
	end

	if GetTask(NEW_BAG_NUM_09_NEWYEAR_VIET) >= 90 then
		Say("Trong v�ng  1 tu�n ch� c� th� nh�n ���c nhi�u nh�t l� 90 T�i L�c M�ng Xu�n, c�c h� �� nh�n �� n�n kh�ng th� nh�n ti�p ���c n�a.", 0)
		return
	end

	ApplyRelayShareData(GetTongName(),0,0,g_szFileName,"give_new_bag_cb")
end

function give_new_bag_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say("C�c h� c� th� nh�n T�i L�c M�ng Xu�n v�i s� l��ng l� 0", 0)
		return
	end

	local nStage = GetRelayShareDataByKey(szKey,nKey1,nKey2,"tong_mission_key_stage")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)

	if nStage == nil then
		nStage = 0
	end

	if nStage == 0 then
		Say("C�c h� c� th� nh�n T�i L�c M�ng Xu�n v�i s� l��ng l� 0", 0)
		return
	end

	local tNewBagNum = 
	{
		[0] = 0,
		[1] = 10,
		[2] = 20,
		[3] = 35,
		[4] = 50,
		[5] = 70,
		[6] = 90,
	}
	local nObtainStage = GetTask(STAGE_NUM_09_NEWYEAR_VIET)
	if nObtainStage == nil then
		nObtainStage = 0
	end
	local nNewBagNum = tNewBagNum[nStage] - tNewBagNum[nObtainStage]

	if nNewBagNum == nil or nNewBagNum <= 0 then
		Say("C�c h� c� th� nh�n T�i L�c M�ng Xu�n v�i s� l��ng l� 0", 0)
		return
	end

	local nRetCode = add_item_ex( {"T�i L�c M�ng Xu�n",	2,	1,	30046,	nNewBagNum},"T� Quang C�c stage "..nStage)
	if nRetCode == 1 or nRetCode == 2 then
		SetTask(STAGE_NUM_09_NEWYEAR_VIET, nStage)
		SetTask(NEW_BAG_NUM_09_NEWYEAR_VIET, GetTask(NEW_BAG_NUM_09_NEWYEAR_VIET)+nNewBagNum )
		Talk(1, "", format("Bang h�i hi�n t�i c�a ��i hi�p �� v��t �i %d T� Quang C�c\nTu�n n�y ��i hi�p c� th� nh�n t�ng c�ng %d T�i L�c M�ng Xu�n\n��i hi�p �� nh�n %d T�i L�c M�ng Xu�n\nL�n n�y ��i hi�p c� th� nh�n %d T�i L�c M�ng Xu�n", nStage, tNewBagNum[nStage], tNewBagNum[nObtainStage], nNewBagNum) )
	end
end

function add_item_ex(tItem,szLog)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0	
	
	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName)
		WriteLogEx(g_szLogTitle, szLog, nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, szLog, "", "", format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
	return nRetCode
end

function pay_ex(nNum)
	local nRetCode = 0
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLogEx(g_szLogTitle, format("Pay(%d)", nItemNum), nItemNum, "NULL", "NULL", GetTongName(), format("Pay(%d)", nItemNum).." Failed, return value = "..nRetCode)
		return 0
	end
end


function no()
end



