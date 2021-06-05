--Create Date:2007-3-22 23:06
--Author:yanjun(yim)
--Describe:����������ɴ��͵�ս��ָ��λ�ã���ʹ������(���������ر�,�;�99��,ÿʹ��һ��Ҫ����
--Ӧ���;õ���,ֻ�����ض�ս����,��ս����ʼ��ſ�ʹ��)��
Include("\\script\\newbattles\\functions.lua");

g_nUseCoolDown = 60;	--ʹ��CDʱ��

tbPosEmplacement = 
{
	[1] = {"Tuy�n ��u ph�o ��i (t�) (tr� 3 �i�m �� b�n)",3,1650,2965},
	[2] = {"Tuy�n ��u ph�o ��i (trung) (tr� 4 �i�m �� b�n)",4,1733,2990},
	[3] = {"Tuy�n ��u ph�o ��i (ph�i) (tr� 3 �i�m �� b�n)",3,1795,2963},
	[4] = {"Trung qu�n ti�u k�nh (trung) (tr� 2 �i�m �� b�n)",2,1718,3192,},
}

tbPosVillage = 
{
	[1] = {"T�y qu�n h��ng ��o (tr� 3 �i�m �� b�n)",3,1627,3331},
	[2] = {"Trung t�m b�n b� (tr� 2 �i�m �� b�n)",2,1671,3370},
	[3] = {"G�c tr�n b�n �� (tr� 2 �i�m �� b�n)",2,1673,3200},
	[4] = {"G�c d��i b�n �� (tr� 2 �i�m �� b�n)",2,1682,3548},
}

tbPosMain = 
{
	[1] = {"Ti�n doanh (tr� 5 �i�m �� b�n)",5,1761,3354},
	[2] = {"Khu t� n�n phe T�ng (tr� 5 �i�m �� b�n)",5,1690,3291},
	[3] = {"Khu t� n�n phe Li�u (tr� 5 �i�m �� b�n)",5,1836,3305},
	[4] = {"Ti�n tuy�n phe T�ng (tr� 4 �i�m �� b�n)",4,1676,3409},
	[5] = {"Ti�n tuy�n phe Li�u (tr� 4 �i�m �� b�n)",4,1842,3410},
	[6] = {"Khu th� d�n (tr� 4 �i�m �� b�n)",4,1754,3500},
}

tbPos = {tbPosVillage,nil,tbPosEmplacement,tbPosMain,tbPosMain};	--�ݹȳ�û�д��͵�

function OnUse(nItemIdx)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	if nBattleType == 0 or nBattleType == RESOURCE_ID then
		Talk(1,"","K� M�n Tr�n Ph� ch� s� d�ng trong chi�n tr��ng Th�n L�c, Ph�o ��i, Nh�n M�n quan, Ng�c M�n quan. ");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Khi chi�n tr�n ch�nh th�c b�t ��u m�i c� th� s� d�ng K� M�n Tr�n ph�");
		return 0;
	end;
	if judge_use_state() == 0 then
		Talk(1,"","Tr�ng th�i hi�n t�i kh�ng th� s� d�ng K� M�n Tr�n Ph�. <color=red>Ch� ���c s� d�ng � h�u doanh<color>. ");
		return 0;
	end;
	nItemIdx = tonumber(nItemIdx);
	local nleft = AbradeItem(nItemIdx, 0)
	if (nleft == 0) then
		Say("�� b�n hi�n t�i K� M�n Tr�n ph� c�a b�n b�ng 0", 0)
		DelItemByIndex(nItemIdx, 0)					-- �;�Ϊ0Ҫɾ������Ʒ
	end
	local nTimeElapse = GetTime() - BT_GetData(PT_QIMENZHENFU_USE_TIME);
	if nTimeElapse <= g_nUseCoolDown then
		Talk(1,"","Sau <color=yellow>"..(g_nUseCoolDown-nTimeElapse).."<color> gi�y m�i c� th� d�ng l�i K� M�n Tr�n ph�.");
		return 0;
	end;
	local selTab = {};
	for i=1,getn(tbPos[nBattleType]) do
		tinsert(selTab,format(tbPos[nBattleType][i][1].."/#go_to(%d,%d,%d)",i,nBattleType,nItemIdx));
	end;
	tinsert(selTab,"Kh�ng s� d�ng/nothing");
	Say("B�n hi�n tham gia <color=yellow>"..tBattleName[nBattleType].."<color>, c� mu�n s� d�ng K� M�n Tr�n ph� kh�ng?",getn(selTab),selTab);
end;

function go_to(nIdx,nBattleType,nItemIdx)
	if BT_GetTempData(PTT_ROOMINDEX) ~= 0 then	--����ڵ���������
		return 0;
	end;
	local nMapX,nMapY = tbPos[nBattleType][nIdx][3],tbPos[nBattleType][nIdx][4];
	local nCurMapID = GetWorldPos();
	if nCurMapID == 880+nBattleType or nCurMapID == PRIMARY_MAIN_MAP_ID then	--���õ�ͼID����һ���жϣ���Ҫ�ǵ������������������
		local nShouldCost = tbPos[nBattleType][nIdx][2];
		AbradeItem(nItemIdx, nShouldCost)
		SetPos(nMapX,nMapY);
		BT_SetData(PT_QIMENZHENFU_USE_TIME,GetTime());
		set_player_state();
	else
		Talk(1,"","Hi�n t�i kh�ng th� s� d�ng K� M�n Tr�n ph�");
	end;
end;

function judge_use_state()
	if BT_GetTempData(PTT_LOCK) ~= 0 then	--��������������
		return 0;
	end;
	if GetFightState() == 1 then
		return 0;
	end;
	return 1;
end;

function set_player_state()
	if GetFightState() == 0 then
		BT_RestoreAll();
	end;
	BT_SetTempData(PTT_DIE_LOOP,0);
	SetFightState(1);
end;

function nothing()

end;