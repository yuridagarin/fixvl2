--���Ž�������ϳ�
Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tSay = {
		format("S� d�ng %d Thi�n M�n Kim L�nh v� %d L� Bao Thi�n M�n Kim L�nh ��i l�y 1 L� Bao N�ng C�p Thi�n M�n Kim L�nh/#sure_exchange(%d)", CC_TMGL_COST_NUM, 1, nItem),
		"Ta suy ngh� l�i/do_nothing",	
	}
	Say("��i hi�p mu�n ��i L� Bao Th�ng C�p ch�?", getn(tSay), tSay);
end

function sure_exchange(nItem)
	local nFreeRoom = GetFreeItemRoom();
	local nCount = min(GetItemCount(2, 1, 30509), floor(GetItemCount(2, 1, 30370)/CC_TMGL_COST_NUM));
	AskClientForNumber("sure_exchange_deal",0,min(nFreeRoom, nCount),"Nh�p s� l��ng","")
end

function sure_exchange_deal(nNum)
	for i = 1, nNum do
		if GetFreeItemRoom() < 2 then
			Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
			return 0;
		end
		if GetItemCount(2, 1, 30370) < CC_TMGL_COST_NUM then 
			Talk(1,"",format("C�n c� <color=red> %d <color> Thi�n M�n Kim L�nh m�i c� th� ��i l�y 1 L� Bao N�ng C�p Thi�n M�n Kim L�nh", CC_TMGL_COST_NUM));
			return 0;
		end
		if DelItem(2, 1, 30509, 1) ~= 1 then
			return 0;
		end
		if DelItem(2, 1, 30370, CC_TMGL_COST_NUM) ~= 1 then
			return 0;
		end
		gf_AddItemEx2({2, 1, 30511, 1}, "L� bao Thi�n M�n Kim L�nh N�ng C�p", CC_LOG_TITLE, "��i L� Bao N�ng C�p Thi�n M�n Kim L�nh", 0, 1);
	end
end 


function do_nothing()
end