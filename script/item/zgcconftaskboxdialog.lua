--�ű����ƣ������̵ı���ʰȡ�ű�
--�ű����ܣ��������̵ı���Npc�Ի���Ȼ�����ʰȡ�����жϣ����ڱ���
--�߻��ˣ����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺����ɽ�ĵڶ���DD
--�����޸ļ�¼��2007-08-13���ݺ�ܵ�Ҫ���޸��˱����ʰȡ����
Include("\\script\\online\\zgc_public_fun.lua")
Box_belong_ID = 0
Box_get_time = 1
Box_index_save_ID = 166
function main()
	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	if GetPlayerRoute() == 0 then
		Msg2Player("Ch� bang ch�, ph� bang ch�, tr��ng l�o, ���ng ch�, h��ng ch� gia nh�p l�u ph�i m�i c� th� nh�t b�o v�t n�y!")
		return
	end
	if IsTongMember() > 5 or IsTongMember() == 0 then 															--�ж��Ƿ����
		Msg2Player("Ch� bang ch�, ph� bang ch�, tr��ng l�o, ���ng ch�, h��ng ch� gia nh�p l�u ph�i m�i c� th� nh�t b�o v�t n�y!")
	else
		if GetFightState() == 0 then --��ս��״̬���ܼ�
			Msg2Player("Ch� � tr�ng th�i chi�n ��u m�i c� th� nh�t ���c b�o v�t n�y!")
			return
		end
		if GetUnitCurStates(npc_index,Box_belong_ID) == 0 or (GetTime() - GetUnitCurStates(npc_index,Box_get_time)) > 10 then
			SetTaskTemp(Box_index_save_ID,npc_index)
			SetUnitCurStates(npc_index,Box_belong_ID,1)
			SetUnitCurStates(npc_index,Box_get_time,GetTime())
			DoWait(9,10,10)
		else
			Talk(1,"","<color=green>��a ra <color>: r��ng kho b�u c�n �ang b� ng��i kh�c s� d�ng, vui l�ng quay l�i trong ch�c l�t.")
			return
		end
	end	
end
