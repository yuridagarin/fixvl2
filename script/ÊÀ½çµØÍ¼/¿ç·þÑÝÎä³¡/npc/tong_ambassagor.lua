--�������ʹ
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\tong_melee\\npc\\tm_main_npc.lua")

function main()
	local tSay = {
		"Lo�n Chi�n Bang H�i/tm_join_tong_melee",
		"\n T�i h� ch� xem qua th�i/nothing",
	}
	Say("<color=green> ��i S� Bang H�i:<color>"..gf_GetPlayerSexName().."M�n tham gia ho�t ��ng n�o d��i ��y kh�ng?", getn(tSay), tSay);
end