Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	if GetPlayerFaction() == 0 then
		Talk(1,"","Ch�a gia nh�p m�n ph�i kh�ng th� m� t�i trang s�c t�n h�n.");
		return 0;
	end;
	local selTab = {
			format("M�/#open(%d)",nItemIdx),
			"L�n sau h�y m�!/nothing",
			}
	Say("B�n mu�n m� t�i trang s�c t�n h�n? B�n trong ch�a 1 m�n trang s�c.",getn(selTab),selTab);
end;
tCloth_Faction = {--��ģ����
		{131,173,	167,213},
		{143,189,	171,217},
		{147,193,	175,221},
		{151,197,	179,225},
		{155,201,	183,229},
		{159,205,	187,233},
		{163,209,	191,237},
		};
function open(nItemIdx)
	if gf_JudgeRoomWeight(1,10) == 0 then
		Talk(1,"","B�n kh�ng �� kho�ng tr�ng ho�c s�c l�c, xin ki�m tra l�i!");
		return 0;
	end;
	local nBody = GetBody();
	local nFaction = GetPlayerFaction();
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(0,108,tCloth_Faction[nFaction][3]+nBody-1,1)
		Msg2Player("B�n nh�n ���c 1 m�n trang s�c t�n h�n");
		WriteLog("[K�t h�n]:"..GetName().."�� m� 1 t�i trang s�c t�n h�n");
	end;
end;