--create date:07-04-03
--author:yanjun
--describe:use the battle title
tTab =
{
--��Ʒ���࣬���࣬��ϸ�����Ҫ���Σ���Ʒ���ƣ��ƺ����ƣ���Ӧ�ƺű��ڵĴ��࣬���࣬����ʱ��(��ʵʱ��)
	{2,1,9990,	 2,	"��i T�ng Phong Th��ng l�nh (Hi�u �y)",	"T�ng_V� D�ng Hi�u �y",		30,	 2,	3600 * 24 * 30},
	{2,1,9989,	-2,	"��i Li�u Phong Th��ng l�nh (Hi�u �y)",	"Li�u_Ki�u D�ng �� �y",		30,	 8,	3600 * 24 * 30},
	{2,1,9988,	 3,	"��i T�ng Phong Th��ng l�nh (�� th�ng)",	"T�ng_Th��ng Th�ng �� th�ng",		30,	 3,	3600 * 24 * 30},
	{2,1,9987,	-3,	"��i Li�u Phong Th��ng l�nh (�� th�ng)",	"Li�u_Tuy�t tr�n �� th�ng",		30,	 9,	3600 * 24 * 30},
	{2,1,9986,	 4,	"��i T�ng Phong Th��ng l�nh (Ti�n phong)",	"T�ng_��nh B�c ��i Ti�n phong",	30,	 4,	3600 * 24 * 30},
	{2,1,9985,	-4,	"��i Li�u Phong Th��ng l�nh (Ti�n phong)",	"Li�u_B�nh Nam ��i Ti�n phong",	30,	10,	3600 * 24 * 30},	
	{2,1,9984,	 5,	"��i T�ng Phong Th��ng l�nh (T��ng qu�n)",	"T�ng_V� Song ��i t��ng qu�n",	30,	 5,	3600 * 24 * 30},	
	{2,1,9983,	-5,	"��i Li�u Phong Th��ng l�nh (T��ng qu�n)",	"Li�u_Th�ng Thi�n ��i t��ng qu�n",	30,	11,	3600 * 24 * 30},	
	{2,1,9982,	 6,	"��i T�ng Phong Th��ng l�nh (Nguy�n so�i)",	"T�ng_H� Qu�c ��i nguy�n so�i",	30,	 6,	3600 * 24 * 30},	
	{2,1,9981,	-6,	"��i Li�u Phong Th��ng l�nh (Nguy�n so�i)",	"Nam Vi�n ��i V��ng",			30,	12,	3600 * 24 * 30},
} 

tRank = {
	[0] = "Binh s�",
	[1] = "Binh s�",
	[2] = "Hi�u �y",
	[3] = "�� th�ng",
	[4] = "Ti�n phong",
	[5] = "T��ng qu�n",
	[6] = "Nguy�n So�i",
	}
function OnUse(nItemIdx)
	local nTitleIdx = get_title_index(nItemIdx);
	if nTitleIdx == 0 then
		Talk(1,"","B�n kh�ng s� d�ng Phong Th��ng L�nh.");
		return 0;
	end;
	local selTab = {
				format("��ng �/#use_confirm(%d,%d)",nItemIdx,nTitleIdx),
				"Ta suy ngh� l�i!/nothing",
				}
	if check_player_state(nTitleIdx) == 1 then
		Say("s� d�ng <color=yellow>"..tTab[nTitleIdx][5].."<color> b�n nh�n ���c <color=yellow>"..tTab[nTitleIdx][6].."<color> danh hi�u, <color=red>danh hi�u tr��c ��y c�ng b� x�a<color>, c� c�n mu�n s� d�ng kh�ng?",getn(selTab),selTab);
	end;
end;

function get_title_index(nItemIdx)
	nItemIdx = tonumber(nItemIdx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	for i,v in tTab do
		if tTab[i][1] == nGenre and tTab[i][2] == nDetail and tTab[i][3] == nParticular then
			return i;
		end;
	end;
	return 0;
end;

function check_player_state(nTitleIdx)
	local nCurRank = GetTask(704);
	local nNeedRank = tTab[nTitleIdx][4];
	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	
	if nCurRank > 0 then
		if nNeedRank < 0 then
			Talk(1,"","B�n hi�n thu�c phe <color=yellow>T�ng<color>, kh�ng th� d�ng danh hi�u c�a phe Li�u");
			return 0
		end
	elseif nCurRank < 0 then
		if nNeedRank > 0 then
			Talk(1,"","B�n hi�n thu�c phe <color=yellow>Li�u<color>, kh�ng th� d�ng danh hi�u c�a phe T�ng");
			return 0;
		end
	end
	nCurRank = abs(nCurRank)
	nNeedRank = abs(nNeedRank)
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end
	if nCurRank < nNeedRank then
		Talk(1,"","Qu�n h�m c�a b�n qu� th�p kh�ng th� s� d�ng danh hi�u n�y.");
		return 0
	end
	return 1
end;

function use_confirm(nItemIdx,nTitleIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		for i=2,12 do
			RemoveTitle(30,i);
		end;
		local nGenre,nDetail = tTab[nTitleIdx][7],tTab[nTitleIdx][8];
		local nTime = tTab[nTitleIdx][9];
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("B�n nh�n ���c x�ng hi�u"..tTab[nTitleIdx][6]);
		SetCurTitle(nGenre, nDetail);
	end;
end;