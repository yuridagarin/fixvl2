Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	nItem = tonumber(nItem);
	local nTime = tonumber(date("%Y%m%d"));
	
	if nTime < CC_UPGRADE_DATE then
		Talk(1, "", "��i hi�p t�m th�i ng��i kh�ng th� m� l� bao n�y, l� bao n�ng c�p n�y ch� c� th� m� sau khi <color=red> m�n ph�i m�i �� s�ng l�p <color> m�i ���c.");
		return 0;
	end
	
	if 1 ~= gf_CheckPlayerRoute() then
		Talk(1, "", "Ch� c� nh�ng ng��i ch�i gia nh�p l�u ph�i m�i c� th� m�!");
		return 0;
	end
	
	local nRoute = GetPlayerRoute();
	if GetLevel() < CC_LEVEL_LIMIT and (nRoute == 23 or nRoute == 29 or nRoute == 30) then
		Talk(1,"",format("Ch� c� nh�ng ng��i ch�i c� ��ng c�p ��t ��n %d m�i m� ���c", CC_LEVEL_LIMIT));
		return 0;
	end
	
	local strTab = {
		format("Ta mu�n m� l� bao n�ng c�p/#OnUse_1(%d)", nItem),
		"�� ta suy ngh�/nothing",
	};
	Say("<color=green> L� Bao N�ng C�p: <color> x�c nh�n m� L� Bao N�ng C�p n�y kh�ng?", getn(strTab), strTab);
end

function OnUse_1(nItem)
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	if nRoute ~= 23 and nRoute ~= 29 and nRoute ~= 30 then
		--������
		if DelItemByIndex(nItem, 1) == 1 then
			gf_AddItemEx2({2, 1, 30370, CC_TMGL_COST_NUM}, "Thi�n M�n Kim L�nh", CC_LOG_TITLE, "S� d�ng L� Bao N�ng C�p Thi�n M�n Kim L�nh", 0, 1);
		end
		return 0;
	else
		--������
		if DelItemByIndex(nItem, 1) == 1 then
			gf_AddItemEx2({2, 1, 30370, CC_TMGL_UPGRADE_NUM}, "Thi�n M�n Kim L�nh", CC_LOG_TITLE, "S� d�ng L� Bao N�ng C�p Thi�n M�n Kim L�nh", 0, 1);
			gf_Modify("Exp", CC_TMGL_UPGRADE_EXP);
			Msg2Global(format("Ch�c m�ng ng��i ch�i %s m� %s nh�n ���c %s + %d", GetName(), "L� bao Thi�n M�n Kim L�nh N�ng C�p", "Thi�n M�n Kim L�nh", CC_TMGL_UPGRADE_NUM));
		end
		return 0;
	end
end



