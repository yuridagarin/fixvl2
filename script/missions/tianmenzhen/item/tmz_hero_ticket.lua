--����Ӣ��ȯ
Include("\\script\\lib\\globalfunctions.lua")

g_COLLECT_COAT_ID = 1;

function OnUse()
	Say("S� d�ng 30 [Phi�u Thi�n M�n anh h�ng] c� th� nh�n ���c 1 b� Thi�n M�n ngo�i trang v�nh vi�n, s� d�ng kh�ng?",
		2,
		"\n s� d�ng/confirm_use",
		"\n kh�ng c� g�/gf_DoNothing")
end

function confirm_use()
	if GetItemCount(2,95,691) < 30 then
		Talk(1,"","C�c h� mang theo [Phi�u Thi�n M�n anh h�ng] kh�ng �� 30");
		return 0;
	end
	local tIndex = {115,116,117};
	local bCheck = 0;
	for i=1,getn(tIndex) do
		if GetPlayerCollectionData(g_COLLECT_COAT_ID, tIndex[i]) ~= 1 then
			bCheck = 1;
			break
		end
	end

	if bCheck ~= 1 then
		Talk(1, "", "C�c h� �� c� ngo�i trang n�y r�i.");
		return 0;
	end	
	if DelItem(2,95,691,30) == 1 then
		for i=1,getn(tIndex) do
			if SetPlayerCollectionData(g_COLLECT_COAT_ID, tIndex[i], 1) ~= 1 then
				WriteLog(format("[Phi�u Thi�n M�n anh h�ng] [SetPlayerCollectionData] [Failed] [Acc: %s] [Role: %s] [Collection: %d, %d]", GetAccount(), GetName(), g_COLLECT_COAT_ID, tIndex[i]));
			end
		end		
		Talk(1,"","Gia t�ng th�nh c�ng, h�y ki�m tra t�, <color=yellow>�H�p Ng� Huy�n Thi�n Bi�n�<color>.");
	end
end