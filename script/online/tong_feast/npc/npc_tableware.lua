--�����ű�
Include("\\script\\online\\tong_feast\\tf_head.lua")

function main()
	if tf_CheckCondition() ~= 1 then
		return 0;
	end
	local npcIndex = GetTargetNpc();
	local s = SDB(TF_FEAST_CHEF, 0, 2);
	s:apply2(callout(main_cb, npcIndex));
end

function main_cb(npcIndex, nCount, sdb)
	if nCount <= 0 then
		print("UDERROR: main_cb error")
		return 0;
	end
	local szTongName = GetTongName();
	local sData = sdb[szTongName];
	if not sData then
		main_cb_no();
		return 0;
	end
	for i =1, getn(sData) - 1 do
		if tonumber(sData[i]) == npcIndex then
			main_cb_yes();
			return 1;
		end
	end
	main_cb_no();
end

function main_cb_yes()
	local tSay = {
		"Ta mu�n d�ng ti�c/tf_HaveDinner",
		"Ta mu�n k�nh t�u/main_cb_yes_toast",
		"S� d�ng Ti�c C� Tinh Ch�/main_cb_yes_UseIBtw",
		"Ta ch� ti�n ���ng gh� ngang/nothing",
	}
	Say("Th��ng th�c m� v�?"..format("<color=red>( hi�n t�i b�n n�y �� c� s� ng��i l� %d/10)<color>", GetNpcLevel(GetTargetNpc())),getn(tSay), tSay);
end

function main_cb_yes_toast()
	Say("Ng��i x�c ��nh mu�n k�nh t�u cho b�n ti�c hi�n t�i kh�ng?", 2, "��ng �/tf_Toast", "T�i h� ch� xem qua th�i/nothing");
end

function main_cb_yes_UseIBtw()
	Say("Ng��i x�c ��nh mu�n s� d�ng B� �� �n kh�ng?", 2, "��ng �/tf_UseIBtw", "T�i h� ch� xem qua th�i/nothing");
end

function main_cb_no()
	Talk(1,"","B�n h� �ang th��ng th�c c�c m�n �n!");
end