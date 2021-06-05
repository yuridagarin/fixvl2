--create date:07-11-23
--author:yanjun
--describe:use the battle title
Include("\\script\\newbattles\\functions.lua");
TB_NEW_TITLE = 
{
	[1] = 
		{
			{2,1,9961,"H� l�nh Ph� tr�n ��c","Ph� tr�n ��c h�"},
			{--�Ƿ�������Ԫ˧���Σ�������������Ӧ�ƺű��ڵĴ��࣬���࣬����ʱ��(��ʵʱ��)���������������ֵ��
				{1,"Th�m 15% n�i, ngo�i c�ng",	30,13,3600 * 24 * 30,	300000},
				{1,"th�m 100 �i�m S�t th��ng",	30,15,3600 * 24 * 30,	300000},
			},
		},
	[2] = 
		{
			{2,1,9963,"Tr�n qu�n H� k� l�nh","Tr�n qu�n H� k�"},
			{
				{0,"T� l� s�t th��ng gi�m 25%",30,17,3600 * 24 * 30,	450000},
			},
		},
	[3] = 
		{
			{2,1,9962,"Thi�t c� long v� l�nh","Thi�t c� long v�"},
			{
				{0,"T�ng 60 �i�m thu�c t�nh",30,19,3600 * 24 * 30,	400000},
			},
		},
	[4] = 
		{
			{2,1,9964,"V� Song Phi T��ng l�nh","V� Song Phi T��ng"},
			{
				{0,"T�ng 10000 �i�m sinh l�c t�i �a",30,21,3600 * 24 * 30,	500000},
			},
		},
	[5] = 
		{
			{2,1,9960,"Ng� ��ch m�nh s� l�nh","Ng� ��ch m�nh s�"},
			{
				{1,"T�ng 40 �i�m thu�c t�nh",30,23,3600 * 24 * 30,	250000},
			},
		},
}

function OnUse(nItemIdx)
	nItemIdx = tonumber(nItemIdx);
	local nType = get_item_info(nItemIdx);
	local nCurCamp = BT_GetCurCamp();
	if nType == 0 then
		Talk(1,"","B�n kh�ng s� d�ng Phong Th��ng L�nh.");
		return 0;
	end;
	if nType == 1 then	--��������������󶽻���
		local selTab = {
					format("T�ng 15##n�i, ngo�i l�c/#use_confirm(%d,%d)",nItemIdx,1),
					format("th�m 100 �i�m S�t th��ng/#use_confirm(%d,%d)",nItemIdx,2),
					"H�y b�/nothing",
					}
		Say("s� d�ng <color=yellow>"..TB_NEW_TITLE[nType][1][4].."<color>B�n s� nh�n ���c <color=yellow>��i"..tCampNameZ[nCurCamp]..TB_NEW_TITLE[nType][1][4].."<color>danh hi�u, h�y ch�n thu�c t�nh b�n c�n: ",getn(selTab),selTab);
	else
		local selTab = {
					format("��ng �/#use_confirm(%d,%d)",nItemIdx,1),
					"H�y b�/nothing",
					}
		Say("s� d�ng <color=yellow>"..TB_NEW_TITLE[nType][1][4].."<color>B�n s� nh�n ���c <color=yellow>��i"..tCampNameZ[nCurCamp]..TB_NEW_TITLE[nType][1][5].."<color>danh hi�u, b�n mu�n s� d�ng ngay kh�ng?",getn(selTab),selTab);
	end;
end;

function get_item_info(nItemIdx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(TB_NEW_TITLE) do
		if TB_NEW_TITLE[i][1][1] == nGenre and TB_NEW_TITLE[i][1][2] == nDetail and TB_NEW_TITLE[i][1][3] == nParticular then
			return i;
		end;
	end;
	return 0;
end;

function check_player_state(nItemType,nTitleIdx)
	local nNeedJunGong = TB_NEW_TITLE[nItemType][2][nTitleIdx][6];
	local nNeedEverRank = TB_NEW_TITLE[nItemType][2][nTitleIdx][1];
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	local bEverMarshal = 0;
	local nCurCamp = BT_GetCurCamp();
--	if BT_GetData(PT_MARSHAL_WEEK) >= 15 then
--		bEverMarshal = 1;	--������Ԫ˧
--	end;
	if nNeedEverRank == 1 then
		if bEverMarshal == 0 and abs(nCurJunGong) < nNeedJunGong then
			Talk(1,"","B�n ph�i ��t ���c "..tCampNameZ[nCurCamp].." <color=yellow>"..nNeedJunGong.."<color>chi�n c�ng ho�c c�<color=yellow>"..tCampNameZ[nCurCamp].."_Qu�n h�m V�nh C�u Nguy�n so�i<color>m�i c� th� s� d�ng danh hi�u n�y.");				
			return 0;
		end;
	else
		if abs(nCurJunGong) < nNeedJunGong then
			Talk(1,"","B�n ph�i ��t ���c "..tCampNameZ[nCurCamp].." <color=yellow>"..nNeedJunGong.."<color> Qu�n c�ng m�i s� d�ng danh hi�u n�y.");				
			return 0;
		end;
	end;
	return 1;
end;

function use_confirm(nItemIdx,nTitleIdx)
	local nType = get_item_info(nItemIdx);
	if check_player_state(nType,nTitleIdx) ~= 1 then
		return 0;
	end;
	local nCurCamp = BT_GetCurCamp();
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nGenre,nDetail = TB_NEW_TITLE[nType][2][nTitleIdx][3],TB_NEW_TITLE[nType][2][nTitleIdx][4];
		if nCurCamp == LIAO_ID then
			nDetail = nDetail + 1;
		end;
		if mod(nDetail,2) == 1 then	--�η���
			for i=7,12 do
				RemoveTitle(30,2*i);	--���ɵ�ȫɾ��
			end;
		else	--�ɷ���
			for i=6,11 do
				RemoveTitle(30,2*i+1);	--���ε�ȫɾ��
			end;			
		end;
		if nDetail <= 16 then	--����Ǵ���/�����󶽻���
			for i=13,16 do
				RemoveTitle(30,i);
			end;
		end;
		local nTime = TB_NEW_TITLE[nType][2][nTitleIdx][5];
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("B�n nh�n ���c danh hi�u:"..TB_NEW_TITLE[nType][1][5]);
		SetCurTitle(nGenre, nDetail);
	end;
end;