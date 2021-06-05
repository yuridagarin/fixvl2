--����

g_tbSkillName = {
	[0] = "",
	[1] = "",
	[2] = "D�ch C�n Kinh",
	[3] = "T�y T�y Kinh",
	[4] = "Nh� Lai Th�n Ch��ng",
	[5] = "",
	[6] = "H�p Tinh Tr�n",
	[7] = "",
	[8] = "V�n T��ng Th�n C�ng",
	[9] = "Thi�n �m Tr�n H�n Kh�c",
	[10] = "",
	[11] = "Gi�ng Long Th�p B�t Ch��ng",
	[12] = "�� C�u c�n ph�p",
	[13] = "",
	[14] = "V� Th��ng Th�i C�c Ki�m",
	[15] = "Th�i C�c Th�n C�ng",
	[16] = "",
	[17] = "Li�n Ho�n To�n Long th��ng",
	[18] = "B� V��ng T��ng Ph�ng Ti�n",
	[19] = "",
	[20] = "V� Thi�n Ma C�ng",
	[21] = "V� �nh Ma C�",
	[22] ="",
	[23] ="V� C�c Phong L�i Quy�t",
	[24] ="",
	[25] ="C�n Kh�n ��i Na Di",
	[26] ="Quang Minh Ng� H�nh Tr�n",
	[27] ="H�n B�ng Mi�n Ch��ng",
	[28] ="",
	[29] ="Loan Ph�ng C�u Thi�n",
	[30] ="C�u V� Hoa Ti�n Quy�t",
}	

function OnUse(nItemIdx)
	if chk_can_use() == 0 then
		Say("B�n �� n�y kh�ng th� s� d�ng ��u kh�",0)
		return 0
	end
	
	if have_learned_skill() ~= 1 then
		Talk(1,"","C�c h� v�n ch�a h�c tuy�t k� tr�n ph�i, kh�ng th� s� d�ng ��u kh�");
		return 0;
	end;
	use(nItemIdx);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetMomentum(10,1);
		Msg2Player("S� d�ng ��u kh�, �i�m s�t kh� th�nh 10");
	end;
end;

function have_learned_skill()
	local nRoute = GetPlayerRoute();
	local szSkillName = g_tbSkillName[nRoute];
	if szSkillName == "" then
		return 0;
	end;
	return HaveLearnedSkill(g_tbSkillName[nRoute]);
end;

function chk_can_use()
	local nMapID = GetMapTemplate(SubWorld);
	if nMapID ~= 6006 then
		return 0;
	else
		return 1;
	end
end