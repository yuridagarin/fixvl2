--File name:	pearl.lua
--Describe:		����ű�
--Item ID:		2,1,30067
--Create Date:	2009-02-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

TYPE_NULL 	= 0;	--û�н���
TYPE_ITEM 	= 1;	--��ͨ��Ʒ
TYPE_EQUIP 	= 2;	--������װ������Ʒ
TYPE_CMD 	= 3;	--����

--=========================================================================================
g_szLogTitle = "Event th�ng 3"			--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nVietUseBoxEnd = 2009041300					--ʹ�ý�ֹ����
g_nExpNum = 500000								--ʹ��һ�������õľ���ֵ

g_szFileName = "pearl.lua"						--�ļ���

--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
		Msg2Player("V�t ph�m n�y �� qu� h�n, kh�ng th� s� d�ng th�m n�a.")
		return
	end

	local nExp = g_nExpNum
	local nExpTotal = GetTask(PEARL_TOTALEXP_09_MARCH_VIET)
	if nExpTotal >= PEARL_EXP_LIMIT_09_MARCH_VIET then
		Msg2Player("C�c h� �� thu ���c kinh nghi�m cao nh�t t� v�t ph�m Ng�c Trai "..PEARL_EXP_LIMIT_09_MARCH_VIET.." , C�c h� hi�n nay kh�ng th� thu ���c ph�n th��ng kinh nghi�m.");
		nExp = 0;
		return
	elseif nExpTotal + g_nExpNum > PEARL_EXP_LIMIT_09_MARCH_VIET then
		nExp = PEARL_EXP_LIMIT_09_MARCH_VIET - nExpTotal;
	end

	if nExp ~= 0 and nExp ~= nil then
		if DelItemByIndex(nItemIdx,1) == 1 then
			ModifyExp(nExp);
			SetTask( PEARL_TOTALEXP_09_MARCH_VIET, (nExpTotal+nExp) )
			Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m");

			local szItemName = "�i�m kinh nghi�m"
			local nItemNum = nExp
			local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
			WriteLogEx(g_szLogTitle, "Ng�c Trai", nItemNum, szItemName, szInfoDescribe, GetTongName() )
		end
	end
end

