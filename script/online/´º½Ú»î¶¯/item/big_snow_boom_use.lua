--�ű����ƣ�ը����ѩ���װ�ʹ�ýű�
--�ű����ܣ�ʹ��ը����ѩ���װ������20��ը����ѩ��
--�߻��ˣ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-01-31
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")
--================================��������������===========================
change_boom_big_snow_num = 20				--�һ���ը����ѩ������
--=================================�ű����߼���============================
--***********************��Ʒʹ��������***********************
function OnUse(goods_index)
	Say("D�ng <color=green>t�i ��n ��i Tuy�t C�u<color> c� th� ��i"..change_boom_big_snow_num.." <color=green>��n ��i Tuy�t C�u<color>, ��ng � ch�?",
		2,
		"Ta c�n v�t ph�m n�y/bag_use_determine",
		"�� ta suy ngh� l�i/end_dialog"
		)
end
--***********************��Ʒȷ��ʹ�ú���*********************
function bag_use_determine()
	if GetItemCount(2,0,672) == 0 then					--��Ʒ���ڼ��
		Talk(1,"","X�c nh�n trong h�nh trang c�a b�n c� <color=red>t�i ��n ��i Tuy�t C�u<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(1,50) ~= 1 then			--��Ұ����ռ�/���ؼ��
		return
	end
	if DelItem(2,0,672,1) ~= 1 then						--��Ʒɾ�����
		Talk(1,"","X�c nh�n trong h�nh trang c�a b�n c� <color=red>t�i ��n ��i Tuy�t C�u<color>!")
		return
	end
	local add_flag = AddItem(2,3,218,20)
	if add_flag == 1 then
		Msg2Player("B�n ��i th�nh c�ng"..change_boom_big_snow_num.." ��i Tuy�t C�u!")
	else
		WriteLog("Th�n tr��ng_Ho�t ��ng t�n ni�n_ Ng��i ch�i:"..GetNpcName().."S� d�ng t�i ��n ��i Tuy�t C�u ��i ph�n th��ng th�t b�i,"..add_flag)
	end
end
