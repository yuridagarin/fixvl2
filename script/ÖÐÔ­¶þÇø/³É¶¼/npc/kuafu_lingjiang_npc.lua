--��������콱npc
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua")
Include("\\script\\missions\\tong_melee\\npc\\tm_main_npc.lua")

function main()
	local tSay = {
		"Chi�n tr��ng li�n ��u/jyr_main_lingjiang",
		"Lo�n chi�n bang h�i/tm_award_tong_melee",
		"\n T�i h� ch� xem qua th�i/nothing",
	}
	Say("<color=green> Ng��i Nh�n Th��ng Li�n Server:<color>"..gf_GetPlayerSexName().."Mu�n nh�n th��ng li�n server n�o?", getn(tSay), tSay);
end