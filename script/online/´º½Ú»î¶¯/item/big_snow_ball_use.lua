--�ű����ƣ���ѩ���װ�ʹ�ýű�
--�ű����ܣ�ʹ�ô�ѩ���װ������20����ѩ��
--�߻��ˣ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-01-31
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")
--================================��������������===========================
change_big_snow_ball_num = 20				--�һ��Ĵ�ѩ������
--=================================�ű����߼���============================
--***********************��Ʒʹ��������***********************
function OnUse(goods_index)
	Say("D�ng <color=green>t�i ��i Tuy�t C�u<color> c� th� ��i"..change_big_snow_ball_num.." <color=green>��i Tuy�t C�u<color>, ng��i ��ng � ch�?",
		2,
		"Ta c�n v�t ph�m n�y/bag_use_determine",
		"�� ta suy ngh� l�i/end_dialog"
		)
end
--***********************��Ʒȷ��ʹ�ú���*********************
function bag_use_determine()
	if GetItemCount(2,0,673) == 0 then					--��Ʒ���ڼ��
		Talk(1,"","X�c nh�n trong h�nh trang c�a b�n c� <color=red>t�i ��i Tuy�t C�u<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(1,50) ~= 1 then			--��Ұ����ռ�/���ؼ��
		return
	end
	if DelItem(2,0,673,1) ~= 1 then						--��Ʒɾ�����
		Talk(1,"","X�c nh�n trong h�nh trang c�a b�n c� <color=red>t�i ��i Tuy�t C�u<color>!")
		return
	end
	local add_flag = AddItem(2,3,221,20)
	if add_flag == 1 then
		Msg2Player("B�n �� d�ng t�i ��i Tuy�t C�u ��i"..change_big_snow_ball_num.." ��i Tuy�t C�u!")
	else
		WriteLog("Th�n tr��ng_Ho�t ��ng t�n ni�n_ Ng��i ch�i:"..GetNpcName().."D�ng ��i Tuy�t C�u ��i ph�n th��ng th�t b�i,"..add_flag)
	end
end
