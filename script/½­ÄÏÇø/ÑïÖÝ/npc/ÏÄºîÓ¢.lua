--�����������ĺ�Ӣ
--created by lizhi
--2005-8-24 10:34
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	
	--���
	local tSay = {};
	local tActivityID = {134};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
		if getn(tSay) > 0 then
			tinsert(tSay, "\nK�t th�c ��i tho�i/nothing");	
			Say(format("<color=green>H� H�u Anh:<color> %s c�n gi�p �� g�?",gf_GetPlayerSexName()), getn(tSay), tSay);
			return 1;
		end
	end
	
  Talk(1,"","<color=green>H� H�u Anh<color>: ��");
end;