Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\2010_11\\activity_03\\head.lua");

RK_results =
{
	"R�i kh�i/gf_DoNothing",
	"Th�i gian kh�ng c�n nhi�u n�a, h�y nhanh ch�ng thu th�p nh�ng nguy�n li�u �� cho ta",
	"H�m nay c�c h� �� ��i v�t ph�m n�y r�i"
}

RK_itemList = 
{
	{{0, 200, 30003}, 500, "Thi�t Ph� m�i"}, 
	{{0, 200, 30001}, 500, "Cu�c Chim m�i"}, 
	{{0, 200, 30002}, 500, "Cu�c m�i"},
	{{0, 200, 30004}, 500, "Cu�c Thu�c m�i"}
}

function RK_notEnoughResource()
	local head = RK_results[2];
	local menu = {RK_results[1]};
	Say(head, getn(menu), menu);
end

function RK_exchanged()
	local head = RK_results[3];
	local menu = {RK_results[1]};
	Say(head, getn(menu), menu);
end

function RK_exchange(index)
	if 1 == GT_hasExchanged(index) then
		RK_exchanged();
	elseif 0 == GT_isEnoughResource(index) then
		RK_notEnoughResource();
	else
		GT_exchange(index);
	end
end

function RK_buyItem(index)
	local itemID = RK_itemList[index][1];
	local cost = RK_itemList[index][2];
	if GetCash() < cost then
		Talk(1,"","H�nh trang kh�ng �� ti�n!");
		return
	end
	if 1 == gf_Judge_Room_Weight(1, 0, "") then
		if 1 == Pay(cost) then
			local tmpItemID = {itemID[1], itemID[2], itemID[3], 1};
			local itemName = RK_itemList[index][3];
			gf_AddItemEx2(tmpItemID, itemName, "gather event", "buy");
		end
	end
end

function RK_showItemList()
	local head = "Mua ��o c� thu th�p";
	local menu = {
		"Mua Thi�t Ph� (5 b�c)/#RK_buyItem(1)",
		"Mua Cu�c (5 b�c)/#RK_buyItem(2)",
		"Mua Cu�c Chim (5 b�c)/#RK_buyItem(3)",
		"Mua Cu�c Thu�c (5 b�c)/#RK_buyItem(4)",
		"Tho�t/gf_DoNothing"
	};
	Say(head, getn(menu), menu);
end

function main()
	--WriteLog("main::called");
	local head = "Nghe n�i khu v�c Tuy�n Ch�u ��t �ai m�u m� t�i nguy�n thi�n nhi�n v� h�n, nay qu�c gia �ang r�t c�n nhi�u t�i nguy�n �� ph�c v� qu�n ��i ch�ng gi�c ngo�i x�m. N�u c�c h� c� th� thu th�p gi�p ta t�t nhi�n s� c� l� v�t h�u t�.";
	local menu = {
		"Ta mu�n n�p 300 G�/#RK_exchange(1)",
		"Ta mu�n n�p 300 L�a/#RK_exchange(2)",
		"Ta mu�n n�p 180 ��/#RK_exchange(3)",
		"Ta mu�n n�p 180 S�t/#RK_exchange(4)",
		"Mua ��o c� thu th�p/RK_showItemList",
		"Ta ch� gh� ngang/gf_DoNothing"
		};
	Say(head, getn(menu), menu);
end