--file function:item use function 2,1,30321
--function design:big bear
--function develop:cunzhang
--develop date:5-24 2011
--modify tips:
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
tbTWLXItemString = {
	[1] = "Thi�n Ngo�i L�u TInh ",
	[2] = {2,1,30299,9,"M�nh Tinh Ng�n"},
	[4] = "<color=green>Th�ng b�o<color>: m� %s c� th� nh�n ���c<color=green>%d<color> <color=green>%s<color> <color=red>%s<color>, x�c ��nh mu�n m�?",
	[5] = "(Kh�a)",
	[6] = "X�c nh�n m�",
	[7] = "Tho�t",
}
function OnUse(nItemIndex)
	Say(format(tbTWLXItemString[4],tbTWLXItemString[1],tbTWLXItemString[2][4],tbTWLXItemString[2][5],tbTWLXItemString[5]),
		2,
		tbTWLXItemString[6].."/#use_deal("..nItemIndex..")",
		tbTWLXItemString[7].."/nothing"
	)
end
--���ô���
function use_deal(nItemIndex)
	if gf_JudgeRoomWeight(1,0) ~= 1 then
		return
	end
	
	if DelItemByIndex(nItemIndex,1) == 1 then
		gf_AddItemEx2({tbTWLXItemString[2][1],tbTWLXItemString[2][2],tbTWLXItemString[2][3],tbTWLXItemString[2][4]}, THIENMON_LOG_TITLE, "nh�n")
		
--		local bAddFlag = AddItem(tbTWLXItemString[2][1],tbTWLXItemString[2][2],tbTWLXItemString[2][3],tbTWLXItemString[2][4])
--		local szquantity = "chg_suc"
--		if bAddFlag ~= 1 then
--			szquantity = "chg_fail:"..bAddFlag
--		end
--		gf_WriteLogEx("TMZ_mission","item_chg(2,1,30321->2,1,30299,9)",szquantity,tbTWLXItemString[1])
	end
end
function nothing()
end