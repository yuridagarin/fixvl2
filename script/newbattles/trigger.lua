Include("\\script\\newbattles\\functions.lua");
function OnLogin()
	BT_SetData(PT_BATTLE_TYPE,0);--��ע�⣱
	BT_RestorePlayerState();
end;

--ע��1����������ս�����棬��ʱ�������崻���û�����PT_BATTLE_TYPE�����������ô��ҵ�½��
--ʱ��ִ��BT_RestorePlayerStateʱ��BT_RestorePlayerState����PT_BATTLE_TYPE��LeaveChannel�����
--���������뿪һ���Լ���û�м����Channel����������Զ��뿪��̬Ƶ����������ASSERT���֡�

--���ʣ���Ϊʲô������ʱ�����أ�
--�Դ���Ϊ�Ѿ������õ�������������Ҫ�ĵĻ���Ҫ�Ķ��ܶ�ط���Ŀǰ����û��ʲô���Ⱑ��