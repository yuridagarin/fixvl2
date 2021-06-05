Include("\\script\\online_activites\\2010_12\\activity_05\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

CR_Head = "<color=green>Xa Phu ��u tr��ng Tuy�t: <color>Ho�t ��ng ��u Tr��ng Tuy�t 1 ng�y ti�n h�nh 3 l�n, th�i gian bao g�m 11:30, 17:30, 21:30, m�i tr�n ��u duy tr� 1 gi�; �i�u ki�n tham gia c�p 80 tr� l�n, �� gia nh�p m�n ph�i, �� k�ch ho�t c�nh gi�i kinh m�ch.";

CR_Menu1 = 
{
	"V�o ��u Tr��ng Tuy�t (ti�u hao 5 v�ng t�ng 10 Ti�u Tuy�t C�u)/CR_DoEnter",
	"Mua ��n tuy�t c�u/CR_DoShowSaleList",
	"R�i kh�i/gf_DoNothing"
};

CR_Menu2 = 
{
	"R�i kh�i ��u tr��ng tuy�t/CR_DoExit",
	"Mua ��n tuy�t c�u/CR_DoShowSaleList",
	"R�i kh�i/gf_DoNothing"
}

CR_SaleList = 
{
	{{2, 3, 221}, "��i tuy�t c�u", 10, 150000},
	{{2, 3, 220}, "Trung tuy�t c�u", 10, 100000},
	{{2, 3, 219}, "Ti�u tuy�t c�u", 10, 50000},
}

CR_Menu3_1 = 
{
	"10 ��i Tuy�t C�u (15 v�ng)/#CR_DoBuy(1)",
	"10 Trung Tuy�t C�u (10 v�ng)/#CR_DoBuy(2)",
	"10 Ti�u Tuy�t C�u (5 v�ng)/#CR_DoBuy(3)",
	"Ta ch� gh� ch�i/gf_DoNothing",
}

function CR_DoEnter()
	local mapID = GetWorldPos();
  mapID = SB_MapMap[mapID];
	if 1 ~= SB_CheckState(mapID) then
		Talk(1, "", "R�t ti�c, ��t ho�t ��ng n�y �� k�t th�c, h�y tr� l�i l�n sau");
		return
	end
	if 1 ~= SB_CheckPlayerCount(mapID) then
		Talk(1, "", "R�t ti�c, ��u tr��ng �� ��y, vui l�ng tr� l�i l�n sau");
		return
	end
	if 0 == GetPlayerRoute() then
		Talk(1, "", "R�t ti�c, c�c h� ch�a gia nh�p m�n ph�i kh�ng th� tham gia");
		return
	end
	if SB_MIN_LEVEL > GetLevel() then
		Talk(1, "", "R�t ti�c, c�c h� ch�a ��t �� c�p ��, c�n "..SB_MIN_LEVEL.."tr� l�n");
		return
	end
	if MeridianGetLevel() < 1 then
		Talk(1,"","R�t ti�c, c�c h� ch�a khai th�ng c�nh gi�i kinh m�ch");
		return
	end
	if 1 ~= SB_CheckEquipment() then
		Talk(1, "", "R�t ti�c, c�c h� c�n c�i b� ngo�i trang v� v� kh�");
		return
	end
	if GetCash() < SB_COST then
		Talk(1,"","R�t ti�c, ng�n l��ng c�c h� mang theo kh�ng ��!");
		return
	end	
	if gf_Judge_Room_Weight(2,50) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end	
	local itemID = {2, 3, 219, 10};
	local itemName = "Ti�u tuy�t c�u";
	gf_AddItemEx2(itemID, itemName, "Event th�ng 12 n�m 2012", "application gift");
	gf_WriteLogEx("NEM TUYET 022013", "tham gia th�nh c�ng", 1, "Tham gia n�m tuy�t")
	mf_JoinMission(SB_MISSION_ID, SB_CAMP_ID, mapID);
end

function CR_DoExit()
	--WriteLog("CR_DoExit::SubWorld: "..SubWorld..", mapID: "..SubWorldIdx2ID(SubWorld));
	SB_ResetState()
	DelMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
end

function CR_DoShowSaleList()
	Say(CR_Head, getn(CR_Menu3_1), CR_Menu3_1);
end

function CR_DoBuy(index)
	local itemID = CR_SaleList[index][1];
	local itemName = CR_SaleList[index][2];
	local itemCount = CR_SaleList[index][3];
	local cost = CR_SaleList[index][4];
	if GetCash() < cost then
		Talk(1,"","H�nh trang kh�ng �� ti�n!");
		return
	end
	if 1 == gf_Judge_Room_Weight(4,100, "") then
		if 1 == Pay(cost) then
			local tmpItemID = {itemID[1], itemID[2], itemID[3], itemCount};
			gf_AddItemEx2(tmpItemID, itemName, "NEM TUYET 022013", "Mua ��n tuy�t c�u"); --Event th�ng 12 n�m 2012
		end
	end
	CR_DoShowSaleList();	
end

function main()
	--WriteLog("main::called");
	if 0 == SB_IsInSnowMap() then
		Say(CR_Head, getn(CR_Menu1), CR_Menu1);
	else
		Say(CR_Head, getn(CR_Menu2), CR_Menu2);
	end
end