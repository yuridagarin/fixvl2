-- IB��Ʒ

Include("\\script\\lib\\globalfunctions.lua")

tIBItems = {
--	{{"С��������",2,95,210},{"������",{2	,95,208,10}}},
--	{{"���������",2,95,211},{"������",{2	,95,208,50}}},
--	{{"�𵰱���",2,95,213},{"��",{2,95,189,10}}},
--	{{"һ��С��",2,95,215},{"С��",{2,95,187,1}}},
--	{{"һ��С��",2,95,216},{"С��",{2,95,187,10}}},
--	{{"һ��С��",2,95,217},{"С��",{2,95,187,100}}},
--	{{"һ�зŴ�",2,95,218},{"�Ŵ�",{2,95,195,3}}},
--	{{"С��������Ըɰ",2,95,232},{"������Ըɰ",{2,95,231,50}}},
--	{{"���������Ըɰ",2,95,233},{"������Ըɰ",{2,95,231,250}}},
--	{{"С�������¼",2,95,614},{"�����¼",{2,95,613,10}}},
--	{{"��������¼",2,95,615},{"�����¼",{2,95,613,50}}},	
--	{{"С��ͨ������",2,95,660},{"ͨ������",{2,95,621,10}}},
--	{{"���ͨ������",2,95,661},{"ͨ������",{2,95,621,50}}},	
--	{{"��������ӡ����",2,95,670},{"��������ӡ",{2,95,619,10}}},
--	{{"�������ӡ����",2,95,671},{"�������ӡ",{2,95,620,10}}},	
--	{{"С����Զ������",2,95,882},{"��Զ������",{2,95,918,10}}},	
--	{{"�����Զ������",2,95,883},{"��Զ������",{2,95,918,100}}},	
--	{{"С��������",2,95,1516},{"������",{2,95,1511,50}}},	
--	{{"���������",2,95,1517},{"������",{2,95,1511,250}}},
	{{"Bao Thi�n Ki�u L�nh Nh�",2,95,2086},{"Thi�n Ki�u L�nh",{2,97,236,10}}},	
	{{"Bao Thi�n Ki�u L�nh L�n",2,95,2087},{"Thi�n Ki�u L�nh",{2,97,236,50}}},	
}

function OnUse(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	local nType = 0;
	for i = 1,getn(tIBItems) do
		if nID1 == tIBItems[i][1][2] and nID2 == tIBItems[i][1][3] and nID3 == tIBItems[i][1][4] then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local tSel = {
		format("Hi�n t�i d�ng/#onOpen(%d,%d)", nItemIdx,nType),
		"��ng/nothing",
	}
	Say(format("D�ng %s s� nh�n ���c <color=yellow>%d c�i %s<color>, mu�n d�ng ngay kh�ng??",tIBItems[nType][1][1],tIBItems[nType][2][2][4],tIBItems[nType][2][1]),
		getn(tSel), tSel);
end

function onOpen(nItemIdx,nType)
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		gf_SetLogCaption("open packed ib item:"..tIBItems[nType][1][1]);
		gf_AddItemEx(tIBItems[nType][2][2], tIBItems[nType][2][1]);
		gf_SetLogCaption("");
	end
end

