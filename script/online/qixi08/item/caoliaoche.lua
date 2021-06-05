--�߼����ϳ�
--by vivi
--2008/11/19

g_NpcInfo = "<color=green>Xe c� cao c�p<color>: "
g_szThisFile = "\\script\\online\\qixi08\\item\\caoliaoche.lua";

function OnUse()
	Say(g_NpcInfo.."D�ng cho th�n c�u vang danh thi�n h�, bao g�m B�ch Ngh�a, Hi�p D�c v� Chi�n M� Nguy�n So�i cao c�p. Ng��i mu�n cho ng�a �n kh�ng? Mu�n cho �n no c�n ph�i c� <color=yellow>3000 v�ng<color>, Ng��i mu�n ch�? <color=red>Ch� �: Trang b� ng�a tr�n ng��i m�i c� th� cho �n. Ng�a �� ���c kh�a c�ng c� th� cho �n, kh�ng c�n bi�t �� b�n nh� th� n�o, gi� c� v�n nh� th�.<color>",
		2,
		"\nS� d�ng/check_the_horse",
		"\nKh�ng c�n/nothing")	
end

function check_the_horse()
	local nGold = GetCash();
	if nGold < 30000000 then
		Talk(1,"",g_NpcInfo.."Cho ng�a �n no c�n c� <color=yellow>3000 v�ng<color>, tr�n ng��i ng��i hi�n gi� kh�ng ��.");
		return 0;
	end
	local tHorseId = {{"B�ch Ngh�a",0,105,49},{"Hi�p D�c",0,105,50},{"Chi�n M� Nguy�n So�i cao c�p (tr�ng)",0,105,51},{"Chi�n M� Nguy�n So�i cao c�p (�en)",0,105,52}};
	local nId1,nId2,nId3 = GetPlayerEquipInfo(10);
	local nCheck = 0;
	for i=1,getn(tHorseId) do
		if nId1 == tHorseId[i][2] and nId2 == tHorseId[i][3] and nId3 == tHorseId[i][4] then
			nCheck = i;
			break;
		end
	end	
	if nCheck == 0 then
		Say(g_NpcInfo.."Ta ch� c� th� cho B�ch Ngh�a, Hi�p D�c ho�c Chi�n M� Nguy�n So�i cao c�p �n, ng��i mang theo kh�ng ph�i nh�ng lo�i n�y.",0);
		return 0;
	else
		local nIdx = GetPlayerEquipIndex(10);
		local tb = GetItemInfoByIndex(nIdx,1);
		local d = tb["durability"];
		local md = tb["maxdurability"];		
		if d >= floor(md/2) then
			Talk(1,"",g_NpcInfo.."Ng�a c�a ng��i �� b�n v�n c�n cao, kh�ng c�n ph�i cho �n.");
			return 0;
		end
		if Pay(30000000) == 1 then
			ChangeItemDurability("horse");	
		end
	end	
end

function onthing()

end