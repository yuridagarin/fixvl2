	itempart_head			= 0;	-- ͷ
	itempart_body			= 1;	-- ����
	itempart_weapon			= 2;	-- ����
	itempart_foot			= 3;	-- �Ų�
	itempart_ring			= 4;	-- װ����1
	itempart_ring2			= 5;	-- װ����2
                                    --
	itempart_mask			= 6;	-- ���
	itempart_cloth			= 7;	-- ����
	itempart_outfoot		= 8;	-- �°��������
	itempart_great_book		= 9;	-- ���ؼ�
	itempart_horse			= 10;	-- ��
	itempart_book			= 11;	-- �ؼ�
                                    --
	itempart_weapon_extend	= 12;	-- ������չ(����,��ʸ)
                                    --
	itempart_innerstone1	= 13;	-- �ڵ�1
	itempart_innerstone2	= 14;	-- �ڵ�2
	itempart_innerstone3	= 15;	-- �ڵ�3
	itempart_innerstone4	= 16;	-- �ڵ�4
                                    --
	itempart_armory_head	= 17;	-- ����-��
	itempart_armory_body	= 18;	-- ����-��
	itempart_armory_foot	= 19;	-- ����-װ
	itempart_armory_ring1	= 20;	-- ����-��ָ1
	itempart_armory_ring2	= 21;	-- ����-��ָ2
                                    --
	itempart_badge			= 22;	-- ����
	itempart_dress_smock	= 23;	-- ����
                                    --
	itempart_ornament_cap	= 24;	-- ��Ʒ-ñ
	itempart_ornament_cloth	= 25;	-- ��Ʒ-��
	itempart_ornament_foot	= 26;	-- ��Ʒ-Ь

ItemCreate = {}
function ItemCreate.giveCangJianGoldenCap()
	gf_AddItemEx({0,103,94+GetBody(),1,1,-1,-1,-1,-1,-1,-1}, "T�ng Ki�m T� Kim m�o");
end
function ItemCreate.giveCangJianGoldenCloth()
	gf_AddItemEx({0,100,94+GetBody(),1,1,-1,-1,-1,-1,-1,-1}, "Kim L� Th��ng");
end
function ItemCreate.giveCangJianGoldenPants()
	gf_AddItemEx({0,101,94+GetBody(),1,1,-1,-1,-1,-1,-1,-1}, "T�ng Ki�m � kim ph�c");
end

ItemCreate.tRoute2ItmePart = {
	[2 ] = {8801,8802, {{3, 8801, "Hi�n Vi�n To�i V� �ao"}}},
	[3 ] = {8803,8804, {{8, 8803, "Hi�n Vi�n C�u Nh� Tr��ng"}}},
	[4 ] = {8805,8806, {{0, 8804, "Hi�n Vi�n H�o Nhi�n Th�"}}},
	[6 ] = {8807,8808, {{1, 8805, "Hi�n Vi�n ch�m v� h�nh"}}},
	[8 ] = {8809,8810, {{2, 8806, "Hi�n Vi�n T� Tinh Ki�m"}}},
	[9 ] = {8811,8812, {{10,8807, "Hi�n Vi�n Ph�ng Ho�ng C�m"}}},
	[11] = {8813,8814, {{0, 8808, "Hi�n Vi�n Ng� Nh�c Th�"}}},
	[12] = {8815,8816, {{5, 8809, "Hi�n Vi�n Ph� Thi�n C�n"}}},
	[14] = {8817,8818, {{2, 8810, "Hi�n Vi�n H�ng Qu�n Ki�m"}}},
	[15] = {8819,8820, {{9, 8811, "Hi�n Vi�n Sinh T� B�t"}}},
	[17] = {8821,8822, {{6, 8812, "Hi�n Vi�n Ph� Qu�n Th��ng"}}},
	[18] = {8823,8824, {{4, 8813, "Hi�n Vi�n Khai Thi�n Cung"}}},
	[20] = {8825,8826, {{7, 8814, "Hi�n Vi�n �m D��ng Nh�n"}}},
	[21] = {8827,8828, {{11,8815, "Hi�n Vi�n U Minh Tr�o"}}},
	[23] = {8829,8830, {{2, 8816, "Hi�n Vi�n L�i Minh Ki�m"}}},
	[25] = {8831,8832, {{3, 8817, "Hi�n Vi�n Tr�m Vi�m �ao"}}},
	[26] = {8833,8834, {{9, 8818, "Hi�n Vi�n Quang Minh B�t"}}},
	[27] = {8835,8836, {{11,8819, "Hi�n Vi�n Ch�  �n Tr�o"}}},
	[29] = {8837,8838, {{13,8820, "Hi�n Vi�n L�ng Ti�u Phi�n"}}},
	[30] = {8839,8848, {{12,8821, "Hi�n Vi�n Ph�n Hoa ��ch"}}},
}

function ItemCreate.giveXYWeapen()
	local tItemInfo = ItemCreate.tRoute2ItmePart[GetPlayerRoute()][3];
	if not tItemInfo then return end
	tItemInfo = tItemInfo[random(1, getn(tItemInfo))];
	if not tItemInfo then return end
	gf_AddItemEx({0, tItemInfo[1], tItemInfo[2], 1, 1, -1, -1, -1, -1, -1, -1}, tItemInfo[3]);
end
function ItemCreate.giveXYZhan()
	local tItemInfo = ItemCreate.tRoute2ItmePart[GetPlayerRoute()][1];
	if not tItemInfo then return end
	gf_AddItemEx({0, 102, tItemInfo, 1, 1, -1, -1, -1, -1, -1, -1}, "Hi�n Vi�n Chi�n");

end
function ItemCreate.giveXYDou()
	local tItemInfo = ItemCreate.tRoute2ItmePart[GetPlayerRoute()][2];
	if not tItemInfo then return end
	gf_AddItemEx({0, 102, tItemInfo, 1, 1, -1, -1, -1, -1, -1, -1}, "Hi�n Vi�n ��u");

end

ItemCreate.TiandiCloth = {
	[1] = {
		{"Thi�n ��a Huy�n Ho�ng Kh�i",{0,103,85,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thi�n ��a Huy�n Ho�ng Kh�i",{0,103,86,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thi�n ��a Huy�n Ho�ng Kh�i",{0,103,87,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thi�n ��a Huy�n Ho�ng Kh�i",{0,103,88,1,1,0,0,0,0,0,0,0,0,120}}},
	[2] = {
		{"Thi�n ��a Huy�n Ho�ng Gi�p ",{0,100,85,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thi�n ��a Huy�n Ho�ng Gi�p ",{0,100,86,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thi�n ��a Huy�n Ho�ng Gi�p ",{0,100,87,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thi�n ��a Huy�n Ho�ng Gi�p ",{0,100,88,1,1,0,0,0,0,0,0,0,0,120}}},
	[3] = {
		{"Thi�n ��a Huy�n Ho�ng Trang",{0,101,85,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thi�n ��a Huy�n Ho�ng Trang",{0,101,86,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thi�n ��a Huy�n Ho�ng Trang",{0,101,87,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thi�n ��a Huy�n Ho�ng Trang",{0,101,88,1,1,0,0,0,0,0,0,0,0,120}}},
};

ItemCreate.TiandiWp ={
	{"Thi�n ��a Huy�n Ho�ng Th�",{0,0,17	,1,1,0,0,0,0,0,0,0,0,120}},	--01
	{"Thi�n ��a Huy�n Ho�ng Ki�m ",{0,2,39	,1,1,0,0,0,0,0,0,0,0,120}},	--02
	{"Thi�n ��a Huy�n Ho�ng C�n",{0,5,43	,1,1,0,0,0,0,0,0,0,0,120}},	--03
	{"Thi�n ��a Huy�n Ho�ng Kh� ",{0,1,56	,1,1,0,0,0,0,0,0,0,0,120}},	--04
	{"Thi�n ��a Huy�n Ho�ng Dao",{0,3,67	,1,1,0,0,0,0,0,0,0,0,120}},	--05
	{"Thi�n ��a Huy�n Ho�ng C�m",{0,10,78	,1,1,0,0,0,0,0,0,0,0,120}},	--06
	{"Thi�n ��a Huy�n Ho�ng B�t ",{0,9,89	,1,1,0,0,0,0,0,0,0,0,120}},	--07
	{"Thi�n ��a Huy�n Ho�ng Tr��ng",{0,8,100	,1,1,0,0,0,0,0,0,0,0,120}},	--08
	{"Thi�n ��a Huy�n Ho�ng Th��ng ",{0,6,111	,1,1,0,0,0,0,0,0,0,0,120}},	--09
	{"Thi�n ��a Huy�n Ho�ng Cung ",{0,4,122	,1,1,0,0,0,0,0,0,0,0,120}},	--10
	{"Thi�n ��a Huy�n Ho�ng Tr�o",{0,11,15	,1,1,0,0,0,0,0,0,0,0,120}},	--11
	{"Thi�n ��a Huy�n Ho�ng Nh�n ",{0,7,15	,1,1,0,0,0,0,0,0,0,0,120}},	--12
	{"Thi�n ��a Huy�n Ho�ng Phi�n",{0,13,15	,1,1,0,0,0,0,0,0,0,0,120}},	--13
	{"Thi�n ��a Huy�n Ho�ng ��ch",{0,12,15	,1,1,0,0,0,0,0,0,0,0,120}},	--14
};

ItemCreate.Tiandi_Route2Weapon = {
	[2] = 5 ,
	[3] = 8 ,
	[4] = 1 ,
	[6] = 4 ,
	[8] = 2 ,
	[9] = 6 ,
	[11]= 1 ,
	[12]= 3 ,
	[14]= 2 ,
	[15]= 7 ,
	[17]= 9 ,
	[18]= 10,
	[20]= 12,
	[21]= 11,
	[23]= 2 ,
	[25]= 5 ,
	[26]= 7 ,
	[27]= 11,
	[29]= 13,
	[30]= 14,
}
function getWeapenByRoute(nRoute)
	return ItemCreate.Tiandi_Route2Weapon[nRoute];
end
function ItemCreate.giveTiandi(nType, nBody, nLingqi)
	if not nBody then
		nBody = random(1,4)
	end
	local tItem = ItemCreate.TiandiCloth[nType][nBody];
	if nLingqi and nLingqi ~= 120 then
		tItem = new(tItem);
		tItem[2][14] = nLingqi;
	end
	gf_AddItemEx(tItem[2], tItem[1]);
end
function ItemCreate.giveTiandi1(nBody, nLingqi)
	ItemCreate.giveTiandi(1, nBody, nLingqi)
end
function ItemCreate.giveTiandi2(nBody, nLingqi)
	ItemCreate.giveTiandi(2, nBody, nLingqi)
end
function ItemCreate.giveTiandi3(nBody, nLingqi)
	ItemCreate.giveTiandi(3, nBody, nLingqi)
end
function ItemCreate.giveTiandi4(nType, nLingqi)
	if not nType then
		nType = random(1, getn(ItemCreate.TiandiWp));
	end
	local tItem = ItemCreate.TiandiWp[nType];
	if not tItem then return end
	if nLingqi and nLingqi ~= 120 then
		tItem = new(tItem);
		tItem[2][14] = nLingqi;
	end
gf_AddItemEx(tItem[2], tItem[1]);
end

--------------------------------------------------------------------------
ItemCreate.tItemList = {
	["Hi�n Vi�n Chi�n"] = ItemCreate.giveXYZhan,
	["Hi�n Vi�n ��u"] = ItemCreate.giveXYDou,
	["Hi�n Vi�n v� kh�"] = ItemCreate.giveXYWeapen,
	["T�ng Ki�m T� Kim m�o"] = ItemCreate.giveCangJianGoldenCap,
	["Kim L� Th��ng"] = ItemCreate.giveCangJianGoldenCloth,
	["T�ng Ki�m � kim ph�c"] = ItemCreate.giveCangJianGoldenPants,
	["Thi�n ��a Huy�n Ho�ng Kh�i"] = ItemCreate.giveTiandi1,
	["Thi�n ��a Huy�n Ho�ng Gi�p "] = ItemCreate.giveTiandi2,
	["Thi�n ��a Huy�n Ho�ng Trang"] = ItemCreate.giveTiandi3,
	["V� kh� Thi�n ��a Huy�n Ho�ng"] = ItemCreate.giveTiandi4,

}
function ItemCreate:create(name, ...)
	if not name then
		print("[ItemCreate:create] [Error name] [name=nil]");
		return
	end
	local f = ItemCreate.tItemList[name];
	if not f then
		print(format("[ItemCreate:create] [Error name] [name=%s]", tostring(name)));
		return
	end
	f(gf_UnPack(arg));
end

------------------------------------------------------------------
function getItemGDP(nItemIdx)
	return GetItemGenre(nItemIdx), GetItemDetail(nItemIdx), GetItemParticular(nItemIdx);
end

--ʹ��roll���Ǳ�����NPC�������������ӣ�
SF_FILE = "\\settings\\static_script\\lib\\itemfunctions.lua";
function roll(tLootItem)
	if type(tLootItem) ~= "table" then return end
	SetNpcLifeTime(GetTargetNpc(),	0);
	SetNpcScript(GetTargetNpc(),	"");
	local diceId = ApplyItemDice(1, 100, 150, SF_FILE, "rollTimeOver", GetTeamSize());
	AddDiceItemInfo(diceId, gf_UnPack(tLootItem))
	local nPlayerOld = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsPlayerDeath() == 0 then
			RollItem(diceId)
		end
	end
	PlayerIndex = nPlayerOld
end

function rollTimeOver(dwID)
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	if type(t) ~= "table" then return end
	for index, value in t do
		local str = value[1].."N�m"..value[2].." �i�m"
		if value[3] == 0 then
			str = value[1].."Ph�ng"
		elseif value[3] == 1 then
			str = str.." (Tuy�t c�u)"
			if value[4] == 1 then
				str = str.." -- ʰȡ��"..szItem
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -- ʰȡ��"..szItem
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("T�t c� ng��i ch�i �� b� cu�c")
	elseif nSize ~= getn(t) then
		Msg2Player("Nh�ng ng��i ch�i kh�c �� v��t qu� th�i gian, xem nh� b� cu�c")
	end
end

tShineSunEquipName = {
	[2] = {
		{"H�o Nguy�t-�� N�n T�n Gi� M�o","H�o Nguy�t-�� N�n T�n Gi� B�o","H�o Nguy�t-�� N�n T�n Gi� Trang","H�o Nguy�t-�� N�n T�n Gi� Ph�t �ao",},
		{"Di�u D��ng-�� N�n T�n Gi� M�o","Di�u D��ng-�� N�n T�n Gi� B�o","Di�u D��ng-�� N�n T�n Gi� Trang","Di�u D��ng-�� N�n T�n Gi� Ph�t �ao",},
	},
	[3] = {
		{"H�o Nguy�t-�� �ch T�n Gi� M�o","H�o Nguy�t-�� �ch T�n Gi� B�o","H�o Nguy�t-�� �ch T�n Gi� Trang","H�o Nguy�t-�� �ch T�n Gi� Ph�t Tr��ng",},
		{"Di�u D��ng-�� �ch T�n Gi� M�o","Di�u D��ng-�� �ch T�n Gi� B�o","Di�u D��ng-�� �ch T�n Gi� Trang","Di�u D��ng-�� �ch T�n Gi� Ph�t Tr��ng",},
	},
	[4] = {
		{"H�o Nguy�t-�� Ki�p T�n Gi� M�o","H�o Nguy�t-�� Ki�p T�n Gi� B�o","H�o Nguy�t-�� Ki�p T�n Gi� Trang","H�o Nguy�t-�� Ki�p T�n Gi� Ph�t Th�",},
		{"Di�u D��ng-�� Ki�p T�n Gi� M�o","Di�u D��ng-�� Ki�p T�n Gi� B�o","Di�u D��ng-�� Ki�p T�n Gi� Trang","Di�u D��ng-�� Ki�p T�n Gi� Ph�t Th�",},
	},	
	[6] = {
		{"H�o Nguy�t-V�n Ki�p Th�nh Th� Qu�n","H�o Nguy�t-V�n Ki�p Th�nh Th� Y","H�o Nguy�t-V�n Ki�p Th�nh Th� Trang","H�o Nguy�t-V�n Ki�p Th�nh Th� Tr�m",},
		{"Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n","Di�u D��ng-V�n Ki�p Th�nh Th� Y","Di�u D��ng-V�n Ki�p Th�nh Th� Trang","Di�u D��ng-V�n Ki�p Th�nh Th� Tr�m",},
	},
	[8] = {
		{"H�o Nguy�t-Ph�t V�n Th�nh C� Tr�m","H�o Nguy�t-Ph�t V�n Th�nh C� Y","H�o Nguy�t-Ph�t V�n Th�nh C� Qu�n","H�o Nguy�t-Ph�t V�n Th�nh C� Li�n Ki�m",},
		{"Di�u D��ng-Ph�t V�n Th�nh C� Tr�m","Di�u D��ng-Ph�t V�n Th�nh C� Y","Di�u D��ng-Ph�t V�n Th�nh C� Qu�n","Di�u D��ng-Ph�t V�n Th�nh C� Li�n Ki�m",},
	},
	[9] = {
		{"H�o Nguy�t-Ph�t Tr�n Th�nh C� Tr�m","H�o Nguy�t-Ph�t Tr�n Th�nh C� Y","H�o Nguy�t-Ph�t Tr�n Th�nh C� Qu�n","H�o Nguy�t-Ph�t Tr�n Th�nh C� C�m",},
		{"Di�u D��ng-Ph�t Tr�n Th�nh C� Tr�m","Di�u D��ng-Ph�t Tr�n Th�nh C� Y","Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n","Di�u D��ng-Ph�t Tr�n Th�nh C� C�m",},
	},
	[11] = {
		{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i C�n","H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Y","H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Trang","H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Th�",},
		{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n","Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y","Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang","Di�u D��ng-Tr�c Ph�ng Thi�n C�i Th�",},
	},
	[12] = {
		{"H�o Nguy�t-Du Long ��a Kh�t C�n","H�o Nguy�t-Du Long ��a Kh�t Y","H�o Nguy�t-Du Long ��a Kh�t Trang","H�o Nguy�t-Du Long ��a Kh�t C�n",},
		{"Di�u D��ng-Du Long ��a Kh�t C�n","Di�u D��ng-Du Long ��a Kh�t Y","Di�u D��ng-Du Long ��a Kh�t Trang","Di�u D��ng-Du Long ��a Kh�t C�n",},
	},
	[14] = {
		{"H�o Nguy�t-V� C�c Thi�n T�n Qu�n","H�o Nguy�t-V� C�c Thi�n T�n B�o","H�o Nguy�t-V� C�c Thi�n T�n Trang","H�o Nguy�t-V� C�c Thi�n T�n T�c Ki�m",},
		{"Di�u D��ng-V� C�c Thi�n T�n Qu�n","Di�u D��ng-V� C�c Thi�n T�n B�o","Di�u D��ng-V� C�c Thi�n T�n Trang","Di�u D��ng-V� C�c Thi�n T�n T�c Ki�m",},
	},
	[15] = {
		{"H�o Nguy�t-B�ch L�c Thi�n T�n Qu�n","H�o Nguy�t-B�ch L�c Thi�n T�n B�o","H�o Nguy�t-B�ch L�c Thi�n T�n Trang","H�o Nguy�t-B�ch L�c Thi�n T�n B�t",},
		{"Di�u D��ng-B�ch L�c Thi�n T�n Qu�n","Di�u D��ng-B�ch L�c Thi�n T�n B�o","Di�u D��ng-B�ch L�c Thi�n T�n Trang","Di�u D��ng-B�ch L�c Thi�n T�n B�t",},
	},
	[17] = {
		{"H�o Nguy�t-C�m Thi�n ��u H�n Kh�i","H�o Nguy�t-C�m Thi�n ��u H�n Gi�p","H�o Nguy�t-C�m Thi�n ��u H�n Trang","H�o Nguy�t-C�m Thi�n ��u H�n Th��ng",},
		{"Di�u D��ng-C�m Thi�n ��u H�n Kh�i","Di�u D��ng-C�m Thi�n ��u H�n Gi�p","Di�u D��ng-C�m Thi�n ��u H�n Trang","Di�u D��ng-C�m Thi�n ��u H�n Th��ng",},
	},
	[18] = {
		{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Kh�i","H�o Nguy�t-��nh Thi�n Th�n Ngh� Gi�p","H�o Nguy�t-��nh Thi�n Th�n Ngh� Trang","H�o Nguy�t-��nh Thi�n Th�n Ngh� Cung",},
		{"Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i","Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p","Di�u D��ng-��nh Thi�n Th�n Ngh� Trang","Di�u D��ng-��nh Thi�n Th�n Ngh� Cung",},
	},
	[20] = {
		{"H�o Nguy�t-Qu� X�c T� Th�n C�n","H�o Nguy�t-Qu� X�c T� Th�n Y","H�o Nguy�t-Qu� X�c T� Th�n Trang","H�o Nguy�t-Qu� X�c T� Th�n �ao",},
		{"Di�u D��ng-Qu� X�c T� Th�n C�n","Di�u D��ng-Qu� X�c T� Th�n Y","Di�u D��ng-Qu� X�c T� Th�n Trang","Di�u D��ng-Qu� X�c T� Th�n �ao",},
	},
	[21] = {
		{"H�o Nguy�t-Vu C�t ��c V��ng C�n","H�o Nguy�t-Vu C�t ��c V��ng Y","H�o Nguy�t-Vu C�t ��c V��ng Trang","H�o Nguy�t-Vu C�t ��c V��ng Tr�o",},
		{"Di�u D��ng-Vu C�t ��c V��ng C�n","Di�u D��ng-Vu C�t ��c V��ng Y","Di�u D��ng-Vu C�t ��c V��ng Trang","Di�u D��ng-Vu C�t ��c V��ng Tr�o",},
	},
	[23] = {
		{"H�o Nguy�t-B�t ��ng Ch�n Ti�n Qu�n","H�o Nguy�t-B�t ��ng Ch�n Ti�n B�o","H�o Nguy�t-B�t ��ng Ch�n Ti�n Trang","H�o Nguy�t-B�t ��ng Ch�n Ti�n Ki�m",},
		{"Di�u D��ng-B�t ��ng Ch�n Ti�n Qu�n","Di�u D��ng-B�t ��ng Ch�n Ti�n B�o","Di�u D��ng-B�t ��ng Ch�n Ti�n Trang","Di�u D��ng-B�t ��ng Ch�n Ti�n Ki�m",},
	},
	[25] = {
		{"H�o Nguy�t-Nh�c Huy�t Cu�ng Chi�n C�n","H�o Nguy�t-Nh�c Huy�t Cu�ng Chi�n Y","H�o Nguy�t-Nh�c Huy�t Cu�ng Chi�n Trang","H�o Nguy�t-Nh�c Huy�t Cu�ng Chi�n �ao",},
		{"Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n C�n","Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Y","Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang","Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n �ao",},
	},
	[26] = {
		{"H�o Nguy�t-C�u Thi�n Qu� Ph� Qu�n","H�o Nguy�t-C�u Thi�n Qu� Ph� B�o","H�o Nguy�t-C�u Thi�n Qu� Ph� Trang","H�o Nguy�t-C�u Thi�n Qu� Ph� B�t",},
		{"Di�u D��ng-C�u Thi�n Qu� Ph� Qu�n","Di�u D��ng-C�u Thi�n Qu� Ph� B�o","Di�u D��ng-C�u Thi�n Qu� Ph� Trang","Di�u D��ng-C�u Thi�n Qu� Ph� B�t",},
	},
	[27] = {
		{"H�o Nguy�t-Ma �nh Th�n T�ng Qu�n","H�o Nguy�t-Ma �nh Th�n T�ng B�o","H�o Nguy�t-Ma �nh Th�n T�ng Trang","H�o Nguy�t-Ma �nh Th�n T�ng Tr�o",},
		{"Di�u D��ng-Ma �nh Th�n T�ng Qu�n","Di�u D��ng-Ma �nh Th�n T�ng B�o","Di�u D��ng-Ma �nh Th�n T�ng Trang","Di�u D��ng-Ma �nh Th�n T�ng Tr�o",},
	},
	[29] = {
		{"H�o Nguy�t-T� V�n Ti�n T� Tr�m","H�o Nguy�t-T� V�n Ti�n T� Y","H�o Nguy�t-T� V�n Ti�n T� Qu�n","H�o Nguy�t-T� V�n Ti�n T� Phi�n",},
		{"Di�u D��ng-T� V�n Ti�n T� Tr�m","Di�u D��ng-T� V�n Ti�n T� Y","Di�u D��ng-T� V�n Ti�n T� Qu�n","Di�u D��ng-T� V�n Ti�n T� Phi�n",},
	},
	[30] = {
		{"H�o Nguy�t-Phi H� Ti�n T� Tr�m","H�o Nguy�t-Phi H� Ti�n T� Y","H�o Nguy�t-Phi H� Ti�n T� ","H�o Nguy�t-Phi H� Ti�n T� �u Lan Ti�u",},
		{"Di�u D��ng-Phi H� Ti�n T� Tr�m","Di�u D��ng-Phi H� Ti�n T� Y","Di�u D��ng-Phi H� Ti�n T�","Di�u D��ng-Phi H� Ti�n T� �u Lan Ti�u",},
	},
}

function ef_GetShineSunEquipName(nRoute,nGeneration,nType)
	local szName = tShineSunEquipName[nRoute][nGeneration][nType];
	return szName;
end

--�����º�ҫ��װ��
--nRoute��·��
--nBody������
--nGeneration��1Ϊ��£�2Ϊҫ��
--nType��1Ϊͷ��2Ϊ�·���3Ϊ���ӣ�4Ϊ����
--nQianghua��ǿ���ȼ�
--tExpireTime������ʱ��
function ef_AddShineSunEquip(nRoute,nBody,nGeneration,nType,nQianghua,tExpireTime)
	nQianghua = nQianghua or 0;
	local nRetCode,nItemIdx = 0,0;
	local nID1,nID2,nID3 = 0,0,0;
	local szName = ef_GetShineSunEquipName(nRoute,nGeneration,nType);
	local tbWeaponID2 = {nil,3,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11,nil,2,nil,3,9,11,nil,13,12};
	local tbWeaponID3 = {{nil,8972,8974,8973,nil,8975,nil,8976,8977,nil,8978,8979,nil,8980,8981,nil,8982,8983,nil,8984,8985,nil,8986,nil,8987,8988,8989,nil,8990,8991},
											 {nil,8992,8994,8993,nil,8995,nil,8996,8997,nil,8998,8999,nil,9000,9001,nil,9002,9003,nil,9004,9005,nil,9006,nil,9007,9008,9009,nil,9010,9011}};
	local tbID3 = {
		[2] = {{3064,3065},{3128,3129}},
		[3] = {{3068,3069},{3132,3133}},
		[4] = {{3066,3067},{3130,3131}},
		[6] = {{3070,3071,3072,3073},{3134,3135,3136,3137}},
		[8] = {{nil,nil,3074,3075},{nil,nil,3138,3139}},
		[9] = {{nil,nil,3076,3077},{nil,nil,3140,3141}},
		[11] = {{3078,3079,3080,3081},{3142,3143,3144,3145}},
		[12] = {{3082,3083,3084,3085},{3146,3147,3148,3149}},
		[14] = {{3086,3087,3088,3089},{3150,3151,3152,3153}},
		[15] = {{3090,3091,3092,3093},{3154,3155,3156,3157}},
		[17] = {{3094,3095,3096,3097},{3158,3159,3160,3161}},
		[18] = {{3098,3099,3100,3101},{3162,3163,3164,3165}},
		[20] = {{3102,3103,3104,3105},{3166,3167,3168,3169}},
		[21] = {{3106,3107,3108,3109},{3170,3171,3172,3173}},
		[23] = {{3110,3111},{3174,3175}},
		[25] = {{3112,3113,3114,3115},{3176,3177,3178,3179}},
		[26] = {{3116,3117,3118,3119},{3180,3181,3182,3183}},
		[27] = {{3120,3121,3122,3123},{3184,3185,3186,3187}},
		[29] = {{nil,nil,3124,3125},{nil,nil,3188,3189}},
		[30] = {{nil,nil,3126,3127},{nil,nil,3190,3191}},	
	};
	if nType == 1 then
		nID2 = 103;
		nID3 = tbID3[nRoute][nGeneration][nBody];
	elseif nType == 2 then
		nID2 = 100;
		nID3 = tbID3[nRoute][nGeneration][nBody];
	elseif nType == 3 then
		nID2 = 101;
		nID3 = tbID3[nRoute][nGeneration][nBody];
	elseif nType == 4 then
		nID2 = tbWeaponID2[nRoute];
		nID3 = tbWeaponID3[nGeneration][nRoute];
	end
	
	gf_SetLogCaption("Trang b� H�o Nguy�t Di�u Nh�t");
	nRetCode,nItemIdx = gf_AddItemEx({nID1,nID2,nID3,1,1,-1,-1,-1,-1,-1,-1,0,nQianghua},szName);
	if nRetCode == 1 and type(tExpireTime) == "table" then
		gf_SetItemExpireTime(nItemIdx, gf_UnPack(tExpireTime));
	end
	gf_SetLogCaption("");
	return nRetCode,nItemIdx;
end