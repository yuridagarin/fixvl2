--�ű����ƣ�������
--�ű����ܣ��������и����
--�߻��ˣ�����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007��6��20��
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Tb_ma_ring = {104,105}
function OnUse()
	Say("<color=green>G�i �<color>: S� d�ng <color=yellow>h�p nh�n<color> c� th� c� nh�n kim c��ng t��ng �ng t�nh c�ch<color=yellow>nh�n kim c��ng<color> ph� h�p t�nh c�ch. Sao h�?",
	2,
	"��i/ma_ring_bag_use",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
function ma_ring_bag_use()
	--���Я�����
	if GetItemCount(2,1,586) == 0 then
		Talk(1,"","<color=green>G�i �<color>: Xin x�c nh�n b�n c� mang <color=yellow>h�p nh�n kim c��ng<color>!")
		return
	end
	--���ؿռ���
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--���ɾ�����
	if DelItem(2,1,586,1) ~= 1 then
		Talk(1,"","<color=green>G�i �<color>: Xin x�c nh�n b�n c� mang <color=yellow>h�p nh�n kim c��ng<color>!")
		return
	end
	--���ӽ���
	AddItem(0,102,Tb_ma_ring[GetSex()],1)
end
