--�ű����ƣ�2007�괺�ڻ�ɽ���з�ʹ�ýű�
--�ű����ܣ�ʹ�ñ���Ʒ���Կ��ٵ��ﻪɽ������
--�����д�ˣ��峤
--�߻��ˣ�����
--�����дʱ�䣺2007-01-29
--�޸ļ�¼��
--=============================��������������=========================
goto_huashan_fu_id = 671
--==============================�������߼���==========================
function OnUse()
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>Nh�c nh�<color>: Ch�a gia nh�p m�n ph�i kh�ng th� tham gia ho�t ��ng Hoa S�n C�nh K�!")
		return
	end
	Say("D�ng Hoa S�n Th�n ph� c� th� nhanh ch�ng v�o H�i Hoa S�n, nh�ng h�n ch� 10 ph�t m�i s� d�ng m�t l�n. Ng��i c� mu�n s� d�ng kh�ng?",
	2,
	"Ta mu�n ��n H�i Hoa S�n/goto_huashan_fast",
	"�� ta suy ngh� l�i/end_dialog")
end
--**********************************goto��ɽ***************************
function goto_huashan_fast()
	if GetItemCount(2,0,goto_huashan_fu_id) == 0 then
		Talk(1,"","X�c nh�n trong h�nh trang c�a b�n c� <color=red>Hoa S�n Th�n ph�<color>!")
		return
	end
	if DelItem(2,0,goto_huashan_fu_id,1) ~= 1 then
		Talk(1,"","X�c nh�n trong h�nh trang c�a b�n c� <color=red>Hoa S�n Th�n ph�<color>!")
		return
	end
	local goto_huashan_att = {
		{1564,2912},
		{1552,2899},
		{1562,2935},
		{1581,2924},
		{1595,2901},
		{1579,2896},
		{1566,2902}	
	}
	local att_seq = random(1,getn(goto_huashan_att))
	NewWorld(969,goto_huashan_att[att_seq][1],goto_huashan_att[att_seq][2])
	SetFightState(1)
	SetDeathPunish(0)
	Msg2Player("B�n �� ��i sang tr�ng th�i PK!")
end
--*********************************�պ���******************************
function end_dialog()
end
