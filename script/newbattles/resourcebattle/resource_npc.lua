--filename:resource_npc.lua
--create date:2006-06-16
--describe:���ݽű�
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function main()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local bExist = GetUnitCurStates(nNpcIndex,0);	--ʹ�õȼ��������Ƿ���ڵı��
	if bExist == 0 then
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Msg2Player("Kh�ng th� thu th�p l��ng th�o n�y.");
		return 0;
	end;
	if IsHaveState(1) > 0 then	--�Ƿ�����
		Msg2Player("Tr�n ng�a kh�ng th� nh�t l��ng th�o.");
		return 0;
	end;
	local _,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIndex);
	if BT_GetDistance(nNpcPosX,nNpcPosY) >= 15 then
		Msg2Player("B�n �� xa khu v�c l��ng th�o!");
		return 0;
	end;
	if GetItemCount(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4]) <= 0 then
		Msg2Player("Kh�ng c� cu�c kh�ng th� thu th�p l��ng th�o.");
		return 0;
	end;
--	local nMainType,nSubType1,nSubType2 = GetPlayerEquipInfo(2);
--	if nMainType ~= 0 or nSubType1 ~= 0 or nSubType2 ~= 0 then
--		Msg2Player("���������������ɼ����ݱ���쳣���ѡ�");
--		return 0;
--	end;
	if DoFireworks(DIGGING_ACTION_ID,1) == 1 then
		Msg2Player("�ang thu th�p l��ng th�o��......");
		CastState("state_fetter",1,5*18)
		ProgressSlot(5*18);	--5��
		SetNpcLifeTime(nNpcIndex,0);
		AddUnitStates(nNpcIndex,0,-bExist);	--��0
		SetNpcScript(nNpcIndex,"");
	else
		Msg2Player("Kh�ng th� l�m ��ng t�c n�y � tr�ng th�i ng�i")
	end;
end;


function OnProgressCallback()
	local nCamp = BT_GetCamp();
	if random(1,100) <= 50 then
		Msg2MSGroup(MISSION_ID,"Ng��i ch�i"..GetName().."t�i Nh�n M�n Quan-Th�o c�c chi�n ��o b�i b�a b�i �nh h��ng ��n m�i tr��ng n�n b� th� d�n truy �u�i, ch� ng��i ch�i ��n gi�i c�u",nCamp);
		local npcIndex = CreateNpc("Ho�n tr��ng Th� d�n","Th� d�n gi�n d�",GetWorldPos());
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\resourcebattle\\angryvillager_death.lua");	
	else
		AddItem(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4],3);
		Msg2Player("B�n nh�n ���c 3 bao "..tBattleItem[3][1]);	
	end;
	BT_AddBattleActivity(BA_RESO_GOT_RES);
	Use_Hoe();
end;