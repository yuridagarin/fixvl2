--���������ϳ�
Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tSay = {
		format("S� d�ng %d Thi�n C��ng L�nh v� %d Thi�n C��ng L�nh L� Bao ��i l�y 1 L� Bao N�ng C�p Thi�n C��ng L�nh/#sure_exchange(%d)", CC_TGL_COST_NUM, 1, nItem),
		"Ta suy ngh� l�i/do_nothing",	
	}
	Say("��i hi�p mu�n ��i L� Bao Th�ng C�p ch�?", getn(tSay), tSay);
end

function sure_exchange(nItem)
	local nFreeRoom = GetFreeItemRoom();
	local nCount = min(GetItemCount(2, 1, 30508), floor(GetItemCount(2, 95, 204)/CC_TGL_COST_NUM));
	AskClientForNumber("sure_exchange_deal",0,min(nFreeRoom, nCount),"Nh�p s� l��ng","")
end

function sure_exchange_deal(nNum)
	for i = 1, nNum do
		if GetFreeItemRoom() < 2 then
			Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
			return 0;
		end
		if GetItemCount(2, 95, 204) < CC_TGL_COST_NUM then 
			Talk(1,"",format("C�n c� <color=red> %d <color> Thi�n C��ng L�nh m�i c� th� ��i 1 L� Bao N�ng C�p Thi�n C��ng L�nh", CC_TGL_COST_NUM));
			return 0;
		end
		if DelItem(2, 1, 30508, 1) ~= 1 then
			return 0;
		end
		if DelItem(2, 95, 204, CC_TGL_COST_NUM) ~= 1 then
			return 0;
		end
		gf_AddItemEx2({2, 1, 30510, 1}, "L� bao Thi�n Cang L�nh N�ng C�p", CC_LOG_TITLE, "��i L� Bao N�ng C�p Thi�n C��ng L�nh", 0, 1);
	end
end

function do_nothing()
end