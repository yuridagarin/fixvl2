--author:yanjun
--date:06-12-13
--describe:����ű�
Include("\\script\\task\\prison\\jail_head.lua");
g_NpcName = "B� kho�i"
function main()
	local selTab = {
			"Ta t�i �c t�y tr�i, ta ph�i t� th�/surrender",
			"B�ng h�u ta � ��y, h�y �� ta v�o th�m./visit_a_prisoner",
			"T�m hi�u t�nh h�nh/know_detail",
			"Kh�ng c� g�/nothing",
			}
	Say("<color=green>"..g_NpcName.."<color>: � ��y l� thi�n lao, kh�ng c� vi�c cho ng��i!",getn(selTab),selTab);
end;

function surrender()
	local nPKValue = GetPKValue();
	local nLevel = GetLevel();
	local nNeededMoney = floor(nLevel^3*nPKValue/6);	--��λ��ͭ
	local sStringMoney = gf_GetMoneyString(nNeededMoney);
	if nPKValue > 0 then
		if GetCash() < nNeededMoney then
			Talk(1,"main","<color=green>"..g_NpcName.."<color>: Kh�ng c� ti�n mu�n ��n nh� lao ng�i �? Kh� cho ng��i l�m!");
		else
			local selTab = {
						"�� r�i/surrender_confirm",
						"Ng�i thi�n lao c�ng ph�i t�n ti�n!/nothing",
						}
			Say("<color=green>"..g_NpcName.."<color>: Xem ng��i gian x�o nh� v�y, ��a <color=yellow>"..sStringMoney.."<color> cho ��i ca, ��i ca s� cho ng��i vui v� m�t t�.",getn(selTab),selTab);
		end;
	else
		Talk(2,"main","<color=green>"..g_NpcName.."<color>: Ti�u t� ng��i kh�ng c� vi�c g� ��ng ch�y lung tung, mu�n ch�t �?","��ng n�ng gi�n ch�, ta c�ng ��u c� � ��u.");
	end;
end;

function surrender_confirm()
	local nPKValue = GetPKValue();
	local nLevel = GetLevel();
	local nNeededMoney = floor(nLevel^3*nPKValue/6);
	local sStringMoney = gf_GetMoneyString(nNeededMoney);
	local nCash = GetCash();
	if nCash < nNeededMoney then
		Talk(1,"main","<color=green>"..g_NpcName.."<color>: Kh�ng c� ti�n mu�n ��n nh� lao ng�i �? Kh� cho ng��i l�m!");
		return 0;
	end;
	local sString = "";
	local selTab = {};
	local nSeizureMoney = nCash - nNeededMoney;
	if nSeizureMoney > 0 then
		sString = "Ng��i v�n c�n <color=red>";
		sString = sString..gf_GetMoneyString(nSeizureMoney);
		sString = sString.."<color>, n�u ng��i kh�ng c� � ki�n th� ta ch�ng thu l�m g�";
		tinsert(selTab,"Kh�ng sao, ng��i c�m �i/#enter_jail(1)");
	else
		sString = "Ng��i kh�ng mang �� ng�n l��ng �?"
		tinsert(selTab,"Ta �i c�ng v�i ng��i/#enter_jail(1)");
	end;
	tinsert(selTab,"��i ��, ta mu�n g�p b�ng h�u/nothing");
	Say("<color=green>"..g_NpcName.."<color>: Ta c�n ch�a t�ch thu s� ti�n d� c�a ng��i, xem n�o tr� ti�n ng�i lao ra c�n <color=yellow>"..sStringMoney.."<color> v�o,"..sString,getn(selTab),selTab);
end;

function enter_jail(nType)
	CleanInteractive();
	local nCash = GetCash();
	if nType == 1 then	--����������׵�
		if Pay(nCash) == 1 then
			if NewWorld(tJailEnterPoint[1],tJailEnterPoint[2],tJailEnterPoint[3]) == 1 then
				ForbidRead(1)	--��������
				UseScrollEnable(0);	--��ֹʹ�ûس�
				SetCanRestorePK(1);	--4���ٶ���PKֵ
			else
				Earn(nCash);
			end;
		else
			Talk(1,"main","<color=green>"..g_NpcName.."<color>: Kh�ng c� ti�n mu�n ��n nh� lao ng�i �? Kh� cho ng��i l�m!");
		end;
	elseif nType == 2 then	--̽���
		if Pay(10000) == 1 then
			if NewWorld(tJailEnterPoint[1],tJailEnterPoint[2],tJailEnterPoint[3]) == 1 then
				ForbidRead(1)	--��������
				UseScrollEnable(0);	--��ֹʹ�ûس�
			else
				Earn(10000);
			end;
		else
			Talk(1,"main","<color=green>"..g_NpcName.."<color>: Kh�ng c� ti�n mu�n ��n nh� lao ng�i �? Kh� cho ng��i l�m!");
		end;
	end;
end;

function visit_a_prisoner()
	if GetPKValue() > 0 then
		Talk(2,"","<color=green>"..g_NpcName.."<color>: To gan! L�m chuy�n c�ng qu�y c�n ngoan c� �?","C� vi�c cho ng��i th� ��y!");
		return 0;
	end;
	local selTab = {
				"��ng �/#enter_jail(2)",
				"H�y b�/nothing",
				}
	Say("<color=green>"..g_NpcName.."<color>: L�o gia ta d�o n�y c� h�i kh� kh�n, c�n <color=yellow>1 ti�n v�ng<color>.",getn(selTab),selTab);
end;

function know_detail()
	Talk(1,"main","<color=green>"..g_NpcName.."<color>: <color=yellow>4 gi� online gi�m 1 �i�m PK<color>, n�u c� ng�n l��ng th� �i�m PK s� gi�m nhanh h�n.");
end;
