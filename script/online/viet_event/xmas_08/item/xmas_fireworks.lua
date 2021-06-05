--File name:	xmas_fireworks.lua
--Describe:		�̻�ű�
--Item ID:		2,1,30039
--Create Date:	2008-11-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\xmas_08\\xmas_head.lua");

TYPE_NULL 	= 0;	--û�н���
TYPE_ITEM 	= 1;	--��ͨ��Ʒ
TYPE_EQUIP 	= 2;	--������װ������Ʒ
TYPE_CMD 	= 3;	--����

BYTE_FIREWORKS_NUM_08_USED = 1
BYTE_FIREWORKS_NUM_08_COUNT = 2
--=========================================================================================
g_szLogTitle = "Hoat dong thang 6 nam 2010"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_nVietUseBoxEnd = 2009010500					--�̻��ʹ�ý�ֹ����
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nExpNum = 200000
g_nMaxUse = 100
g_nDayUse = 10								--ʹ��һ���̻��õľ���ֵ

YANHUO_TABLE = {
--	{"X�ch M�c H�a Di�m", 801, 10, 2, 1, 191},
--	{"Tranh M�c H�a Di�m", 802, 10, 2, 1, 193},
--	{"Lam M�c H�a Di�m", 805, 10, 2, 1, 192},
	{"Tranh S�c Y�n Hoa", 820, 3, 2, 1, 189},
	{"Lam S�c Y�n Hoa", 823, 3, 2, 1, 190},
	{""		   , 808, 5, 2, 1, 194},	--�����̻�
	{""		   , 811, 5, 2, 1, 194},
--	{""		   , 813, 10, 2, 1, 194},
--	{""		   , 814, 10, 2, 1, 194},
--	{""		   , 817, 10, 2, 1, 194},
	{""		   , 832, 3, 2, 1, 194},
	{""		   , 835, 3, 2, 1, 194},
	{""		   , 838, 1, 2, 1, 194},
	{""        , 841, 1, 2, 1, 194}
};

t_Firework_Exp = {
	{2, 80, 200000},
	{2, 5, 400000},
	{2, 5, 600000},
	{2, 5, 800000},
	{2, 5, 1000000},
}


--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"))
	
	if nDate < 20100708 or nDate > 20100711 then
		return
	end
	
	if GetTask(FIREWORKS_DATE_08_XMAS_VIET) ~= nDate then
		SetTask(FIREWORKS_DATE_08_XMAS_VIET, nDate)
		gf_SetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT, 0)
		SetTask(FIREWORKS_TIME_08_XMAS_VIET, 0)
	end

	if GetLevel() < 73 then
		Say("Nh�n v�t c� ��ng c�p 73 tr� l�n m�i c� th� s� d�ng ph�o hoa",1,"K�t th�c ��i tho�i/no_talk")
		return
	end

	--if gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_USED) >= 100 then
	--	Msg2Player("Ch� c� th� s� d�ng t�i �a 100 ph�o hoa.")
	--	return
	--end

	if gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT) >= g_nDayUse then
		Msg2Player("Ng�y h�m nay ch� c� th� s� d�ng 10 ph�o hoa.")
		return
	end

	if (GetTime() - GetTask(FIREWORKS_TIME_08_XMAS_VIET)) < 60 then
		local nRemainTime = 60 - (GetTime() - GetTask(FIREWORKS_TIME_08_XMAS_VIET))
		Msg2Player("C�n "..nRemainTime.." gi�y n�a m�i c� th� ��t ph�o hoa ti�p.")
		return
	end

	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_EventGiveRandAward(t_Firework_Exp,100,1,g_szLogTitle,"s� d�ng ph�o hoa")
		gf_SetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT, gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT) + 1)
		--gf_SetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_USED, gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_USED) + 1)
		SetTask(FIREWORKS_TIME_08_XMAS_VIET, GetTime())		
		nIndex = random(1, getn(YANHUO_TABLE));
		DoFireworks(YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3]);
	end
end

function no_talk()
end