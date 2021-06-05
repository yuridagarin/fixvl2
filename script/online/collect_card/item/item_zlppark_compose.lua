--������Ƭ����ϳ�
Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\lib\\globalfunctions.lua")


function OnUse(nItem)
	local tSay = {
		format("Ti�u hao %d ti�n v�ng ��i l�y L� Bao N�ng C�p Phi�n B�n M�i/#sure_exchange()", CC_ZLP_PARK_COST, 1),
		"Ta suy ngh� l�i/do_nothing",	
	}
	Say("��i hi�p mu�n ��i L� Bao N�ng C�p ch�?", getn(tSay), tSay);
end

function sure_exchange()
	local nFreeRoom = GetFreeItemRoom();
	local nCount = min(GetItemCount(2, 1, 30540), floor(GetCash()/(CC_ZLP_PARK_COST * 10000)));
	AskClientForNumber("sure_exchange_deal",0,min(nFreeRoom, nCount),"Nh�p s� l��ng","")
end

function sure_exchange_deal(nNum)
	for i = 1, nNum do
		if GetFreeItemRoom() < 2 then
			Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
			return 0;
		end
		if GetItemCount(2, 1, 30540) < 1 then 
			Talk(1,"","Thi�u L� Bao N�ng C�p Phi�n B�n M�i, kh�ng th� n�ng c�p.");
			return 0;
		end
		if GetCash() < CC_ZLP_PARK_COST * 10000 then
			Talk(1,"","Ti�n v�ng trong h�nh trang kh�ng ��");
			return 0;
		end
		if DelItem(2, 1, 30540, 1) ~= 1 then
			return 0;
		end
		if Pay(CC_ZLP_PARK_COST * 10000) ~= 1 then
			return 0;
		end
		gf_AddItemEx2({2, 1, 30541, 1}, "L� bao N�ng C�p Phi�n B�n M�i", CC_LOG_TITLE, "��i L� Bao N�ng C�p Phi�n B�n M�i", 0, 1);
	end
end 


function do_nothing()
end