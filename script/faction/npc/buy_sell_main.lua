--�ű����ܣ�ʦ��NPC����-����
--���ܿ������峤
--����ʱ�䣺2011-4-2
--�޸ļ�¼��
--�һ�ѡ������Ի�����
Include("\\script\\faction\\faction_head.lua")
function faction_buysell_main(nFactionId)
	return 
	format("<color=green>%s<color>:".."V� %s n�y, t�m ta c� vi�c g� kh�ng?",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()]),
	{
		"Ta mu�n mua m�t s� v�t d�ng./#normal_buy("..nFactionId..")",
		"Ta nghe n�i s� m�n c� 1 th�n binh b�o gi�p th�ch h�p v�i giang h� t�n th�? Ta mu�n xem xem nh� th� n�o./#faction_buy("..nFactionId..",2)",
		"Ta nghe n�i s� m�n c� 1 b� th�n binh b�o gi�p gi�nh cho v� l�m cao th�? H�y cho ta xem!/#faction_buy("..nFactionId..",3)",
		"Ta nghe n�i s� m�n c� 1 b� th�n binh b�o gi�p gi�nh cho tuy�t th� cao th�? H�y cho ta xem!/#faction_buy("..nFactionId..",4)",
		"L�m th� n�o �� nh�n ���c �� c�ng hi�n s� m�n./#contribution_get("..nFactionId..")",
		"R�i kh�i./cancel",
	}
end
--��ͨ����
function normal_buy(nFactionId)
	Sale(TFACTION_INFO[nFactionId].tShopId[1])
end
--ʦ��װ������
function faction_buy(nFactionId,nShopStep)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ng��i kh�ng ph�i �� t� %s ta, sao c� th� mua m�t t�ch c�a b� m�n ���c?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	else
		Sale(TFACTION_INFO[nFactionId].tShopId[nShopStep])
	end
end
--ʦ�Ź��׶�����
function contribution_get(nFactionId)
	local sDiaHead = format("<color=green>%s<color>#%s n�n quay v� t�m ch��ng m�n qu� ph�i �� nh�n nhi�m v� s� m�n, ho�n th�nh c� th� nh�n ���c <color=red>�i�m c�ng hi�n s� m�n<color>.",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	if GetPlayerFaction() == nFactionId then
		sDiaHead = format("<color=green>%s<color>#��n t�m ch��ng m�n b�n ph�i �� nh�n nhi�m v� s� m�n, ho�n th�nh c� th� nh�n ���c <color=red>�i�m c�ng hi�n s� m�n<color>#",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	end
	Say(sDiaHead,
		2,
		"Tr� l�i./main",
		"R�i kh�i./cancel"
	)
end
--�����Ի�
function cancel()
end