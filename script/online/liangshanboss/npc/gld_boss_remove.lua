--�ƽ�BOSS���Ƴ���ʱ��ִ�еĴ���
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function OnRemove()
--	print("Gld_Boss OnRemove");
	--���ڱ������
	ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_DelDataRecord");
	--BOSSλ������
	SetGlbValue(GS_GLOBAL_VALUE3,0);
	return 1;
end
