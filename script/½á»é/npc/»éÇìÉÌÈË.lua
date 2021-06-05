Include("\\script\\���\\marriage_head.lua");

g_InfoHeader = "<color=green>Th��ng nh�n h�n l�<color>:";

function main()
	local selTab = {
				"Mua ti�u h�ng bao/buy_xiaohongbao",
				"Mua ph�o/buy_banger",
				"Kh�ng mua/cancel",
				}
	Say(g_InfoHeader.."T�t c� v�t ph�m ph�c v� cho h�n l� b�n ti�m ��u kh�ng thi�u. Kh�ch quan "..gf_GetPlayerSexName().."c�n mua g�?",getn(selTab),selTab);
end;

function buy_xiaohongbao()
	local selTab = {
			"��ng �/buy_hongbao_confirm",
			"�� ta ngh� l�i/cancel",
			}
	Say(g_InfoHeader.."Mua ti�u h�ng bao m�t 100 l��ng, m� ra c� th� nh�n ���c 88 l��ng. Mua kh�ng?",getn(selTab),selTab);
end;

function buy_hongbao_confirm()
	if gf_JudgeRoomWeight(2,10) ~= 1 then
		Talk(1,"",g_InfoHeader.."Ng��i c�n s�p x�p l�i h�nh l�, kho�ng tr�ng kh�ng ��.");
		return 0;
	end;
	if Pay(1000000) == 1 then
		AddItem(2,1,508,1);
		Msg2Player("B�n mua ���c ti�u h�ng bao")
		WriteLog("[K�t h�n]:"..GetName().."Mua ���c ti�u h�ng bao");
	else
		Msg2Player("B�n kh�ng �� ti�n ");
	end;
end;

function buy_banger()
	local selTab = {
			"Mua ph�o/#buy_banger_confirm(1)",
			"Mua m�t phong ph�o/#buy_banger_confirm(2)",
			"Ta mu�n xem c�c v�t ph�m kh�c/main",
			}
	Say(g_InfoHeader.."Ph�o 50 l��ng b�c 1 vi�n, 1 phong ph�o c�n 1 l��ng v�ng",getn(selTab),selTab);
end;

function buy_banger_confirm(nType)
	if gf_JudgeRoomWeight(2,10) ~= 1 then
		Talk(1,"",g_InfoHeader.."Ng��i c�n s�p x�p l�i h�nh l�, kho�ng tr�ng kh�ng ��.");
		return 0;
	end;
	if nType == 1 then
		if Pay(5000) == 1 then
			AddItem(2,3,214,1);
			Msg2Player("B�n mua 1 vi�n ph�o")
		else
			Msg2Player("B�n kh�ng �� ti�n ");
		end;		
	else
		if Pay(10000) == 1 then
			AddItem(2,3,215,1);
			Msg2Player("B�n mua 1 phong ph�o")
		else
			Msg2Player("B�n kh�ng �� ti�n ");
		end;	
	end;
end;