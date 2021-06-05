--Describe:�廪�Ϲ�ʹ��NPC�ű�
--Create Date:2007-6-13
--Author:yanjun
Include("\\script\\lib\\globalfunctions.lua");
g_szInforHeader = "<color=green>Thanh Hoa T� quang S� gi�<color>: ";
function main()
	local selTab = {
			"Gi�p b�n h�c t�p tho�i m�i- Thanh Hoa Chi Tinh/talk1",
			"Gi�p gia ��nh c� kh�ng kh� vui v�- T�n Th� tuy�n e/talk2",
			"M�u �en kinh �i�n- Laptop th� h� H8/talk3",
			"Ta th�ch m�n n�y qu�!/choose_the_favour",
			"L�n sau s� quay l�i xem/nothing",
			}
	Say(g_szInforHeader.."Ta l� T� Quang S� gi�, mang may m�n ��n cho m�i ng��i. T�ng c�c h� b�nh �t n�y! Xem th� v�n kh� c�a c�c h� nh� th� n�o!",getn(selTab),selTab);
end;

function nothing()

end;

function talk1()
	Talk(1,"main",g_szInforHeader.."\n\n<color=yellow>H�n ch� gi�o d�c<color>: ");
end;

function talk2()
	Talk(1,"talk2_1",g_szInforHeader.."\n\n<color=yellow>xem ��y<color>: Ti vi tinh th� l�ng<color=red>3 t�c/5t�c<color>\n<color=yellow>Vi t�nh gia ��nh<color>: <color=red>16: 10<color>");
end;

function talk2_1()
	Talk(1,"main",g_szInforHeader.."\n\n<color=yellow>Thi�t k� chi ti�t<color>: \n<color=yellow><color>: n�ng c�p t�nh n�ng <color=red>40##<color>, <color=red>40##<color>\nEasy ��n gi�n, Enjoy s�ng kho�i, Ease tinh t�.");
end;

function talk3()
	Talk(1,"main",g_szInforHeader.."\n\n<color=yellow>T� do t� t�i<color>: ");
end;

function choose_the_favour()
	local selTab = {
				"Ta th�ch Thanh Hoa Chi Tinh/select_one",
				"Ta th�ch T�n Th� tuy�n e/select_one",
				"Ta th�ch Laptop th� h� H8/select_one",
				"Ta mu�n xem gi�i thi�u s�n ph�m/main",
				}
	Say(g_szInforHeader.."Thi�u Hi�p th�ch s�n ph�m n�o?",getn(selTab),selTab);
end;

function select_one()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 070624 then
		Talk(1,"",g_szInforHeader.."B�nh �t �� t�ng h�t r�i. Xin h�y ��i k� ho�t ��ng sau");
		return 0;
	end;
	if GetLevel() < 30 then
		Talk(1,"",g_szInforHeader.."Thi�u hi�p n�ng l�c c�n y�u qu�. Xin luy�n ��n c�p <color=yellow>30<color> r�i quay l�i g�p ta!");
		return 0;
	end;
	if GetTask(2357) ~= 0 then
		Talk(1,"",g_szInforHeader.."M�i nh�n v�t ch� nh�n ���c b�nh �t 1 l�n th�i!");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,10) ~= 1 then
		Talk(1,"",g_szInforHeader.."H�nh trang ho�c s�c l�c c�a ng��i kh�ng ��! H�y quay l�i sau nh�!");
		return 0;
	end;
	SetTask(2357,1);
	Talk(1,"",g_szInforHeader.."��y l� ch�t qu� m�n! Xin ��ng ch�!");
	local nRand = random(1,1000);
	if nRand <= 650 then
		AddItem(2,1,1123,1);
		Msg2Player("B�n nh�n ���c 1 B�nh �t Ng�i h��ng");
	elseif nRand <= 850 then
		AddItem(2,1,1124,1);
		Msg2Player("B�n nh�n ���c 1 B�nh �t th�t n��ng");
	elseif nRand <= 950 then
		AddItem(2,1,1125,1);
		Msg2Player("B�n nh�n ���c 1 B�nh �t b�t b�o");
	elseif nRand <= 994 then
		AddItem(2,1,1126,1);
		Msg2Player("B�n nh�n ���c 1 B�nh �t Vui v�");
	elseif nRand <= 999 then
		AddItem(2,1,1127,1);
		Msg2Player("B�n nh�n ���c 1 B�nh �t May m�n");
	else
		AddItem(2,1,1128,1);
		Msg2Player("B�n nh�n ���c 1 B�nh �t Th�y tinh");
	end;
end;

