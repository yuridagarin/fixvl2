--define�ļ�

--LSB_ACTIVITY_ID = 66; --�ID
LSB_MAP_TASK_TEMP = 1; --��ͼ������¼BOSS��Ŀ
MAX_BOSS_NUM = 100; --boss��������
TIME_ZOOM_DIFF = 57600; --ʱ������
LSB_szLogTitle = "Khi�u chi�n Boss L��ng S�n"
Min_Level = 80;

--������ȫ�ֱ���
GS_GLOBAL_VALUE1 = 2012; --��¼����C����������Ŀ
GS_GLOBAL_VALUE2 = 2013; --��¼����C�����ԯװ����Ŀ

GS_GLOBAL_VALUE3 = 2014; --��¼bossλ��

GS_GLOBAL_VALUE4 = 2015; --��¼ȫ����������ʱ��

--��ʱ���������ʱʹ��֮ǰ�ģ���������ƬӰ�죩
Sma_Boss_Index = 161;
Mid_Boss_Index = 162; -- ��¼��boss�ͱ����Index
Gld_Boss_Index = 163;

--��ʱ��������������
Pre_Click_Time1 = 3089; --����A���ʱ��
Pre_Click_Time2 = 3090; --����B���ʱ��

--���ӵ�����
Click_Space_time = 60; --60s

--boss�����ű�·��
Sma_Boss_Death_Script = "\\script\\online\\liangshanboss\\npc\\sma_boss_death.lua";
Sma_Boss_Remove_Script = "\\script\\online\\liangshanboss\\npc\\sma_boss_remove.lua";
Mid_Boss_Death_Script = "\\script\\online\\liangshanboss\\npc\\mid_boss_death.lua";
Mid_Boss_Remove_Script = "\\script\\online\\liangshanboss\\npc\\mid_boss_remove.lua";
Gld_Boss_Death_Script = "\\script\\online\\liangshanboss\\npc\\gld_boos_death.lua";
Gld_Boss_Remove_Script = "\\script\\online\\liangshanboss\\npc\\gld_boss_remove.lua";

--����·��
Box_A_Script = "\\script\\online\\liangshanboss\\npc\\box\\box_a.lua"
Box_B_Script = "\\script\\online\\liangshanboss\\npc\\box\\box_b.lua";
Box_C_Script = "\\script\\online\\liangshanboss\\npc\\box\\box_c.lua";
Box_D_Script = "\\script\\online\\liangshanboss\\npc\\box\\box_d.lua";
Box_E_Script = "\\script\\online\\liangshanboss\\npc\\box\\box_e.lua";


--����A
Exp_Award_A = 50000;
Box_Num_A = {2,1,30384,10};

--����B
Exp_Award_B = 100000;
Box_Num_B = {2,1,30384,20};

--����C
Exp_Award_C = 500000;
Box_Num_C = {2,1,30384,40};

--Relay �������ݿ��¼�ṹ
--��¼��ǰboss�Ƿ����
Lsb_Record = {
	szKey = "activity_lsb",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "lsb_key",
}
--��¼����ҳ�boss����Ŀ
Lsb_Record2 = {
	szKey = "activity_lsb2",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "lsb_key2",
}
--��¼ȫ�������ʱ��
Lsb_Record3 = {
	szKey = "activity_lsb3",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "lsb_key3",
}

--������������Ʒ
Item_Trigger_Drop = {2,1,30392,"L��ng S�n t�n v�t"};

--�ƽ��boss����ˢ�����Ӹ���
GlodBoss_Death_Num = 40;
GlodBoss_Drop_Num = 40;
--
--��ʱ�������ʹ�õ���
Pre_Click_Time3 = 222;--�������߹�CD

--ʹ�õ��߼��
Used_Space_Time = 6;