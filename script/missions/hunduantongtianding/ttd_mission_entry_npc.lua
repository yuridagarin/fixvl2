Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\hunduantongtianding\\qrs_npc.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	--���
	local tSay = {};
	local tActivityID = {130};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
		if getn(tSay) > 0 then
			tinsert(tSay, "\nK�t th�c ��i tho�i/nothing");	
			Say(format("<color=green>Nh�m Doanh Doanh:<color> %s c�n s� gi�p �� g�?",gf_GetPlayerSexName()), getn(tSay), tSay);
			return 1;
		end
	end
	
	--����ͨ��þ�
	ttd_entry_npc_main()
end