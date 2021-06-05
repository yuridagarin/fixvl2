g_tbItem = {
		--ID1, ID2, ID3,     name,����ֵ,����ֵ
	[1] = {2,	1,	1156,	"Ngh�ch L�n",	1,	10},
	[2] = {2,	1,	1157,	"��u h�n",	10,	10},
	}
	
--���ɼ�������
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
	[31] = "Thi�n �nh tuy�t s�t",
	[32] = "V�n ki�m h�a v� tr�n",
};
	

function OnUse(nItemIdx)
	local nIdx = get_item_idx(nItemIdx);
	if nIdx == 0 then
		Talk(1,"","V�t ph�m b�n s� d�ng kh�ng th� t�ng tr� s�t kh�! ");
		return 0;
	end;
	
	if chk_can_use() == 0 then
		Say("Khu v�c hi�n t�i kh�ng th� s� d�ng "..g_tbItem[nIdx][4]..".",0)
		return 0
	end
	
	if have_learned_skill() ~= 1 then
		Talk(1,"","B�n ch�a h�c ���c tuy�t k� Tr�n ph�i n�o, kh�ng th� s� d�ng "..g_tbItem[nIdx][4]..".");
		return 0;
	end;
	use(nItemIdx,nIdx)
--	local nCurShaQi = GetMomentum();
--	local selTab = {
--			format("��ng �/#use(%d,%d)",nItemIdx,nIdx),
--			"H�y b�/nothing",
--			}
--	Say("Ng��i ��ng � s� d�ng <color=yellow>"..g_tbItem[nIdx][4].."<color>? Sau khi s� d�ng c� th� gia t�ng <color=yellow>"..g_tbItem[nIdx][5].."<color> Tr� s�t kh�. Tr� s�t kh� c�a b�n l� <color=yellow>"..nCurShaQi.."<color>.",getn(selTab),selTab);
end;

function use(nItemIdx,nIdx)
	local nCurShaQi = GetMomentum();
	if nCurShaQi >= g_tbItem[nIdx][6] then
		Talk(1,"","Tr� s�t kh� hi�n t�i c�a b�n l� <color=yellow>"..nCurShaQi.."<color> kh�ng th� s� d�ng <color=yellow>"..g_tbItem[nIdx][4].."<color>.");
		return 0;
	end;
	local nMapID = GetWorldPos()
	if nMapID ~= 606 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			if nIdx == 1 then
				SetMomentum(nCurShaQi+1);
				Msg2Player("B�n �� s� d�ng 1 "..g_tbItem[nIdx][4]..", tr� s�t kh� t�ng 1 . ");
			else
				SetMomentum(10);
				Msg2Player("B�n �� s� d�ng 1 "..g_tbItem[nIdx][4]..", tr� s�t kh� th�nh 10 .");
			end;
		end;
	else
		SetMomentumBoundSwitch(0);
		if DelItemByIndex(nItemIdx,1) == 1 then
			if nIdx == 1 then
				SetMomentum(nCurShaQi+1);
				Msg2Player("B�n �� s� d�ng 1 "..g_tbItem[nIdx][4]..", tr� s�t kh� t�ng 1 . ");
			else
				SetMomentum(10);
				Msg2Player("B�n �� s� d�ng 1 "..g_tbItem[nIdx][4]..", tr� s�t kh� th�nh 10 .");
			end;
		end;
		SetMomentumBoundSwitch(1);
	end	
	
end;

function get_item_idx(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(g_tbItem) do
		if nID1 == g_tbItem[i][1] and nID2 == g_tbItem[i][2] and nID3 == g_tbItem[i][3] then
			return i;
		end;
	end;
	return 0;
end;

function have_learned_skill()
	local nRoute = GetPlayerRoute();
	local szSkillName = g_tbSkillName[nRoute];
	if szSkillName == "" then
		return 0;
	end;
	return HaveLearnedSkill(g_tbSkillName[nRoute]);
end;

function nothing()

end;

function chk_can_use()
	local nMapID = GetWorldPos()
	if nMapID >= 839 and nMapID <= 842 then
		return 0
	end
	if GetMissionS(10) == "�i s� m�n" then	--�����ǲ���������ؿ�����
		return 0;
	end;
	return 1
end