--��ɽ����
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\online_activites\\task_values.lua")

MAP_TABLE = {507,504,501};
Item_Table = {2,1,30391,"Xuy�n V�n Ti�n"};
ITEM_NEED_NUM = 1;

function OnUse(nItem)
	if GetTime() - GetTaskTemp(Pre_Click_Time3) < Used_Space_Time then
		--Msg2Player(format("����ʹ�õ�CDʱ��Ϊ%d��",Used_Space_Time));
		return 0;
	end
	--���ʱ��
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"","V�t ph�m �� qu� h�n s� d�ng");
		return 0;
	end
	if LSB_Check_LR() == 0 then
			return 0;
	end
	--�����ͼ�Ƿ����
	local nMap,nX,nY = GetWorldPos();
	if LSB_IsAllowMap(MAP_TABLE,nMap) == 0 then
		Talk(1,"","B�n �� hi�n t�i kh�ng th� s� d�ng v�t ph�m n�y");
		return 0;
	end
	--��Ʒ�������
	if GetItemCount(Item_Table[1],Item_Table[2],Item_Table[3]) < ITEM_NEED_NUM then
		Talk(1,"",format("S� l��ng Xuy�n V�n Ti�n kh�ng �� %d c�i",ITEM_NEED_NUM));
	end
	--boss�������
	if LSB_GetCurrMapBossNum(nMap) >= MAX_BOSS_NUM then
		Talk(1,"",format("S� l��ng Boss trong b�n �� kh�ng th� v��t qu� %d ",MAX_BOSS_NUM));
		return 0;
	end
	--����Ƿ�bossû����������û��
	if LSB_Check_NpcName() == 0 then
		Talk(1,"","L��ng S�n h�o ki�t g�i ra tr��c khi ch�t ho�c sau khi nh�t B�o R��ng m�i c� th� s� d�ng ��o c� n�y")
		return 0;
	end
	--ɾ����Ʒ
	if DelItem(Item_Table[1],Item_Table[2],Item_Table[3],1) ~= 1 then
		return 0;
	end
	SetCurrentNpcSFX(PIdx2NpcIdx(),936,1,0,18*5);
	--����CDʱ��
	SetItemUseLapse(18 * 60 * 2);
	--��������
	LSB_Check_Day_Seq()
	--��boss
	ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_Is_Allow_BOSS");
	SetTaskTemp(Pre_Click_Time3,GetTime());
	--����
	if tGtTask:check_cur_task(90) == 1 and GetTask(VET_LSB_CALLBOSS) < 5 then
		SetTask(VET_LSB_CALLBOSS,GetTask(VET_LSB_CALLBOSS) + 1);
		if GetTask(VET_LSB_CALLBOSS) ~= 5 then
			Msg2Player(format("Tri�u g�i %d/5 l�n L��ng S�n h�o ki�t ",GetTask(VET_LSB_CALLBOSS)));
		else
			Msg2Player(format("Tri�u g�i %d/5 l�n L��ng S�n h�o ki�t (ho�n th�nh)",GetTask(VET_LSB_CALLBOSS)));
		end
	end
	--��ͼboss����+1
	SetMapTaskTemp(nMap,1,GetMapTaskTemp(nMap,1) + 1);
--	local nKind,nMapId,nNpcIndex = LSB_CreateBoss();
--	if nKind == 1 and LSB_Get_Map_Name(nMapId) ~= nil then
--		--��������
--		local nNpcIdx = CreateNpc("��Դ����", format("%s�Ļƽ���",GetName()), nMap, nX + 1, nY + 1);
--		SetNpcLifeTime(nNpcIdx,3 * 60);
--		--��¼index
--		SetTaskTemp(Gld_Boss_Index,nNpcIdx);
--		SetNpcScript(nNpcIdx,Box_E_Script);
--		Msg2Global(format("%s������ǳ����˵��г���%s�ƽ��BOSS һ��С�ı����ӵ�%s��ͼ����ҿ�ǰ��ս������",GetName(),GetNpcName(nNpcIndex), LSB_Get_Map_Name(nMapId)));
--	else
--		Msg2Player(format("%s�ǳ����˵��г���%sBOSS",GetName(),GetNpcName(nNpcIndex)));
--	end
end