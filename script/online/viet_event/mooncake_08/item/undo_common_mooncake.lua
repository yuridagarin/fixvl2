--File name:	undo_common_mooncake.lua
--Describe:		δ�����ͨ�±��ű�
--Item ID:		2,1,30027
--Create Date:	2008-08-20
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")

--=========================================================================================
g_szLogTitle = "Ho�t ��ng trung thu : ".."B�nh ch�a ch�n th��ng"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nVietUseMoonCakeEnd = 2008101300					--�±���ʹ�ý�ֹ����
g_nExpNum = 10000									--ʹ��һ���±���õľ���ֵ

--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseMoonCakeEnd then
		return
	end
	if GetLevel() < 20 then
		Talk(1,"","Ch� c� ng��i ch�i ��t ��ng c�p t� 20 tr� l�n m�i c� th� s� d�ng v�t ph�m n�y.")
		return
	end
	if GetTask(TOTALEXP_08_MOONCAKE_VIET) >= g_nExpTotal_MoonCakeViet then
		Msg2Player("B�n �� ��t gi�i h�n �i�m kinh nghi�m c� th� nh�n ���c trong ho�t ��ng Trung thu l�n n�y. "..g_nExpTotal_MoonCakeViet.." , Kh�ng th� ti�p t�c s� d�ng v�t ph�m n�y.");
		Talk(1,"","B�n �� ��t gi�i h�n �i�m kinh nghi�m c� th� nh�n ���c trong ho�t ��ng Trung thu l�n n�y. "..g_nExpTotal_MoonCakeViet.." , Kh�ng th� ti�p t�c s� d�ng v�t ph�m n�y.");
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		use_it()
	end
end

function use_it()
	--���齱������
	local nExp = g_nExpNum
	local nExpTotal = GetTask(TOTALEXP_08_MOONCAKE_VIET)
	if nExpTotal + g_nExpNum > g_nExpTotal_MoonCakeViet then
		nExp = g_nExpTotal_MoonCakeViet - nExpTotal
	elseif nExpTotal >= g_nExpTotal_MoonCakeViet then
		nExp = 0
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( TOTALEXP_08_MOONCAKE_VIET, (nExpTotal+nExp) )
		Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m");
		WriteLogEx(szLogTrungThuName,"nh�n",nExp,"�i�m kinh nghi�m")		
	end
	--����Ч������
	local nRandom = random(1,100)
	if nRandom <= 25 then
		CastState("state_vertigo", 1, 18*3)
	elseif nRandom <= 50 then
		CastState("state_confusion", 1, 18*3)
	elseif nRandom <= 75 then
		CastState("state_sleep", 1, 18*3)
	else
		SetWound(1, 12000)
	end
end



function nothing()

end
