--�����

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\class\\clause3.lua")
--Include("\\script\\lib\\xoyobi.lua")

tItems = {
	{"Di�n V� Nguy�n So�i Bao",2,95,692},
	{"Di�n V� T��ng Qu�n Bao",2,95,693},
	{"Di�n V� Ti�n Phong Bao",2,95,694},
	{"Di�n V� S� Binh Bao",2,95,695},
}

tClause = {
	{
		subclauses = {
		{{"V�n Hoa H�p [��u kh�i c�p 1]", {2,95,574,1},}, 1000},
		{{"Ti�u Thi�n M�n Di�n V� L�nh", {2,95,206,1},}, 1000},
		{{"Ti�u Thi�n Th�ch Bao", {2,95,221,1},}, 1000},
		{{"Phi�u Thi�n M�n anh h�ng ", {2,95,691,1,4},}, 7000},
		},			
		giveClause = ClauseRandom.giveClause,
	},
	{
		subclauses = {
--		{{"�����䵶", {0,3,8890,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"��������", {0,0,8872,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"��������", {0,8,8908,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"������Ӱ", {0,1,8878,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"�Ⱥ�������", {0,2,8881,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"����������", {0,10,8917,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"���ۻ���", {0,0,8873,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"�����", {0,5,8899,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"�򻪴��罣", {0,2,8882,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"���ƶ�ת��", {0,9,8911,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"�ƾ�ɱ��ǹ", {0,6,8902,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"���׷����", {0,4,8896,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"�ι�Ѫ��", {0,7,8905,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"����Ѫצ", {0,11,8920,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"������׽�", {0,2,8883,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"�����쵶", {0,3,8891,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"����б�", {0,9,8912,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"������צ", {0,11,8921,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"��������֦", {0,13,8929,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"����������", {0,12,8926,1,1,-1,-1,-1,-1,-1,-1},}, 25},			
		{{"Huy�n Th�ch Kim Tinh", {2,201,3,1},}, 2000},
		{{"Ph� Th�y M�c Tinh", {2,201,5,1},}, 2000},
		{{"Nguy�t Hoa Th�y Tinh", {2,201,7,1},}, 2000},
		{{"C�u Huy�n H�a Tinh", {2,201,9,1},}, 2000},
		{{"Ng�ng Ng�c Th� Tinh", {2,201,11,1},}, 2000},
		},			
		giveClause = ClauseRandom.giveClause,
	},
	{
		subclauses = {
		{{"Xu Ti�u Dao 300";giveClause = function() EarnXYB(300) end}, 5000},
		{{"2 v�ng";giveClause = function() gf_Modify("Money",20000) end}, 4500},
		{{"Ti�u Ti�u Kim H�", {2,95,696,1},}, 500},
		},			
		giveClause = ClauseRandom.giveClause,
	},
	{
		subclauses = {
		{{"Kim Tinh", {2,201,2,1},}, 2000},
		{{"M�c Tinh", {2,201,4,1},}, 2000},
		{{"Th�y Tinh", {2,201,6,1},}, 2000},
		{{"H�a Tinh", {2,201,8,1},}, 2000},
		{{"Th� Tinh", {2,201,10,1},}, 2000},
		},			
		giveClause = ClauseRandom.giveClause,
	},	
}

function OnUse(nItemIdx)
	local g, d, p = GetItemInfoByIndex(nItemIdx)
	local nType = 0;
	for i = 1,getn(tItems) do
		if g == tItems[i][2] and d == tItems[i][3] and p == tItems[i][4] then
			nType = i;
			break;
		end
	end
	if nType == 0 then return 0; end
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_SetLogCaption("Di�n V� Bao");
		ClauseRandom.giveClause(tClause[nType]);
		gf_SetLogCaption("")
	end	
end