--�ƽ�boss�����ű�
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function OnDeath(Index,f,x)
	local nMapId,nX,nY;
	if f == 0 then
	--���Ŷӽ���
		local msg = "";
		local sCaptainName = GetCaptainName();
--		print("GetTeamSize",GetTeamSize());
		if GetTeamSize() ~= 0 and GetTeamSize() ~= 1 then
			--��roll����
			LSB_Get_Award_C(3,0,Index);
			--���̶�����
			local OldPlayerIndex = PlayerIndex;
			for i=1,GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				msg = msg..GetName()..",";
				nMapId,nX,nY = GetWorldPos();
				if LSB_IsAllowMap({507,504,501},nMapId) == 1 and GetLevel() >= Min_Level and GetPlayerFaction() ~= 0 then
					LSB_Get_Award_Fix_C();
				end
			end
			PlayerIndex = OldPlayerIndex;
			--ͨ��
			local strTemp = format("%s ��i tr��ng %s th�ng l�nh gi�t ch�t Boss%s ��i Ho�ng Kim",msg,sCaptainName,GetNpcName(Index));
			AddGlobalNews(strTemp);
			Msg2Global(strTemp);
		else
			nMapId,nX,nY = GetWorldPos();
			if LSB_IsAllowMap({507,504,501},nMapId) == 1 and GetLevel() >= Min_Level and GetPlayerFaction() ~= 0 then
					LSB_Get_Award_Fix_C();
					LSB_Get_Award_C(3,1,Index);
			end
			local strTemp = format("%s �� ��nh b�i Boss%s ��i Ho�ng Kim",GetName(),GetNpcName(Index));
			AddGlobalNews(strTemp);
			Msg2Global(strTemp);
		end
	end
	--������
	local nIndex = GetGlbValue(GS_GLOBAL_VALUE3);
	if nIndex ~= 0 then
		for i = 1, GlodBoss_Death_Num do
			local nNpcIdx = CreateNpc("B�o r��ng T�i nguy�n", "��i B�o R��ng", LSB_GOLD_BOSS_LOCATION[nIndex][1], LSB_GOLD_BOSS_LOCATION[nIndex][2], LSB_GOLD_BOSS_LOCATION[nIndex][3],6,1,1,200);
			SetNpcLifeTime(nNpcIdx,3 * 60);
			SetNpcScript(nNpcIdx,Box_B_Script);
		end
	end
	--����
	--SetGlbValue(GS_GLOBAL_VALUE3,0);
	--ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_DelDataRecord");
	SetNpcLifeTime(Index,0);
end