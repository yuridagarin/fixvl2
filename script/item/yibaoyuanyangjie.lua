--�ű����ƣ�һ��ԧ���ʹ�ýű�
--�ű����ܣ�ʹ�ô���Ʒ���������һ��������ԧ���
--�߻��ˣ�С����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-08-09
--�ű��޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������

goods_num = 30
function OnUse(bag_index)
	--��Ʒʹ���ж�
	local goods_id = GetItemParticular(bag_index)
	if goods_id ~= 1158 then
		return
	end
	--ʹ��ȷ����ʾ
	Say("<color=green>G�i � <color>: S� d�ng <color=yellow>1 t�i Uy�n ��ng K�t<color> c� th� ��i l�y <color=yellow>"..goods_num.."<color><color=yellow>Uy�n ��ng K�t<color>, b�n x�c nh�n s� d�ng ch�? ",
	2,
	"S� d�ng /goods_add",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--��Ʒ����
function goods_add()
	--��Ʒ���
	if GetItemCount(2,1,1158) == 0 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>1 T�i Uy�n ��ng K�t <color>!")
		return
	end
	--�ռ为�ؼ��
	if Zgc_pub_goods_add_chk(1,goods_num) ~= 1 then
		return
	end
	--��Ʒɾ�����
	if DelItem(2,1,1158,1) ~= 1 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>1 T�i Uy�n ��ng K�t <color>!")
		return
	end
	--��Ʒ�����Լ����log
	local add_flag = AddItem(2,1,572,goods_num)
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n �� ��i ���c r�i."..goods_num.." Uy�n ��ng K�t!")
	else
		WriteLog("��i Uy�n ��ng K�t: Ng��i ch�i ["..GetName().."] ��i Uy�n ��ng K�t th�t b�i, k� hi�u th�t b�i: "..add_flag)
	end
end
