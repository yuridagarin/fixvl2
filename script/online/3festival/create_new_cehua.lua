--����3���²߻��ű�
--by vivi
--09/11/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function main()
	if Get_3festival_State() == 1 then
		local nNpcIndex = 0;
		local tCehuaId = {};	
		for i=1,getn(tNewCehua) do
			if SubWorldID2Idx(tNewCehua[i][4]) ~= -1 then
				tinsert(tCehuaId,tNewCehua[i]);
			end
		end
		if getn(tCehuaId) == 0 then
			return
		end
		for i=1,getn(tCehuaId) do
			local nRand = random(1,getn(tCehuaId[i][5]));
			nNpcIndex = CreateNpc(tCehuaId[i][1],tCehuaId[i][2],tCehuaId[i][4],tCehuaId[i][5][nRand],tCehuaId[i][6][nRand]);
			SetNpcScript(nNpcIndex,"\\script\\online\\3festival\\gensuiyouli_npc.lua");
			SetMapTaskTemp(tCehuaId[i][4],1,nNpcIndex); 
			local nRanIndex = random(1,getn(tActionIndex)); 
			local nActionIndex = tActionIndex[nRanIndex][2];
			SetMapTaskTemp(tCehuaId[i][4],2,nActionIndex);
			SetMapTaskTemp(tCehuaId[i][4],3,GetTime());
			NpcChat(nNpcIndex,"M�i ng��i h�y l�m theo l�i t�i l�m ��ng t�c <color=yellow>"..tActionIndex[nRanIndex][1].."<color>, s� c� ph�n th��ng");
			SetNpcLifeTime(nNpcIndex,NEW_CEHUA_LIFETIME);
			Msg2Global("Giang H� Thi�n Nh�n "..tCehuaId[i][2].." �� xu�t hi�n"..tCehuaId[i][3]..", m�i ng��i h�y mau ��n tr� chuy�n �i! S� c� qu� ��y�");
			--AddGlobalNews("��������"..tCehuaId[i][2].."��������"..tCehuaId[i][3].."����ҿ�ȥ�������������죬�н�����Ŷ");		
		end
	end		
end