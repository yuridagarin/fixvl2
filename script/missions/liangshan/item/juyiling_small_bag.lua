--�ű����ܣ�С��������ʹ�ýű������10�������
--������ƣ�����
--���ܿ������峤
--����ʱ�䣺2011-6-10
--�޸ļ�¼��
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\liangshan\\head.lua")
tbItemString = {
	[1] = "Bao T� Ngh�a L�nh nh�",
	[2] = {TJYLInfo[1],TJYLInfo[2],TJYLInfo[3],10,TJYLInfo[4]},
	[4] = "<color=green>Th�ng b�o<color>: m� %s c� th� nh�n ���c<color=green>%d<color> <color=green>%s<color> <color=red>%s<color>, x�c ��nh mu�n m�?",
	[5] = "(Kh�a)",
	[6] = "X�c nh�n m�",
	[7] = "Tho�t",
}
function OnUse(nItemIndex)
	Say(format(tbItemString[4],tbItemString[1],tbItemString[2][4],tbItemString[2][5],tbItemString[5]),
		2,
		tbItemString[6].."/#use_deal("..nItemIndex..")",
		tbItemString[7].."/nothing"
	)
end
--���ô���
function use_deal(nItemIndex)
        do return end;
	if gf_JudgeRoomWeight(1,0,"") ~= 1 then
		return
	end
	
	if DelItemByIndex(nItemIndex,1) == 1 then
		gf_AddItemEx2({tbItemString[2][1],tbItemString[2][2],tbItemString[2][3],tbItemString[2][4]}, "T� Ngh�a L�nh", LUONGSON_LOG_TITLE, "nh�n")
		
--		local bAddFlag = AddItem(tbItemString[2][1],tbItemString[2][2],tbItemString[2][3],tbItemString[2][4])
--		local szquantity = "chg_suc"
--		if bAddFlag ~= 1 then
--			szquantity = "chg_fail:"..bAddFlag
--		end
--		gf_WriteLogEx("LS_mission","item_chg(2,95,210->2,95,208,10)",szquantity,tbItemString[1])
	end
end
function nothing()
end