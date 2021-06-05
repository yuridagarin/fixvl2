Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");

TC_ExpBounus = 
{
	{2, 100, 20000000, 1}
};

TC_WeaponList = 
{
  {1, 7, "Ph� Y�n �ao", {0, 3, 6001, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 7, "Ph� Y�n c�n", {0, 5, 6002, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 7, "Ph� Y�n tr��ng", {0, 8, 6003, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 7, "H�m Y�n th�", {0, 0, 6004, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 7, "T�ng Y�n ch�m", {0, 1, 6005, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 7, "Phi Y�n ki�m", {0, 2, 6006, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 7, "V�n Y�n c�m", {0, 10, 6007, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 7, "V�n Y�n th�", {0, 0, 6008, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 7, "L�u Y�n c�n", {0, 5, 6009, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 7, "Huy�n Y�n ki�m", {0, 2, 6010, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 6, "V� Y�n b�t", {0, 9, 6011, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 6, "H� Ti�m Th��ng", {0, 6, 6012, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 6, "H�nh Y�n Cung", {0, 4, 6013, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 6, "Tr�c Y�n nh�n", {0, 7, 6014, 1, 1, -1, -1, -1, -1, -1, -1}},
  {1, 6, "Y�u Y�n tr�o", {0, 11, 6015, 1, 1, -1, -1, -1, -1, -1, -1}}
}

function TC_AddWeapon()
	gf_EventGiveRandAward(TC_WeaponList, 100, 1, "Event th�ng 12 n�m 2010", "V� kh� b� Phi Y�n");
end

function TC_AddBattleAchievement()
	SetTask(701, GetTask(701)+7000);
	Msg2Player("C�c h� nh�n ���c 7000 �i�m qu�n c�ng");
end

-- base 1000
TC_ItemBonusList = 
{
	{1, 300, "Ch�m Ch�m", {2, 1, 30165, 50}},
	{31, 10, "TC_AddWeapon();"},
	{1, 1, "Thi�n Qu�i Th�ch", {2, 0, 1084, 1}},
	{1, 100, "Chi�n Th�n ho�n", {2, 1, 1005, 1}, 7 * 24 * 3600},
	{1, 10, "Phi Y�n Th�ch", {2, 1, 30130, 1}},
	{1, 10, "T� Quang Th�n Th�ch", {2, 1, 30131, 1}},
	{1, 5, "B�ch Kim H�ng Bao (tr�ng)", {2, 1, 30228, 1}, 7 * 24 * 3600},
	{1, 5, "Ho�ng Kim ��i H�ng Bao (tr�ng)", {2, 1, 538, 1}, 7 * 24 * 3600},
	{1, 10, "T� Kim H�ng Bao (tr�ng)", {2, 1, 536, 1}, 7 * 24 * 3600},
	{1, 200, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}},
	{1, 1, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2, 1, 1067, 1}, 7 * 24 * 3600},
	{1, 10, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}},
	{1, 5, "Thi�n Th�ch linh th�ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
	{1, 1, "L�ng Ba Vi B�", {0, 112, 78, 1}},
  {3, 50, 5000000, 1}, --��Ǯ
  {31, 282, "TC_AddBattleAchievement();"} -- ����ֵ
}

function main()
	local teamSize = GetTeamSize()
	local mapID = SubWorldIdx2ID(SubWorld);
	local itemBonusTable = {{0, 0, "", 0, 0}}

	local chance = random(1, 1000);
	local tmp = 0;
	for i=1, getn(TC_ItemBonusList) do
		tmp = tmp + TC_ItemBonusList[i][2];
		if tmp >= chance then
			--WriteLog("main::i: "..i..", chance: "..chance);
			for j=1, getn(TC_ItemBonusList[i]) do
				if type(TC_ItemBonusList[i][j]) ~= "table" then
					itemBonusTable[1][j] = TC_ItemBonusList[i][j];
				else
					itemBonusTable[1][j] = {};
					for k=1, getn(TC_ItemBonusList[i][j]) do
						itemBonusTable[1][j][k] = TC_ItemBonusList[i][j][k];
					end
				end
			end
			break;
		end
	end
	itemBonusTable[1][2] = 1000;
	
	--for i=1, getn(itemBonusTable[1]) do
	--	local tmp = "";
	--	if type(TC_ItemBonusList[1][i]) == "table" then
	--		tmp = tmp.."{";
	--		for j=1, getn(TC_ItemBonusList[1][i]) do
	--			tmp = tmp..TC_ItemBonusList[1][i][j]..", ";
	--		end
	--		tmp = tmp.."}";
	--	else
	--		tmp = TC_ItemBonusList[1][i];
	--	end
	--	WriteLog("main::itemBonusTable[1]["..i.."]: "..tmp);
	--end

	for i=1, teamSize do
		local oldPlayerIndex = PlayerIndex;
		PlayerIndex = GetTeamMember(i);
		gf_EventGiveRandAward(TC_ExpBounus, 1000, 1, "Event th�ng 12 n�m 2010", "teasure chest");			
		gf_EventGiveRandAward(itemBonusTable, 1000, 1, "Event th�ng 12 n�m 2010", "teasure chest");	
		PlayerIndex = oldPlayerIndex;
	end
	FG_DestroyChest(mapID);
end