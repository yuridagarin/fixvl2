--��������npc�ű�
--by vivi
--09/10/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function main()
	local sNpcName = "";
	local nMapId = GetWorldPos();
	for i=1,getn(tNewCehua) do
		if tonumber(nMapId) == tNewCehua[i][4] then
			sNpcName = tNewCehua[i][2];
			break
		end
	end
	local nActionIdx = GetMapTaskTemp(nMapId,2);
	Talk(1,"","<color=green>"..sNpcName.."<color>: H�y l�m theo ��ng t�c <color=yellow>"..tActionIndex[nActionIdx-4][1].."<color> c�a ta, tr�n c�p <color=yellow>30<color> m�i ���c nh�n th��ng. Ch� �, b�n ph�i c� ch� �� ph�n th��ng. ");
	local nNpcIdx = GetMapTaskTemp(nMapId,1);
	local nTime = GetTime()-GetMapTaskTemp(nMapId,3);
	if nTime > 60 then --���һ����˵һ��
		NpcChat(nNpcIdx,"M�i ng��i h�y l�m theo h��ng d�n c�a ta"..tActionIndex[nActionIdx-4][1].." s� c� ph�n th��ng nh�n th��ng.");
		SetMapTaskTemp(nMapId,3,GetTime());
	end
end