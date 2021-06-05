--=============================================
--create by zhangming 2010.6.18
--describe:Խ�ϰ�2010��7�»1 ��Ԫ��4�ɽű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--�ͷ�ļ�
Include("\\script\\online_activites\\2010_07\\activites_01\\item\\item_hunyuan.lua");--�ͷ�ļ�
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")  -- Chuy�n sinh VN

--g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[17][1], 2, 1);

function OnUse(nItemIdx)
	if GetTranslifeCount() < 2 then
		Talk(1,"","Ph�i luy�n th�nh H�n Nguy�n C�ng th�nh th� 4 m�i c� th� s� d�ng v�t ph�m n�y")
		return
	end

    local tSay = {}
    local szHeader = "Ch�c m�ng c�c h� �� ��t ��n ��nh cao c�a H�n Nguy�n C�ng th�nh th� 4, h�y ch�n ph�n th��ng h� tr� :"
   	tinsert(tSay, "N�ng c�p th� c��i K� L�n (c�n 1 Phi�u V� + 100 v�ng)/do_bonus")
   	tinsert(tSay, "Tho�t/do_nothing")
   	
   	Say(szHeader, getn(tSay), tSay)
end

function do_bonus()
	if GetLevel() < 98 then
		Talk(1,"","��ng c�p 98 tr� l�n m�i c� th� s� d�ng ch�c n�ng n�y!")
		return
	end
	if GetCash() < 1000000 then
		Talk(1,"","Ch�a �� ng�n l��ng �� ��i!")
		return
	end
	if gf_JudgeRoomWeight(2, 300) == 0 then
		Talk(1,"","H�nh trang kh�ng �� ch� tr�ng ho�c �� n�ng, vui l�ng s�p x�p l�i!")
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nItemIdx = GetPlayerEquipIndex(10)
	if nItemIdx ==0 then
		Talk(1,"","B�n ph�i trang b� ng�a m�i c� th� ��i ���c!")
		return
	end
	if nG ~= 0 or nD ~= 105 or nP ~= 15 then
		Talk(1,"","B�n ph�i trang b� Phi�u V� m�i c� th� ��i ���c!")
		return
	end
	local horse_time_limit = 30 * 24 * 3600
	local nExpireTime = GetItemExpireTime(nItemIdx)
	if nExpireTime <= 0 or nExpireTime == nil then
		nExpireTime = horse_time_limit
	end
	
	if DelItemByIndex(nItemIdx, -1) == 1 and Pay(1000000) == 1 then	
		local nOk, nItemIndex = AddItem(0, 105, 33, 1, 1, 3, 403)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)
			SetItemExpireTime(nItemIndex, nExpireTime)
		end
		Msg2Player("Nh�n ���c th� c��i K� L�n.")
		gf_WriteLogEx("Ho tro Chuyen Sinh 2", "��i K� L�n")
	end
end

function do_nothing()
	
end